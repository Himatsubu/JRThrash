package net.njlab.model;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Stack;

import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.config.Config;
import net.njlab.dfg.DFGraphManager;
import net.njlab.dfg.DFGraphNode;
import net.njlab.dfg.DFGraphVariableAccess;
import net.njlab.dump.Dump;
import net.njlab.sample.annotation.JRThrashUnroll;
import openjdk.com.sun.tools.javac.tree.JCTree.JCStatement;

/**
 *  @author Keisuke Koike
 */
public class VerilogStatAssemblage extends VerilogStatementsPhase{

	ArrayList<VerilogStatement> statements = new ArrayList<VerilogStatement>();
	ArrayList<VerilogStage> stages = new ArrayList<VerilogStage>();
	public int totalStepNum=0;
	public int maxStepNum = 0;
	boolean makeDfgIsFinished = false;
	boolean schedulingIsFinished = false;
	private boolean isReturnStat = false;	//return する式の場合，明示しないキャストをチェックする
	String retType;	//return する式の場合の戻り型
	StateTransGraphNode stgNode;

	boolean thisPhaseIsMerged = false;
	int mergedPhase = -1;

	//ループ展開系
	VerilogVariableDecl loopVariable;
	int unrollNum;
	//ArrayList<VerilogVariableDecl> clonedVariable = new ArrayList<VerilogVariableDecl>();	//ループ展開の際, 展開数分コピーする変数
	private VerilogStatAssemblage forInitPart = null;
	private VerilogStatAssemblage forUpdatePart = null;
	boolean updateChangeIsSuccessful = false;	//for文の更新部の変更に成功した場合 true
	private boolean updateIsChanged = false;
	int unrollType = -1;
	static final boolean original = true;
	static final boolean unrolled = false;

	VerilogStatAssemblage(JCStatement statement, VerilogStatementsPhase parent){
		this.parent = parent;
		makeVariableStack();
		VerilogStatement tmp = VerilogStatement.makeSubStatement(statement);
		tmp.setPhaseParent(this);	//親ブロックの設定
		tmp.buildExpression();
		statements.add( tmp );
		checkAssignKind();
	}

	VerilogStatAssemblage(ArrayList<VerilogStatement> statements, VerilogStatementsPhase parent){
		this.parent = parent;
		makeVariableStack();	//このクラスのVeriableStack には statements 内に出てくる全変数が格納されている
		for(int i=0; i<statements.size(); i++){
			statements.get(i).setPhaseParent(this);	//親ブロックの設定
			statements.get(i).buildExpression();
			this.statements.add(statements.get(i));
		}
		checkAssignKind();
	}

	VerilogStatAssemblage(ArrayList<VerilogVariableDecl> statements, VerilogStatementsPhase parent, int x){
		this.parent = parent;
		this.variableStack.addAll(parent.variableStack);
		this.variableStack.addAll(parent.vdecls);
		for(int i=0; i<statements.size(); i++){
			statements.get(i).setPhaseParent(this);	//親ブロックの設定
			this.statements.add(statements.get(i));
		}
		checkAssignKind();
	}

	VerilogStatAssemblage(VerilogStatement statement, VerilogStatementsPhase parent){
		this.parent = parent;
		makeVariableStack();
		statement.setPhaseParent(this);	//親ブロックの設定
		statement.buildExpression();
		this.statements.add(statement);
		checkAssignKind();
	}

