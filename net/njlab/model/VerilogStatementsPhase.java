package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Stack;

import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.JCAssert;
import openjdk.com.sun.tools.javac.tree.JCTree.JCBlock;
import openjdk.com.sun.tools.javac.tree.JCTree.JCBreak;
import openjdk.com.sun.tools.javac.tree.JCTree.JCCase;
import openjdk.com.sun.tools.javac.tree.JCTree.JCCatch;
import openjdk.com.sun.tools.javac.tree.JCTree.JCClassDecl;
import openjdk.com.sun.tools.javac.tree.JCTree.JCContinue;
import openjdk.com.sun.tools.javac.tree.JCTree.JCDoWhileLoop;
import openjdk.com.sun.tools.javac.tree.JCTree.JCEnhancedForLoop;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpressionStatement;
import openjdk.com.sun.tools.javac.tree.JCTree.JCForLoop;
import openjdk.com.sun.tools.javac.tree.JCTree.JCIf;
import openjdk.com.sun.tools.javac.tree.JCTree.JCLabeledStatement;
import openjdk.com.sun.tools.javac.tree.JCTree.JCReturn;
import openjdk.com.sun.tools.javac.tree.JCTree.JCSkip;
import openjdk.com.sun.tools.javac.tree.JCTree.JCStatement;
import openjdk.com.sun.tools.javac.tree.JCTree.JCSwitch;
import openjdk.com.sun.tools.javac.tree.JCTree.JCSynchronized;
import openjdk.com.sun.tools.javac.tree.JCTree.JCThrow;
import openjdk.com.sun.tools.javac.tree.JCTree.JCTry;
import openjdk.com.sun.tools.javac.tree.JCTree.JCVariableDecl;
import openjdk.com.sun.tools.javac.tree.JCTree.JCWhileLoop;

/**
 *  @author Keisuke Koike
 */
public abstract class VerilogStatementsPhase extends VerilogScope{

	//if や for 等のブロック内部で宣言された変数
	public ArrayList<VerilogVariableDecl> vdecls = new ArrayList<VerilogVariableDecl>();
	static private ArrayList<VerilogStatementsPhase> methodStatements = null;
	abstract public void dump(PrintWriter out, int offset);
	abstract public boolean existERR();   //エラーがある場合 true
	//abstract public VerilogCaseChild makeCaseChild();

