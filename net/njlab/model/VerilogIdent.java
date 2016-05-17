package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import net.njlab.dfg.*;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.*;

/**
 *  @author Keisuke Koike
 */
public class VerilogIdent extends VerilogExpression{

	JCIdent ident;
	VerilogVariableDecl variable = null;

	public VerilogIdent(JCIdent ident, VerilogStatement statParent, VerilogExpression exprParent){
		this.ident = ident;
		this.statParent = statParent;
		this.exprParent = exprParent;
	}

	@Override
	public void buildExpression(){
		for(int i=statParent.getPhaseParent().variableStack.size()-1; i>=0; i--){
			if(statParent.getPhaseParent().variableStack.get(i).name.compareTo(ident.getName().toString())==0){
				variable = statParent.getPhaseParent().variableStack.get(i);
				break;
			}
		}
		if(variable==null){
			CompileMsgs.edumpIdentNotFound(ident.getName().toString(), statParent.getPhaseParent().getParentClass().className);
			buildSucceed = false;
		}
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Ident>");
		Dump.tprintln(out, offset+1, "<variableID>	"+ variable.variableID +"	</variableID>");
		Dump.tprintln(out, offset+1, "<idName>	"+ variable.name +"	</idName>");
		Dump.tprintln(out, offset, "</Ident>");
	}

	@Override
	public boolean checkAssignKind(){
		return false;
	}

	@Override
	public ArrayList<VerilogVariableDecl> registerUsedVariables(){
		ArrayList<VerilogVariableDecl> retArray = new ArrayList<VerilogVariableDecl>();
		retArray.add(variable);
		return retArray;
	}

	@Override
	public DFGraphNode makeDFG(){

		DFGraphVariableAccess identNode = new DFGraphVariableAccess(variable, null);
		return identNode;
	}
}
