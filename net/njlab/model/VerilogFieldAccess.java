package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.dfg.DFGraphNode;
import net.njlab.dfg.DFGraphVariableAccess;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.JCFieldAccess;

/**
 *  @author Keisuke Koike
 */
public class VerilogFieldAccess extends VerilogExpression{

	JCFieldAccess fieldAccess;
	VerilogVariableDecl field; //フィールド変数

	String objName;
	String arrayName;

	public VerilogFieldAccess(JCFieldAccess fieldAccess, VerilogStatement statParent, VerilogExpression exprParent){
		this.fieldAccess = fieldAccess;
		this.statParent = statParent;
		this.exprParent = exprParent;
	}

	public void buildExpression(){
		String fieldName[] = fieldAccess.toString().split("\\.");

		//fieldName だけの記述は, Ident扱い
		if(fieldName.length==2){
			if(fieldName[0].compareTo("this")==0){	//this.fieldName
				if(searchFieldVariable(fieldName))
					return;
			}
			else{	//fieldName.ArrayName
				objName = fieldName[0];
				arrayName = fieldName[1];
				return;
			}
		}
		else if(fieldName.length==3){	//this.fieldName.ArrayName
			if(fieldName[0].compareTo("this")==0){
				objName = fieldName[1];
				arrayName = fieldName[2];
				return;
			}
		}

		CompileMsgs.edumpAccessibleField(fieldAccess.toString());
		buildSucceed = false;

	}

	private boolean searchFieldVariable(String[] fieldName){

		for(int i=statParent.getPhaseParent().variableStack.size()-1; i>=0; i--){
			if(statParent.getPhaseParent().variableStack.get(i).name.compareTo(fieldName[1])==0 && //fieldName[1] は フィールド名. フィールド名が一致してかつフィールド上に宣言されている
			   statParent.getPhaseParent().variableStack.get(i).defType==VerilogVariableDecl.defTypeField){
				field = statParent.getPhaseParent().variableStack.get(i);
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<FieldAccess>");
		Dump.tprintln(out, offset+1, "<variableID>	"+ field.variableID +"	</variableID>\n");
		Dump.tprintln(out, offset+1, "<fieldName>	"+ field.name +"	</fieldName>\n");
		Dump.tprintln(out, offset, "</FieldAccess>\n");
	}

	@Override
	public boolean checkAssignKind(){
		return false;
	}

	@Override
	public ArrayList<VerilogVariableDecl> registerUsedVariables(){
		ArrayList<VerilogVariableDecl> retArray = new ArrayList<VerilogVariableDecl>();
		retArray.add(field);
		return retArray;
	}

	@Override
	public DFGraphNode makeDFG(){

		if(objName!=null){

			field = statParent.getPhaseParent().getParentClass().searchFieldInObject(objName, arrayName);
			if(field==null){
				CompileMsgs.edumpObjNotFound(fieldAccess.toString());
				buildSucceed = false;
			}
			else if(!field.isArray){
				CompileMsgs.edumpAccessOnlyObjArray(fieldAccess.toString());
				buildSucceed = false;
			}
		}
		DFGraphVariableAccess fieldNode = new DFGraphVariableAccess(field, objName);
		return fieldNode;
	}
}