	/**
	 * ++, --, =, op=, メソッド呼び出し, が, サブExpression として使われていないかチェック
	 * */
	private void  checkAssignKind(){
		for(int i=0; i<statements.size(); i++){
			statements.get(i).checkAssignKind();
		}
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		for(int i=0; i<statements.size(); i++){
			ret |= statements.get(i).existERR();
		}
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<StatAssemblage>	<Phase>  "+ this.stateID +"  </Phase>");
		Dump.tprintln(out, offset+1, "<stageNum>  "+ stages.size() +"  </stageNum>");
		Dump.tprintln(out, offset+1, "<totalStepNum>  "+ totalStepNum +"  </totalStepNum>");
		Dump.tprintln(out, offset+1, "<VariableStack>");
		for(int i=0; i<variableStack.size(); i++)
			variableStack.get(i).dumpSimple(out, offset+2);
		Dump.tprintln(out, offset+1, "</VariableStack>\n");
		Dump.tprintln(out, offset+1, "<statements>");
		for(int i=0; i<statements.size(); i++){
			if(statements.get(i) instanceof VerilogExprStatement)
				statements.get(i).dump(out, offset+2);
			else if(statements.get(i) instanceof VerilogVariableDecl)
				((VerilogVariableDecl)statements.get(i)).dumpSimple(out, offset+2);
		}
		Dump.tprintln(out, offset+1, "</statements>\n");
		Dump.tprintln(out, offset, "</StatAssemblage>\n");
	}

	/**
	 * 式にステージを割り当て，各式のDFGを作成する
	 * */
	public int makeDFG(){

		if(makeDfgIsFinished)
			return stages.size();

		makeDfgIsFinished = true;
		findUsedVariables();
		assignStageToStatement();

		VerilogMethod parentMethod = null;
		if(!(parent instanceof VerilogClass))
			parentMethod = getParentMethod();

		for(int i=0; i<stages.size(); i++)
			stages.get(i).makeDFG(getParentClass(), parentMethod);

		if(isReturnStat)
			modifyReturnCast();

		/*if(forUpdateGraphs.size()>0){
			stages.get(stages.size()-1).DFGraphs.addAll(forUpdateGraphs);
			forUpdatePartIsMerged = true;
		}*/

		if(forUpdatePart!=null)
			appendUpdateDFG();

		if(updateIsChanged){
			if(checkUpdateCanBeUnrolled()){
				updateChangeIsSuccessful = true;
				changeUpdateValue();
				optimization(original);
			}
		}

		optimization(original);
		registerNodeToDFGraphManager();	//DFGManager の statementNodeにノードを格納.   これ以降DFGraph を変更しない
		for(int i=0; i<stages.size(); i++)
			stages.get(i).connectDependencyVariables(original);
		setLastAccessObj();
		checkERR();
		return stages.size();
	}

	/**
	 * DFGの依存関係をリセット
	*/
	public void resetDFGraphConnectivity(){

		for(int i=0; i<stages.size(); i++)
			stages.get(i).resetDFGraphConnectivity();
	}

/**
 * デバッグ用
 * */
	private void checkERR(){
		/*
		//statementNode の要素数とDFGraphの個数が一致すっるかチェック
		for(int i=0; i<stages.size(); i++){
			for(int j=0; j<stages.get(i).DFGraphs.size(); j++){
				int nodeNum = stages.get(i).DFGraphs.get(j).getRootNode().countNodeNum();
				if(nodeNum!=stages.get(i).DFGraphs.get(j).statementNode.size()){
					System.out.println("DEBUG:	error VerilogStatAssemblage checkERR,	nodeNum = "+nodeNum+"	arraySize = "+stages.get(i).DFGraphs.get(j).statementNode.size());
				}
			}
		}

		//statementNode内に重複ノードがないかチェック
		for(int i=0; i<stages.size(); i++){
			for(int j=0; j<stages.get(i).DFGraphs.size(); j++){
				for(int k=0; k<stages.get(i).DFGraphs.get(j).statementNode.size(); k++){
					for(int l=k+1; l<stages.get(i).DFGraphs.get(j).statementNode.size(); l++){
						if(stages.get(i).DFGraphs.get(j).statementNode.get(k)==stages.get(i).DFGraphs.get(j).statementNode.get(l)){
							System.out.println("DEBUG:	error VerilogStatAssemblage checkERR,	"+stages.get(i).DFGraphs.get(j).statementNode.get(l));
						}
					}
				}
			}
		}*/
	}

	private void registerNodeToDFGraphManager(){
		for(int i=0; i<stages.size(); i++){
			stages.get(i).registerNodeToDFGraphManager();
		}
	}

