package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.dfg.DFGraphNode;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import net.njlab.config.*;
import openjdk.com.sun.tools.javac.tree.JCTree;
import openjdk.com.sun.tools.javac.tree.JCTree.JCAssignOp;

/**
 *  @author Keisuke Koike
 */
public class VerilogAssignOp extends VerilogExpression{

    /*** Assignment operators, of type Assignop.
    public static final int BITOR_ASG = MOD + 1;             // |=
    public static final int BITXOR_ASG = BITOR_ASG + 1;      // ^=
    public static final int BITAND_ASG = BITXOR_ASG + 1;     // &=

    public static final int SL_ASG = SL + BITOR_ASG - BITOR; // <<=
    public static final int SR_ASG = SL_ASG + 1;             // >>=
    public static final int USR_ASG = SR_ASG + 1;            // >>>=
    public static final int PLUS_ASG = USR_ASG + 1;          // +=
    public static final int MINUS_ASG = PLUS_ASG + 1;        // -=
    public static final int MUL_ASG = MINUS_ASG + 1;         // *=
    public static final int DIV_ASG = MUL_ASG + 1;           // /=
    public static final int MOD_ASG = DIV_ASG + 1;           // %=
    */

	JCAssignOp assignOp;
	VerilogExpression rightExpr;
	VerilogExpression dest;
	int asgOp;
	String opString;

	public VerilogAssignOp(JCAssignOp assignOp, VerilogStatement statParent, VerilogExpression exprParent){
		this.assignOp = assignOp;
		this.statParent = statParent;
		this.exprParent = exprParent;
	}

	String getOpString(int binaryOp){
		if(binaryOp== JCTree.BITOR_ASG )	 return "|";
		else if(binaryOp==JCTree.BITXOR_ASG) return "^";
		else if(binaryOp==JCTree.BITAND_ASG) return "&";
		else if(binaryOp==JCTree.SL_ASG) 	 return "<<";
		else if(binaryOp==JCTree.SR_ASG) 	 return ">>";
		else if(binaryOp==JCTree.USR_ASG) 	 return ">>>";
		else if(binaryOp==JCTree.PLUS_ASG)   return "+";
		else if(binaryOp==JCTree.MINUS_ASG)  return "-";
		else if(binaryOp==JCTree.MUL_ASG)    return "*";
		else if(binaryOp==JCTree.DIV_ASG)    return "/";
		else if(binaryOp==JCTree.MOD_ASG)    return "%";
		else 						return "error_ASG";
	}

	@Override
	public void buildExpression(){
		asgOp = assignOp.getTag();
		opString = getOpString(asgOp);
		rightExpr = VerilogExpression.makeSubExpression(statParent, this, assignOp.getExpression());
		rightExpr.buildExpression();
		dest = VerilogExpression.makeSubExpression(statParent, this, assignOp.getVariable());
		dest.buildExpression();
		checkDest();
		checkReadOnly();
	}

	void checkDest(){	//代入先が 配列かフィールドかメソッド内の変数かをチェック
		if(!(dest instanceof VerilogIdent) &&
    	   !(dest instanceof VerilogArrayAccess) &&
    	   !(dest instanceof VerilogFieldAccess)){
			System.out.println("DEBUG:	error VerilogAssignOp checkDest");
			this.buildSucceed = false;
		}
	}

	private void checkReadOnly(){	//read only なのに書き込んでいないかチェック

		VerilogVariableDecl vdecl = null;
		if(dest instanceof VerilogFieldAccess){
			VerilogFieldAccess fieldAccess = (VerilogFieldAccess)dest;
			vdecl = fieldAccess.field;
		}
		else if(dest instanceof VerilogIdent){
			VerilogIdent ident = (VerilogIdent)dest;
			vdecl = ident.variable;
		}

		if(vdecl!=null){
			if(vdecl.isReadOnlyPort){
				CompileMsgs.edumpWriteReadOnlyPort(assignOp.toString());
				this.buildSucceed = false;
			}
		}
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		ret |= rightExpr.existERR();
		ret |= dest.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){

		String opString = this.opString;

		if(this.opString.compareTo("<<")==0)
			opString = "SL";
		else if(this.opString.compareTo(">>")==0)
			opString = "SR";
		else if(this.opString.compareTo(">>>")==0)
			opString = "USR";
		else if(opString.compareTo("&")==0)
			opString = "BITAND";
		else if(opString.compareTo("&&")==0)
			opString = "AND";

		Dump.tprintln(out, offset, "<AssignOp>");
		Dump.tprintln(out, offset, "<asgOP>	"+opString+" </asgOP>");
		Dump.tprintln(out, offset+1, "<rightExpr>");
		rightExpr.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</rightExpr>\n");
		Dump.tprintln(out, offset+1, "<dest>");
		dest.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</dest>\n");
		Dump.tprintln(out, offset, "</AssignOp>\n");
	}

	@Override
	public boolean checkAssignKind(){
		boolean ret = false;
		ret |= isAssignKind(rightExpr);
		ret |= isAssignKind(dest);
		ret |= rightExpr.checkAssignKind();
		ret |= dest.checkAssignKind();
		return ret;
	}

	@Override
	public ArrayList<VerilogVariableDecl> registerUsedVariables(){
		ArrayList<VerilogVariableDecl> retArray = new ArrayList<VerilogVariableDecl>();

		if(dest instanceof VerilogIdent){	//代入文の左辺がIdent
			statParent.usedWriteVariable = ((VerilogIdent)dest).variable;
			retArray.add(((VerilogIdent)dest).variable);
		}
		else if(dest instanceof VerilogArrayAccess){	//代入文の左辺が配列	array[num0][num1]... => array->書き込み変数      num0, num1->読み取り変数
			if(((VerilogArrayAccess)dest).arrayVal instanceof VerilogIdent){

				VerilogIdent ident = (VerilogIdent)((VerilogArrayAccess)dest).arrayVal;
				statParent.usedWriteVariable = ident.variable;
				retArray.add(ident.variable);
			}
			else if(((VerilogArrayAccess)dest).arrayVal instanceof VerilogFieldAccess){

				VerilogFieldAccess fieldAccess = (VerilogFieldAccess)((VerilogArrayAccess)dest).arrayVal;
				statParent.usedWriteVariable = fieldAccess.field;
				retArray.add(fieldAccess.field);
			}
			else{
				System.out.println("DEBUG:	verilogAssign.registerUsedVariables..");
			}
			for(int i=0; i<((VerilogArrayAccess) dest).indices.size(); i++){	//インデックス部に出てくる変数を読み取り変数に追加
				retArray.addAll(((VerilogArrayAccess) dest).indices.get(i).registerUsedVariables());
			}
		}
		else if(dest instanceof VerilogFieldAccess){	//代入文の左辺がフィールド
			statParent.usedWriteVariable = ((VerilogFieldAccess)dest).field;
		}
		else{
			System.out.println("DEBUG:	verilogAssign.registerUsedVariables");
		}
		retArray.addAll(rightExpr.registerUsedVariables());
		return retArray;
	}

	@Override
	public DFGraphNode makeDFG(){

		Config config = statParent.getPhaseParent().getParentClass().config;
		DFGraphNode rightNode = rightExpr.makeDFG();
		DFGraphNode leftNode = dest.makeDFG();
		DFGraphNode destNode = dest.makeDFG();
		DFGraphNode tmp = VerilogBinary.makeBinaryNode(leftNode, rightNode, opString, config, assignOp);
		return VerilogAssign.makeAssignNode(destNode, tmp, config);
	}
}
