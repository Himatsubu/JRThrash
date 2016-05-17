package net.njlab.model;
import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.config.Config;
import net.njlab.dfg.DFGraphBinary;
import net.njlab.dfg.DFGraphNode;
import net.njlab.dfg.DFGraphTypeCast;
import net.njlab.dfg.DFGraphUnary;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree;
import openjdk.com.sun.tools.javac.tree.JCTree.JCBinary;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpression;

/**
 *  @author Keisuke Koike
 */
public class VerilogBinary extends VerilogExpression{

	JCBinary binary;
	VerilogExpression leftExpr, rightExpr;
	int binaryOp;
	String opString;
	boolean negativeLogic = false; 		// <= と >= を < に直す際, 真偽が変わる

    public static final String OR =     "||";   // ||
    public static final String AND =    "&&";   // &&
    public static final String BITOR =  "|";    // |
    public static final String BITXOR = "^";    // ^
    public static final String BITAND = "&";    // &
    public static final String EQ =     "==";   // ==
    public static final String NE =     "!=";   // !=
    public static final String LT =     "<";    // <
    public static final String GT =     ">";    // >
    public static final String LE =     "<=";   // <=
    public static final String GE =     ">=";   // >=
    public static final String SL =     "<<";   // <<
    public static final String SR =     ">>";   // >>
    public static final String USR =    ">>>";  // >>>
    public static final String PLUS =   "+";    // +
    public static final String MINUS =  "-";    // -
    public static final String MUL =    "*";    // *
    public static final String DIV =    "/";    // /
    public static final String MOD =    "%";    // %

    /** Binary operators, of type Binary.
    public static final int OR = NULLCHK + 1;                // ||
    public static final int AND = OR + 1;                    // &&
    public static final int BITOR = AND + 1;                 // |
    public static final int BITXOR = BITOR + 1;              // ^
    public static final int BITAND = BITXOR + 1;             // &
    public static final int EQ = BITAND + 1;                 // ==
    public static final int NE = EQ + 1;                     // !=
    public static final int LT = NE + 1;                     // <
    public static final int GT = LT + 1;                     // >
    public static final int LE = GT + 1;                     // <=
    public static final int GE = LE + 1;                     // >=
    public static final int SL = GE + 1;                     // <<
    public static final int SR = SL + 1;                     // >>
    public static final int USR = SR + 1;                    // >>>
    public static final int PLUS = USR + 1;                  // +
    public static final int MINUS = PLUS + 1;                // -
    public static final int MUL = MINUS + 1;                 // *
    public static final int DIV = MUL + 1;                   // /
    public static final int MOD = DIV + 1;                   // %
	*/


	public VerilogBinary(JCBinary binary, VerilogStatement statParent, VerilogExpression exprParent){
		this.binary = binary;
		this.statParent = statParent;
		this.exprParent = exprParent;
	}

	@Override
	public void buildExpression(){
		//System.out.println(binary.operator);
		binaryOp = binary.getTag();
		opString = getOpString(binaryOp);
		leftExpr = VerilogExpression.makeSubExpression(statParent, this, binary.getLeftOperand());
		leftExpr.buildExpression();
		rightExpr = VerilogExpression.makeSubExpression(statParent, this, binary.getRightOperand());
		rightExpr.buildExpression();
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		ret |= rightExpr.existERR();
		ret |= leftExpr.existERR();
		return ret;
	}

	String getOpString(int binaryOp){
		if(binaryOp== JCTree.OR )	     return OR;
		else if(binaryOp==JCTree.AND)    return AND;
		else if(binaryOp==JCTree.BITOR)  return BITOR;
		else if(binaryOp==JCTree.BITXOR) return BITXOR;
		else if(binaryOp==JCTree.BITAND) return BITAND;
		else if(binaryOp==JCTree.EQ)     return EQ;
		else if(binaryOp==JCTree.NE)     return NE;
		else if(binaryOp==JCTree.LT)     return LT;
		else if(binaryOp==JCTree.GT)     return GT;
		else if(binaryOp==JCTree.LE)     return LE;
		else if(binaryOp==JCTree.GE)     return GE;
		else if(binaryOp==JCTree.SL)     return SL;
		else if(binaryOp==JCTree.SR)     return SR;
		else if(binaryOp==JCTree.USR)    return USR;
		else if(binaryOp==JCTree.PLUS)   return PLUS;
		else if(binaryOp==JCTree.MINUS)  return MINUS;
		else if(binaryOp==JCTree.MUL)    return MUL;
		else if(binaryOp==JCTree.DIV)    return DIV;
		else if(binaryOp==JCTree.MOD)    return MOD;
		else 						     return "error_BINARY_OP";
	}