	public boolean haveMethodInv(){

		for(VerilogStatement statement : statements){
			if( statement.haveMethodInv )
				return true;
		}
		return false;
	}

	/**
	 * スケジューリングを行う
	 * */
	public void scheduling(){

		if(schedulingIsFinished)
			return;

		int step;
		if(getParentClass().config.optimizeType.compareTo(Config.listScheduling)==0){
			for(int i=0; i<stages.size(); i++){
				stages.get(i).listScheduling(getParentClass().listSet);

				step = stages.get(i).controlStepNum;
				maxStepNum = Math.max(step, maxStepNum);
				totalStepNum += step;
			}
		}
		schedulingIsFinished = true;
	}

	/**
	 * 各式の読み取り変数と書き込み変数を調べる
	 * */
	private void findUsedVariables(){
		for(int i=0; i<statements.size(); i++){
			statements.get(i).findUsedVariables();
		}
/*
		for(int i=0; i<statements.size(); i++){// read, write レジスタダンプ
			if(statements.get(i) instanceof VerilogVariableDecl)
				System.out.println("vdecl	"+((VerilogVariableDecl)statements.get(i)).vdecl.toString());
			else if(statements.get(i) instanceof VerilogExprStatement)
				System.out.println("exprs	"+((VerilogExprStatement)statements.get(i)).expr.toString());

			for(int j=0; j<statements.get(i).usedReadVariables.size(); j++){
				if(statements.get(i).usedReadVariables.get(j)!=null)
					System.out.println("read	"+statements.get(i).usedReadVariables.get(j).name);
			}
			if(statements.get(i).usedWriteVariable!=null)
				System.out.println("write	"+statements.get(i).usedWriteVariable.name+"\n");
		}//*/
	}

	/**
	 * 式にステージを割り当てる
	 * */
	private void assignStageToStatement(){

		int i,j, assignStageID;

		for(i=0; i<statements.size(); i++){
			assignStageID=0;

			if(statements.get(i).haveMethodInv){	//メソッド呼び出しを持っている式だった => 新しいステージに追加

				if(stages.size()==0)
					assignStageID = 0;
				else
					assignStageID = stages.get(stages.size()-1).stageID+1;
			}
			else{
				for(j=stages.size()-1; j>=0; j--){	//最後のほうのステージからハザードを調査

					boolean hazardOccur = false;
					if(stages.get(j).checkMethodInv()){
						assignStageID = stages.get(j).stageID+1;
						break;
					}
					if(stages.get(j).checkRAW(statements.get(i))){	//RAWハザード
						assignStageID = Math.max(assignStageID, stages.get(j).stageID);
						hazardOccur = true;
					}
					if(stages.get(j).checkWAW(statements.get(i))){	//WAWハザード
						assignStageID = Math.max(assignStageID, stages.get(j).stageID);
						hazardOccur = true;
					}
					if(stages.get(j).checkWAR(statements.get(i))){	//WARハザード
						assignStageID = Math.max(assignStageID, stages.get(j).stageID);
						hazardOccur = true;
					}
					if(hazardOccur)
						break;
				}
			}
			addStatement(assignStageID, statements.get(i), statements.get(i).haveMethodInv);
		}
	}

	//ステージ割り当て確認
	protected void dumpStageInfo(){

		int totalStepNum = 0;
		for(int i=0; i<stages.size(); i++)
			totalStepNum += stages.get(i).maxStep+1;

		if(!thisPhaseIsMerged)
			System.out.println("phaseID: "+stateID+"      "+"(stepNum = "+totalStepNum+")");
		else
			System.out.println("phaseID: "+stateID+"      this phase is merged into phaseID "+mergedPhase);

		for(int i=0; i<stages.size(); i++){

			VerilogStage stage = stages.get(i);
			if(!thisPhaseIsMerged)
				System.out.println("      stage "+stage.stageID+"      (stepNum = "+(stage.maxStep+1)+")\n");
			else
				System.out.println("      stage "+stage.stageID+"\n");

			for(int j=0; j<stages.get(i).getStatements().size(); j++){

				if(stage.getStatements().get(j) instanceof VerilogExprStatement)
					System.out.println("            "+((VerilogExprStatement)stages.get(i).getStatements().get(j)).expr.toString()+"\n");

				else if(stage.getStatements().get(j) instanceof VerilogVariableDecl){
					System.out.println("            "+((VerilogVariableDecl)stages.get(i).getStatements().get(j)).vdecl.toString()+"\n");
				}
			}
		}
		System.out.println("\n");
	}

