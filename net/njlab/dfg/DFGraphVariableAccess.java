package net.njlab.dfg;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogWire;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogBinary;
import net.njlab.model.VerilogClass;
import net.njlab.model.VerilogVariableDecl;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public class DFGraphVariableAccess extends DFGraphNode{

	private VerilogVariableDecl variable;
	public  DFGraphNode assignNode=null;//代入元ノード -> null の場合は，読み取りノード
	private int[] lastAccessStep;		//DFGraphVariableAccess -> 最後に書き込みしたステップ         DFGraphArrayAccess -> 最後に 読み取り or 書き込みしたステップ
	private boolean isReadNode = true;
	private boolean forwardingEnable = false;
	ArrayList<DFGraphVariableAccess> previousReadVariables = new ArrayList<DFGraphVariableAccess>();  //この変数より先に読み取りが完了していなければならない変数ノード
	ArrayList<DFGraphVariableAccess> nextVariable = new ArrayList<DFGraphVariableAccess>();	//この変数より後に割り当てられるべき変数ノード
	DFGraphVariableAccess previousWriteVariable = null;
	String objName;	//この変数があるオブジェクトの名前
	private DFGraphArrayAccess paredArrayAccess = null;	//対応する配列アクセスノード
	private boolean needSaveValue = false;	//WARハザード回避のために 値の退避を必要とする

	public DFGraphNode getAssignNode(){
		return assignNode;
	}

	public boolean isPropagateNode(){
		if(assignNode!=null){
			if(assignNode instanceof DFGraphLiteral)
				return true;
			else
				return false;
		}
		return false;
	}

	public DFGraphVariableAccess(VerilogVariableDecl variable, String objName){

		this.variable = variable;
		if(variable!=null)
			this.destType = DFGraphNode.getDestType(variable.getType());

		this.objName = objName;
	}

	@Override
	public void replaceSrcNode(DFGraphNode popNode, DFGraphNode pushNode){
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
		Dump.tprintln(wout, offset, "<VariableAccess>");
		super.dumpNode(wout, offset+1);
		Dump.tprintln(wout, offset+1, "<variableName>	"+variable.getName()+"	</variableName>");
		Dump.tprintln(wout, offset+1, "<type>	"+variable.getType()+"	</type>");
		Dump.tprintln(wout, offset+1, "<variableID>	"+variable.getID()+"	</variableID>");
		Dump.tprintln(wout, offset+1, "<isRead>	"+isReadNode()+"	</isRead>");
		//Dump.tprintln(wout, offset+1, "<lastAccessObj>	"+lastAccessStep+"	</lastAccessObj>");

		String dependence = (previousWriteVariable!=null) ? previousWriteVariable.hashCode()+"" : "";
		for(int i=0; i<previousReadVariables.size(); ++i){
			dependence += (dependence.compareTo("")==0) ? previousReadVariables.get(i).hashCode()+"" :
														  ","+previousReadVariables.get(i).hashCode();
		}
		Dump.tprintln(wout, offset+1, "<dependence>	"+dependence+"	</dependence>");

		if(assignNode!=null){
			Dump.tprintln(wout, offset+1, "<assignNode>");
			assignNode.dumpNode(wout, offset+2);
			Dump.tprintln(wout, offset+1, "</assignNode>");
		}
		Dump.tprintln(wout, offset+1, "<component><!--"+Dump.translateHTML(variable.constructComponentString())+"--></component>");
		Dump.tprintln(wout, offset, "</VariableAccess>");
	}

	@Override
	public void constantFolding(boolean[] optContinueFlag, Config config){
		if(assignNode!=null)
			assignNode.constantFolding(optContinueFlag, config);
	}

	@Override
	public void constantFoldingForBinarySequence(boolean[] foldingHappend){

		if(assignNode!=null)
			assignNode.constantFoldingForBinarySequence(foldingHappend);
	}

	@Override
	public DFGraphVariableAccess clone(){

		DFGraphVariableAccess tmp = (DFGraphVariableAccess)super.clone();
		tmp.previousReadVariables = new ArrayList<DFGraphVariableAccess>();
		tmp.previousWriteVariable = null;
		tmp.nextVariable = new ArrayList<DFGraphVariableAccess>();
		if(tmp.assignNode!=null){
			tmp.assignNode = assignNode.clone();
			tmp.assignNode.addDestNode(tmp);
		}
		tmp.lastAccessStep = null;
		return tmp;
	}

	@Override
	public int countNodeNum(){
		return 1+ ((assignNode!=null) ? assignNode.countNodeNum() : 0);
	}

	@Override
	public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag){

		if(assignNode!=null){
			assignNode.propagate(propagationNode, optContinueFlag);
			if(propagationNode.variable==variable){//伝播変数に書き込まれた -> このノードの属するステージより後は調べない
				return true;
			}
		}
		else if(propagationNode.variable==variable){	//定数に置き換えることができる
			DFGraphLiteral propagatedLiteral = (DFGraphLiteral)propagationNode.getAssignNode();
			replaceNode(new DFGraphLiteral(propagatedLiteral.type, propagatedLiteral.inum, propagatedLiteral.lnum,
										   propagatedLiteral.fnum, propagatedLiteral.dnum, propagatedLiteral.bool));
			optContinueFlag[0] = true;
		}
		return false;
	}

	@Override
	public void addStatementNode(DFGraphManager parentManager, ArrayList<DFGraphNode> statementNode){
		this.parentManager = parentManager;
		statementNode.add(this);
		if(assignNode!=null)
			assignNode.addStatementNode(parentManager, statementNode);
	}

	@Override
	public void computePriority(int minCntlStp, Config config){

		boolean nextVairableIsRead = true;
		for(int i=0; i<nextVariable.size(); i++){

			if(minCntlStp < nextVariable.get(i).minCntlStpFromThisNode){
				minCntlStp = nextVariable.get(i).minCntlStpFromThisNode;
				nextVairableIsRead = nextVariable.get(i).isReadNode;
			}
		}

		if(assignNode!=null){	//書き込み

			if( (nextVariable.size()!=0) && nextVairableIsRead && (!variable.isForwarfingInvalidate()) )	//フォワーディング成立条件を満たしている -> この書き込みに費やすステップ数は 0 と仮定
				minNodeOperatingStep = 0;
			else
				minNodeOperatingStep = 1;

			minCntlStpFromThisNode = minCntlStp + minNodeOperatingStep;	//レジスタ代入
			assignNode.computePriority(minCntlStpFromThisNode, config);
			destTypeIsReg = false;
			if(isReadNode!=false)
				System.out.println("DEBUG:	error	DFGraphVariableDecl readNode is writable");
		}
		else{	//レジスタ読み取り

			if(nextVariable.size()!=0 && parentManager.parentClass.config.saveReadVariableWithWARhazard){	//後で書き込みが控えている && WAR退避有効  -> 値をレジスタに退避
				minNodeOperatingStep = 1;	//この読み取りノードには, レジスタに代入する分の1ステップが必要
				//destTypeIsReg = true;
				destTypeIsReg = false;
			}
			else{
				minNodeOperatingStep = 0;
				destTypeIsReg = false;
			}
			minCntlStpFromThisNode = minCntlStp + minNodeOperatingStep;

			if(isReadNode!=true)
				System.out.println("DEBUG:	error	DFGraphVariableDecl writeNode is readable");
		}
		priority = minCntlStpFromThisNode;
	}

	public void setAccessStepObj(int[] lastAccessStep){
		this.lastAccessStep = lastAccessStep;
	}

	public int getLastAccessStep(){
		return lastAccessStep[0];
	}

	public void setLastAccessStep(int num){
		if(num<=lastAccessStep[0])
			System.out.println("DEBUG:	error DFGraphVariableAccess setLastAccessStep");
		else
			lastAccessStep[0] = num;
	}

	@Override
	public void assignControlStep(int controlStep, SchedulingListSet listSet){

		if(!isReadNode)
			if(assignNode.assignState == notAssigned)	//ソースノードがステップ未割り当て
				assignNode.assignControlStep(controlStep, listSet);	//ソースノードのステップ割り当てを試みる

		if(isReadNode){	//読み取り

			if(previousWriteVariableIsAssigned()){	//前にある書き込みノードの割り当てが終了
				setStepAndForwardingFlag(controlStep);
			}
		}
		else{	//書き込み

			if(previousWriteVariableIsDead(controlStep)){

				if(parentManager.parentClass.config.saveReadVariableWithWARhazard){
					saveValueOfPrevReadVariables(controlStep);
					assignWriteStep(controlStep);
				}
				else{
					if(previousReadVariableIsAllDead(controlStep))
						assignWriteStep(controlStep);
				}
			}
		}
	}

	private void assignWriteStep(int controlStep){

		if(assignNode.assignState==finished){	//ソースが割り当て済み

			int startEnableStep = getStartEnableStep(assignNode, controlStep);
			startEnableStep = Math.max(lastAccessStep[0]+1, startEnableStep);	//フォワーディングの影響で，同時書き込みの可能性が発生    a = b+c;
																				//														  a = a+x;
			if(startEnableStep <= controlStep){	//このステップ以前にソースノードの計算が終了している
				startStep = controlStep;
				setEndStep(0, false);
				assignState = finished;
				setLastAccessStep(controlStep);//mim
			}
		}
	}

	/**
	 * これより前にある読み取りノードの生存時間が終了している -> true
	 */
	private boolean previousReadVariableIsAllDead(int controlStep){

		for(DFGraphVariableAccess previousVar : previousReadVariables){

			if(previousVar.isReadNode){
				previousVar.searchTimeToLive();

				if(variableIsStillAlive(controlStep, previousVar)){	//まだ生きているリードノードがある
					return false;
				}
			}
		}
		return true;
	}

	private boolean variableIsStillAlive(int controlStep, DFGraphVariableAccess variable){

		return (variable.diedStep > controlStep || variable.diedStep < 0);
	}

	/**
	 * これより前にある書き込みノードの割り当てが終了している -> true
	 */
	private boolean previousWriteVariableIsAssigned(){

		if(previousWriteVariable==null)
			return true;

		if(previousWriteVariable.assignState!=finished)
			return false;

		return true;
	}

	/**
	 * WARハザードに備えて, previousReadVariables の値を一時レジスタに退避する
	 * */
	private void saveValueOfPrevReadVariables(int controlStep){

		for(int i=0; i<previousReadVariables.size(); ++i)
			previousReadVariables.get(i).saveValueToTmpReg(controlStep);
	}

	/**
	 * WARハザードが発生する場合, リードノードの値を一時レジスタに退避する
	 * */
	private void saveValueToTmpReg(int controlStep){

		if(destNodes.size()!=1){
			System.out.println("DEBUG:	err DFGraphVariableAccess saveValueToTmpReg");	//リードノードの destNode は1つでなければならない
			return;
		}

		//searchTimeToLive();

		//System.out.println(destNodes.get(0).startStep);

		//System.out.println(controlStep+"  "+diedStep+"  "+variable.getName());

		//このノードがまだ生きてきる (このノードの結果を必要とするノードがまだある) -> 値を退避
		if( variableIsStillAlive(controlStep, this) )
			needSaveValue = true;
	}

	private void setStepAndForwardingFlag(int currentStep){

		if(previousWriteVariable==null){
			startStep = currentStep;
			setEndStep(0, false);
			assignState = finished;
			return;
		}

		if(parentManager.parentClass.config.forwardingEnable==false || variable.isForwarfingInvalidate()==true){	//フォワーディングしない場合は，書き込みステップより後のステップに割り当てる
			if(previousWriteVariable.endStep < currentStep){
				startStep = currentStep;
				setEndStep(0, false);
				assignState = finished;
			}
			return;
		}

		if(previousWriteVariable.endStep <= currentStep){
			startStep = currentStep;
			setEndStep(0, false);
			assignState = finished;
		}

		if(previousWriteVariable.endStep == currentStep)
			forwardingEnable = true;
	}


	/**
	 * これより前にある書き込みノードの割り当てが終了していてかつ，現在書き込み可能なステップである -> true
	 */
	private boolean previousWriteVariableIsDead(int controlStep){

		int diedStep = -1;

		if(previousWriteVariable==null)
			return true;

		if(previousWriteVariable.assignState!=finished)
			return false;

		previousWriteVariable.searchTimeToLive();
		diedStep = previousWriteVariable.diedStep;
		return (diedStep < controlStep) ? true : false;//(書き込みステップ + 1) ステップ目からアクセス可能なので  LessThan
	}

	/**
	 * これより前にある変数アクセスノードの割り当てが終了している
	 */
	boolean checkPreviousVariable(){

		boolean ret = true;
		for(DFGraphVariableAccess vAccess : previousReadVariables){
			if(vAccess.assignState!=DFGraphNode.finished)
				ret &= false;
		}

		if(previousWriteVariable!=null && this.previousWriteVariable.assignState!=DFGraphNode.finished)
			ret &= false;
		return ret;
	}

	public VerilogVariableDecl getVariableDecl(){
		return variable;
	}

	public boolean isReadNode(){
		return isReadNode;
	}

	public void changeToWritableNode(){
		isReadNode = false;
	}

	public void loopVariableModify(String loopVariableName, int iterationNum, String updateOp, DFGraphNode updateExpressionNode){

		if(variable.getName().compareTo(loopVariableName)==0 && isReadNode){
			DFGraphLiteral literal = new DFGraphLiteral(VerilogVariableDecl.intType, iterationNum, 0, 0, 0, false);
			DFGraphBinary multBinaryNode = VerilogBinary.makeBinaryNode(literal, updateExpressionNode.clone(), VerilogBinary.MUL, parentManager.parentClass.config, null);
			DFGraphBinary binaryNode = VerilogBinary.makeBinaryNode(this.clone(), multBinaryNode, updateOp, parentManager.parentClass.config, null);
			replaceNode(binaryNode);
		}
	}

	protected boolean replaceVariableReference(VerilogVariableDecl originalVariable, VerilogVariableDecl clonedVariable){

		if( variable == originalVariable ){
			variable = clonedVariable;
			return true;
		}
		return false;
	}

	@Override
	public void assignDestSignal(VerilogClass parentClass){

		if(destTypeIsReg)
			destSignal = allocateTmpReg();

		else if(forwardingEnable)	//一時レジスタ不要のフォワーディング -> ワイヤアサイン
			super.assignDestSignal(parentClass);

		else
			destSignal = variable.getPrimitiveSignal();
	}

	@Override
	public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);

		if(assignNode!=null){	//書き込み
			VerilogNoneBlockAssign vAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, assignNode.destSignal, endState);
			registerNoneBlockAssign(controlStep, vAssign, endStep);

			if(variable.isArray)
				System.out.println("DEBUG:	error DFGraphVariableAccess  makeAlways");
		}
		else if(isReadNode && (!variable.isArray)){	//読み取り
			if(destTypeIsReg){

				VerilogNoneBlockAssign vAssign;
				if(forwardingEnable)
					vAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, previousWriteVariable.getAssignNode().destSignal, endState);
				else
					vAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, variable.getPrimitiveSignal(), endState);

				registerNoneBlockAssign(controlStep, vAssign, endStep);
			}
			else{
				if(forwardingEnable)
					((VerilogWire)destSignal).setAssignExpression(previousWriteVariable.getAssignNode().destSignal);
			}
		}
	}

	public void makeResetPart(ArrayList<VerilogNoneBlockAssign> resetAssign){

		StateIdentifier resetPart = new StateIdentifier(StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, true);
		VerilogNoneBlockAssign vAssign = new VerilogNoneBlockAssign((VerilogReg)getVariableDecl().getPrimitiveSignal(), assignNode.destSignal, resetPart);
		resetAssign.add(vAssign);
	}

	private void addPreviousReadVariable(DFGraphVariableAccess vNode){
		previousReadVariables.add(vNode);
	}

	private void addPreviousWriteVariable(DFGraphVariableAccess vNode){

		if(previousWriteVariable!=null)	//write ノードの二重登録はありえない
			System.out.println("DEBUG:	DFGraphVariableAccess addPreviousWriteVariable");

		this.previousWriteVariable = vNode;
	}

	private void addNextVariable(DFGraphVariableAccess vNode){
		this.nextVariable.add(vNode);
	}

	/**
	 * WAR ハザードの read ノード登録
	 * */
	public boolean registerReadNode(DFGraphVariableAccess previousRead){

		if(isReadNode)
			System.out.println("DEBUG:	error DFGraphVariableAccess registerReadNode");

		if(variable == previousRead.getVariableDecl()){
			addPreviousReadVariable(previousRead);
			previousRead.addNextVariable(this);
			return true;
		}
		return false;
	}

	/**
	 * RAW, WAW ハザードの write ノード登録
	 * */
	public boolean registerWriteNode(DFGraphVariableAccess previousWrite){

		if(variable == previousWrite.getVariableDecl()){
			addPreviousWriteVariable(previousWrite);
			previousWrite.addNextVariable(this);
			return true;
		}
		return false;
	}

	protected void resetConnectivity(){

		previousReadVariables.clear();
		previousWriteVariable = null;
		nextVariable.clear();
	}

	@Override
	public int getAssignedToNewRegStep(){

		int ret = -1;
		if(isReadNode){
			System.out.println("DEBUG:	error DFGraphVariableAccess getDiedStep");
		}
		else{
			ret = startStep;
		}
		return ret;
	}

	@Override
	public boolean destSignalIsNotSaved(){

		if(isReadNode()==false)
			System.out.println("DEBUG:	DFGraphVariableAccess	destSignalIsIPcoreOut");

		//if(forwardingEnable)	//このリードの前にある書き込みノードのソースノード（ = アサインノード）が何であれ，フォワーディングしている場合は true （一時レジスタの生存時間解決の複雑化を避けるため）
		//	return true;
		// フォワーディング結果をすぐに使えない場合は, deleUselessForwarding で forwarding ==false にする

		//return false;			//return !destTypeIsReg; にしてはいけない
		return needSaveValue;
	}

