package net.njlab.model;
import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.dfg.DFGraphNode;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpression;
import openjdk.com.sun.tools.javac.tree.JCTree.JCNewArray;

/**
 *  @author Keisuke Koike
 */
public class VerilogNewArray  extends VerilogExpression{

	private JCNewArray newArray;
	private String type;
	private ArrayList<Integer> elements = new ArrayList<Integer>();

	VerilogNewArray( JCNewArray newArray, VerilogStatement parent){
		statParent = parent;
		this.newArray = newArray;
	}

	public ArrayList<Integer> getElements(){
		return elements;
	}

	@Override
	public void buildExpression(){

		if(newArray.getDimensions().length()<=0){	//{1,2,3,...} と書くタイプの初期化
			this.buildSucceed = false;
			CompileMsgs.edumpInitArray(newArray.toString());
			return;
		}
		else{
			type = ((VerilogVariableDecl)statParent).type;
			for(JCExpression expr : newArray.getDimensions()){	//次元
				try{
					elements.add(Integer.decode(expr.toString()));
				}
				catch(NumberFormatException e){
					CompileMsgs.edumpInitArrayWithInt(newArray.toString());
					this.buildSucceed = false;
				}
			}
		}

	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<NewArray>");
		Dump.tprintln(out, offset+1, "<type>	"+type+"	</type>");
		Dump.tprint(out, offset+1, "<elements>");
		for(int i=0; i<elements.size(); i++)
			Dump.tprint(out, 0, "	"+elements.get(i)+"	");
		Dump.tprint(out, 0, "</elements>");
		Dump.tprintln(out, offset, "");
		Dump.tprintln(out, offset, "</NewArray>");
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
