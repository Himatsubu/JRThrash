package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import net.njlab.dfg.*;
import net.njlab.config.*;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.*;

/**
 *  @author Keisuke Koike
 */
public class VerilogLiteral  extends VerilogExpression{

	JCLiteral literal;
	String type;
	int inum;
	long lnum;
	float fnum;
	double dnum;
	boolean bool;

	VerilogLiteral( JCLiteral literal,  VerilogStatement statParent, VerilogExpression exprParent){
		this.exprParent = exprParent;
		this.statParent = statParent;
		this.literal = literal;
	}

	@Override
	public void buildExpression(){
		type = literal.type.toString();

		if(type.compareTo(VerilogVariableDecl.doubleType)==0 || type.compareTo(VerilogVariableDecl.floatType)==0){
			//float か double のどちらかに統一する
			if(statParent.getPhaseParent().getParentClass().config.floatingType==Config.doubleType){
				dnum = Double.valueOf(literal.value.toString());
				type = VerilogVariableDecl.doubleType;
			}
			else if(statParent.getPhaseParent().getParentClass().config.floatingType==Config.singleType){
				fnum = Float.valueOf(literal.value.toString());
				type = VerilogVariableDecl.floatType;
			}
		}
		else if(type.compareTo(VerilogVariableDecl.booleanType)==0){
			type = VerilogVariableDecl.booleanType;
			if(literal.value.toString()=="true")	bool = true;
			else 									bool = false;
		}
		else if(type.compareTo(VerilogVariableDecl.longType)==0){
			type = VerilogVariableDecl.longType;
			lnum = Long.valueOf(literal.value.toString());
		}
		else{
			try{
				inum = Integer.valueOf(literal.value.toString());
				type = VerilogVariableDecl.intType;
			}
			catch(Exception e){
				CompileMsgs.edumpNotSupportedLiteral(literal.toString());
				buildSucceed = false;
			}
		}
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Literal>");
		Dump.tprintln(out, offset+1, "<type>	"+type+"	</type>");
		if(type.compareTo(VerilogVariableDecl.doubleType)==0){
			Dump.tprintln(out, offset+1, "<value>	"+dnum+"	</value>");
		}
		else if(type.compareTo(VerilogVariableDecl.floatType)==0){
			Dump.tprintln(out, offset+1, "<value>	"+fnum+"	</value>");
		}
		else if(type.compareTo(VerilogVariableDecl.booleanType)==0){
			Dump.tprintln(out, offset+1, "<value>	"+bool+"	</value>");
		}
		else if(type.compareTo(VerilogVariableDecl.longType)==0){
			Dump.tprintln(out, offset+1, "<value>	"+lnum+"	</value>");
		}
		else{
			Dump.tprintln(out, offset+1, "<value>	"+inum+"	</value>");
		}
		Dump.tprintln(out, offset, "</Literal>");
	}

	@Override
	public boolean checkAssignKind(){
		return false;
	}

	@Override
	public ArrayList<VerilogVariableDecl> registerUsedVariables(){
		ArrayList<VerilogVariableDecl> retArray = new ArrayList<VerilogVariableDecl>();
		return retArray;
	}

	public DFGraphNode makeDFG(){

		DFGraphLiteral literalNode = new DFGraphLiteral(type, inum, lnum, fnum, dnum, bool);
		return literalNode;
	}
}
