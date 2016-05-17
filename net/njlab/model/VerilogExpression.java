package net.njlab.model;

import java.io.PrintWriter;
import java.util.*;
import openjdk.com.sun.tools.javac.tree.JCTree;
import openjdk.com.sun.tools.javac.tree.JCTree.JCAnnotation;
import openjdk.com.sun.tools.javac.tree.JCTree.JCArrayAccess;
import openjdk.com.sun.tools.javac.tree.JCTree.JCArrayTypeTree;
import openjdk.com.sun.tools.javac.tree.JCTree.JCAssign;
import openjdk.com.sun.tools.javac.tree.JCTree.JCAssignOp;
import openjdk.com.sun.tools.javac.tree.JCTree.JCBinary;
import openjdk.com.sun.tools.javac.tree.JCTree.JCConditional;
import openjdk.com.sun.tools.javac.tree.JCTree.JCErroneous;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpression;
import openjdk.com.sun.tools.javac.tree.JCTree.JCFieldAccess;
import openjdk.com.sun.tools.javac.tree.JCTree.JCIdent;
import openjdk.com.sun.tools.javac.tree.JCTree.JCInstanceOf;
import openjdk.com.sun.tools.javac.tree.JCTree.JCLiteral;
import openjdk.com.sun.tools.javac.tree.JCTree.JCMethodInvocation;
import openjdk.com.sun.tools.javac.tree.JCTree.JCNewArray;
import openjdk.com.sun.tools.javac.tree.JCTree.JCNewClass;
import openjdk.com.sun.tools.javac.tree.JCTree.JCParens;
import openjdk.com.sun.tools.javac.tree.JCTree.JCPrimitiveTypeTree;
import openjdk.com.sun.tools.javac.tree.JCTree.JCTypeApply;
import openjdk.com.sun.tools.javac.tree.JCTree.JCTypeCast;
import openjdk.com.sun.tools.javac.tree.JCTree.JCUnary;
import openjdk.com.sun.tools.javac.tree.JCTree.JCWildcard;
import openjdk.com.sun.tools.javac.tree.JCTree.LetExpr;
import net.njlab.dfg.*;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;

/**
 *  @author Keisuke Koike
 */
public abstract class VerilogExpression {

	VerilogExpression exprParent = null;
	VerilogStatement statParent = null;
	boolean buildSucceed = true;

	public static boolean read = true;
	public static boolean write = false;

	abstract public void buildExpression();
	abstract public boolean existERR();
	abstract public void dump(PrintWriter out, int offset);
	abstract public ArrayList<VerilogVariableDecl> registerUsedVariables();
	abstract public DFGraphNode makeDFG();

	/**
	 * 子 Expression の中に ++, --, =, += メソッド呼び出し などの代入が発生する式を調べる
	 * */
	abstract public boolean checkAssignKind();

	static VerilogExpression makeSubExpression(VerilogStatement statParent, VerilogExpression exprParent, JCExpression expr){

		if(expr instanceof JCConditional){
			VerilogConditional tmp = new VerilogConditional((JCConditional)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCMethodInvocation){
			VerilogMethodInv tmp = new VerilogMethodInv((JCMethodInvocation)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCNewClass){
			CompileMsgs.edumpDontNewClass();
		}
		else if(expr instanceof JCNewArray){
			CompileMsgs.edumpDontNewArray();
		}
		else if(expr instanceof JCParens){
			return makeSubExpression(statParent, exprParent, ((JCParens)expr).expr);
		}
		else if(expr instanceof JCAssign){
			VerilogAssign tmp = new VerilogAssign((JCAssign)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCAssignOp){
			VerilogAssignOp tmp = new VerilogAssignOp((JCAssignOp)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCUnary){
			VerilogUnary tmp = new VerilogUnary((JCUnary)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCBinary){
			VerilogBinary tmp = new VerilogBinary((JCBinary)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCTypeCast){
			VerilogTypeCast tmp = new VerilogTypeCast((JCTypeCast)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCInstanceOf){
			CompileMsgs.edumpUnusable("instanceof");
		}
		else if(expr instanceof JCArrayAccess){
			VerilogArrayAccess tmp = new VerilogArrayAccess((JCArrayAccess)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCFieldAccess){
			VerilogFieldAccess tmp = new VerilogFieldAccess((JCFieldAccess)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCIdent){
			VerilogIdent tmp = new VerilogIdent((JCIdent)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCLiteral){
			VerilogLiteral tmp = new VerilogLiteral((JCLiteral)expr, statParent, exprParent);
			return tmp;
		}
		else if(expr instanceof JCPrimitiveTypeTree){
			CompileMsgs.edumpUnusable("PrimitiveTypeTrees");
		}
		else if(expr instanceof JCArrayTypeTree){
			CompileMsgs.edumpUnusable("ArrayTypeTrees");
		}
		else if(expr instanceof JCTypeApply){
			CompileMsgs.edumpUnusable("TypeApplies");
		}
		else if(expr instanceof JCWildcard){
			CompileMsgs.edumpUnusable("Wildcards");
		}
		else if(expr instanceof JCAnnotation){
			CompileMsgs.edumpUnusable("These Annotations");
		}
		else if(expr instanceof JCErroneous){
			CompileMsgs.edumpUnusable("Erroneous");
		}
		else if(expr instanceof LetExpr){
			CompileMsgs.edumpUnusable("LetExprs");
		}

		Dump.tprint(System.out, 1, expr.toString());
		System.out.println("\n");

		statParent.buildSucceed = false;
		if(exprParent!=null)	exprParent.buildSucceed = false;
		return null;
	}

	/**
	 * ++, --, =, op=, method呼び出し かどうか判別
	 * */
	public static boolean isAssignKind(VerilogExpression expr){

		if(expr instanceof VerilogMethodInv){

			VerilogMethod originalMethod = ((VerilogMethodInv)expr).getMethod();
			if(originalMethod!=null)
				if(originalMethod.convertedIntoIP)	//IPコア化するメソッドは，メソッド呼び出し扱いしない
					return false;

			return true;
		}

		else if(expr instanceof VerilogAssign)
			return true;

		else if(expr instanceof VerilogAssignOp)
			return true;

		else if(expr instanceof VerilogUnary){
			if(((VerilogUnary)expr).unaryOp==JCTree.PREINC  ||
			   ((VerilogUnary)expr).unaryOp==JCTree.PREDEC  ||
			   ((VerilogUnary)expr).unaryOp==JCTree.POSTINC ||
			   ((VerilogUnary)expr).unaryOp==JCTree.POSTDEC )
				return true;
		}
		return false;
	}

	/**
	 * ++, --, =, op=  かどうか判別（method呼び出しは判定せず）
	 * */
	public static boolean isIncDecAssign(VerilogExpression expr){

		if(expr instanceof VerilogAssign)
			return true;

		else if(expr instanceof VerilogAssignOp)
			return true;

		else if(expr instanceof VerilogUnary){
			if(((VerilogUnary)expr).unaryOp==JCTree.PREINC  ||
			   ((VerilogUnary)expr).unaryOp==JCTree.PREDEC  ||
			   ((VerilogUnary)expr).unaryOp==JCTree.POSTINC ||
			   ((VerilogUnary)expr).unaryOp==JCTree.POSTDEC )
				return true;
		}
		return false;
	}
}
