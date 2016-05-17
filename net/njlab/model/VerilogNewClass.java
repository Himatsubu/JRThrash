package net.njlab.model;
import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.dfg.DFGraphNode;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.JCNewClass;

/**
 *  @author Keisuke Koike
 */
public class VerilogNewClass  extends VerilogExpression{

	JCNewClass newClass;
	private String className;

	//VerilogNewClass(JCNewClass newClass, VerilogExpression parent){ //NewClass はフィールドの初期化でのみ使用可能なので呼ばれない
	//	exprParent = parent;
	//	makeNewClass(newClass);
	//}

	VerilogNewClass(JCNewClass newClass, VerilogStatement parent){
		statParent = parent;
		this.newClass = newClass;
	}

	@Override
	public void buildExpression(){
		className = newClass.getIdentifier().toString();
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<NewClass>");
		Dump.tprintln(out, offset+1, "<className>	"+className+"	</className>");
		Dump.tprintln(out, offset, "</NewClass>");
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

	@Override
	public DFGraphNode makeDFG(){//呼ばれない
		return null;
	}
}
