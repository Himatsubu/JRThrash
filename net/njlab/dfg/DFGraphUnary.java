package net.njlab.dfg;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogUnaryExpression;
import net.njlab.circuit.VerilogWire;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogUnary;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public class DFGraphUnary extends DFGraphNode{

	DFGraphNode srcNode;
	String opString;
	VerilogWire unaryOpResult = null;	//単項演算の結果を格納する wire
	boolean unaryOpResultIsReplaced = false; //最適化により unaryOpResult が別のノードの unaryOpResult を指してるとき, unaryOpResult を変更してはいけない

	public DFGraphUnary(DFGraphNode srcNode, String opString,int destType){
		srcNode.addDestNode(this);
		this.srcNode = srcNode;
		this.opString = opString;
		this.destType = destType;
	}

	@Override
	 public void replaceSrcNode(DFGraphNode popNode, DFGraphNode pushNode){
		 if(srcNode==popNode){
			 srcNode = pushNode;
			 srcNode.addDestNode(this);
		 }
	 }

	@Override
	public void dumpNode(PrintWriter wout, int offset){
		Dump.tprintln(wout, offset, "<Unary>");
		super.dumpNode(wout, offset+1);
		Dump.tprintln(wout, offset+1, "<op>	"+opString+"	</op>");
		Dump.tprintln(wout, offset+1, "<srcNode>");
		srcNode.dumpNode(wout, offset+2);
		Dump.tprintln(wout, offset+1, "</srcNode>");
		Dump.tprintln(wout, offset+1, "<component><!--"+Dump.translateHTML("		verilog operator : "+opString+"	")+"--></component>");
		Dump.tprintln(wout, offset, "</Unary>");
	}

	@Override
	public void constantFolding(boolean[] optContinueFlag, Config config){

		srcNode.constantFolding(optContinueFlag, config);
		if(srcNode instanceof DFGraphLiteral){
			DFGraphLiteral oldLiteral = ((DFGraphLiteral)srcNode);

			if(opString.compareTo(VerilogUnary.POS)==0){
				replaceNode(srcNode);
			}
			else if(opString.compareTo(VerilogUnary.NEG)==0){
				replaceNode( new DFGraphLiteral(oldLiteral.type, -oldLiteral.inum, -oldLiteral.lnum,
												-oldLiteral.fnum, -oldLiteral.dnum, oldLiteral.bool));
			}
			else if(opString.compareTo(VerilogUnary.NOT)==0){
				replaceNode( new DFGraphLiteral(oldLiteral.type, oldLiteral.inum, oldLiteral.lnum,
												oldLiteral.fnum, oldLiteral.dnum, !oldLiteral.bool));
			}
			else if(opString.compareTo(VerilogUnary.COMPL)==0){
				replaceNode( new DFGraphLiteral(oldLiteral.type, ~oldLiteral.inum, ~oldLiteral.lnum,
												oldLiteral.fnum, oldLiteral.dnum, oldLiteral.bool));
			}
			else{
				System.out.println("DEBUG:	error DFGraphUnary cinstntfolding");
			}
			optContinueFlag[0] = true;
		}
	}

	@Override
	public void constantFoldingForBinarySequence(boolean[] foldingHappend){

		srcNode.constantFoldingForBinarySequence(foldingHappend);
	}

	@Override
	public DFGraphUnary clone(){

		DFGraphUnary tmp = (DFGraphUnary)super.clone();
		tmp.srcNode = srcNode.clone();
		tmp.srcNode.addDestNode(tmp);
		return tmp;
	}

	@Override
	public int countNodeNum(){
		return 1+srcNode.countNodeNum();
	}

	@Override
	public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag){
		boolean ret = false;
		ret |= srcNode.propagate(propagationNode, optContinueFlag);
		return ret;
	}

	@Override
	public void addStatementNode(DFGraphManager parentManager, ArrayList<DFGraphNode> statementNode){
		this.parentManager = parentManager;
		statementNode.add(this);
		srcNode.addStatementNode(parentManager, statementNode);
	}

	@Override
	public void computePriority(int minCntlStp, Config config){

		if(opString.compareTo(VerilogUnary.COMPL)==0){	// ~
			this.destTypeIsReg = config.BitOpChaining ? false : true;
			minNodeOperatingStep = config.BitOpChaining ? 0 : 1;
		}
		else if(opString.compareTo(VerilogUnary.NOT)==0){ // !
			this.destTypeIsReg = config.logicalOpChaining ? false : true;
			minNodeOperatingStep = config.logicalOpChaining ? 0 : 1;
		}
		else if(opString.compareTo(VerilogUnary.NEG)==0){
			this.destTypeIsReg = config.unaryMinusChaining ? false : true;
			minNodeOperatingStep = config.unaryMinusChaining ? 0 : 1;
		}
		else if(opString.compareTo(VerilogUnary.POS)==0){
			this.destTypeIsReg = false;
			minNodeOperatingStep = 0;
		}
		else{
			System.out.println("DEBUG:	error DFGraphUnary  computePriority");
		}
		minCntlStpFromThisNode = minCntlStp + minNodeOperatingStep;
		priority = minCntlStpFromThisNode;
		srcNode.computePriority(minCntlStpFromThisNode, config);
	}

	@Override
	public void assignControlStep(int controlStep, SchedulingListSet listSet){

		if(srcNode.assignState==notAssigned)
			srcNode.assignControlStep(controlStep, listSet);

		//if(impossibleToAssignforALAP(controlStep))	//ALAPスケジューリングの割り当て可能ステップに達していない
		//	return;

		if(srcNode.assignState==finished){
			int startEnableStep = getStartEnableStep(srcNode, controlStep);
			if(startEnableStep <= controlStep){//このステップ以前にソースノードの計算が終了している
				startStep = controlStep;
				setEndStep(0, false);
				assignState = finished;
			}
		}
	}

	public DFGraphNode getSrcNode(){
		return srcNode;
	}

	@Override
	public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		if(destTypeIsReg){

			if(!unaryOpResultIsReplaced){	//最適化により binaryOpResult が別のノードの binaryOpResult を指してるとき, unaryOpResult を変更してはいけない)
				if(unaryOpResult==null)
					unaryOpResult = parentManager.parentClass.getTmpSignals().getWire(destSignal.bitWidth, destSignal.isSigned);
				unaryOpResult.setAssignExpression(new VerilogUnaryExpression(srcNode.destSignal, opString));
			}
			StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);
			VerilogNoneBlockAssign resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, unaryOpResult, endState);
			registerNoneBlockAssign(controlStep, resultAssign, endStep);
			//genCodeForRetainTmpRegValue(controlStep);
		}
		else{
			VerilogUnaryExpression unary = new VerilogUnaryExpression(srcNode.destSignal, opString);
			((VerilogWire)destSignal).setAssignExpression(unary);
		}
	}

	@Override
	public int getAssignedToNewRegStep(){

		int ret = -1;
		if(destTypeIsReg){
			ret = endStep;
		}
		else{
			if(destNodes.size()==0)
				ret = Integer.MAX_VALUE;
			for(int i=0; i<destNodes.size(); i++)
				ret = Math.max(destNodes.get(i).getAssignedToNewRegStep(), ret);
		}
		return ret;
	}

	@Override
	public boolean destSignalIsNotSaved(){

		if(destTypeIsReg)
			return false;

		return srcNode.destSignalIsNotSaved();
	}

	public VerilogWire getUnaryOpResult(){
		return unaryOpResult;
	}

	public void replaceUnaryOpResult(VerilogWire newWire){
		unaryOpResult = newWire;
		unaryOpResultIsReplaced = true;
	}
}
