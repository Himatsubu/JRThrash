package net.njlab.model;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.*;
import net.njlab.dfg.*;
import java.io.PrintWriter;

/**
 *  @author Keisuke Koike
 */
public class VerilogExprStatement  extends VerilogStatement{

	JCExpression expr;
	VerilogExpression expression;

	//<statement expression> ::= <assignment> | <preincrement expression> | <postincrement expression> | <predecrement expression> | <postdecrement expression> | <method invocation> | <class instance creation expression>

	VerilogExprStatement(JCExpression expr){
		this.expr = expr;
		expression = VerilogExpression.makeSubExpression(this, null, expr);
	}

	@Override
	public void buildExpression(){
		if(expression!=null)
			expression.buildExpression();
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		if(expression!=null)
			ret |= expression.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<ExprStatement>");
		expression.dump(out, offset+1);
		Dump.tprintln(out, offset, "</ExprStatement>\n");
	}

	@Override
	public boolean checkAssignKind(){
		boolean ret = false;
		if(expression!=null)
			if(ret=expression.checkAssignKind())
				CompileMsgs.edumpAssignKind(expr.toString());

		if(ret)
			buildSucceed = false;
		return ret;
	}

	@Override
	public void findUsedVariables(){
		usedReadVariables.addAll(expression.registerUsedVariables());
	}

	@Override
	public DFGraphNode makeDFG(){
		return expression.makeDFG();
	}
}
