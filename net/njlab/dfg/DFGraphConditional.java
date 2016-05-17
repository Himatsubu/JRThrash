package net.njlab.dfg;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.TmpSignals;
import net.njlab.circuit.VerilogCondExpression;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogWire;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public class DFGraphConditional extends DFGraphNode{

	DFGraphNode trueNode;
	DFGraphNode falseNode;
	DFGraphNode condNode;
	VerilogWire destWire;	//結果をアサインするワイヤ		結果がレジスタ代入される場合は，このワイヤをノンブロック代入する
	boolean destWireIsReplaced = false;	//最適化により destWire が別のノードの destWire を指してるとき, destWire を変更してはいけない

	public DFGraphConditional(DFGraphNode trueNode, DFGraphNode falseNode, DFGraphNode condNode, int destType){
		trueNode.addDestNode(this);
		falseNode.addDestNode(this);
		condNode.addDestNode(this);
		this.trueNode = trueNode;
		this.falseNode = falseNode;
		this.condNode = condNode;
		this.destType =destType;
	}

	@Override
	public void replaceSrcNode(DFGraphNode popNode, DFGraphNode pushNode){
		if(trueNode==popNode){
			trueNode = pushNode;
			trueNode.addDestNode(this);
		}
		if(falseNode==popNode){
			falseNode = pushNode;
			falseNode.addDestNode(this);
		}
		if(condNode==popNode){
			condNode = pushNode;
			condNode.addDestNode(this);
		}
	}

	@Override
	public void dumpNode(PrintWriter wout, int offset){
		Dump.tprintln(wout, offset, "<Conditional>");
		super.dumpNode(wout, offset+1);
		Dump.tprintln(wout, offset+1, "<condNode>");
		condNode.dumpNode(wout, offset+2);
		Dump.tprintln(wout, offset+1, "</condNode>");
		Dump.tprintln(wout, offset+1, "<trueNode>");
		trueNode.dumpNode(wout, offset+2);
		Dump.tprintln(wout, offset+1, "</trueNode>");
		Dump.tprintln(wout, offset+1, "<falseNode>");
		falseNode.dumpNode(wout, offset+2);
		Dump.tprintln(wout, offset+1, "</falseNode>");
		Dump.tprintln(wout, offset+1, "<component><!--"+Dump.translateHTML("		verilog operator : ?:	")+"--></component>");
		Dump.tprintln(wout, offset, "</Conditional>");
	}

	@Override
	public void constantFolding(boolean[] optContinueFlag, Config config){
		trueNode.constantFolding(optContinueFlag, config);
		falseNode.constantFolding(optContinueFlag, config);
		condNode.constantFolding(optContinueFlag, config);
	}

	@Override
	public void constantFoldingForBinarySequence(boolean[] foldingHappend){
		trueNode.constantFoldingForBinarySequence(foldingHappend);
		falseNode.constantFoldingForBinarySequence(foldingHappend);
		condNode.constantFoldingForBinarySequence(foldingHappend);
	}

	@Override
	public DFGraphConditional clone(){

		DFGraphConditional tmp = (DFGraphConditional)super.clone();
		tmp.trueNode = trueNode.clone();
		tmp.trueNode.addDestNode(tmp);
		tmp.falseNode = falseNode.clone();
		tmp.falseNode.addDestNode(tmp);
		tmp.condNode = condNode.clone();
		tmp.condNode.addDestNode(tmp);
		return tmp;
	}

	@Override
	public int countNodeNum(){
		return 1+trueNode.countNodeNum()+falseNode.countNodeNum()+condNode.countNodeNum();
	}

	@Override
	public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag){
		boolean ret = false;
		ret |= trueNode.propagate(propagationNode, optContinueFlag);
		ret |= falseNode.propagate(propagationNode, optContinueFlag);
		ret |= condNode.propagate(propagationNode, optContinueFlag);
		return ret;
	}

	@Override
	public void addStatementNode(DFGraphManager parentManager, ArrayList<DFGraphNode> statementNode){
		this.parentManager = parentManager;
		statementNode.add(this);
		trueNode.addStatementNode(parentManager, statementNode);
		falseNode.addStatementNode(parentManager, statementNode);
		condNode.addStatementNode(parentManager, statementNode);
	}

	@Override
	public void computePriority(int minCntlStp, Config config){

		minNodeOperatingStep = config.conditionalChaining ? 0 : 1;
		minCntlStpFromThisNode = minCntlStp + minNodeOperatingStep;
		trueNode.computePriority(minCntlStpFromThisNode, config);
		falseNode.computePriority(minCntlStpFromThisNode, config);
		condNode.computePriority(minCntlStpFromThisNode, config);
		destTypeIsReg = config.conditionalChaining ? false : true;
		priority = minCntlStpFromThisNode;
	}

	@Override
	public void assignControlStep(int controlStep, SchedulingListSet listSet){

		if(trueNode.assignState==notAssigned)
			trueNode.assignControlStep(controlStep, listSet);

		if(falseNode.assignState==notAssigned)
			falseNode.assignControlStep(controlStep, listSet);

		if(condNode.assignState==notAssigned)
			condNode.assignControlStep(controlStep, listSet);

		//if(impossibleToAssignforALAP(controlStep))	//ALAPスケジューリングの割り当て可能ステップに達していない
		//	return;

		if(trueNode.assignState==finished && falseNode.assignState==finished && condNode.assignState==finished){	//ソースが割り当て済み
			int startEnableStep = Math.max(getStartEnableStep(trueNode, controlStep) , Math.max(getStartEnableStep(falseNode, controlStep), getStartEnableStep(condNode, controlStep)));
			if(startEnableStep <= controlStep){	//このステップ以前にソースノードの計算が終了している
				startStep = controlStep;
				setEndStep(0, false);
				assignState = finished;
			}
		}
	}

	@Override
	public void assignDestSignal(VerilogClass parentClass){

		if(destTypeIsReg){
			destSignal = allocateTmpReg();
		}
		else{
			TmpSignals tmpSignals = parentClass.getTmpSignals();
			destSignal = tmpSignals.getWire(getBitWidth(), isSignedType());
		}
	}

	@Override
	public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		VerilogCondExpression condExpr = new VerilogCondExpression(condNode.destSignal, trueNode.destSignal, falseNode.destSignal);

		if(destTypeIsReg){
			if(!destWireIsReplaced){
				if(destWire==null)
					destWire = parentManager.parentClass.getTmpSignals().getWire(getBitWidth(), isSignedType());
				destWire.setAssignExpression(condExpr);
			}
			StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);
			VerilogNoneBlockAssign resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, destWire, endState);
			registerNoneBlockAssign(controlStep, resultAssign, endStep);
		}
		else{
			((VerilogWire)destSignal).setAssignExpression(condExpr);
		}
	}

	@Override
	public int getAssignedToNewRegStep(){

		int ret = -1;

		if(!destTypeIsReg){	//結果をワイヤアサイン
			if(destNodes.size()==0)
				ret = Integer.MAX_VALUE;
			for(int i=0; i<destNodes.size(); i++)
				ret = Math.max(destNodes.get(i).getAssignedToNewRegStep(), ret);
		}
		else{	//結果をレジスタ代入
			ret = endStep;
		}
		return ret;
	}

	@Override
	public boolean destSignalIsNotSaved(){

		if(destTypeIsReg)
			return false;

		return trueNode.destSignalIsNotSaved() | falseNode.destSignalIsNotSaved() | condNode.destSignalIsNotSaved();
	}

	public VerilogWire getDestWire(){
		return destWire;
	}

	public void replaceDestWire(VerilogWire newWire){
		destWire = newWire;
		destWireIsReplaced = true;
	}
}






