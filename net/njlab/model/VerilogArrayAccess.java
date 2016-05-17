package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.dfg.DFGraphArrayAccess;
import net.njlab.dfg.DFGraphBinary;
import net.njlab.dfg.DFGraphLiteral;
import net.njlab.dfg.DFGraphNode;
import net.njlab.dfg.DFGraphVariableAccess;
import net.njlab.dump.Dump;
import net.njlab.dump.CompileMsgs;
import openjdk.com.sun.tools.javac.tree.JCTree.JCArrayAccess;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpression;
import openjdk.com.sun.tools.javac.tree.JCTree.JCFieldAccess;
import openjdk.com.sun.tools.javac.tree.JCTree.JCIdent;
import openjdk.com.sun.tools.javac.tree.JCTree.JCParens;

/**
 *  @author Keisuke Koike
 */
public class VerilogArrayAccess extends VerilogExpression {

	JCArrayAccess arrayAccess;
	ArrayList<VerilogExpression> indices = new ArrayList<VerilogExpression>();
	VerilogExpression arrayVal;	//VerilogIdent か VerilogField のはず

	public VerilogArrayAccess(JCArrayAccess arrayAccess, VerilogStatement statParent, VerilogExpression exprParent){
		this.arrayAccess = arrayAccess;
		this.statParent = statParent;
		this.exprParent = exprParent;
	}

	public void buildExpression(){

		int times=0;	//デバッグ用
		JCExpression tmpArrayAccess = arrayAccess;
		while(true){

			if(tmpArrayAccess instanceof JCArrayAccess){
				VerilogExpression tmp = VerilogExpression.makeSubExpression(statParent, this, ((JCArrayAccess)tmpArrayAccess).getIndex());
				tmp.buildExpression();
				indices.add(0, tmp);
				//System.out.println("arrayAccess:	"+tmpArrayAccess+"  "+((JCArrayAccess)tmpArrayAccess).getExpression());
				tmpArrayAccess = ((JCArrayAccess)tmpArrayAccess).getExpression();

			}
			else if(tmpArrayAccess instanceof JCParens){
				tmpArrayAccess = ((JCParens)tmpArrayAccess).getExpression();
			}
			else if(tmpArrayAccess instanceof JCIdent || tmpArrayAccess instanceof JCFieldAccess){

				//if(tmpArrayAccess instanceof JCFieldAccess)
				//	System.out.println("arrayAccess:	"+tmpArrayAccess+"  "+((JCFieldAccess)tmpArrayAccess).getExpression());
				arrayVal = VerilogExpression.makeSubExpression(statParent, this, tmpArrayAccess);
				arrayVal.buildExpression();
				break;
			}
			else{
				System.out.println("DEBUG:	error array access"+arrayAccess);
				times++;
				if(times > 100) break;
			}
		}
		checkError();
	}

	void checkError(){

		if(arrayVal instanceof VerilogIdent){
			if(((VerilogIdent)arrayVal).variable==null)
				buildSucceed = false;

			else if(((VerilogIdent)arrayVal).variable.init == null &&
				((VerilogIdent)arrayVal).variable.defType != VerilogVariableDecl.defTypeParamList){

				CompileMsgs.edumpArrayDeclare(arrayAccess.toString());
				buildSucceed = false;
			}
		}
		else if(arrayVal instanceof VerilogFieldAccess){
			if(((VerilogFieldAccess)arrayVal).field==null){// フィールドアクセスの形式がおかしい
				if(((VerilogFieldAccess)arrayVal).objName==null)
					buildSucceed = false;
			}
			else if(((VerilogFieldAccess)arrayVal).field.init == null &&
					((VerilogFieldAccess)arrayVal).field.defType != VerilogVariableDecl.defTypeParamList){

					CompileMsgs.edumpArrayDeclare(arrayAccess.toString());
					buildSucceed = false;
			}
		}
		else{
			System.out.println("DEBUG:	error array access	"+arrayAccess);
			buildSucceed = false;
		}
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		for(int i=0; i<indices.size(); i++){
			ret |= indices.get(i).existERR();
		}
		if(arrayVal==null)
			ret |= true;
		else
			ret |= arrayVal.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<ArrayAccess>");
		if(arrayVal instanceof VerilogIdent){
			Dump.tprintln(out, offset+1, "<variableID>	"+ ((VerilogIdent)arrayVal).variable.variableID +"	</variableID>");
			Dump.tprintln(out, offset+1, "<idName>"+ ((VerilogIdent)arrayVal).variable.name +"</idName>\n");
		}
		else{
			Dump.tprintln(out, offset+1, "<variableID>	"+ ((VerilogFieldAccess)arrayVal).field.variableID +"	</variableID>");
			Dump.tprintln(out, offset+1, "<fieldName>"+ ((VerilogFieldAccess)arrayVal).field.name +"</fieldName>\n");
		}
		for(int i=0; i<indices.size(); i++){
			Dump.tprintln(out, offset+1, "<index"+i+">");
			indices.get(i).dump(out, offset+2);
			Dump.tprintln(out, offset+1, "</index"+i+">\n");
		}
		Dump.tprintln(out, offset, "</ArrayAccess>\n");
	}

	@Override
	public boolean checkAssignKind(){
		boolean ret = false;
		for(int i=0; i<indices.size(); i++){
			ret |= isAssignKind(indices.get(i));
		}
		ret |= isAssignKind(arrayVal);
		for(int i=0; i<indices.size(); i++){
			ret |= indices.get(i).checkAssignKind();
		}
		if(arrayVal!=null)
			ret |= arrayVal.checkAssignKind();
		return ret;
	}

	@Override
	public ArrayList<VerilogVariableDecl> registerUsedVariables(){
		int i;
		ArrayList<VerilogVariableDecl> retArray = new ArrayList<VerilogVariableDecl>();
		for(i=0; i<indices.size(); i++){
			retArray.addAll(indices.get(i).registerUsedVariables());
		}
		retArray.addAll(arrayVal.registerUsedVariables());
		return retArray;
	}

	@Override
	public DFGraphNode makeDFG(){

		int arrayDim = indices.size();
		int[] convolutionEleNum = new int[arrayDim];
		DFGraphBinary[] multBinaryNode = new DFGraphBinary[arrayDim];
		DFGraphVariableAccess vAccessNode = (DFGraphVariableAccess)arrayVal.makeDFG();

		for(int i=0; i<arrayDim; i++)
			convolutionEleNum[i] = 1;

		for(int i=0; i<arrayDim; i++){
			for(int j=i+1; j<arrayDim; j++){
				convolutionEleNum[i] *= ((VerilogNewArray)vAccessNode.getVariableDecl().init).getElements().get(j);
			}
			DFGraphLiteral tmp = new DFGraphLiteral(VerilogVariableDecl.intType, convolutionEleNum[i], 0, 0, 0, true);
			multBinaryNode[i] = VerilogBinary.makeBinaryNode(tmp, indices.get(i).makeDFG(), VerilogBinary.MUL, statParent.getPhaseParent().getParentClass().config, arrayAccess);
		}

		DFGraphBinary addNode = multBinaryNode[0];
		for(int i=1; i<multBinaryNode.length; i++){
			addNode = VerilogBinary.makeBinaryNode(addNode, multBinaryNode[i], VerilogBinary.PLUS, statParent.getPhaseParent().getParentClass().config, arrayAccess);
		}

		DFGraphArrayAccess arrayAccessNode = new DFGraphArrayAccess(vAccessNode, addNode);
		return  arrayAccessNode;
	}
}