	private void addStatement(int addStageID, VerilogStatement statement, boolean havMethodInv){

		if(stages.size()==addStageID){	//新たにステージを作る必要がある
			stages.add(new VerilogStage(addStageID, statement));
		}
		else{	//既存のステージに割り当て
			stages.get(addStageID).addStatement(statement);
		}
	}

	public void dumpDFG(PrintWriter wout, int offset){

		if(thisPhaseIsMerged)
			return;

		Dump.tprintln(wout, offset, "<Phase>");
		Dump.tprintln(wout, offset+1, "<phaseID>	"+stateID+"	</phaseID>");
		for(int i=0; i<stages.size(); i++){
			stages.get(i).dumpDFG(wout, offset+1);
		}
		Dump.tprintln(wout, offset, "</Phase>\n");
	}

	/**
	 * 定数伝播と定数畳み込みを行う
	 * */
	boolean[] optContinueFlag = new boolean[1];
	private void optimization(boolean originalOrUnrolled){

		optContinueFlag[0] = true;

		while(optContinueFlag[0]){

			optContinueFlag[0] = false;
			constantPropagation(optContinueFlag, originalOrUnrolled);
			constantFolding(optContinueFlag, originalOrUnrolled);
		}
		constantFoldingForBinarySequence(originalOrUnrolled);
	}

	/**
	 * 最適化プロセスの定数伝播をする
	 * */
	private void  constantPropagation(boolean[] optContinueFlag, boolean originalOrUnrolled){

		for(int i=0; i<stages.size(); i++){

			if(stages.get(i).getStatements().get(0).haveMethodInv)
				continue;
			stages.get(i).propagateInnerStage(optContinueFlag, originalOrUnrolled);//ステージ内での定数伝播を行う

			ArrayList<DFGraphVariableAccess> srcVariable;
			srcVariable = stages.get(i).getSrcVariable();

			for(int j=0; j<srcVariable.size(); j++){//ステージ間での定数伝播を行う
				for(int k=i+1; k<stages.size(); k++){
					if(stages.get(k).propagate(srcVariable.get(j), optContinueFlag, originalOrUnrolled)) //伝播する変数に書き込みが行われたステージ以降は調べない
						break;
					if(stages.get(k).getStatements().get(0).haveMethodInv) //メソッド呼び出しより後も調べない
						break;
				}
			}
		}
	}

	/**
	 * 最適化プロセスの定数畳み込みをする
	 * */
	private void constantFolding(boolean[] optContinueFlag, boolean originalOrUnrolled){

		for(int i=0; i<stages.size(); i++){
			stages.get(i).constantFolding(optContinueFlag, originalOrUnrolled);
		}
	}

	/**
	 * (10 - x) -20 = -10 - x  のような DFG のノードをまたいだ最適化を行う
	 * */
	private void constantFoldingForBinarySequence(boolean originalOrUnrolled){

		for(int i=0; i<stages.size(); i++){
			stages.get(i).constantFoldingForBinarySequence(originalOrUnrolled);
		}
	}

	/**
	 * 変数の最終アクセスステップを格納するオブジェクトをDFGraphVariable に渡す
	 * */
	private void setLastAccessObj(){

		for(int i=0; i<stages.size(); i++){
			stages.get(i).setLastAccessObj();
			stages.get(i).setStepIsAccessable();
		}
	}