	/**
	 * 状態遷移グラフ（フェイズの状態遷移グラフ）を完成させる
	 * @param source 状態遷移元
	 * @param elseSource 状態遷移元（状態分岐失敗した場合）
	 * @param strayChild 遷移先不明のフェイズ
	 * @param strayElseChild 状態分岐失敗した場合の遷移先が不明のフェイズ
	 * */
	abstract protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
												Stack<StateTransGraphNode> elseSource,
												Stack<StateTransGraphNode> strayChild,
												Stack<StateTransGraphNode> strayElseChild);
	abstract protected StateTransGraphNode getFirstPhase();	//そのフェイズ以下にあって遷移可能な最初のフェイズのノードを探す（そのフェイズ以下のノードを作ってから実行する）

	VerilogStatementsPhase parent;
	boolean buildSucceed = true;
	int stateID;
	static private int stateIDseq;
	public VerilogLiteralNumber phaseLiteral;
	public VerilogSignalString  phaseSignal;

	/**
	 * method のもつ全 statementPhase を格納する配列を渡す
	 * */
	static void setMethodStaetmentArray(ArrayList<VerilogStatementsPhase> statements){
		methodStatements = statements;
	}

	static void resetStateId(){
		stateIDseq = 1;
	}

	VerilogStatementsPhase(){
		stateID = stateIDseq++;
		if(methodStatements!=null)
			methodStatements.add(this);
	}

	/**
	 * ブロック開始時の変数スタックを作成
	 * ブロック開始時の変数スタック = 親ブロック開始時の変数スタック + 親ブロック内で宣言された変数
	 * */
	void makeVariableStack(){
		this.variableStack.addAll(parent.variableStack);
		this.variableStack.addAll(parent.vdecls);
	}

	public VerilogMethod getParentMethod(){

		VerilogStatementsPhase tmp = this;
		while(!(tmp instanceof VerilogMethod)){
			tmp = tmp.parent;
		}
		return (VerilogMethod)tmp;
	}

	public VerilogClass getParentClass(){
		VerilogStatementsPhase tmp = this;
		while(!(tmp instanceof VerilogClass)){
			tmp = tmp.parent;
		}
		return (VerilogClass)tmp;
	}

	static VerilogStatementsPhase makeSubBlock(JCStatement statement, VerilogStatementsPhase parent){

		if(statement instanceof JCClassDecl){
			System.out.println("DEBUG:	error  ClassDecl");
		}
		else if(statement instanceof JCVariableDecl){
			System.out.println("DEBUG:	error VariableDecl");//VariableDeclはこの関数で作成しない
			return null;
		}
		else if(statement instanceof JCSkip){	//JCSkip 以外に null を返してかつ buildSucceed == true があってはいけない
			return null;
		}
		else if(statement instanceof JCBlock){
			VerilogBlock tmp = new VerilogBlock((JCBlock)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCDoWhileLoop){
			VerilogDoWhile tmp = new VerilogDoWhile((JCDoWhileLoop)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCWhileLoop){
			VerilogWhileLoop tmp = new VerilogWhileLoop((JCWhileLoop)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCForLoop){
			VerilogForLoop tmp = new VerilogForLoop((JCForLoop)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCEnhancedForLoop){
			CompileMsgs.edumpUnusable("For-each statements");
			Dump.tprint(System.out, 1, statement.toString());
			System.out.println("\n");
		}
		else if(statement instanceof JCLabeledStatement){
			CompileMsgs.edumpUnusable("Labels");
			Dump.tprint(System.out, 1, statement.toString());
			System.out.println("\n");
		}
		else if(statement instanceof JCSwitch){
			VerilogSwitch tmp = new VerilogSwitch((JCSwitch)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCCase){
			VerilogCase tmp = new VerilogCase((JCCase)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCSynchronized){
			CompileMsgs.edumpUnusable("Synchronized blocks");
			Dump.tprint(System.out, 1, statement.toString());
			System.out.println("\n");
		}
		else if(statement instanceof JCTry){

			VerilogBlock tmp = new VerilogBlock(((JCTry)statement).getBlock(), parent);

			for(JCCatch catchBlock : ((JCTry)statement).getCatches())
				checkCatch(catchBlock);	//チェックブロックに何か書いていたら警告

			return tmp;
		}
		else if(statement instanceof JCIf){
			VerilogIf tmp = new VerilogIf((JCIf)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCExpressionStatement){
			//if や for 等に対して if(...) ExpressionStatement と書かれているものは, if(...){ ExpressionStatment } に変換する
			VerilogBlock tmp = new VerilogBlock((JCExpressionStatement)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCBreak){
			VerilogBreak tmp = new VerilogBreak((JCBreak)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCContinue){
			VerilogContinue tmp = new VerilogContinue((JCContinue)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCReturn){
			VerilogReturn tmp = new VerilogReturn((JCReturn)statement, parent);
			return tmp;
		}
		else if(statement instanceof JCThrow){
			CompileMsgs.edumpUnusable("Throw statements");
			Dump.tprint(System.out, 1, statement.toString());
			System.out.println("\n");
		}
		else if(statement instanceof JCAssert){
			CompileMsgs.edumpUnusable("Asserts");
			System.out.println("\n");
		}
		parent.buildSucceed = false;
		return null;
	}

	static private void checkCatch(JCCatch catchBlock){

		if(catchBlock.getBlock().getStatements().size()!=0){

			CompileMsgs.wdumpCatchNotExecuted();
			Dump.tprint(System.out, 1, catchBlock.toString());
			System.out.println("\n");
		}
	}

	protected void moveStack(Stack dst, Stack src){

		while(src.size()>0){
			dst.push(src.pop());
		}
	}

	protected void dumpStgDebug(Stack stA, Stack stB, String className){

		if(stA.size()!=0 || stB.size()!=0){
			System.out.println("DEBUG:	error "+className+" makeStateTransGraph");
		}
	}

	public int getStateID(){
		return stateID;
	}
}
