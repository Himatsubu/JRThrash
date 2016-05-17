package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;

import com.sun.org.apache.xalan.internal.xsltc.cmdline.Compile;

import net.njlab.dfg.*;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree;
import openjdk.com.sun.tools.javac.tree.JCTree.*;

/**
 *  @author Keisuke Koike
 */
public class VerilogUnary extends VerilogExpression{

	JCUnary unary;
	VerilogExpression expr;
	int unaryOp;
	String opString;

    public static final String POS =     "+";   // +
    public static final String NEG =     "-";   // -
    public static final String NOT =     "!";   // !
    public static final String COMPL =   "~";   // ~
    public static final String PREINC =  "++_"; // ++ _
    public static final String PREDEC =  "--_"; // -- _
    public static final String POSTINC = "_++"; // _ ++
    public static final String POSTDEC = "_--"; // _ --

    /*** Unary operators, of type Unary.
    public static final int POS = ERRONEOUS + 1;             // +
    public static final int NEG = POS + 1;                   // -
    public static final int NOT = NEG + 1;                   // !
    public static final int COMPL = NOT + 1;                 // ~
    public static final int PREINC = COMPL + 1;              // ++ _
    public static final int PREDEC = PREINC + 1;             // -- _
    public static final int POSTINC = PREDEC + 1;            // _ ++
    public static final int POSTDEC = POSTINC + 1;           // _ --
	*/

	public VerilogUnary(JCUnary unary, VerilogStatement statParent, VerilogExpression exprParent){
		this.unary = unary;
		this.statParent = statParent;
		this.exprParent = exprParent;
		//System.out.println("unary "+unary.operator);
	}

	public String getOpString(int unaryOp){
		if(unaryOp== JCTree.POS )	     return POS;
		else if(unaryOp==JCTree.NEG)     return NEG;
		else if(unaryOp==JCTree.NOT)     return NOT;
		else if(unaryOp==JCTree.COMPL)   return COMPL;
		else if(unaryOp==JCTree.PREINC)  return PREINC;
		else if(unaryOp==JCTree.PREDEC)  return PREDEC;
		else if(unaryOp==JCTree.POSTINC) return POSTINC;
		else if(unaryOp==JCTree.POSTDEC) return POSTDEC;
		else 						     return "error_UNARY_OP";
	}

	@Override
	public void buildExpression(){
		unaryOp = unary.getTag();
		opString = getOpString(unaryOp);
		expr = VerilogExpression.makeSubExpression(statParent, this, unary.getExpression());
		expr.buildExpression();
		checkReadOnly();
	}

	private void checkReadOnly(){	//read only なのに書き込んでいないかチェック

		VerilogVariableDecl vdecl = null;
		if(expr instanceof VerilogFieldAccess){
			VerilogFieldAccess fieldAccess = (VerilogFieldAccess)expr;
			vdecl = fieldAccess.field;
		}
		else if(expr instanceof VerilogIdent){
			VerilogIdent ident = (VerilogIdent)expr;
			vdecl = ident.variable;
		}

		if(vdecl!=null){
			if(vdecl.isReadOnlyPort){
				if(opString.compareTo(PREINC)==0 || opString.compareTo(POSTINC)==0 ||
				   opString.compareTo(PREDEC)==0 || opString.compareTo(POSTDEC)==0){
						CompileMsgs.edumpWriteReadOnlyPort(unary.toString());
						this.buildSucceed = false;
				}
			}
		}
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		ret |= expr.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Unary>");
		Dump.tprintln(out, offset, "<unaryOP>	"+opString+"</unaryOP>");
		expr.dump(out, offset+1);
		Dump.tprintln(out, offset, "</Unary>\n");
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
		if(opString.compareTo(PREINC)==0 || opString.compareTo(POSTINC)==0 ||
		   opString.compareTo(PREDEC)==0 || opString.compareTo(POSTDEC)==0){	//++, --は num++; のように単独で文となる => num を読み取り,書き込み変数リストに追加
			statParent.usedWriteVariable = retArray.get(0);
		}
		return retArray;
	}

	@Override
	public DFGraphNode makeDFG(){

		DFGraphNode srcNode = expr.makeDFG();
		DFGraphUnary unaryNode;
		VerilogClass parentClass = statParent.getPhaseParent().getParentClass();

		if(opString.compareTo(PREINC)==0 || opString.compareTo(POSTINC)==0){	//num++; ,  ++num; のように単独で使用する場合のみ変換可能
			DFGraphLiteral literalNode = new DFGraphLiteral(srcNode.getDestTypeString(parentClass.config), 1, 1L, 1.0f, 1.0, true);
			DFGraphNode binaryNode = VerilogBinary.makeBinaryNode(srcNode, literalNode, VerilogBinary.PLUS, parentClass.config, unary);
			return VerilogAssign.makeAssignNode(srcNode.clone(), binaryNode, parentClass.config);
		}
		else if(opString.compareTo(PREDEC)==0 || opString.compareTo(POSTDEC)==0){//num--; ,  --num; のように単独で使用する場合のみ変換可能
			DFGraphLiteral literalNode = new DFGraphLiteral(srcNode.getDestTypeString(parentClass.config), 1, 1L, 1.0f, 1.0, true);
			DFGraphNode binaryNode = VerilogBinary.makeBinaryNode(srcNode, literalNode, VerilogBinary.MINUS, parentClass.config, unary);
			return VerilogAssign.makeAssignNode(srcNode.clone(), binaryNode, parentClass.config);
		}
		else if(parentClass.config.addIntUseIP && opString.compareTo(NEG)==0 && srcNode.destType!=DFGraphNode.destTypeFloating){
			DFGraphLiteral literalNode = new DFGraphLiteral(srcNode.getDestTypeString(parentClass.config), 0, 0L, 0.0f, 0.0, true);
			return  VerilogBinary.makeBinaryNode(literalNode, srcNode, VerilogBinary.MINUS, parentClass.config, unary);
		}
		else{
			unaryNode = new DFGraphUnary(srcNode, opString, srcNode.destType);
		}
		return unaryNode;
	}
}