	/**
	 * for文の 初期化部分の構造が ループ展開にふさわしい形か調べる
	 * */
	public boolean checkInitFormat(){

		boolean initFormatOk = false;
		for(int i=0; i<stages.size(); i++){
			for(int j=0; j<stages.get(i).getDFGraphs().size(); j++){
				initFormatOk |= stages.get(i).getDFGraphs().get(j).checkInitFormat(loopVariable.getName(), this);
			}
		}
		return initFormatOk;
	}

	/**
	 * for 文の更新部分にループ展開で指定された変数がある
	 * */
	public boolean exprHasLoopValue(String unrollVariableName){

		boolean ret = false;

		if(statements.size()==0)
			return false;

		statements.get(0).findUsedVariables();
		if( statements.get(0).usedWriteVariable!=null)
			if( statements.get(0).usedWriteVariable.getName().compareTo(unrollVariableName)==0 )
				ret = true;

		statements.get(0).usedReadVariables.clear();
		statements.get(0).usedWriteVariable = null;
		return ret;
	}

	/**
	 * for文の 更新部分の構造が  unrollType==withoutDependence または unrollType==pipeline の場合のループ展開にふさわしい形か調べる
	 * */
	public boolean checkUpdateCanBeUnrolled(){

		if(!checkUpdateCanBeMerged())
			return false;

		if(stages.get(0).getDFGraphs().size()>=2)
			return false;

		return stages.get(0).getDFGraphs().get(0).checkUpdateFormat(loopVariable.getName(), this);
	}

	/**
	 * for文の update 部の構造が, body に組み込めるかチェック
	 * */
	public boolean checkUpdateCanBeMerged(){

		if(stages.size()==1 && !stages.get(0).checkMethodInv())
			return true;

		return false;
	}


	public void setUpdateInfo(String updateOp){
		((VerilogForLoop)parent).setUpdateInfo(updateOp);
	}

	//展開したforループの更新部を変更
	protected void changeUpdateValue(){
		stages.get(0).getDFGraphs().get(0).changeUpdateValue(unrollNum);
	}

	public DFGraphNode getUpdateExpression(){
		return stages.get(0).getDFGraphs().get(0).getUpdateNode();
	}

	public void setUnrollParam(VerilogVariableDecl loopVariable, int unrollNum, int unrollType){

		this.loopVariable = loopVariable;
		this.unrollNum = unrollNum;
		this.unrollType = unrollType;
	}

	/**
	 * @param originalVariable コピーする元の変数. コピーする変数 = 展開するループ内部で定義された変数
	 * forループのbody に関してループ展開しながら DFGを作成する<br>
	 * */
	public void unrollStatements(ArrayList<VerilogVariableDecl> originalVariable, String updateOp, DFGraphNode updateExpressionNode){

		makeDfgIsFinished = true;
		findUsedVariables();

		assignStageToStatement();
		stages.get(0).makeDFG(getParentClass(), getParentMethod());	//DFG作成

		if(stages.size()!=1)
			System.out.println("DEBUG: error VerilogStatAssemblage unrollStatements "+stages.size());

		if(unrollType==JRThrashUnroll.simple || unrollType==JRThrashUnroll.modifyLoopVar || unrollType==JRThrashUnroll.copyLoopVar)	//展開タイプ simple or modifyLoopVar or copyLoopVar
			unrollStatementsWithDependence(originalVariable, updateOp, updateExpressionNode);

		else
			unrollStatementsWithoutDependence(originalVariable, updateOp, updateExpressionNode);	//展開タイプ modifyLoopVar_IndependentIterator

		registerNodeToDFGraphManager();	//DFGManager の statementNodeにノードを格納.   これ以降DFGraph を変更しない
		setLastAccessObj();
		checkERR();
	}