//	/**
//	 *	変数読み取りのフォワーディングが成立しているか調べる
//	 * */
//	protected void forwardingCheck(int currentStep){
//
//		if(this.assignState!=finished || !isReadNode)
//			System.out.println("DEBUG:	error DFGraphVariable Access forwardingCheck");
//
//		if(forwardingEnable){
//			if(currentStep > endStep){	//この変数ノードが読まれるステップが後過ぎて，フォワーディングできない
//				forwardingEnable = false;
//				++startStep;	//早めていた開始ステップを遅らせる
//				setEndStep(0, false);
//			}
//		}
//	}

	protected void deleUselessForwarding(){

		if(isReadNode){
			if(forwardingEnable && !destTypeIsReg){
				searchTimeToLive();

				if(diedStep > endStep){	//この変数ノードが読まれるステップが後過ぎて，フォワーディングする意味がない
					forwardingEnable = false;
					++startStep;	//早めていた開始ステップを遅らせる. 遅らせても, この後にある write ノードとハザードは起こさない (write ノードも 生存時間を基に書き込みタイミングを決めているから)
					setEndStep(0, false);

					for(int i=0; i<destNodes.size(); i++)
						destNodes.get(i).modifyStartAndEndStep(endStep);
				}
			}
		}
	}

	protected void setParedArrayAccess(DFGraphArrayAccess paredArrayAccess){
		this.paredArrayAccess = paredArrayAccess;
	}

	protected DFGraphArrayAccess getParedArrayAccess(){
		return paredArrayAccess;
	}

	@Override
	public void setComponentSign(){
		componentSigniture = variable.hashCode();
	}
}











