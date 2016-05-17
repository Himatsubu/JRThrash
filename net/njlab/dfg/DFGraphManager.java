package net.njlab.dfg;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.model.VerilogBinary;
import net.njlab.model.VerilogClass;
import net.njlab.model.VerilogMethod;
import net.njlab.model.VerilogStatAssemblage;
import net.njlab.model.VerilogVariableDecl;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public class DFGraphManager implements Cloneable{

	public  ArrayList<DFGraphNode> statementNode; //文が持つDFGノードの集合
	static private ArrayList<DFGraphNode> nodes =  new ArrayList<DFGraphNode>();	//作業用
	private DFGraphNode rootNode = null; //文が持つDFGのルートノード
	private boolean isReturnGraph = false;	//return するDFGである
	public VerilogClass parentClass;
	public Config config;
	public VerilogMethod parentMethod;
	public boolean cloned = false;	//ループ展開で作られたコピーDFGである -> true

	public int usedIntRegNum=0;
	public int usedLongRegNum=0;
	public int usedFloatRegNum=0;
	public int usedBoolRegNum=0;

	//ループ展開チェック用
	public  String errDumpString;
	private DFGraphNode updateNode;	// ループ更新部 ( loopVariable = loopVariable (+-) Expression )  の Expression 部分

	public DFGraphManager(DFGraphNode rootNode, VerilogClass parentClass, VerilogMethod parentMethod, String errDumpString){
		this.rootNode = rootNode;
		this.parentClass = parentClass;
		this.parentMethod = parentMethod;
		this.errDumpString = errDumpString;
		this.config = parentClass.config;
	}

	public void dumpDFG(PrintWriter wout, int offset){
		if(rootNode!=null){
			//Dump.tprintln(wout, offset, "<nodeNum>	"+statementNode.size()+"	</nodeNum>");
			rootNode.dumpNode(wout, offset);
		}
	}

	public DFGraphNode getRootNode(){
		return rootNode;
	}

	public void setRootNode(DFGraphNode newRoot){
		rootNode = newRoot;
	}

	public DFGraphVariableAccess getPropagationNode(){

		if(rootNode instanceof DFGraphVariableAccess){
			if(((DFGraphVariableAccess)rootNode).isPropagateNode())
				return (DFGraphVariableAccess)rootNode;
			else
				return null;
		}
		return null;
	}

	public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag){
		boolean ret = false;
		if(rootNode!=null)
			return rootNode.propagate(propagationNode,optContinueFlag);
		return ret;
	}

	public void constantFolding(boolean[] optContinueFlag){
		if(rootNode!=null)
			rootNode.constantFolding(optContinueFlag, config);
	}

	/**
	 * (10 - x) -20 = -10 - x  のような DFG のノードをまたいだ最適化を行う
	 * */
	public void constantFoldingForBinarySequence(){

		boolean[] foldingHappened = new boolean[1];
		foldingHappened[0] = true;

		while(foldingHappened[0]){

			foldingHappened[0] = false;

			if(rootNode!=null)
				rootNode.constantFoldingForBinarySequence(foldingHappened);
		}
	}


	public void registerNode(){
		if(rootNode!=null){
			statementNode = new ArrayList<DFGraphNode>();
			rootNode.addStatementNode(this, statementNode);
		}
	}

	public void computePriority(){
		if(rootNode!=null){
			rootNode.computePriority(0, parentClass.config);

			if(isReturnGraph && rootNode.destSignalIsNotSaved())	//return するDFG のルートノードの結果は，レジスタに格納
				rootNode.destTypeIsReg = true;
		}
	}

	public void assignControlStep(int controlStep, SchedulingListSet listSet){
		if(rootNode!=null){
			if(rootNode.getAssignedState()==DFGraphNode.notAssigned)
				rootNode.assignControlStep(controlStep, listSet);
		}
	}

	/**
	 * for文の 初期化部分の構造が ループ展開にふさわしい形か調べる
	 * */
	public boolean checkInitFormat(String loopVariableName, VerilogStatAssemblage statementPhase){

		if(rootNode!=null){
			if(rootNode instanceof DFGraphVariableAccess){

				VerilogVariableDecl tmpVariable = ((DFGraphVariableAccess)rootNode).getVariableDecl();
				if(tmpVariable.getName().compareTo(loopVariableName)==0){
					return true;
				}
			}
		}
		return false;
	}

	public boolean checkUpdateFormat(String loopVariableName, VerilogStatAssemblage statementPhase){

		boolean ret = false;

		if(rootNode==null)
			return false;

		if(rootNode instanceof DFGraphVariableAccess)
			if(((DFGraphVariableAccess)rootNode).getVariableDecl().getName().compareTo(loopVariableName)==0)
				if(((DFGraphVariableAccess)rootNode).assignNode instanceof DFGraphBinary)
					ret = checkBinaryPlusMinus(loopVariableName, statementPhase, ((DFGraphBinary)((DFGraphVariableAccess)rootNode).assignNode));

		return ret;
	}

	private boolean checkBinaryPlusMinus(String loopVariableName, VerilogStatAssemblage statementPhase, DFGraphBinary binaryNode){

		if(binaryNode.getLeftNode() instanceof DFGraphVariableAccess){
			if(binaryNode.getOpString().compareTo(VerilogBinary.PLUS)==0|| binaryNode.getOpString().compareTo(VerilogBinary.MINUS)==0){
				if(((DFGraphVariableAccess)binaryNode.getLeftNode()).getVariableDecl().getName().compareTo(loopVariableName)==0){
					statementPhase.setUpdateInfo(binaryNode.getOpString());
					updateNode = binaryNode.getRightNode();
					return true;
				}
			}
		}
		else if(binaryNode.getRightNode() instanceof DFGraphVariableAccess){
			if(binaryNode.getOpString().compareTo(VerilogBinary.PLUS)==0){
				if(((DFGraphVariableAccess)binaryNode.getRightNode()).getVariableDecl().getName().compareTo(loopVariableName)==0){
					statementPhase.setUpdateInfo(binaryNode.getOpString());
					updateNode = binaryNode.getLeftNode();
					return true;
				}
			}
		}
		return false;
	}

	public void changeUpdateValue(int unrolNum){

		DFGraphLiteral unrollNumber = new DFGraphLiteral(updateNode.getDestTypeString(parentClass.config), unrolNum, unrolNum, unrolNum, unrolNum, false);
		DFGraphNode tmp = VerilogBinary.makeBinaryNode(unrollNumber, updateNode.clone(), VerilogBinary.MUL, parentClass.config, null);
		updateNode.replaceNode(tmp);
	}

	public DFGraphNode getUpdateNode(){
		return updateNode;
	}

	public DFGraphManager copyDFG(int iterationNum, String loopVariableName, ArrayList<VerilogVariableDecl> originalVariable, ArrayList<VerilogVariableDecl> clonedVariable,
								  String updateOp, DFGraphNode updateExpressionNode){

		try {
			DFGraphManager tmp = (DFGraphManager)super.clone();
			tmp.rootNode = rootNode.clone();
			tmp.cloned = true;

			if(iterationNum!=0)
				tmp.loopVariableModify(loopVariableName, iterationNum, updateOp, updateExpressionNode);

			tmp.replaceVariableReference(originalVariable, clonedVariable);
			return tmp;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	private void assembleAllNode(){

		nodes.clear();
		rootNode.addStatementNode(this, nodes);
	}

	/**
	 * ループ変数を修正  a[loopVariable] -> a[loopVariable (+-) iterationNum * updateExpression ]
	 * */
	private void loopVariableModify(String loopVariableName, int iterationNum, String updateOp, DFGraphNode updateExpressionNode){

		assembleAllNode();
		for(int i=0; i<nodes.size(); i++){
			if(nodes.get(i) instanceof DFGraphVariableAccess){
				((DFGraphVariableAccess)nodes.get(i)).loopVariableModify(loopVariableName, iterationNum, updateOp, updateExpressionNode);
			}
		}
	}

	/**
	 * ループ間で独立した変数の参照先 (DFGraphVariableAccess の variableフィールド)を変更する
	 * */
	private void replaceVariableReference(ArrayList<VerilogVariableDecl> originalVariable, ArrayList<VerilogVariableDecl> clonedVariable){

		assembleAllNode();
		for(int i=0; i<nodes.size(); i++){
			if(nodes.get(i) instanceof DFGraphVariableAccess){

				for(int j=0; j<clonedVariable.size(); ++j)
					((DFGraphVariableAccess)nodes.get(i)).replaceVariableReference(originalVariable.get(j), clonedVariable.get(j));
			}
		}
	}

	/**
	 * originalVariable を参照している DFGraphVariableAccess ノードを順次 clonedVariables に変更する
	 * */
	public void replceVariableReference(VerilogVariableDecl originalVariable, ArrayList<VerilogVariableDecl> clonedVariables){

		assembleAllNode();
		for(int i=0; i<nodes.size(); ++i){

			if(nodes.get(i) instanceof DFGraphVariableAccess){
				int lastIndex = clonedVariables.size()-1;

				if(lastIndex<0)
					break;

				boolean isReplaced = ((DFGraphVariableAccess)nodes.get(i)).replaceVariableReference(originalVariable, clonedVariables.get(lastIndex));

				if(isReplaced)
					clonedVariables.remove(lastIndex);
			}
		}
	}

	/**
	 * 式の中で var を参照している回数
	 * */
	public int calcRefTimesOfVar(VerilogVariableDecl var){

		int refTimes = 0;
		assembleAllNode();
		for(int i=0; i<nodes.size(); i++)
			if(nodes.get(i) instanceof DFGraphVariableAccess)
				if( ((DFGraphVariableAccess)nodes.get(i)).getVariableDecl()==var )
					++refTimes;

		return refTimes;
	}


	public void getMaxRegisterNum(){

		for(int i=0; i<statementNode.size(); i++){

			if(statementNode.get(i).destTypeIsReg){
				switch(statementNode.get(i).destType){
					case DFGraphNode.destTypeInt:
						usedIntRegNum++;
						break;
					case DFGraphNode.destTypeLong:
						usedLongRegNum++;
						break;
					case DFGraphNode.destTypeFloating:
						usedFloatRegNum++;
						break;
					case DFGraphNode.destTypeBoolean:
						usedBoolRegNum++;
						break;
					default:
						System.out.println("DEBUG:	error DFGraphManager getMaxRegisterNum");
				}
			}
		}
	}

	public void searchTimeToLive(){

		for(int i=0; i<statementNode.size(); i++){
			if(statementNode.get(i).destTypeIsReg){
				statementNode.get(i).searchTimeToLive();
			}
		}
	}

	public void bindTmpReg(VerilogClass parentClass){

		for(int i=0; i<statementNode.size(); i++){
			statementNode.get(i).assignDestSignal(parentClass);
		}
	}

	public void modifyReturnCast(String retType){
		rootNode = new DFGraphTypeCast(rootNode, retType);
		rootNode.parentManager = this;
		isReturnGraph = true;
	}

	public void makeNoneBlockAssign(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		for(int i=0; i<statementNode.size(); i++){
			statementNode.get(i).makeAlways(controlStep, methodID, phaseID, stageID);
		}
	}

	public void makeResetPart(ArrayList<VerilogNoneBlockAssign> resetAssign){

		if(rootNode instanceof DFGraphVariableAccess){
			((DFGraphVariableAccess)rootNode).makeResetPart(resetAssign);
		}
		for(int i=0; i<statementNode.size(); i++){
			if(statementNode.get(i) != rootNode)
				statementNode.get(i).makeAlways(null, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist);
		}
	}

	/**
	 * WAR ハザードの read ノードを探す
	 * */
	public void assembleReadVariables(ArrayList<DFGraphVariableAccess> readNodes){

		assembleAllNode();
		for(int i=0; i<nodes.size(); i++){
			if( nodes.get(i) instanceof DFGraphVariableAccess ){

				DFGraphVariableAccess read = (DFGraphVariableAccess)nodes.get(i);
				if( read.isReadNode() )
					if(!rootNodeIsSameVariable(read)) //read ノードと同一の変数をもつノードに書き込んでいる -> WARハザードの対象にならない read ノード
						readNodes.add(read);
			}
		}
	}

	private boolean rootNodeIsSameVariable(DFGraphVariableAccess readNode){

		if(rootNode instanceof DFGraphVariableAccess){
			if( ((DFGraphVariableAccess)rootNode).getVariableDecl() == readNode.getVariableDecl()){
				return true;
			}
		}
		else if(rootNode instanceof DFGraphArrayAccess){

			DFGraphVariableAccess root = ((DFGraphArrayAccess)rootNode).getVariable();
			if( root.getVariableDecl() == readNode.getVariableDecl() ){
				return true;
			}
		}
		return false;
	}

	/**
	 * @param checked
	 * 変数 checked に代入している式である -> true
	 * */
	public boolean rootNodeIsSameVariable(VerilogVariableDecl checked){

		if(rootNode instanceof DFGraphVariableAccess){

			if( ((DFGraphVariableAccess)rootNode).getVariableDecl() == checked )
				return true;
		}
		return false;
	}

	/**
	 * 無意味なフォワーディングの消去
	 * */
	public void deleteUselessForwarding(){

		for(DFGraphNode node : statementNode)
			if(node instanceof DFGraphVariableAccess)
				((DFGraphVariableAccess)node).deleUselessForwarding();
	}

	/**
	 * WAW, RAW ハザードの write ノードを探す
	 * */
	public DFGraphVariableAccess getWriteVariable(){

		if(rootNode instanceof DFGraphVariableAccess ){
			if( !((DFGraphVariableAccess)rootNode).isReadNode() )
				return (DFGraphVariableAccess)rootNode;
		}
		else if(rootNode instanceof DFGraphArrayAccess){
			DFGraphVariableAccess variable = ((DFGraphArrayAccess)rootNode).getVariable();
			if( !variable.isReadNode() )
				return variable;
		}
		return null;
	}

	/**
	 * WAR ハザードの依存関係をセット
	 * */
	public void setReadNodeToWriteNode(ArrayList<DFGraphVariableAccess> readNodes){

		if(rootNode instanceof DFGraphVariableAccess){

			for(int i=0; i<readNodes.size(); i++){
				DFGraphVariableAccess root = (DFGraphVariableAccess)rootNode;
				if(root.registerReadNode(readNodes.get(i))){
					readNodes.remove(readNodes.get(i));	//依存関係の見つかったノードは取り除く
					i--;
				}
			}
		}
		else if(rootNode instanceof DFGraphArrayAccess){

			DFGraphVariableAccess variable = ((DFGraphArrayAccess)rootNode).getVariable();
			for(int i=0; i<readNodes.size(); i++){
				if(variable.registerReadNode(readNodes.get(i))){
					readNodes.remove(readNodes.get(i));	//依存関係の見つかったノードは取り除く
					i--;
				}
			}
		}
	}

	/**
	 * RAWハザードの依存関係をセット
	 * */
	public boolean setWriteNodeToReadAndWriteNode(DFGraphVariableAccess writeVariable){

		assembleAllNode();
		boolean occuredRAW = false;

		for(int i=0; i<nodes.size(); i++){
			if( nodes.get(i) instanceof DFGraphVariableAccess ){
				DFGraphVariableAccess vAccess = (DFGraphVariableAccess)nodes.get(i);
				if( vAccess.isReadNode() ){
					occuredRAW |= vAccess.registerWriteNode(writeVariable);
				}
			}
		}

		if(rootNodeIsSameVariable(writeVariable)){	//この式に対しWAW ハザードが発生した -> writeVariableと以降の式との RAWハザードは発生しない

			if(!occuredRAW){	//この式とRAWハザードが発生している場合，WAW を登録する必要はない
				setWriteNodeToWriteNode(writeVariable);
			}
			return false;
		}
		return true;
	}

	/**
	 * WAW ハザードの依存関係をセット
	 * */
	public void setWriteNodeToWriteNode(DFGraphVariableAccess writeVariable){

		if(rootNode instanceof DFGraphVariableAccess){
			DFGraphVariableAccess root = (DFGraphVariableAccess)rootNode;
			if(!root.isReadNode())
				root.registerWriteNode(writeVariable);
		}
		else if(rootNode instanceof DFGraphArrayAccess){
			DFGraphVariableAccess variable = ((DFGraphArrayAccess)rootNode).getVariable();
			if(!variable.isReadNode())
				variable.registerWriteNode(writeVariable);
		}
	}

	public void resetDFGraphConnectivity(){

		for( DFGraphNode node : statementNode ){
			if(node instanceof DFGraphVariableAccess)
				((DFGraphVariableAccess)node).resetConnectivity();
		}
	}

	/**
	 * DFG の最小クリティカルパスを探す<br>
	 * 最小 -> 高スループットな演算IPが十分ある
	 * */
	public int searchMinCriticalPath(){

		int minCriticalPath = 0;
		for(DFGraphNode node : statementNode)
			minCriticalPath = Math.max(minCriticalPath, node.minCntlStpFromThisNode);

		return minCriticalPath;
	}

	public void defFastestStepForAlap(int minCriticalPath){

		for(DFGraphNode node : statementNode)
			node.fastestStepForAlap = minCriticalPath - node.minCntlStpFromThisNode;
	}
}














