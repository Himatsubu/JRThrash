package net.njlab.model;

import java.io.PrintWriter;
import java.util.*;

import openjdk.com.sun.tools.javac.tree.JCTree.*;
import net.njlab.dfg.*;
import net.njlab.dump.Dump;
import net.njlab.scheduling.*;
import net.njlab.config.*;

/**
 *  @author Keisuke Koike
 */
public abstract class VerilogStatement implements Cloneable{

	boolean buildSucceed = true;
	private VerilogStatementsPhase parent;
	public void buildExpression(){};
	abstract public void dump(PrintWriter out, int offset);
	abstract public boolean existERR();   //エラーがある場合true
	abstract public DFGraphNode makeDFG();
	public ArrayList<VerilogVariableDecl> usedReadVariables = new ArrayList<VerilogVariableDecl>();	//文中に出てきた全ての変数を格納する
	public VerilogVariableDecl usedWriteVariable = null;
	public abstract void findUsedVariables();
	protected boolean haveMethodInv = false; //式がメソッド呼び出しを持っている -> true
	//public ArrayList<DFGraphNode> statementNode = new ArrayList<DFGraphNode>(); //文が持つDFGノードの集合
	//DFGraphNode rootNode = null; //文が持つDFGのルートノード


	/**
	 * ++, --, =, op=, メソッド呼び出し, がサブExpression として使われていないかチェック
	 * */
	abstract public boolean checkAssignKind();

	public void setPhaseParent(VerilogStatementsPhase parent){
		this.parent = parent;
	}

	public VerilogStatementsPhase getPhaseParent(){
		return parent;
	}

	public static VerilogStatement makeSubStatement(JCStatement statement){

		if(statement instanceof JCExpressionStatement){
			VerilogExprStatement tmp = new VerilogExprStatement(((JCExpressionStatement)statement).getExpression());
			return tmp;
		}
		else {
			System.out.println("DEBUG:	error makeSubStatement");
		}
		return null;
	}
}


