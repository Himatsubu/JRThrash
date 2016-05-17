package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.dfg.*;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.*;

/**
 *  @author Keisuke Koike
 */
public class VerilogParens extends VerilogExpression{

	JCParens parens;
	VerilogExpression expr;

	VerilogParens(JCParens parens, VerilogStatement statParent, VerilogExpression exprParent){
		this.parens = parens;
		this.exprParent = exprParent;
		this.statParent = statParent;
	}

	@Override
	public void buildExpression(){
		expr = VerilogExpression.makeSubExpression(statParent, this, parens.getExpression());
		expr.buildExpression();
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		ret |= expr.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Parens>");
		expr.dump(out, offset+1);
		Dump.tprintln(out, offset, "</Parens>\n");
	}

	@Override
	public boolean checkAssignKind(){

		boolean ret = false;
		ret |= isAssignKind(expr);
		ret |= expr.checkAssignKind();
		return ret;
	}

	@Override
	public ArrayList<VerilogVariableDecl> registerUsedVariables(){
		ArrayList<VerilogVariableDecl> retArray = new ArrayList<VerilogVariableDecl>();
		retArray.addAll(expr.registerUsedVariables());
		return retArray;
	}

	@Override
	public DFGraphNode makeDFG(){

		DFGraphNode srcNode = expr.makeDFG();
		DFGraphParens parenNode = new DFGraphParens(srcNode);
		return parenNode;
	}
}