	public void dump(PrintWriter out, int offset){

		String tmpOpString = opString;
		if(opString.compareTo("<")==0)
			tmpOpString = "LT";
		else if(opString.compareTo(">")==0)
			tmpOpString = "GT";
		else if(opString.compareTo("<=")==0)
			tmpOpString = "LE";
		else if(opString.compareTo(">=")==0)
			tmpOpString = "GE";
		else if(opString.compareTo("<<")==0)
			tmpOpString = "SL";
		else if(opString.compareTo(">>")==0)
			tmpOpString = "SR";
		else if(opString.compareTo(">>")==0)
			tmpOpString = "USR";
		else if(opString.compareTo("&")==0)
			tmpOpString = "BITAND";
		else if(opString.compareTo("&&")==0)
			tmpOpString = "AND";

		Dump.tprintln(out, offset, "<Binary>");
		Dump.tprintln(out, offset+1, "<binaryOp>	"+ "'"+tmpOpString+"'" +"	</binaryOp>");
		if(negativeLogic)	Dump.tprintln(out, offset+1, "<negativeLogic>	"+ negativeLogic +"	</negativeLogic>\n");
		Dump.tprintln(out, offset+1, "<leftExpr>");
		leftExpr.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</leftExpr>\n");
		Dump.tprintln(out, offset+1, "<rightExpr>");
		rightExpr.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</rightExpr>\n");
		Dump.tprintln(out, offset, "</Binary>\n");
	}

	@Override
	public boolean checkAssignKind(){

		boolean ret = false;
		ret |= isAssignKind(leftExpr);
		ret |= isAssignKind(rightExpr);
		ret |= rightExpr.checkAssignKind();
		ret |= leftExpr.checkAssignKind();
		return ret;
	}

	@Override
	public  ArrayList<VerilogVariableDecl>  registerUsedVariables(){
		 ArrayList<VerilogVariableDecl> retArray = new  ArrayList<VerilogVariableDecl>();
		retArray.addAll(leftExpr.registerUsedVariables());
		retArray.addAll(rightExpr.registerUsedVariables());
		return retArray;
	}

	@Override
	public DFGraphNode makeDFG(){

		DFGraphNode leftNode = leftExpr.makeDFG();
		DFGraphNode rightNode = rightExpr.makeDFG();
		DFGraphBinary binaryNode;
		// A>B -> (B<A),   A<=B -> !(B<A),   A>=B -> !(A<B)
		String tmpOpString = opString;
		if(opString.compareTo(GT)==0 || opString.compareTo(LE)==0 || opString.compareTo(GE)==0)
			tmpOpString = VerilogBinary.LT;

		if(opString.compareTo(GT)==0 || opString.compareTo(LE)==0){
			DFGraphNode tmp = leftNode;
			leftNode = rightNode;
			rightNode = tmp;
		}
		binaryNode = makeBinaryNode(leftNode, rightNode, tmpOpString, statParent.getPhaseParent().getParentClass().config, binary);
		if(opString.compareTo(GE)==0 || opString.compareTo(LE)==0){
			DFGraphUnary unaryNode = new DFGraphUnary(binaryNode, VerilogUnary.NOT, binaryNode.destType);
			return unaryNode;
		}
		return binaryNode;
	}

	public static DFGraphBinary makeBinaryNode(DFGraphNode leftNode, DFGraphNode rightNode, String opString, Config config, JCExpression expr){

		if(opString.compareTo(GT)==0 || opString.compareTo(GE)==0 || opString.compareTo(LE)==0)
			System.out.println("DEBUG:	VerilogBinary makeBinaryNode");

		DFGraphBinary binaryNode = null;
		String floatingType;

		if(config.floatingType == Config.singleType)
			floatingType = VerilogVariableDecl.floatType;
		else
			floatingType = VerilogVariableDecl.doubleType;

		if(leftNode.destType == rightNode.destType){ //(int, int), (long, long), (float, float), (boolean, boolean)
			binaryNode = new DFGraphBinary(leftNode, rightNode, opString, leftNode.destType);
			if(leftNode.destType==DFGraphNode.destTypeFloating && opString.compareTo(MOD)==0)	//浮動小数点演算の % を / に変更
				CompileMsgs.wdumpFloatingModulo(expr.toString());
		}
		else if(leftNode.destType < rightNode.destType){
			DFGraphTypeCast tcast=null;
			if(rightNode.destType == DFGraphNode.destTypeLong){//(int, long)
				tcast = new DFGraphTypeCast(leftNode, VerilogVariableDecl.longType);
			}
			else if(rightNode.destType == DFGraphNode.destTypeFloating){ //(int, float), (long, float)
				tcast = new DFGraphTypeCast(leftNode, floatingType);
			}
			binaryNode = new DFGraphBinary(tcast, rightNode, opString, rightNode.destType);
		}
		else if(leftNode.destType > rightNode.destType){
			DFGraphTypeCast tcast=null;
			if(leftNode.destType == DFGraphNode.destTypeLong){//(long, int)
				tcast = new DFGraphTypeCast(rightNode, VerilogVariableDecl.longType);
			}
			else if(leftNode.destType == DFGraphNode.destTypeFloating){ //(float, int), (float, long)
				tcast = new DFGraphTypeCast(rightNode, floatingType);
			}
			binaryNode = new DFGraphBinary(leftNode, tcast, opString, leftNode.destType);
		}
		return binaryNode;
	}
}
