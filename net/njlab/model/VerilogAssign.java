package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.config.Config;
import net.njlab.dfg.DFGraphArrayAccess;
import net.njlab.dfg.DFGraphNode;
import net.njlab.dfg.DFGraphTypeCast;
import net.njlab.dfg.DFGraphVariableAccess;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.JCAssign;

/**
 *  @author Keisuke Koike
 */
public class VerilogAssign extends VerilogExpression{

	JCAssign assign;
	VerilogExpression rightExpr;
	VerilogExpression dest;

	//右辺がメソッド呼び出しで左辺が配列アクセスの場合は，右辺→左辺と実行する

	public VerilogAssign(JCAssign assign, VerilogStatement statParent, VerilogExpression exprParent){
		this.assign = assign;
		this.statParent = statParent;
		this.exprParent = exprParent;
	}

	@Override
	public void buildExpression(){
		rightExpr = VerilogExpression.makeSubExpression(statParent, this, assign.getExpression());
		if(rightExpr!=null) rightExpr.buildExpression();
		dest = VerilogExpression.makeSubExpression(statParent, this, assign.getVariable());
		dest.buildExpression();
		checkDest();
		checkReadOnly();
	}

	void checkDest(){	//代入先が 配列かフィールドかメソッド内の変数かをチェック
		if(!(dest instanceof VerilogIdent) &&
    	   !(dest instanceof VerilogArrayAccess) &&
    	   !(dest instanceof VerilogFieldAccess)){
			System.out.println("DEBUG:	error VerilogAssign checkDest");
			this.buildSucceed = false;
		}
	}

	/**
	 * read only なのに書き込んでいないかチェック
	 * */
	private void checkReadOnly(){

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
				CompileMsgs.edumpWriteReadOnlyPort(assign.toString());
				this.buildSucceed = false;
			}
		}
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		if(rightExpr!=null)
			ret |= rightExpr.existERR();
		ret |= dest.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Assign>");
		Dump.tprintln(out, offset+1, "<rightExpr>");
		rightExpr.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</rightExpr>\n");
		Dump.tprintln(out, offset+1, "<dest>");
		dest.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</dest>\n");
		Dump.tprintln(out, offset, "</Assign>\n");
	}

	@Override
	public boolean checkAssignKind(){

		boolean ret = false;

		//代入式の右辺がMethod呼び出しなのはOK
		ret |= isIncDecAssign(rightExpr);
		ret |= isAssignKind(dest);
		if(rightExpr!=null)
			ret |= rightExpr.checkAssignKind();
		ret |= dest.checkAssignKind();
		return ret;
	}

	@Override
	public ArrayList<VerilogVariableDecl> registerUsedVariables(){

		ArrayList<VerilogVariableDecl> retArray = new ArrayList<VerilogVariableDecl>();

		if(dest instanceof VerilogIdent){	//代入分の左辺がIdent
			statParent.usedWriteVariable = ((VerilogIdent)dest).variable;
		}
		else if(dest instanceof VerilogArrayAccess){	//代入分の左辺が配列	array[num0][num1]... => array->書き込み変数      num0, num1->読み取り変数
			if(((VerilogArrayAccess)dest).arrayVal instanceof VerilogIdent)
				statParent.usedWriteVariable = ((VerilogIdent)(((VerilogArrayAccess)dest).arrayVal)).variable;
			else if(((VerilogArrayAccess)dest).arrayVal instanceof VerilogFieldAccess)
				statParent.usedWriteVariable = ((VerilogFieldAccess)(((VerilogArrayAccess)dest).arrayVal)).field;
			else{
				System.out.println("DEBUG:	verilogAssign.registerUsedVariables..");
			}
			for(int i=0; i<((VerilogArrayAccess) dest).indices.size(); i++){	//インデックス部に出てくる変数を読み取り変数に追加
				retArray.addAll(((VerilogArrayAccess) dest).indices.get(i).registerUsedVariables());
			}
		}
		else if(dest instanceof VerilogFieldAccess){	//代入分の左辺がフィールド
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

		DFGraphNode rightNode = rightExpr.makeDFG();
		DFGraphNode destNode = dest.makeDFG();

		if(rightNode!=null && destNode!=null){
			return makeAssignNode(destNode, rightNode, statParent.getPhaseParent().getParentClass().config);
		}
		else{
			buildSucceed = false;
			return null;
		}
	}

	public static DFGraphNode makeAssignNode(DFGraphNode destNode, DFGraphNode srcNode, Config config){

		String floatingType;
		if(config.floatingType == Config.singleType)
			floatingType = VerilogVariableDecl.floatType;
		else
			floatingType = VerilogVariableDecl.doubleType;

		if(destNode.destType == srcNode.destType){ //(int, int), (long, long), (float, float), (boolean, boolean)
			setSrcNode(destNode, srcNode);
		}
		else if(destNode.destType > srcNode.destType){	//代入元が小さい場合は，明示的キャストが不要 -> キャストが必要か調べる
			DFGraphTypeCast tcast=null;
			if(destNode.destType == DFGraphNode.destTypeLong){ //(long, int)
				tcast = new DFGraphTypeCast(srcNode, VerilogVariableDecl.longType);
			}
			else if(destNode.destType == DFGraphNode.destTypeFloating){ //(float, int), (float, long)
				tcast = new DFGraphTypeCast(srcNode, floatingType);
			}
			setSrcNode(destNode, tcast);
		}
		else if(destNode.destType < srcNode.destType){	//intType += floatType と書くとキャストがいらない

			DFGraphTypeCast tcast=null;
			if(srcNode.destType == DFGraphNode.destTypeLong){ //(int, long)
				tcast = new DFGraphTypeCast(srcNode, VerilogVariableDecl.intType);
			}
			else if(srcNode.destType == DFGraphNode.destTypeFloating){ //(int, float), (long, float)
				if(destNode.destType == DFGraphNode.destTypeInt){
					tcast = new DFGraphTypeCast(srcNode, VerilogVariableDecl.intType);
				}
				else if(destNode.destType == DFGraphNode.destTypeLong){
					tcast = new DFGraphTypeCast(srcNode, VerilogVariableDecl.longType);
				}
				else
					System.out.println("DEBUG:	verilogAssign makeDFG error");
			}
			setSrcNode(destNode, tcast);
		}
		setWritable(destNode);	//代入先ノードを writable に変更

		return destNode;
	}

	private static void setSrcNode(DFGraphNode destNode, DFGraphNode rightNode){

		if(destNode instanceof DFGraphVariableAccess)
			((DFGraphVariableAccess)destNode).setSrcNode(rightNode);
		else if(destNode instanceof DFGraphArrayAccess){
			((DFGraphArrayAccess)destNode).setSrcNode(rightNode);
		}
		else{
			System.out.println("DEBUG:	makeAssignNode error");
		}
	}

	static private void setWritable(DFGraphNode destNode){

		if(destNode instanceof DFGraphVariableAccess){
			((DFGraphVariableAccess)destNode).changeToWritableNode();
		}
		else{
			((DFGraphArrayAccess)destNode).srcVariable.changeToWritableNode();
		}
	}
}