	/**
	 * ループ展開方法が, simple, copyVar, modifyVar のときの展開を行う
	 * */
	private void unrollStatementsWithDependence(ArrayList<VerilogVariableDecl> originalVariable, String updateOp, DFGraphNode updateExpressionNode){

		//simple か copyLoopVariable の場合, クローンを作る前に, update部分を組み込んでおく
		if( (unrollType==JRThrashUnroll.simple || unrollType==JRThrashUnroll.copyLoopVar) && forUpdatePart!=null)
			appendUpdateDFG();

		if(unrollType==JRThrashUnroll.copyLoopVar){
			ArrayList<VerilogVariableDecl> copiedVars = replaceLoopVariable();			//ループ間の依存関係を無くすため, ループ変数をコピーして入れ替える
			appendCopiedVarInitExprToForInit(copiedVars);								//ループの初期化部にコピーした変数の初期化式を追加
		}

		for(int iteration=1; iteration<unrollNum; iteration++){

			ArrayList<VerilogVariableDecl> clonedVariable = copyVariable(iteration, originalVariable);

			if(unrollType==JRThrashUnroll.simple || unrollType==JRThrashUnroll.copyLoopVar)
				copyDFG(0, originalVariable, updateOp, updateExpressionNode, clonedVariable);

			else if(unrollType==JRThrashUnroll.modifyLoopVar)
				copyDFG(iteration, originalVariable, updateOp, updateExpressionNode, clonedVariable);
		}

		stages.get(0).unifyUnrolledGraph();

		if(unrollType==JRThrashUnroll.modifyLoopVar)
			appendUpdateDFG();	//modifyLoopVar の場合，最後に update 部を組み込む

		optimization(original);	//依存関係を解決する前に最適化
		stages.get(0).connectDependencyVariables(original);	//展開した式も合わせて依存関係を解決

		if(stages.size()!=1)
			System.out.println("DEBUG:	error unrollStatementsWithSimple");
	}

	/**
	 * ループ展開方法が modifyVar_independentIterator のときの展開を行う
	 * */
	private void unrollStatementsWithoutDependence(ArrayList<VerilogVariableDecl> originalVariable, String updateOp, DFGraphNode updateExpressionNode){

		for(int iteration=1; iteration<unrollNum; iteration++){

			ArrayList<VerilogVariableDecl> clonedVariable = copyVariable(iteration, originalVariable);
			copyDFG(iteration, originalVariable, updateOp, updateExpressionNode, clonedVariable);

			optimization(unrolled);	//依存関係を解決する前に最適化
			stages.get(0).connectDependencyVariables(unrolled);	//展開した式の依存関係を考慮しない場合，ループ内の依存関係をここで解決
		}

		optimization(original);	//依存関係をコネクトする前に最適化
		stages.get(0).connectDependencyVariables(original);	//依存関係解決

		stages.get(0).unifyUnrolledGraph();	//展開した式と統合
	}

	/**
	 * ループ間の依存関係を無くすため, ループ変数のコピーを作り入れ替える<br>
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
	private ArrayList<VerilogVariableDecl> replaceLoopVariable(){

		int copyNum = stages.get(0).calcRefTimesOfVar(loopVariable);
		ArrayList<VerilogVariableDecl> copiedVariables = copyVariable(copyNum-1, loopVariable);	//元々定義してあるループ変数も使うので copyNum-1 個複製すれば良い
		copiedVariables.add(loopVariable);
		stages.get(0).replaceLoopVariable(loopVariable, copiedVariables);
		copiedVariables.remove(loopVariable);	//返すのはコピーしてできた変数群だけ
		return copiedVariables;
	}

/*削除禁止
 *
 * dependence == true -> simple or pipeline
 *
	private int unrollStatements(ArrayList<VerilogVariableDecl> originalVariable, String updateOp, DFGraphNode updateExpressionNode){

		makeDfgIsFinished = true;

		findUsedVariables();
		assignStageToStatement(  (dependence==true) ? true : false  );

		for(int i=0; i<stages.size(); i++)
			stages.get(i).makeDFG(getParentClass(), getParentMethod());

		for(int iteration=1; iteration<unrollNum; iteration++){

			copyVariable(iteration, originalVariable);
			copyDFG(iteration, originalVariable, updateOp, updateExpressionNode);

			if(!dependence){
				optimization(unrolledOptimize);	//依存関係を解決する前に最適化
				for(int j=0; j<stages.size(); j++){
					VerilogStage stage = stages.get(j);
					stage.connectDependencyVariables(unrolledOptimize);	//展開した式の依存関係を考慮しない場合，ループ内の依存関係をここで解決
				}
			}
		}

		if(!dependence){
			optimization(originalOptimize);	//依存関係をコネクトする前に最適化
			for(int j=0; j<stages.size(); j++)
				stages.get(j).connectDependencyVariables(originalOptimize);
		}

		for(int i=0; i<stages.size(); i++)
			stages.get(i).unifyUnrolledGraph();

		if(dependence){	//展開した式も合わせて依存関係を解決

			stages.get(stages.size()-1).DFGraphs.addAll(forUpdateGraphs);	//依存関係を考慮する場合，update 部を組み込める
			forUpdatePartIsMerged = true;

			optimization(originalOptimize);	//依存関係を解決する前に最適化
			for(int i=0; i<stages.size(); i++)
				stages.get(i).connectDependencyVariables(originalOptimize);
		}
		registerNodeToDFGraphManager();	//DFGManager の statementNodeにノードを格納.   これ以降DFGraph を変更しない
		setLastAccessObj();
		checkERR();
		return stages.size();
	}
*/

