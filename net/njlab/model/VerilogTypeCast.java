package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.config.Config;
import net.njlab.dfg.DFGraphNode;
import net.njlab.dfg.DFGraphTypeCast;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.JCTypeCast;

/**
 *  @author Keisuke Koike
 */
public class VerilogTypeCast extends VerilogExpression{

	JCTypeCast typeCast;
	VerilogExpression expr;
	String castType;

	public VerilogTypeCast(JCTypeCast typeCast, VerilogStatement statParent, VerilogExpression exprParent){
		this.typeCast = typeCast;
		this.statParent = statParent;
		this.exprParent = exprParent;
	}

	@Override
	public void buildExpression(){

		if(VerilogVariableDecl.isPrimitive(typeCast.getType().toString())){

			castType = typeCast.getType().toString();
			if(castType.compareTo(VerilogVariableDecl.floatType)==0 &&
			   statParent.getPhaseParent().getParentClass().config.floatingType==Config.doubleType){
				castType = VerilogVariableDecl.doubleType;
				CompileMsgs.wdumpCastChangeFloatIntoDouble(typeCast.toString());
			}
			else if(castType.compareTo(VerilogVariableDecl.doubleType)==0 &&
				    statParent.getPhaseParent().getParentClass().config.floatingType==Config.singleType){
				castType = VerilogVariableDecl.floatType;
				CompileMsgs.wdumpCastChangeDoubleIntoFloat(typeCast.toString());
			}
		}
		else{
			CompileMsgs.edumpCastMustBePrimitive(typeCast.toString());
			buildSucceed = false;
		}
		expr = VerilogExpression.makeSubExpression(statParent, this, typeCast.getExpression());
		expr.buildExpression();
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		ret |= expr.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<TypeCast>");
		Dump.tprintln(out, offset+1, "<castType>	"+ castType +"	</castType>\n");
		expr.dump(out, offset+1);
		Dump.tprintln(out, offset, "</TypeCast>\n");
	}

	@Override
	public boolean checkAssignKind(){

		boolean ret = false;

		if(exprParent instanceof VerilogAssign){ //  dest = (castType)methodInv(...); ならばOK
			ret |= isIncDecAssign(expr);
		}
		else{
			ret |= isAssignKind(expr);
		}
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
		DFGraphTypeCast castNode = new DFGraphTypeCast(srcNode, castType);
		return castNode;
	}
}
