package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Stack;
import java.util.Collections;
import java.util.Comparator;

import net.njlab.circuit.TmpSignals;
import net.njlab.circuit.VerilogCaseChild;
import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogCondExpression;
import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.circuit.VerilogWire;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.dfg.DFGraphArrayAccess;
import net.njlab.dfg.DFGraphBinary;
import net.njlab.dfg.DFGraphConditional;
import net.njlab.dfg.DFGraphManager;
import net.njlab.dfg.DFGraphNode;
import net.njlab.dfg.DFGraphUnary;
import net.njlab.dfg.DFGraphVariableAccess;
import net.njlab.dump.Dump;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public class VerilogStage {

	int maxStep = 0;
	public int stageID;
	private ArrayList<VerilogStatement> statements = new ArrayList<VerilogStatement>();
	private ArrayList<DFGraphManager> DFGraphs = new ArrayList<DFGraphManager>();
	private ArrayList<ArrayList<DFGraphManager>> unrolledDFGraphs = new ArrayList<ArrayList<DFGraphManager>>();
	public int controlStepNum = 0;	//コントロールステップ数
	private int minCriticalPath = 0;	//高スループットな演算IPが十分な数ある場合の最小クリティカルパス
	ArrayList<DFGraphVariableAccess> variableAssembly = new ArrayList<DFGraphVariableAccess>(); //作業用array
	ArrayList<DFGraphArrayAccess> arrayAssembly = new ArrayList<DFGraphArrayAccess>(); //作業用array
	static ArrayList<DFGraphNode> destTypeIntNodes = new ArrayList<DFGraphNode>(); //作業用array
	static ArrayList<DFGraphNode> destTypeLongNodes = new ArrayList<DFGraphNode>(); //作業用array
	static ArrayList<DFGraphNode> destTypeFloatingNodes = new ArrayList<DFGraphNode>(); //作業用array
	static ArrayList<DFGraphNode> destTypeBooleanNodes = new ArrayList<DFGraphNode>(); //作業用array
	static ArrayList<DFGraphNode> allNode = new ArrayList<DFGraphNode>();

	public boolean checkRAW(VerilogStatement read){

		for(int i=statements.size()-1; i>=0; i--)
			for(int j=0; j<read.usedReadVariables.size(); j++)
				if(statements.get(i).usedWriteVariable==read.usedReadVariables.get(j))
					return true;
		return false;
	}

	public boolean checkWAW(VerilogStatement write){

		for(int i=statements.size()-1; i>=0; i--)
			if(write.usedWriteVariable!=null)
				if(statements.get(i).usedWriteVariable==write.usedWriteVariable)
					return true;
		return false;
	}

	public boolean checkWAR(VerilogStatement write){

		for(int i=statements.size()-1; i>=0; i--)
			for(int j=0; j<statements.get(i).usedReadVariables.size(); j++)
				if(write.usedWriteVariable==statements.get(i).usedReadVariables.get(j) &&
				   write.usedWriteVariable!=statements.get(i).usedWriteVariable)
					return true;
		return false;
	}

	public boolean checkMethodInv(){
		if(statements.get(0).haveMethodInv)
			return true;
		return false;
	}

	public VerilogStage(int stageID, VerilogStatement statement){
		this.stageID = stageID;
		statements.add(statement);
	}

	public VerilogStage(int stageID){
		this.stageID = stageID;
	}

	public void addStatement(VerilogStatement statement){
		statements.add(statement);
	}

	public ArrayList<VerilogStatement> getStatements(){
		return statements;
	}

	public ArrayList<DFGraphManager> getDFGraphs(){
		return DFGraphs;
	}

	public void makeDFG(VerilogClass claz, VerilogMethod parentMethod){

		for(int i=0; i<statements.size(); i++){

			String errDumpString = null;
			if(statements.get(i) instanceof VerilogVariableDecl){
				errDumpString = ((VerilogVariableDecl)statements.get(i)).vdecl.toString();
			}
			else if(statements.get(i) instanceof VerilogExprStatement){
				errDumpString = ((VerilogExprStatement)statements.get(i)).expr.toString();
			}

			DFGraphNode rootNode = statements.get(i).makeDFG();
			if(rootNode!=null){
				DFGraphManager tmp = new DFGraphManager(rootNode, claz, parentMethod, errDumpString);
				DFGraphs.add(tmp);
			}
		}
	}

	public void dumpDFG(PrintWriter wout, int offset){

		String expressionInStage="";	//このステージに割り当てられた式
		for(int i=0; i<DFGraphs.size(); ++i)
			if(!DFGraphs.get(i).cloned)
					expressionInStage += DFGraphs.get(i).errDumpString+"\n";

		expressionInStage = Dump.translateHTML(expressionInStage);
		//expressionInStage = expressionInStage.replaceAll("\r\n|\r|\n", "&nbsp;&nbsp;&nbsp;&nbsp;<br>&nbsp;&nbsp;");
		//expressionInStage = expressionInStage.replaceAll(" ", "&nbsp;");
		//expressionInStage = expressionInStage.replaceAll("	", "&nbsp;&nbsp;&nbsp;&nbsp");

		Dump.tprintln(wout, offset, "<Stage>");
		Dump.tprintln(wout, offset+1, "<stageID>	"+stageID+"	</stageID>");
		Dump.tprintln(wout, offset+1, "<stepNum>	"+controlStepNum+"	</stepNum>");
		Dump.tprintln(wout, offset+1, "<minCriticalPath>	"+minCriticalPath+"	</minCriticalPath>");
		Dump.tprintln(wout, offset+1, "<exprInStage>	<!--"+expressionInStage+"-->	</exprInStage>");

		for(int i=0; i<DFGraphs.size(); i++)
			DFGraphs.get(i).dumpDFG(wout, offset+1);
		Dump.tprintln(wout, offset, "</Stage>\n");
	}

	public ArrayList<DFGraphVariableAccess> getSrcVariable(){

		variableAssembly.clear();
		for(int i=0; i<DFGraphs.size(); i++){
			DFGraphVariableAccess srcNode;
			srcNode = DFGraphs.get(i).getPropagationNode();
			if(srcNode != null)
				variableAssembly.add(srcNode);
		}
		return variableAssembly;
	}

	public void  propagateInnerStage(boolean[] optContinueFlag, boolean originalORunrolled){

		ArrayList<DFGraphManager> DFGraphs = (originalORunrolled==VerilogStatAssemblage.original) ? this.DFGraphs : this.unrolledDFGraphs.get(this.unrolledDFGraphs.size()-1);

		for(int i=0; i<DFGraphs.size(); i++){

			DFGraphVariableAccess srcVariable = DFGraphs.get(i).getPropagationNode();
			if(srcVariable!=null){
				for(int j=i+1; j<DFGraphs.size(); j++){
					if(DFGraphs.get(j).propagate(srcVariable, optContinueFlag)) //伝播する変数に書き込みが行われたステージ以降は調べない
						break;
				}
			}
		}
	}

	public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag, boolean originalORunrolled){

		ArrayList<DFGraphManager> DFGraphs = (originalORunrolled==VerilogStatAssemblage.original) ? this.DFGraphs : this.unrolledDFGraphs.get(this.unrolledDFGraphs.size()-1);

		boolean isDestNode = false;
		for(int i=0; i<DFGraphs.size(); i++)
			isDestNode |= DFGraphs.get(i).propagate(propagationNode, optContinueFlag);
		return isDestNode;
	}

	public void constantFolding(boolean[] optContinueFlag, boolean originalORunrolled){

		ArrayList<DFGraphManager> DFGraphs = (originalORunrolled==VerilogStatAssemblage.original) ? this.DFGraphs : this.unrolledDFGraphs.get(this.unrolledDFGraphs.size()-1);

		for(int i=0; i<DFGraphs.size(); i++)
			DFGraphs.get(i).constantFolding(optContinueFlag);
	}

	public void constantFoldingForBinarySequence(boolean originalORunrolled){

		ArrayList<DFGraphManager> DFGraphs = (originalORunrolled==VerilogStatAssemblage.original) ? this.DFGraphs : this.unrolledDFGraphs.get(this.unrolledDFGraphs.size()-1);

		for(int i=0; i<DFGraphs.size(); i++)
			DFGraphs.get(i).constantFoldingForBinarySequence();
	}

	public void registerNodeToDFGraphManager(){

		for(int i=0; i<DFGraphs.size(); i++)
			DFGraphs.get(i).registerNode();
	}

	/**
	 * 変数の最終アクセスステップを格納するオブジェクトをDFGraphVariable に渡す
	 * */
	public void setLastAccessObj(){

		variableAssembly.clear();

		for(int i=0; i<DFGraphs.size(); i++){	//ステージ内の全ノードからDFGraphVariableAccess を集める
			for(int j=0; j<DFGraphs.get(i).statementNode.size(); j++){
				if(DFGraphs.get(i).statementNode.get(j) instanceof DFGraphVariableAccess){
					variableAssembly.add((DFGraphVariableAccess)DFGraphs.get(i).statementNode.get(j));
				}
			}
		}
		while(!variableAssembly.isEmpty()){

			int[] lastAccessStep = {-1};
			DFGraphVariableAccess vAccessNode = variableAssembly.remove(0);
			vAccessNode.setAccessStepObj(lastAccessStep);

			for(int i=0; i<variableAssembly.size(); i++){
				if(vAccessNode.getVariableDecl() == variableAssembly.get(i).getVariableDecl()){
					variableAssembly.get(i).setAccessStepObj(lastAccessStep);
					variableAssembly.remove(i);
					--i;
				}
			}
		}
	}

	/**
	 * 同一の配列から読み取る DFGraphArrayAccess の maxCtrlStepForRead に配列をセット
	 * */
	public void setStepIsAccessable(){

		arrayAssembly.clear();

		for(int i=0; i<DFGraphs.size(); i++){	//ステージ内の全ノードからDFGraphVariableAccess を集める
			for(int j=0; j<DFGraphs.get(i).statementNode.size(); j++){
				if(DFGraphs.get(i).statementNode.get(j) instanceof DFGraphArrayAccess){
					arrayAssembly.add((DFGraphArrayAccess)DFGraphs.get(i).statementNode.get(j));
				}
			}
		}
		while(!arrayAssembly.isEmpty()){

			ArrayList<Boolean> stepIsAccessable = new ArrayList<Boolean>();
			DFGraphArrayAccess arayAccessNode = arrayAssembly.remove(0);
			arayAccessNode.setStepIsAccessable(stepIsAccessable);

			for(int i=0; i<arrayAssembly.size(); i++){
				if(arayAccessNode.srcVariable.getVariableDecl() == arrayAssembly.get(i).srcVariable.getVariableDecl()){
					arrayAssembly.get(i).setStepIsAccessable(stepIsAccessable);
					arrayAssembly.remove(i);
					--i;
				}
			}
		}
	}

	public void listScheduling(SchedulingListSet listSet){

		assembleNode();
		for(int i=DFGraphs.size()-1; i>=0; --i)
			DFGraphs.get(i).computePriority();

		searchMinCriticalPath();
		defFastestStepForAlap();

		int controlStep=0;	//ステップ
		do{
			boolean IPcoreIsAssigned = false;	//フォワーディングやチェイニングの都合でIPコアの割り当てが終わった後で，割り当て可能となるノードもある
			do{
				assignControlStep(controlStep, listSet);
				IPcoreIsAssigned = listSet.assignIPcore(controlStep);
			}
			while(IPcoreIsAssigned);
			popNode();
			listSet.UpdateReUseTime();
			++controlStep;
		}
		while(!allNode.isEmpty());

		deleteUselessForwarding();
		controlStepNum = countStepNum();
	}

	private void popNode(){	//ステップアサインの終わったノードを取り除く

		for(int i=0; i<allNode.size(); i++){
			if(allNode.get(i).getAssignedState()==DFGraphNode.finished){
				allNode.remove(allNode.get(i));
				--i;
			}
		}
	}

	private void assembleNode(){

		allNode.clear();
		for(int i=0; i<DFGraphs.size(); i++){
			for(int j=0; j<DFGraphs.get(i).statementNode.size(); j++){
				allNode.add(DFGraphs.get(i).statementNode.get(j));
			}
		}
	}

	/**
	 * 最小の (計算資源数が十分にある場合の) クリティカルパスをさがす
	 * */
	private void searchMinCriticalPath(){

		minCriticalPath = 0;
		for(int i=0; i<DFGraphs.size(); i++)
			minCriticalPath = Math.max(DFGraphs.get(i).searchMinCriticalPath(), minCriticalPath);
	}

	/**
	 * 同じステージの各DFGノードに最小の (計算資源数が十分にある場合の) クリティカルパスを渡す
	 * */
	private void defFastestStepForAlap(){

		for(int i=0; i<DFGraphs.size(); i++)
			DFGraphs.get(i).defFastestStepForAlap(minCriticalPath);
	}

	private void assignControlStep(int controlStep, SchedulingListSet listSet){

		for(int i=0; i<DFGraphs.size(); i++)
			DFGraphs.get(i).assignControlStep(controlStep, listSet);
	}

	private void deleteUselessForwarding(){

		for(DFGraphManager dfg : DFGraphs)
			dfg.deleteUselessForwarding();
	}

	private int countStepNum(){
		for(int i=0; i<DFGraphs.size(); i++){
			if(DFGraphs.get(i).getRootNode()!=null){
				maxStep = Math.max(maxStep, DFGraphs.get(i).getRootNode().endStep);
			}
		}
		return maxStep+1;
	}

	public void cloneDFG(int iteration, String loopVariableName,
						 ArrayList<VerilogVariableDecl> originalVariable, ArrayList<VerilogVariableDecl> clonedVariable, String updateOp,
						 DFGraphNode updateExpressionNode, ArrayList<DFGraphManager> unrolledDFGraphsTmp){

		for(int i=0; i<DFGraphs.size(); i++)
			unrolledDFGraphsTmp.add(DFGraphs.get(i).copyDFG(iteration, loopVariableName, originalVariable, clonedVariable, updateOp, updateExpressionNode));
	}

	/**
	 * ループ間の依存関係を無くすため, ループ変数を入れ替える<br>
	 * [befor]<br>
	 * a[i] = b[i] * c[i]<br>
	 * ++i;<br>
	 *<br>
	 *[after]<br>
	 * a[i_0] = b[i_1] * c[i_2];<br>
	 * ++i;<br>
	 * ++i_0;<br>
	 * ++i_1;<br>
	 * ++i_2;<br>
	 * */
	public void replaceLoopVariable(VerilogVariableDecl original, ArrayList<VerilogVariableDecl> newVariables){


		ArrayList<VerilogVariableDecl> originalVar  = new ArrayList<VerilogVariableDecl>();
		originalVar.add(original);
		ArrayList<VerilogVariableDecl> tmp = new ArrayList<VerilogVariableDecl>();
		ArrayList<VerilogVariableDecl> newVar = new ArrayList<VerilogVariableDecl>( newVariables );

		ArrayList<DFGraphManager> includeingCopiedExpr = new ArrayList<DFGraphManager>();

		for(int i=0; i<DFGraphs.size(); ++i){

			if(DFGraphs.get(i).rootNodeIsSameVariable(original)){	//ループ変数に代入している式である -> この式をコピーして, ループ変数を newVariable に置き換える

				for(int j=0; j<newVariables.size(); ++j){
					tmp.clear();
					tmp.add(newVariables.get(j));
					DFGraphManager copiedDFGs = DFGraphs.get(i).copyDFG(0, null, originalVar, tmp, null, null);	//DFGコピー & ループ変数入れ替え]
					includeingCopiedExpr.add(copiedDFGs);
				}
			}
			else{	//ループ変数に代入していない -> original を参照するDFGraphVariableDecl ノードの参照を変更する
				variableAssembly.clear();
				DFGraphs.get(i).replceVariableReference(original, newVar);
				includeingCopiedExpr.add(DFGraphs.get(i));
			}
		}
		DFGraphs.clear();
		DFGraphs.addAll(includeingCopiedExpr);

		if(newVar.size()!=0)
			System.out.println("DEBUG: error VerilogStage replaceLoopVariable");	//用意したコピーループ変数を使い切っていない
	}

	/**
	 * stage内で var に代入していない式が var を参照している回数
	 * */
	protected int calcRefTimesOfVar(VerilogVariableDecl var){


		int refTimes = 0;
		for(int i=0; i<DFGraphs.size(); ++i)
			if(!DFGraphs.get(i).rootNodeIsSameVariable(var)){	//var に代入している式はカウントしない
				refTimes += DFGraphs.get(i).calcRefTimesOfVar(var);
			}
		return refTimes;
	}

	public void addUnrolledDFGraphs(ArrayList<DFGraphManager> unrolledDFGraphsTmp){
		unrolledDFGraphs.add(unrolledDFGraphsTmp);
	}

	public void unifyUnrolledGraph(){

		for(int i=0; i<unrolledDFGraphs.size(); i++){
			DFGraphs.addAll(unrolledDFGraphs.get(i));
		}
	}

	public void getMaxRegisterNum(VerilogClass parentClass){

		int usedIntRegNum=0;
		int usedLongRegNum=0;
		int usedFloatRegNum=0;
		int usedBoolRegNum=0;

		for(int i=0; i<DFGraphs.size(); i++){
			DFGraphs.get(i).getMaxRegisterNum();
			usedIntRegNum += DFGraphs.get(i).usedIntRegNum;
			usedLongRegNum += DFGraphs.get(i).usedLongRegNum;
			usedFloatRegNum += DFGraphs.get(i).usedFloatRegNum;
			usedBoolRegNum += DFGraphs.get(i).usedBoolRegNum;
		}
		parentClass.setUsedRegNum(usedIntRegNum, usedLongRegNum, usedFloatRegNum, usedBoolRegNum);
	}

	public void getMaxRegisterNumWithSharing(VerilogClass parentClass){

		int usedIntRegNum=0;
		int usedLongRegNum=0;
		int usedFloatRegNum=0;
		int usedBoolRegNum=0;

		for(int i=0; i<DFGraphs.size(); i++){
			DFGraphs.get(i).searchTimeToLive();
		}

		destTypeIntNodes.clear();
		destTypeLongNodes.clear();
		destTypeFloatingNodes.clear();
		destTypeBooleanNodes.clear();

		for(int i=0; i<DFGraphs.size(); i++){
			for(int j=DFGraphs.get(i).statementNode.size()-1; j>=0; j--){
				DFGraphNode tmp = DFGraphs.get(i).statementNode.get(j);
				if(tmp.destTypeIsReg){

					if(tmp.destType==DFGraphNode.destTypeInt)
						pushOrderedInBornedStep(destTypeIntNodes, tmp);

					else if(tmp.destType==DFGraphNode.destTypeLong)
						pushOrderedInBornedStep(destTypeLongNodes, tmp);

					else if(tmp.destType==DFGraphNode.destTypeFloating)
						pushOrderedInBornedStep(destTypeFloatingNodes, tmp);

					else if(tmp.destType==DFGraphNode.destTypeBoolean)
						pushOrderedInBornedStep(destTypeBooleanNodes, tmp);
				}
			}
		}
		//dumpLifeTime();
		usedIntRegNum = assignRegisterID(parentClass,   TmpSignals.intType,      destTypeIntNodes,      parentClass.config.maxIntSharingNum);
		usedLongRegNum = assignRegisterID(parentClass,  TmpSignals.longType,     destTypeLongNodes,     parentClass.config.maxLongSharingNum);
		usedFloatRegNum = assignRegisterID(parentClass, TmpSignals.floatingType, destTypeFloatingNodes, parentClass.config.maxFloatSharingNum);
		usedBoolRegNum = assignRegisterID(parentClass,  TmpSignals.boolType,     destTypeBooleanNodes,  parentClass.config.maxBoolSharingNum);
		parentClass.setUsedRegNum(usedIntRegNum, usedLongRegNum, usedFloatRegNum, usedBoolRegNum);
	}

	void dumpLifeTime(){

		for(int i=0; i<destTypeIntNodes.size(); i++){
			System.out.println("int life:	"+i+"	"+destTypeIntNodes.get(i).bornedStep+" - "+destTypeIntNodes.get(i).diedStep);
		}
		for(int i=0; i<destTypeLongNodes.size(); i++){
			System.out.println("long life:	"+i+"	"+destTypeLongNodes.get(i).bornedStep+" - "+destTypeLongNodes.get(i).diedStep);
		}
		for(int i=0; i<destTypeFloatingNodes.size(); i++){
			System.out.println("floating life:	"+i+"	"+destTypeFloatingNodes.get(i).bornedStep+" - "+destTypeFloatingNodes.get(i).diedStep);
		}
		for(int i=0; i<destTypeBooleanNodes.size(); i++){
			System.out.println("boolean life:	"+i+"	"+destTypeBooleanNodes.get(i).bornedStep+" - "+destTypeBooleanNodes.get(i).diedStep);
		}
		System.out.println("--");
	}

	private int assignRegisterID(VerilogClass parentClass, int regType, ArrayList<DFGraphNode> DFGAssembly, int maxSharingNum){

		TmpSignals tmpSignals = parentClass.getTmpSignals();
		int currentDiedStep;
		int sharedNum;
		ArrayList< ArrayList<DFGraphNode> > sharingNodesArray = new ArrayList< ArrayList<DFGraphNode> >();

		if(parentClass.config.reduceConnectionConst)
			for(DFGraphNode node : DFGAssembly)
				node.setComponentSign();	//レジスタセーブする場合, signiture (signiture:同一のハードウェアコンポーネントを持つ場合同じ値) を付ける

		while(DFGAssembly.size()>0){

			ArrayList<DFGraphNode> sharingNodes = new ArrayList<DFGraphNode>();
			currentDiedStep = DFGAssembly.get(0).diedStep;
			int componentSigniture = DFGAssembly.get(0).getComponentSign();
			sharedNum = 1;

			for(int i=1; i<DFGAssembly.size(); i++){	//同じレジスタを共有するノードを集める

				if(sharedNum >= maxSharingNum)
					break;

				//if(currentDiedStep <= DFGAssembly.get(i).bornedStep){  //生存時間が被らない
				if(currentDiedStep <= DFGAssembly.get(i).bornedStep && componentSigniture==DFGAssembly.get(i).getComponentSign()){  //生存時間が被らない && signiture が同じ
					currentDiedStep = DFGAssembly.get(i).diedStep;
					++sharedNum;
					sharingNodes.add(DFGAssembly.remove(i--));
				}
			}
			sharingNodes.add(DFGAssembly.remove(0));
			sharingNodesArray.add(sharingNodes);
		}

		if(parentClass.config.reduceConnectionConst)
			sharingNodesArray = mergeNodesToSameReg(sharingNodesArray, maxSharingNum);	//componentSigniture は違うが同じ変数に割り当て可能なノードを統合する

		allocateTmpReg(tmpSignals, regType, sharingNodesArray, maxSharingNum);
		return sharingNodesArray.size();
	}

	/**
	 * nodeSigniture は違うが, 変数のライフタイムが被らないノード郡をマージする
	 * */
	private ArrayList< ArrayList<DFGraphNode> > mergeNodesToSameReg(ArrayList< ArrayList<DFGraphNode> > sharingNodesArray, int maxSharingNum){

		ArrayList< ArrayList<DFGraphNode> > sharingNodesArrayMerged = new ArrayList< ArrayList<DFGraphNode> >();	//マージ済みのノード郡を格納する

		while(sharingNodesArray.size()>0){

			sortInOrderOfNodeNum(sharingNodesArray);
			ArrayList<DFGraphNode> mergedNodes = sharingNodesArray.remove(sharingNodesArray.size()-1);
			boolean isMarged = false;

			for(int i=sharingNodesArray.size()-1; i>=0; --i){
				isMarged = isMerged(mergedNodes, sharingNodesArray.get(i), maxSharingNum);
				if( isMarged )
					break;
			}

			if(!isMarged)	//マージされなった場合, mergedNodes をマージ済みノード群として sharingNodesArrayMerged に格納する
				sharingNodesArrayMerged.add(mergedNodes);
		}

		return sharingNodesArrayMerged;
	}

	private boolean isMerged(ArrayList<DFGraphNode> merged, ArrayList<DFGraphNode> absorber, int maxSharingNum){

		if(merged.size() + absorber.size() > maxSharingNum)
			return false;

		for(int i=0; i<merged.size(); ++i)
			for(int j=0; j<absorber.size(); ++j)
				if(  !((merged.get(i).diedStep   <= absorber.get(j).bornedStep) ||	//変数のライフタイムが被っている -> マージ不能
					   (absorber.get(j).diedStep <= merged.get(i).bornedStep  ))  )
							return false;

		absorber.addAll(merged);
		return true;
	}

	/**
	 * sharingNodesArray をシェアリングしているノード数が 「多い」 順にソート
	 */
	private void sortInOrderOfNodeNum(ArrayList< ArrayList<DFGraphNode> > sharingNodesArray){

		Collections.sort(sharingNodesArray, new Comparator(){

			public int compare(Object obj0, Object obj1){
				ArrayList<DFGraphNode> ary0 = (ArrayList<DFGraphNode>)obj0;
				ArrayList<DFGraphNode> ary1 = (ArrayList<DFGraphNode>)obj1;
				return ary0.size() - ary1.size();
			}
		});
	}

	private void allocateTmpReg(TmpSignals tmpSignals, int regType, ArrayList< ArrayList<DFGraphNode> > sharingNodesArray, int maxSharingNum){

		sortInOrderOfNodeNum(sharingNodesArray);

		ArrayList<VerilogReg> tmpRegs = tmpSignals.buildTmpRegArray(regType);	//すでにアロケートされたレジスタをシェリング数が 「少ない」 順にソートして取得

		for(ArrayList<DFGraphNode> sharingNodes : sharingNodesArray){	//sharingNodes -> 同じレジスタを共有するノード

			boolean registerIsAssigned = false;
			for(int i=0; i<tmpRegs.size(); ++i){
				if( maxSharingNum >= tmpRegs.get(i).usedTime + sharingNodes.size() ){	//最大シェアリング回数 >= すでにシェアリングされている回数 + 今回シェアリングされる回数

					for(DFGraphNode sharingNode : sharingNodes){
						sharingNode.setRegisterID(tmpRegs.get(i).getTmpRegID());	//レジスタIDセット
						++tmpRegs.get(i).usedTime;
					}
					registerIsAssigned = true;
					tmpRegs.remove(i);
					break;
				}
			}

			if(registerIsAssigned==false){	//すでにアロケートされたレジスタには，割り当てられなかった -> 新しくレジスタを作成

				VerilogReg newReg = tmpSignals.allocateReg(regType);
				for(DFGraphNode sharingNode : sharingNodes){
					sharingNode.setRegisterID(newReg.getTmpRegID());	//レジスタIDセット
					++newReg.usedTime;
				}
			}
		}
	}

	/**
	 * 一時レジスタを持つノードを生まれた順に格納
	 * */
	private void pushOrderedInBornedStep(ArrayList<DFGraphNode> DFGAssembly, DFGraphNode tmp){

		int low = 0;
		int high = DFGAssembly.size() - 1;
		int mid;
		int key = tmp.bornedStep;

		while( low <= high ){

			mid = (low+high)/2;
			if( DFGAssembly.get(mid).bornedStep == key ){
				DFGAssembly.add(mid, tmp);
				return;
			}
			else if(DFGAssembly.get(mid).bornedStep < key){
				low = mid + 1;
			}
			else{
				high = mid - 1;
			}
		}
		DFGAssembly.add(low, tmp);
	}

	public void bindTmpReg(VerilogClass parentClass){

		for(int i=0; i<DFGraphs.size(); i++)
			DFGraphs.get(i).bindTmpReg(parentClass);
	}

	public void modifyReturnCast(String retType){
		DFGraphs.get(0).modifyReturnCast(retType);
		if(DFGraphs.size()!=1)
			System.out.println("DEBUG:	error  VerilogStage modifyReturnCast");
	}


	/**
	 * destSignal にアサインされている式（文字列）順にソート
	 */
	private void sortOfStringAssignedToWire(ArrayList<DFGraphNode> allNode){

		Collections.sort(allNode, new Comparator(){

			public int compare(Object obj0, Object obj1){
				DFGraphNode ary0 = (DFGraphNode)obj0;
				DFGraphNode ary1 = (DFGraphNode)obj1;
				VerilogWire wire0 = (VerilogWire)ary0.getDestSignal();
				VerilogWire wire1 = (VerilogWire)ary1.getDestSignal();
				String wire0AssignStr = wire0.assignExpr.getExprString(wire0.bitWidth, wire0.isSigned);
				String wire1AssignStr = wire1.assignExpr.getExprString(wire1.bitWidth, wire1.isSigned);
				return wire0AssignStr.compareTo(wire1AssignStr);
			}
		});
	}

	/**
	 * destSignal が ワイヤでかつassignExprがあるもの以外取り除く
	 * */
	private ArrayList<DFGraphNode> assembleWiredDestNodes(ArrayList<DFGraphNode> allNodes) {

		ArrayList<DFGraphNode> nodes = new ArrayList<DFGraphNode>();

		for(int i=0; i<allNodes.size(); ++i){
			VerilogSignal destSignal = allNodes.get(i).getDestSignal();
			if( (destSignal instanceof VerilogWire) && (destSignal.assignExpr!=null))
				nodes.add(allNodes.get(i));
		}
		return nodes;
	}

	private boolean mergeDestSignalWire(ArrayList<DFGraphNode> nodes, TmpSignals tmpSignals) {

		boolean optimized = false;
		int cmpPoint=0;
		while(cmpPoint<nodes.size()){

			VerilogWire wireA = (VerilogWire)nodes.get(cmpPoint).getDestSignal();
			String stringA = wireA.assignExpr.getExprString(wireA.bitWidth, wireA.isSigned);

			//2つのノードの destSignal(wire) に assign する文字列が同じ場合, 2つのノード間で同じ wire を参照させる
			int cmpredPoint = cmpPoint+1;
			while(cmpredPoint<nodes.size()){
				VerilogWire wireB = (VerilogWire)nodes.get(cmpredPoint).getDestSignal();
				String stringB = wireB.assignExpr.getExprString(wireB.bitWidth, wireB.isSigned);

				if(stringA.compareTo(stringB)==0 && wireA.getSigName().compareTo(wireB.getSigName())!=0){
					nodes.get(cmpredPoint).replaceDestSignal(nodes.get(cmpPoint).getDestSignal());
					++cmpredPoint;
					optimized = true;
					tmpSignals.deleteWire(wireB);	//不要な wire は消さなくて良い. 論理合成時の最適化で消えるため回路規模は同じ(2013/10/20 確認) -> やはりシミュレーションが遅くなるので消す
				}
				else{
					break;
				}
			}
			cmpPoint = cmpredPoint;
		}
		return optimized;
	}

	private boolean mergeBinaryOpResultWire(ArrayList<DFGraphNode> nodes, TmpSignals tmpSignals){

		boolean ret = false;
		ArrayList<DFGraphBinary> binaryNodes = new ArrayList<DFGraphBinary>();

		for(DFGraphNode node : nodes)
			if(node instanceof DFGraphBinary)
				if( ((DFGraphBinary)node).getBinaryOpResult()!=null )
					binaryNodes.add((DFGraphBinary)node);

		for(int i=0; i<binaryNodes.size(); ++i){

			VerilogWire cmpWire = binaryNodes.get(i).getBinaryOpResult();
			String cmpStr = cmpWire.assignExpr.getExprString(cmpWire.bitWidth, cmpWire.isSigned);

			for(int j=i+1; j<binaryNodes.size(); ++j){

				VerilogWire cmpredWire = binaryNodes.get(j).getBinaryOpResult();
				String cmpredStr = cmpredWire.assignExpr.getExprString(cmpredWire.bitWidth, cmpredWire.isSigned);

				if(cmpStr.compareTo(cmpredStr)==0 && cmpWire.getSigName().compareTo(cmpredWire.getSigName())!=0){
					binaryNodes.get(j).replaceBinaryOpResult(cmpWire);
					binaryNodes.remove(j);
					tmpSignals.deleteWire(cmpredWire);
					--j;
					ret = true;
				}
			}
		}
		return ret;
	}

	private boolean mergeUnaryOpResultWire(ArrayList<DFGraphNode> nodes, TmpSignals tmpSignals){

		boolean ret = false;
		ArrayList<DFGraphUnary> unaryNodes = new ArrayList<DFGraphUnary>();

		for(DFGraphNode node : nodes)
			if(node instanceof DFGraphUnary)
				if( ((DFGraphUnary)node).getUnaryOpResult()!=null )
					unaryNodes.add((DFGraphUnary)node);

		for(int i=0; i<unaryNodes.size(); ++i){

			VerilogWire cmpWire = unaryNodes.get(i).getUnaryOpResult();
			String cmpStr = cmpWire.assignExpr.getExprString(cmpWire.bitWidth, cmpWire.isSigned);

			for(int j=i+1; j<unaryNodes.size(); ++j){

				VerilogWire cmpredWire = unaryNodes.get(j).getUnaryOpResult();
				String cmpredStr = cmpredWire.assignExpr.getExprString(cmpredWire.bitWidth, cmpredWire.isSigned);

				if(cmpStr.compareTo(cmpredStr)==0 && cmpWire.getSigName().compareTo(cmpredWire.getSigName())!=0){
					unaryNodes.get(j).replaceUnaryOpResult(cmpWire);
					unaryNodes.remove(j);
					tmpSignals.deleteWire(cmpredWire);
					--j;
					ret = true;
				}
			}
		}
		return ret;
	}

	private boolean mergeConditionalDestWire(ArrayList<DFGraphNode> nodes, TmpSignals tmpSignals){

		boolean ret = false;
		ArrayList<DFGraphConditional> condNodes = new ArrayList<DFGraphConditional>();

		for(DFGraphNode node : nodes)
			if(node instanceof DFGraphConditional)
				if( ((DFGraphConditional)node).getDestWire()!=null )
					condNodes.add((DFGraphConditional)node);

		for(int i=0; i<condNodes.size(); ++i){

			VerilogWire cmpWire = condNodes.get(i).getDestWire();
			String cmpStr = cmpWire.assignExpr.getExprString(cmpWire.bitWidth, cmpWire.isSigned);

			for(int j=i+1; j<condNodes.size(); ++j){

				VerilogWire cmpredWire = condNodes.get(j).getDestWire();
				String cmpredStr = cmpredWire.assignExpr.getExprString(cmpredWire.bitWidth, cmpredWire.isSigned);

				if(cmpStr.compareTo(cmpredStr)==0 && cmpWire.getSigName().compareTo(cmpredWire.getSigName())!=0){
					condNodes.get(j).replaceDestWire(cmpWire);
					condNodes.remove(j);
					tmpSignals.deleteWire(cmpredWire);
					--j;
					ret = true;
				}
			}
		}
		return ret;
	}

	/**
	 * ワイヤアサインを最適化 ( 同じ文字列を assign している wire をマージする )
	 * */
	private boolean optWireAssign(VerilogStatAssemblage parentStatAsm){

		TmpSignals tmpSignals = parentStatAsm.getParentClass().getTmpSignals();

		if(!parentStatAsm.getParentClass().config.optimizeWire)
			return false;

		assembleNode();
		ArrayList<DFGraphNode> nodes = assembleWiredDestNodes(allNode);
		sortOfStringAssignedToWire(nodes);	//wire に assign する 文字列順に 並び替え
		boolean optimized = mergeDestSignalWire(nodes, tmpSignals);	//destSignal にアサインする wire をマージ

		optimized |= mergeBinaryOpResultWire(allNode, tmpSignals);
		optimized |= mergeUnaryOpResultWire(allNode, tmpSignals);
		optimized |= mergeConditionalDestWire(allNode, tmpSignals);

		return optimized;
	}

	/**
	 * ステージ制御のcase文構築
	 * */
	public VerilogCaseChild makeStageControl(boolean isLastStage, VerilogMethod parentMethod, VerilogStatAssemblage parentStatAsm){

		VerilogCaseChild stage = new VerilogCaseChild();
		stage.setCond(new VerilogLiteralNumber(parentMethod.regStage.bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(stageID)));
		VerilogCaseStatement stepControl = new VerilogCaseStatement();
		stepControl.setBranchSignal(parentMethod.regStep);

		if(isLastStage){
			boolean hasBranch = parentStatAsm.stgNode.getNextPhase()!=null && parentStatAsm.stgNode.getElsePhase()!=null;	//このステージのあるフェイズは，分岐する

			if(hasBranch){
				if(DFGraphs.size()!=1)
					System.out.println("DEBUG:	error VerilogStage phaseAssign");	//条件分岐のあるフェイズに複数のDFGがあるのは，おかしい

				controlStepNum = DFGraphs.get(0).getRootNode().getStartEnableStep(DFGraphs.get(0).getRootNode(), 0) + 1;	//条件分岐のとき1ステップ大目に必要になる場合があるのでcontrolStepNum修正 ( < や == のチェイニングを無効にしたばあい )
			}
		}

		ArrayList<VerilogNoneBlockAssign>[] controlStep = new ArrayList[controlStepNum];
		makeDfgAlways(parentMethod.methodID, parentStatAsm, controlStep);

		phaseAssign(controlStep, isLastStage, parentMethod, parentStatAsm, controlStepNum-1);
		makeControlStep(stepControl, controlStep, parentMethod);
		stage.addChildBlock(stepControl);
		makeStepStageAssign(stepControl, parentMethod, isLastStage, parentStatAsm);
		return stage;
	}

	/**
	 * DFGraph の always 文を作成
	 * */
	private void makeDfgAlways(int methodID, VerilogStatAssemblage parentStatAsm, ArrayList<VerilogNoneBlockAssign>[] controlStep){

		boolean optimizedWireAssign = true;

		while(optimizedWireAssign){

			for(int i=0; i<controlStep.length; ++i)// noneBlock 代入クリア
				if(controlStep[i]!=null)
					controlStep[i].clear();

			for(int i=0; i<DFGraphs.size(); i++)	//noneBlock 代入作成
				DFGraphs.get(i).makeNoneBlockAssign(controlStep, methodID, parentStatAsm.stateID, stageID);

			optimizedWireAssign = optWireAssign(parentStatAsm);
		}
	}

	/**フェイズの処理<br>
	 * 最終ステージの最終ステップ -> phase = (branch) ? nextPhase : elsePhase
	 * */
	private void phaseAssign(ArrayList<VerilogNoneBlockAssign>[] controlStep, boolean isLastStage, VerilogMethod parentMethod, VerilogStatAssemblage parentStatAsm, int lastStep){

		if(isLastStage){

			int methodID = parentMethod.getMethodID();
			int phaseID = parentStatAsm.stateID;
			StateIdentifier assignedState = new StateIdentifier(methodID, phaseID, stageID, lastStep, false);
			boolean hasBranch = parentStatAsm.stgNode.getNextPhase()!=null && parentStatAsm.stgNode.getElsePhase()!=null;	//このステージのあるフェイズは，分岐する
			VerilogNoneBlockAssign phaseControlAssign = null;

			if(hasBranch){
				if(DFGraphs.size()!=1)
					System.out.println("DEBUG:	error VerilogStage phaseAssign");	//条件分岐のあるフェイズに複数のDFGがあるのは，おかしい

				VerilogSignal branched    = parentStatAsm.stgNode.getNextPhase().getCurrentPhaseSignal();
				VerilogSignal notBranched = parentStatAsm.stgNode.getElsePhase().getCurrentPhaseSignal();
				VerilogCondExpression condExpr = new VerilogCondExpression(DFGraphs.get(0).getRootNode().getDestSignal(), branched, notBranched);
				VerilogSignalString condExprSignal = new VerilogSignalString(condExpr.getExprString(branched.bitWidth, branched.isSigned), 0, parentMethod.getPhaseReg().isSigned);
				phaseControlAssign = new VerilogNoneBlockAssign(parentMethod.getPhaseReg(), condExprSignal, assignedState);
			}
			else{
				phaseControlAssign = new VerilogNoneBlockAssign(parentMethod.getPhaseReg(), parentStatAsm.stgNode.getNextPhase().getCurrentPhaseSignal(), assignedState);
			}

			if(controlStep[lastStep]==null)
				controlStep[lastStep] = new ArrayList<VerilogNoneBlockAssign>();

			controlStep[lastStep].add(phaseControlAssign);
		}
	}

	/**
	 * ステップ制御のcase文構築
	 * */
	private void makeControlStep(VerilogCaseStatement stepControl, ArrayList<VerilogNoneBlockAssign>[] controlStep, VerilogMethod parentMethod){

		boolean compressState = parentMethod.getParentClass().config.genCodeForCompressedState;

		if(compressState){
			for(int stepNumber=0; stepNumber<controlStep.length; stepNumber++){	//全ステップ文の caseChild を構築

				VerilogCaseChild step = new VerilogCaseChild();
					step.setCond(new VerilogLiteralNumber(parentMethod.regStep.bitWidth,
														  VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(stepNumber)) );

				if(controlStep[stepNumber]!=null)
					for(int i=0;i<controlStep[stepNumber].size(); i++)
						step.addNoneBlockStat(controlStep[stepNumber].get(i));

					stepControl.addChildStat(step);
			}
		}
		else{
			for(int stepNumber=0; stepNumber<controlStep.length; stepNumber++){

				if(controlStep[stepNumber]!=null){

					VerilogCaseChild step = new VerilogCaseChild();
					step.setCond(new VerilogLiteralNumber(parentMethod.regStep.bitWidth,
														  VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(stepNumber)) );

					for(int i=0;i<controlStep[stepNumber].size(); i++)
						step.addNoneBlockStat(controlStep[stepNumber].get(i));

					stepControl.addChildStat(step);
				}
			}
		}

		//最低1ステップは確保する
		if(stepControl.getChildStat().size()==0){
			VerilogCaseChild step = new VerilogCaseChild();
			step.setIsDefault(true);
			stepControl.addChildStat(step);
		}
	}


	/**
	 * 非最終ステップ -> step = step + 1;
	 * 最終ステップ -> stage = stage+1,   step = 0
	 * 最終ステージの最終ステップ -> stege = 0, step = 0, regPhase = parent
	 * */
	private void makeStepStageAssign(VerilogCaseStatement stepControl, VerilogMethod parentMethod, boolean isLastStage, VerilogStatAssemblage parentStatAsm){

		stageAssign(stepControl, parentMethod, parentStatAsm.stateID, isLastStage);
		stepAssign(stepControl, parentMethod, parentStatAsm.stateID);

		if(stepControl.getChildStat().size()==1)
			stepControl.getChildStat().get(0).setIsDefault(true);
	}

	/**ステップの処理<br>
	 * 最終ステップ -> step = 0<br>
	 * 最終ステップ以外 -> step = step + 1
	 * */
	private void stepAssign(VerilogCaseStatement stepControl, VerilogMethod parentMethod, int phaseID){

		VerilogCaseChild lastStep = stepControl.getChildStat().get(stepControl.getChildStat().size()-1);
		StateIdentifier assignedState = new StateIdentifier(parentMethod.getMethodID(), phaseID, stageID, lastStep.getCondNumber(), false);

		VerilogSignalString stepZero = new VerilogSignalString(parentMethod.regStep.bitWidth+VerilogLiteralNumber.typeHexadecimal+0, parentMethod.regStep.bitWidth, VerilogSignal.unsigned);
		VerilogNoneBlockAssign stepIsZero = new VerilogNoneBlockAssign(parentMethod.regStep, stepZero, assignedState);
		boolean compressState = parentMethod.getParentClass().config.genCodeForCompressedState;

		if(!haveStepControlAssign(lastStep, parentMethod))	//すでにステップ制御レジスタに代入されている場合は，インクリメントしない (DFGraphMethodInv対策)
			lastStep.addNoneBlockStat(stepIsZero);//最終ステップ -> step = 0

		///* 削除禁止
		 //ステップNoのインクリメント
		for(int i=0; i<stepControl.getChildStat().size()-1; i++)
			if(!haveStepControlAssign(stepControl.getChildStat().get(i), parentMethod))	//すでにステップ制御レジスタに代入されている場合は，インクリメントしない (DFGraphMethodInv で代入される場合の対策)
				stepNumIncrement(stepControl.getChildStat().get(i), parentMethod.regStep, parentMethod, phaseID);


		 //特に処理が無いステップでも，ステップNoのインクリメントが必要
//		if(stepControl.getChildStat().get(stepControl.getChildStat().size()-1).getIsDefault()==false &&
//		   stepControl.getChildStat().size()>=2){
//
//			VerilogCaseChild defaultStep = new VerilogCaseChild();
//			defaultStep.setIsDefault(true);
//			defaultStep.addNoneBlockStat(stepPlusOne);
//			stepControl.addChildStat(defaultStep);
//		}

		//初期化なし変数宣言のすぐ後にメソッド呼び出しがある場合
		if(  (stepControl.getChildStat().size()==1 && stepControl.getChildStat().get(0).getIsDefault())  )
			return;

		//特に処理が無いステップでも，ステップNoのインクリメントが必要 (one-hot エンコーディングしない場合)
		if(!compressState){
			if(  !(stepControl.getChildStat().size()==1 && stepControl.getChildStat().get(0).getCondNumber()==0)  ){

				VerilogNoneBlockAssign stepPlusOne = new VerilogNoneBlockAssign(parentMethod.regStep, parentMethod.wireStepP1, null);
				VerilogCaseChild defaultStep = new VerilogCaseChild();
				defaultStep.setIsDefault(true);
				defaultStep.addNoneBlockStat(stepPlusOne);
				stepControl.addChildStat(defaultStep);
			}//*/
		}
	}

	/**
	 * ステップNoのインクリメント
	 * */
	void stepNumIncrement(VerilogCaseChild step, VerilogReg regStep, VerilogMethod parentMethod, int phaseID){

		StateIdentifier assignedState = new StateIdentifier(parentMethod.getMethodID(), phaseID, stageID, step.getCondNumber(), false);
		VerilogNoneBlockAssign stepPlusOne = new VerilogNoneBlockAssign(parentMethod.regStep, parentMethod.wireStepP1, assignedState);
		step.addNoneBlockStat(stepPlusOne);
	}

	/**ステージの処理<br>
	 * 最終ステップ stage = stage + 1
	 * 最終ステージの最終ステップ -> stage = 0<br>
	 * */
	private void stageAssign(VerilogCaseStatement stepControl, VerilogMethod parentMethod, int phaseID, boolean isLastStage){

		VerilogReg stageReg = parentMethod.regStage;
		int lastStep = stepControl.getChildStat().get(stepControl.getChildStat().size()-1).getCondNumber();
		StateIdentifier assignedState = new StateIdentifier(parentMethod.getMethodID(), phaseID, stageID, lastStep, false);

		if(isLastStage){
			VerilogSignalString stageZero = new VerilogSignalString(stageReg.bitWidth+VerilogLiteralNumber.typeHexadecimal+0, stageReg.bitWidth, VerilogSignal.unsigned);
			VerilogNoneBlockAssign stageIsZero = new VerilogNoneBlockAssign(stageReg, stageZero, assignedState);
			stepControl.getChildStat().get(stepControl.getChildStat().size()-1).addNoneBlockStat(stageIsZero);  //最終ステージの最終ステップ -> stege = 0
		}
		else{
			VerilogNoneBlockAssign stagePlusOne = null;
			stagePlusOne = new VerilogNoneBlockAssign(stageReg, parentMethod.wireStageP1, assignedState);
			stepControl.getChildStat().get(stepControl.getChildStat().size()-1).addNoneBlockStat(stagePlusOne);
		}
	}

	private boolean haveStepControlAssign(VerilogCaseChild checkedState, VerilogMethod parentMethod){
		return checkedState.haveStepControlAssign(parentMethod.getStepRegister());
	}

	public void connectDependencyVariables(boolean originalORunrolled){

		ArrayList<DFGraphManager> DFGraphs = (originalORunrolled==VerilogStatAssemblage.original) ? this.DFGraphs : this.unrolledDFGraphs.get(this.unrolledDFGraphs.size()-1);

		connectWAR(DFGraphs);
		connectRAWandWAW(DFGraphs);
	}

	protected void resetDFGraphConnectivity(){

		for(DFGraphManager dfg : DFGraphs)
			dfg.resetDFGraphConnectivity();
	}

	/**
	 * 書き込み変数ノードに読み取り変数ノードを登録する
	 * */
	void connectWAR(ArrayList<DFGraphManager> DFGraphs){

		for(int i=0; i< DFGraphs.size(); i++){
			variableAssembly.clear();
			DFGraphs.get(i).assembleReadVariables(variableAssembly);
			for(int j=i+1; j<DFGraphs.size(); j++){
				 DFGraphs.get(j).setReadNodeToWriteNode(variableAssembly);
			}
		}
	}

	void connectRAWandWAW(ArrayList<DFGraphManager> DFGraphs){

		for(int i=0; i< DFGraphs.size(); i++){
			DFGraphVariableAccess writeVariable = DFGraphs.get(i).getWriteVariable();
			if(writeVariable!=null){
				for(int j=i+1; j<DFGraphs.size(); j++){
					if(!DFGraphs.get(j).setWriteNodeToReadAndWriteNode(writeVariable))
						break;
				}
			}
		}
	}

	public int getMinCriticalPath(){
		return minCriticalPath;
	}

	public void setMinCriticalPath(int minCriticalPath){
		this.minCriticalPath = minCriticalPath;
	}
}