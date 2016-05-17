package net.njlab.model;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Stack;

import net.njlab.circuit.KeyWord;
import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogCondExpression;
import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.JCCase;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpressionStatement;
import openjdk.com.sun.tools.javac.tree.JCTree.JCLiteral;
import openjdk.com.sun.tools.javac.tree.JCTree.JCStatement;
import openjdk.com.sun.tools.javac.tree.JCTree.JCVariableDecl;

/**
 *  @author Keisuke Koike
 */
public class VerilogCase  extends VerilogStatementsPhase{

	JCCase caseStat;
	ArrayList<VerilogStatementsPhase> subBlock = new ArrayList<VerilogStatementsPhase>();
	int cond;
	boolean isDefault = false;
	VerilogReg branch; //case への分岐フラグレジスタ
	private VerilogSignalString condSignal;
	StateTransGraphNode stgNode;

	VerilogCase(JCCase caseStat, VerilogStatementsPhase parent){
		this.caseStat = caseStat;
		this.parent = parent;
		makeVariableStack();
		makeCond();
		makeSignal();
		assembleSubBlock();
	}

	void makeCond(){

		if(caseStat.getExpression()==null){//default の場合
			isDefault = true;
		}
		else if(!(caseStat.getExpression() instanceof JCLiteral)){
			CompileMsgs.edumpCaseCondLiteral(caseStat.getExpression().toString());
			buildSucceed = false;
		}
		else{
			try{
				cond = Integer.parseInt(caseStat.getExpression().toString());
			}
			catch(NumberFormatException e){
				CompileMsgs.edumpCaseCondLiteral(caseStat.getExpression().toString());
				buildSucceed = false;
			}
		}
	}

	void makeSignal(){
		branch = new VerilogReg(KeyWord.K_sys_+getParentMethod().methodName+KeyWord.K_caseBranch+stateID, 1, VerilogSignal.unsigned);
		//getParentClass().getModule().addRegister(branch);	//状態遷移最適化に伴う変更
	}

	VerilogSignalString getSignalString(int bitWidth){

		if(condSignal==null){
			condSignal = new VerilogSignalString(bitWidth+VerilogLiteralNumber.typeSignedHexadecimal+Integer.toHexString(cond), bitWidth, VerilogSignal.unsigned);
		}
			return condSignal;
	}

	/*VerilogBlock のものと同じ*/
	void assembleSubBlock(){	//if や for, switch 等の前後で連続する ExpressionStatement, VariableDecl を VerilogStatementAssemblage に格納数する
								//VerilogStatementAssemblage は VerilogIf や VerilogForLoop 等と同様にサブブロックとして扱う
		ArrayList<VerilogStatement> statements = new ArrayList<VerilogStatement>();

		for(JCStatement statement : caseStat.getStatements()){

			if(statement instanceof JCExpressionStatement){
				statements.add(new VerilogExprStatement( ((JCExpressionStatement)statement).getExpression()));
			}
			else if(statement instanceof JCVariableDecl){
				VerilogVariableDecl tmp = new VerilogVariableDecl((JCVariableDecl)statement, getParentMethod().methodName, VerilogVariableDecl.defTypeMethod);
				vdecls.add(tmp);
				statements.add(tmp);
			}
			else{// statement が if や for, switch, return 等だった
				if(statements.size()!=0){
					VerilogStatAssemblage tmp = new VerilogStatAssemblage(statements, this);
					subBlock.add(tmp);
					statements.clear();
				}
				VerilogStatementsPhase subPhase = VerilogStatementsPhase.makeSubBlock(statement, this);
				if(subPhase!=null)
					subBlock.add(subPhase);
			}
		}

		if(statements.size()!=0){
			VerilogStatAssemblage tmp = new VerilogStatAssemblage(statements, this);
			subBlock.add(tmp);
			statements.clear();
		}
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		for(int i=0; i<subBlock.size(); i++){
			ret |= subBlock.get(i).existERR();
		}
		return ret;
	}

	public void dump(PrintWriter out, int offset){

		Dump.tprintln(out, offset, "<Case>	<Phase>  "+ this.stateID +"  </Phase>");
		if(isDefault) Dump.tprintln(out, offset+1, "<isDefault>	"+isDefault+"	</isDefault>");
		else          Dump.tprintln(out, offset+1, "<caseCond>	"+cond+"	</caseCond>\n");
		for(int i=0; i<subBlock.size(); i++)
			subBlock.get(i).dump(out, offset+1);
		Dump.tprintln(out, offset, "</Case>\n");
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){

		//親ノードに別の case ステートのノードがある可能性
		stgNode = new StateTransGraphNode(this, phaseSignal, phaseLiteral);

		if(subBlock.size()==0){	//空case の場合，source の状態遷移先が無いので， source が迷子ノードになる.  case 0: 空
			moveStack(strayChild, source);
			moveStack(strayElseChild, elseSource);
		}

		for(int i=0; i<subBlock.size(); i++){

			subBlock.get(i).makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
			dumpStgDebug(source, elseSource, "VerilogCase");

			if(i!=subBlock.size()-1){
				moveStack(source, strayChild);	//迷子ノードは遷移元ノードとなる
				moveStack(elseSource, strayElseChild);
			}
		}

		for(int i=0; i<subBlock.size(); i++){
			StateTransGraphNode firstStep = subBlock.get(i).getFirstPhase();//サブブロックの中で，最初に遷移可能なフェイズ
			if(firstStep!=null){
				stgNode.setNextPhase(firstStep);
				return;
			}
		}

		//case 0:{ 空 }の場合
		strayChild.add(stgNode);	//遷移先が subBlock にないので，迷子になる
	}

	@Override
	protected StateTransGraphNode getFirstPhase(){
		return this.stgNode;
	}

	protected void generateVerilogCode(VerilogReg regPhase, VerilogCaseStatement phaseControl){

		 if(isDefault){
			 StateTransGraphNode.addGoToNextBlockAssign(regPhase, stgNode);
			 phaseControl.addChildStat(stgNode.currentPhaseCaseChild);
		 }
		 else{
			 StateIdentifier assignState = new StateIdentifier(getParentMethod().methodID, stateID, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, false);
			 VerilogReg prsvCondReg = ((VerilogSwitch)parent).preserveCond;
			 String leftSignal = prsvCondReg.getExprString(prsvCondReg.bitWidth, prsvCondReg.isSigned);
			 String rightSignal = getSignalString(prsvCondReg.bitWidth).getExprString(prsvCondReg.bitWidth, prsvCondReg.isSigned);
			 VerilogSignalString condExpr = new VerilogSignalString(leftSignal+KeyWord.K_compareEQ+rightSignal, regPhase.bitWidth, regPhase.isSigned);

			 VerilogCondExpression caseBranchExpr = new VerilogCondExpression(condExpr, stgNode.getNextPhase().getCurrentPhaseSignal(), stgNode.getElsePhase().getCurrentPhaseSignal());
			 VerilogSignalString caseBranchExprSignal = new VerilogSignalString(caseBranchExpr.getExprString(regPhase.bitWidth, regPhase.isSigned), regPhase.bitWidth, regPhase.isSigned);
			 VerilogNoneBlockAssign caseBranchAssign = new VerilogNoneBlockAssign(regPhase, caseBranchExprSignal, assignState);
			 stgNode.currentPhaseCaseChild.addNoneBlockStat(caseBranchAssign);
			 phaseControl.addChildStat(stgNode.currentPhaseCaseChild);
		 }
	}
}






