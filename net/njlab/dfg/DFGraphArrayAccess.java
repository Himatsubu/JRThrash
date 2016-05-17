package net.njlab.dfg;
import java.io.PrintWriter;
import java.util.ArrayList;
import net.njlab.circuit.stateManager.*;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogWire;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogVariableDecl;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public class DFGraphArrayAccess extends DFGraphNode{

	public DFGraphVariableAccess srcVariable;
	DFGraphNode offset;
	DFGraphNode assignNode=null;//代入元ノード -> null の場合は，読み取りノード
	int bramLatency;
	int bramThroughput;
	private ArrayList<Boolean> stepIsAccessable;	//stepIsAccessable[N] == true -> 終了ステップから数えて Nステップ目にこの配列はアクセスされない (同一の配列にアクセスするDfgraphArrayAccessノード間で共有)

	public DFGraphArrayAccess(DFGraphVariableAccess srcVariable, DFGraphNode offset){

		if(srcVariable.getVariableDecl()!=null)
			this.destType = DFGraphNode.getDestType(srcVariable.getVariableDecl().getType());
		this.srcVariable = srcVariable;
		srcVariable.setParedArrayAccess(this);
		this.offset = offset;
		offset.addDestNode(this);
	}

	@Override
	public void replaceSrcNode(DFGraphNode popNode, DFGraphNode pushNode){
		if(offset==popNode){
			offset = pushNode;
			offset.addDestNode(this);
		}

		if(assignNode==popNode){
			assignNode = pushNode;
			assignNode.addDestNode(this);
		}
	}

	public void setSrcNode(DFGraphNode assignNode){
		this.assignNode = assignNode;
		assignNode.addDestNode(this);
	}

	@Override
	public void dumpNode(PrintWriter wout, int offset){

		Dump.tprintln(wout, offset, "<ArrayAccess>");
		super.dumpNode(wout, offset+1);
		//Dump.tprintln(wout, offset+1, "<srcVariable>");
		//srcVariable.dumpNode(wout, offset+2);
		//Dump.tprintln(wout, offset+1, "</srcVariable>");
		String objName = "";
		if(srcVariable.objName!=null && srcVariable.objName.compareTo("this")!=0)	//他のオブジェクトの変数にアクセスしている
			objName = srcVariable.objName+".";

		Dump.tprintln(wout, offset+1, "<variableName>	"+objName+srcVariable.getVariableDecl().getName()+"	</variableName>");
		Dump.tprintln(wout, offset+1, "<isRead>	"+srcVariable.isReadNode()+"	</isRead>");
		Dump.tprintln(wout, offset+1, "<type>	"+srcVariable.getVariableDecl().getType()+"	</type>");
		Dump.tprintln(wout, offset+1, "<variableID>	"+srcVariable.getVariableDecl().getID()+"	</variableID>");

		String dependence = (srcVariable.previousWriteVariable!=null) ? srcVariable.previousWriteVariable.getParedArrayAccess().hashCode()+"" : "";
		for(int i=0; i<srcVariable.previousReadVariables.size(); ++i){
			dependence += (dependence.compareTo("")==0) ? srcVariable.previousReadVariables.get(i).getParedArrayAccess().hashCode()+"" :
														  ","+srcVariable.previousReadVariables.get(i).getParedArrayAccess().hashCode();
		}
		Dump.tprintln(wout, offset+1, "<dependence>	"+dependence+"	</dependence>");

		Dump.tprintln(wout, offset+1, "<component><!--"+Dump.translateHTML(srcVariable.getVariableDecl().constructComponentString())+"--></component>");

		Dump.tprintln(wout, offset+1, "<offset>");
		this.offset.dumpNode(wout, offset+2);
		Dump.tprintln(wout, offset+1, "</offset>");
		if(assignNode!=null){
			Dump.tprintln(wout, offset+1, "<assignNode>");
			assignNode.dumpNode(wout, offset+2);
			Dump.tprintln(wout, offset+1, "</assignNode>");
		}
		Dump.tprintln(wout, offset, "</ArrayAccess>");
	}

	@Override
	public void constantFolding(boolean[] optContinueFlag, Config config){

		offset.constantFolding(optContinueFlag, config);
		if(assignNode!=null)
			assignNode.constantFolding(optContinueFlag, config);
	}

	@Override
	public void constantFoldingForBinarySequence(boolean[] foldingHappend){

		offset.constantFoldingForBinarySequence(foldingHappend);
		if(assignNode!=null)
			assignNode.constantFoldingForBinarySequence(foldingHappend);
	}

	@Override
	public DFGraphArrayAccess clone(){

		DFGraphArrayAccess tmp = (DFGraphArrayAccess)super.clone();
		tmp.srcVariable = (DFGraphVariableAccess)srcVariable.clone();
		tmp.srcVariable.addDestNode(tmp);
		tmp.srcVariable.setParedArrayAccess(tmp);
		tmp.offset = offset.clone();
		tmp.offset.addDestNode(tmp);
		if(assignNode!=null){
			tmp.assignNode = (DFGraphNode)assignNode.clone();
			tmp.assignNode.addDestNode(tmp);
		}
		return tmp;
	}

	@Override
	public int countNodeNum(){
		return 1+srcVariable.countNodeNum()+offset.countNodeNum()+((assignNode!=null) ? assignNode.countNodeNum() : 0);
	}

	@Override
	public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag){
		boolean ret = false;
		ret |= offset.propagate(propagationNode, optContinueFlag);
		if(assignNode!=null)
			ret |= assignNode.propagate(propagationNode, optContinueFlag);
		return ret;
	}

	@Override
	public void addStatementNode(DFGraphManager parentManager, ArrayList<DFGraphNode> statementNode){

		this.parentManager = parentManager;
		statementNode.add(this);
		srcVariable.addStatementNode(parentManager, statementNode);
		offset.addStatementNode(parentManager, statementNode);
		if(assignNode!=null)
			assignNode.addStatementNode(parentManager, statementNode);
	}

	@Override
	public void computePriority(int minCntlStp, Config config){

		for(int i=0; i<srcVariable.nextVariable.size(); i++){
			DFGraphArrayAccess paredDfgArrayAccess = srcVariable.nextVariable.get(i).getParedArrayAccess();
			minCntlStp = Math.max(paredDfgArrayAccess.minCntlStpFromThisNode, minCntlStp);
		}
		minCntlStp = lookForMinAccessableStep(minCntlStp);

		if(assignNode!=null){	//配列代入
			minNodeOperatingStep = 1;
			minCntlStpFromThisNode = minCntlStp + minNodeOperatingStep;
			srcVariable.minCntlStpFromThisNode = minCntlStpFromThisNode;
			assignNode.computePriority(minCntlStpFromThisNode, config);
			destTypeIsReg = false;
			//System.out.println("arrayAccess computePriority "+minCntlStpFromThisNode+" "+minCntlStp+" "+this.getVariable().getVariableDecl().getName());
		}
		else{			//配列読み取り
			minNodeOperatingStep = config.bramLatency + 1;
			minNodeOperatingStep +=  config.arrayReadChaining ? 0 : 1;
			minCntlStpFromThisNode = minCntlStp + minNodeOperatingStep;
			destTypeIsReg = config.arrayReadChaining ? false : true;
		}
		priority = minCntlStpFromThisNode;
		srcVariable.destTypeIsReg = false;

		bramLatency = srcVariable.getVariableDecl().getBramLatency();
		bramThroughput = srcVariable.getVariableDecl().getBramThroughput();
		offset.computePriority(minCntlStpFromThisNode, config);
	}

	@Override
	public void assignControlStep(int controlStep, SchedulingListSet listSet){

		if(offset.assignState == notAssigned)
			offset.assignControlStep(controlStep, listSet);

		if(!srcVariable.isReadNode())
			if(assignNode.assignState == notAssigned)	//ソースノードがステップ未割り当て
				assignNode.assignControlStep(controlStep, listSet);	//ソースノードのステップ割り当てを試みる

		if(srcVariable.checkPreviousVariable()==false)
			return;

		if(srcVariable.isReadNode()){//読み取りminCriticalStep
			//if(impossibleToAssignforALAP(controlStep))	//ALAPスケジューリングの割り当て可能ステップに達していない
			//	return;

			assignReadControlStep(controlStep);
		}
		else{	//書き込み
			assignWriteControlStep(controlStep);
		}
	}

	private void assignReadControlStep(int controlStep){

		if(offset.assignState == finished){

			int startEnableStep = getStartEnableStep(offset, controlStep);
			if(startEnableStep <= controlStep){//このステップ以前にソースノードの計算が終了している
				assignStep(controlStep, bramLatency, true);
			}
		}
	}

	private void assignWriteControlStep(int controlStep){

		if(assignNode.assignState==finished && offset.assignState==finished){	//ソースが割り当て済み
			int startEnableStep = Math.max(getStartEnableStep(assignNode, controlStep), getStartEnableStep(offset, controlStep));
			if(startEnableStep <= controlStep){	//このステップ以前にソースノードの計算が終了している
				assignStep(controlStep, 0, false);
			}
		}
	}

	private void assignStep(int controlStep, int readLatency, boolean isRead){

		if(srcVariable.getLastAccessStep()+bramThroughput <= controlStep){	//ラストアクセス+スループット がこのステップより前 -> アクセス可能
				startStep = controlStep;
				setEndStep(readLatency, isRead);	//read の場合は，readLatency 分かかる
				assignState = finished;
				srcVariable.setLastAccessStep(controlStep);
				srcVariable.assignState = finished;
				srcVariable.startStep = startStep;
				srcVariable.endStep = endStep;
		}
	}

	public DFGraphNode getAssignNode(){
		return assignNode;
	}

	public int getLastAccessStep(){

		return srcVariable.getLastAccessStep();
	}

	public void setStepIsAccessable(ArrayList<Boolean> stepIsAccessable){
		this.stepIsAccessable = stepIsAccessable;
	}

	/**
	 * minStep 以上で, この配列がアクセス可能なステップを返す
	 * */
	private int lookForMinAccessableStep(int minStep){

		int additionalStep = 0;
		if(stepIsAccessable.size() < minStep+1){
			additionalStep = minStep+1 - stepIsAccessable.size();

			for(int i=0; i<additionalStep; ++i)
				stepIsAccessable.add(true);

			stepIsAccessable.set(stepIsAccessable.size()-1, false);
			return minStep;
		}
		else{
			stepIsAccessable.add(true);
			for(int step=minStep; step<stepIsAccessable.size(); ++step){
				if(stepIsAccessable.get(step)){
					stepIsAccessable.set(step, false);
					return step;
				}
			}
		}
		System.out.println("DEBUG:	err DFGraphArrayAccess lookForMinAccessableStep");
		return 0;
	}

	@Override
	public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		VerilogReg addr = null;
		VerilogReg dataIn = null;
		VerilogWire dataOut = null;
		VerilogReg readOrWrite = null;

		if(srcVariable.getVariableDecl().getDefType().compareTo(VerilogVariableDecl.defTypeField)==0){
			addr = srcVariable.getVariableDecl().getFieldSiganls().getFieldArrayAddrReg1();
			dataIn = srcVariable.getVariableDecl().getFieldSiganls().getFieldArrayDataInReg1();
			dataOut = srcVariable.getVariableDecl().getFieldSiganls().getFieldArrayDataOut1();
			readOrWrite = srcVariable.getVariableDecl().getFieldSiganls().getFieldArrayRorW_Reg1();
		}
		else if(srcVariable.getVariableDecl().getDefType().compareTo(VerilogVariableDecl.defTypeParamList)==0){
			addr = srcVariable.getVariableDecl().getParamListSignal().getPrmLstArrayAddrReg();
			dataIn = srcVariable.getVariableDecl().getParamListSignal().getPrmLstArrayDataInReg();
			dataOut = srcVariable.getVariableDecl().getParamListSignal().getPrmLstArrayDataOutWire();
			readOrWrite = srcVariable.getVariableDecl().getParamListSignal().getPrmLstArrayRorW_Reg();
		}

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		if(!srcVariable.isReadNode()){	//配列書き込み
			VerilogNoneBlockAssign addrAssign = new VerilogNoneBlockAssign(addr, offset.destSignal, startState);
			VerilogNoneBlockAssign dataInAssign  = new VerilogNoneBlockAssign(dataIn, assignNode.destSignal, startState);
			VerilogNoneBlockAssign readOrWriteAssign = new VerilogNoneBlockAssign(readOrWrite, parentManager.parentClass.boolTrue, startState);
			registerNoneBlockAssign(controlStep, addrAssign, startStep);
			registerNoneBlockAssign(controlStep, dataInAssign, startStep);
			registerNoneBlockAssign(controlStep, readOrWriteAssign, startStep);
		}
		else{	//配列読み取り
			VerilogNoneBlockAssign addrAssign = new VerilogNoneBlockAssign(addr, offset.destSignal, startState);
			VerilogNoneBlockAssign readOrWriteAssign = new VerilogNoneBlockAssign(readOrWrite, parentManager.parentClass.boolFalse, startState);
			registerNoneBlockAssign(controlStep, addrAssign, startStep);
			registerNoneBlockAssign(controlStep, readOrWriteAssign, startStep);

			if(destTypeIsReg){
				StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);
				VerilogNoneBlockAssign readValueAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, dataOut, endState);
				registerNoneBlockAssign(controlStep, readValueAssign, endStep);
			}
			else{
				((VerilogWire)destSignal).setAssignExpression(dataOut);
			}
		}
	}

	public DFGraphVariableAccess getVariable(){
		return srcVariable;
	}

	@Override
	public int getAssignedToNewRegStep(){
		return startStep;
	}

	@Override
	public boolean destSignalIsNotSaved(){

		if(srcVariable.isReadNode()==false)
			System.out.println("DEBUG:	DFGraphArrayAccess	destSignalIsIPcoreOut");

		return destTypeIsReg ? false : true;
	}

	@Override
	public void setComponentSign(){
		componentSigniture = srcVariable.getVariableDecl().hashCode();
	}
}