	/**
	 * ループ展開する式をコピーする
	 * */
	private void copyDFG(int iteration, ArrayList<VerilogVariableDecl> originalVariable, String updateOp, DFGraphNode updateExpressionNode, ArrayList<VerilogVariableDecl> clonedVariable){


			ArrayList<DFGraphManager>DfgOfEachIteration = new ArrayList<DFGraphManager>();

			stages.get(0).cloneDFG(iteration, loopVariable.getName(), originalVariable, clonedVariable,
								   updateOp, updateExpressionNode, DfgOfEachIteration);
			stages.get(0).addUnrolledDFGraphs(DfgOfEachIteration);
	}

	/**
	 * ループ間で独立な変数をコピーする
	 * */
	private ArrayList<VerilogVariableDecl> copyVariable(int iteration, ArrayList<VerilogVariableDecl> originalVariable){

		VerilogVariableDecl.resetVariableID(getParentClass().classVariables.size());
		ArrayList<VerilogVariableDecl> clonedVariable = new ArrayList<VerilogVariableDecl>();

		for(int i=0; i<originalVariable.size(); i++)
			clonedVariable.add(originalVariable.get(i).duplicate(iteration, getParentClass()));

		return clonedVariable;
	}

	/**
	 * copyNum分 originalVariable をコピーする
	 * */
	private ArrayList<VerilogVariableDecl> copyVariable(int copyNum, VerilogVariableDecl originalVariable){

		VerilogVariableDecl.resetVariableID(getParentClass().classVariables.size());
		ArrayList<VerilogVariableDecl> clonedVariable = new ArrayList<VerilogVariableDecl>();

		for(int i=0; i<copyNum; i++)
			clonedVariable.add(originalVariable.duplicate(i, getParentClass()));

		return clonedVariable;
	}

	/**
	 * for文の update 部をループ本体に組み込む
	 * */
	private void appendUpdateDFG(){

		if(forUpdatePart.stages.size()!=1)
			System.out.println("DEBUG: error VerilogStatAssemblage  appendUpdateDFG");//update 部を組み込むのに stage 数が多すぎる

		VerilogStage lastStage = stages.get(stages.size()-1);

		if(lastStage.checkMethodInv()){
			stages.addAll(forUpdatePart.stages);
			forUpdatePart.stages.get(0).stageID = lastStage.stageID+1;
		}
		else{
			lastStage.getDFGraphs().addAll(forUpdatePart.stages.get(0).getDFGraphs());
			lastStage.getStatements().addAll(forUpdatePart.stages.get(0).getStatements());
		}
		forUpdatePart.thisPhaseIsMerged = true;
		forUpdatePart.mergedPhase = stateID;
	}

