package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.config.Config;
import net.njlab.dfg.*;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.*;

/**
 *  @author Keisuke Koike
 */
public class VerilogConditional extends VerilogExpression{

	JCConditional conditional;
	VerilogExpression cond;
	VerilogExpression trueExpr;
	VerilogExpression falseExpr;

	public VerilogConditional(JCConditional conditional, VerilogStatement statParent, VerilogExpression exprParent){
		this.conditional = conditional;
		this.statParent = statParent;
		this.exprParent = exprParent;
		cond = VerilogExpression.makeSubExpression(statParent, this, conditional.getCondition());
		trueExpr  = VerilogExpression.makeSubExpression(statParent, this, conditional.getTrueExpression());
		falseExpr = VerilogExpression.makeSubExpression(statParent, this, conditional.getFalseExpression());
	}

	public void buildExpression(){
		cond.buildExpression();
		trueExpr.buildExpression();
		falseExpr.buildExpression();
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		ret |= cond.existERR();
		ret |= trueExpr.existERR();
		ret |= falseExpr.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Conditional>");
		Dump.tprintln(out, offset, "<condExpr>");
		cond.dump(out, offset+1);
		Dump.tprintln(out, offset, "</condExpr>\n");
		Dump.tprintln(out, offset, "<trueExpr>");
		trueExpr.dump(out, offset+1);
		Dump.tprintln(out, offset, "</trueExpr>\n");
		Dump.tprintln(out, offset, "<falseExpr>");
		falseExpr.dump(out, offset+1);
		Dump.tprintln(out, offset, "</falseExpr>\n");
		Dump.tprintln(out, offset, "</Conditional>");
	}

	@Override
	public boolean checkAssignKind(){

		boolean ret = false;
		ret |= isAssignKind(cond);
		ret |= isAssignKind(trueExpr);
		ret |= isAssignKind(falseExpr);
		ret |= cond.checkAssignKind();
		ret |= trueExpr.checkAssignKind();
		ret |= falseExpr.checkAssignKind();
		return ret;
	}

	@Override
	public  ArrayList<VerilogVariableDecl>  registerUsedVariables(){
		ArrayList<VerilogVariableDecl> retArray = new  ArrayList<VerilogVariableDecl>();
		retArray.addAll(cond.registerUsedVariables());
		retArray.addAll(trueExpr.registerUsedVariables());
		retArray.addAll(falseExpr.registerUsedVariables());
		return retArray;
	}

	@Override
	public DFGraphNode makeDFG(){//3項演算は trueとfalse大きい方の型にあわせる

		DFGraphNode trueNode = trueExpr.makeDFG();
		DFGraphNode falseNode = falseExpr.makeDFG();
		DFGraphNode condNode = cond.makeDFG();
		DFGraphNode DFGraphConditional = null;

		String floatingType;
		if(statParent.getPhaseParent().getParentClass().config.floatingType == Config.singleType)
			floatingType = VerilogVariableDecl.floatType;
		else
			floatingType = VerilogVariableDecl.doubleType;

		if(trueNode.destType == falseNode.destType){ //(int, int), (long, long), (float, float), (boolean, boolean)
			DFGraphConditional = new DFGraphConditional(trueNode, falseNode, condNode, trueNode.destType);
		}
		else if(trueNode.destType < falseNode.destType){
			DFGraphTypeCast tcast=null;
			if(falseNode.destType == DFGraphNode.destTypeLong){//(int, long)
				tcast = new DFGraphTypeCast(trueNode, VerilogVariableDecl.longType);
			}
			else if(falseNode.destType == DFGraphNode.destTypeFloating){ //(int, float), (long, float)
				tcast = new DFGraphTypeCast(trueNode, floatingType);
			}
			DFGraphConditional = new DFGraphConditional(tcast, falseNode, condNode, falseNode.destType);
		}
		else if(trueNode.destType > falseNode.destType){
			DFGraphTypeCast tcast=null;
			if(trueNode.destType == DFGraphNode.destTypeLong){//(long, int)
				tcast = new DFGraphTypeCast(falseNode, VerilogVariableDecl.longType);
			}
			else if(trueNode.destType == DFGraphNode.destTypeFloating){ //(float, int), (float, long)
				tcast = new DFGraphTypeCast(falseNode, floatingType);
			}
			DFGraphConditional = new DFGraphConditional(trueNode, tcast, condNode, trueNode.destType);
		}
		return DFGraphConditional;
	}
}
