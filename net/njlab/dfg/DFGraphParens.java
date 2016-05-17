package net.njlab.dfg;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogWire;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public class DFGraphParens extends DFGraphNode{

	DFGraphNode srcNode;

	public DFGraphParens(DFGraphNode srcNode){
		srcNode.addDestNode(this);
		this.srcNode = srcNode;
		this.destType = srcNode.destType;
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
		Dump.tprintln(wout, offset, "<Paren>");
		super.dumpNode(wout, offset+1);
		Dump.tprintln(wout, offset+1, "<srcNdoe>");
		srcNode.dumpNode(wout, offset+2);
		Dump.tprintln(wout, offset+1, "</srcNode>");
		Dump.tprintln(wout, offset, "</Paren>");
	}

	@Override
	public void constantFolding(boolean[] optContinueFlag, Config config){
		srcNode.constantFolding(optContinueFlag, config);
	}

	@Override
	public void constantFoldingForBinarySequence(boolean[] foldingHappend){
		srcNode.constantFoldingForBinarySequence(foldingHappend);
	}

	@Override
	public DFGraphParens clone(){

		DFGraphParens tmp = (DFGraphParens)super.clone();
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

		minNodeOperatingStep = 0;
		minCntlStpFromThisNode = minCntlStp;
		srcNode.computePriority(minCntlStpFromThisNode, config);
		destTypeIsReg = false;
		priority = minCntlStpFromThisNode;
	}

	@Override
	public void assignControlStep(int controlStep, SchedulingListSet listSet){

		if(srcNode.assignState==notAssigned)
			srcNode.assignControlStep(controlStep, listSet);

		if(srcNode.assignState==finished){
			int startEnableStep = getStartEnableStep(srcNode, controlStep);
			if(startEnableStep <= controlStep){//このステップ以前にソースノードの計算が終了している
				startStep = controlStep;
				setEndStep(0, false);
				assignState = finished;
			}
		}
	}

	@Override
	public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		((VerilogWire)destSignal).setAssignExpression(srcNode.destSignal);
	}

	@Override
	public int getAssignedToNewRegStep(){
		System.out.println("DEBUG:	error DFGraphLiteral getAssignedToNewRegStep");//このメソッドは呼ばれない
		return 0;
	}

	@Override
	public boolean destSignalIsNotSaved(){
		System.out.println("DEBUG:	error DFGraphLiteral destSignalIsNotSaved");//このメソッドは呼ばれない
		return false;
	}
}