	/**
	 * unrollType==copyLoopVariable のとき for文の initial部にコピーされたループ変数の初期化式をつかする<br>
	 * <br>
	 * [befor]<br>
	 * for( i=0; ... ; ...)<br>
	 * <br>
	 * [after]<br>
	 * for( i=0, i_0=i, i_1=i; ...; ...)<br>
	 * */
	private void appendCopiedVarInitExprToForInit(ArrayList<VerilogVariableDecl> copiedVars){

		ArrayList<DFGraphManager> managers = new ArrayList<DFGraphManager>();

		for(VerilogVariableDecl copiedVar : copiedVars){

			DFGraphVariableAccess destNode = new DFGraphVariableAccess(copiedVar, null);
			DFGraphVariableAccess srcNode  = new DFGraphVariableAccess(loopVariable, null);
			VerilogAssign.makeAssignNode(destNode, srcNode, getParentClass().config);
			managers.add( new DFGraphManager(destNode, getParentClass(), getParentMethod(), copiedVar.getName()+" = "+loopVariable.getName()) );
		}
		int lastStageID = forInitPart.stages.get(forInitPart.stages.size()-1).stageID;
		VerilogStage stage = new VerilogStage(lastStageID+1);	//初期化式は新しいステージに割り当てる

		//このステージのスケジューリングのための前処理を行う
		stage.getDFGraphs().addAll(managers);
		stage.registerNodeToDFGraphManager();
		stage.setLastAccessObj();
		stage.setStepIsAccessable();
		forInitPart.stages.add(stage);

	}


	public void getMaxRegisterNum(){

		for(int i=0; i<stages.size(); i++)
			stages.get(i).getMaxRegisterNum(getParentClass());
	}

	public void getMaxRegisterNumWithSharing(){

		for(int i=0; i<stages.size(); i++)
			stages.get(i).getMaxRegisterNumWithSharing(getParentClass());
	}

	public void bindTmpReg(VerilogClass parentClass){

		for(int i=0; i<stages.size(); i++)
			stages.get(i).bindTmpReg(parentClass);
	}

	public void trueReturnStat(String retType){
		isReturnStat = true;
		this.retType = retType;
	}

	private void modifyReturnCast(){
		stages.get(0).modifyReturnCast(retType);
		if(stages.size()!=1)
			System.out.println("DEBUG:	error  VerilogStatementAssemblage modifyReturnCast");
	}

	public void makeResetPart(ArrayList<VerilogNoneBlockAssign> resetAssign){

		for(int i=0; i<stages.size(); i++){
			for(int j=0; j<stages.get(i).getDFGraphs().size(); j++){
				stages.get(i).getDFGraphs().get(j).makeResetPart(resetAssign);
			}
		}
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){

		stgNode = new StateTransGraphNode(this, phaseSignal, phaseLiteral, source, elseSource);
		strayChild.push(stgNode);
	}

	@Override
	protected StateTransGraphNode getFirstPhase(){
		return this.stgNode;
	}

	protected void generateVerilogCode(VerilogReg regPhase, VerilogCaseStatement phaseControl){

		VerilogCaseStatement stageControl = new VerilogCaseStatement();
		stageControl.setBranchSignal(getParentMethod().regStage);

		for(int i=0; i<stages.size(); i++){
			boolean isLastStage = (i==stages.size()-1) ? true : false;
			stageControl.addChildStat(stages.get(i).makeStageControl(isLastStage, getParentMethod(), this));
		}
		stgNode.currentPhaseCaseChild.addChildBlock(stageControl);

		if(stages.size()==0)
			System.out.println("DEBUG:	error VerilogStatAssemblage generateVerilogCode");


		if(stageControl.getChildStat().size()==1)
			stageControl.getChildStat().get(0).setIsDefault(true);

		phaseControl.addChildStat(stgNode.currentPhaseCaseChild);

	}

	protected void setForUpdatePart(VerilogStatAssemblage forUpdate){
		this.forUpdatePart = forUpdate;
	}

	protected void setForInitPart(VerilogStatAssemblage forInitial){
		this.forInitPart = forInitial;
	}

	public void setUpdateChangeFlag(){
		updateIsChanged = true;
	}
}







