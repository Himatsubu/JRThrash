package net.njlab.model;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Stack;

import net.njlab.circuit.KeyWord;
import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.JCCase;
import openjdk.com.sun.tools.javac.tree.JCTree.JCSwitch;
/**
 *  @author Keisuke Koike
 */
public class VerilogSwitch  extends VerilogStatementsPhase {
	JCSwitch switchStat;
	VerilogStatAssemblage cond;
	ArrayList<VerilogCase> cases = new ArrayList<VerilogCase>();
	VerilogReg branchRest;	//一度でも case に該当すれば，high になるレジスタ -> 落ちぬけ処理に使用
	ArrayList<VerilogBreak> breakPhase = new ArrayList<VerilogBreak>();
	StateTransGraphNode stgNode;
	VerilogReg preserveCond;	//cond の結果値を保存するレジスタ

	VerilogSwitch(JCSwitch switchStat, VerilogStatementsPhase parent){
		this.switchStat = switchStat;
		this.parent = parent;
		makeVariableStack();
		makeCond();
		makeCase();
		makeSignal();
		int aa=0;
	}

	void makeCond(){
			VerilogExprStatement tmp = new VerilogExprStatement(switchStat.getExpression());
			cond = new VerilogStatAssemblage(tmp, this);
	}

	void makeCase(){
		for(JCCase caseStat: switchStat.getCases())
			cases.add((VerilogCase)VerilogStatementsPhase.makeSubBlock(caseStat, this));
	}

	void makeSignal(){
		preserveCond = new VerilogReg(KeyWord.K_sys_+getParentMethod().methodName+KeyWord.K_switchCond+stateID,
									  VerilogVariableDecl.getBitWidth(getParentClass().getModule(), VerilogVariableDecl.intType), VerilogSignal.signed);
		getParentClass().getModule().addRegister(preserveCond);
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		ret |= cond.existERR();
		for(int i=0; i<cases.size(); i++){
			ret |= cases.get(i).existERR();
		}
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Switch>	<Phase>  "+ this.stateID +"  </Phase>");
		if(breakPhase.size()!=0){
			Dump.tprint(out, offset+1, "<BreakPhase>");
			for(int i=0; i<breakPhase.size(); i++)
				if(i!=0)
					Dump.tprint(out, 0, "_"+breakPhase.get(i));
				else
					Dump.tprint(out, 0,"	"+breakPhase.get(i));
			Dump.tprint(out, 0, "	</BreakPhase>");
			Dump.tprintln(out, offset+1, "\n");
		}
		Dump.tprintln(out, offset+1, "<switchCond>");
		cond.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</switchCond>\n");
		for(int i=0; i<cases.size(); i++)
			cases.get(i).dump(out, offset+1);
		Dump.tprintln(out, offset, "</Switch>\n");
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){

		cond.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);	//まず比較部にいく
		dumpStgDebug(source, elseSource, "VerilogSwitch");
		stgNode = new StateTransGraphNode(this, phaseSignal, phaseLiteral, strayChild, strayElseChild);

		if(cases.size()!=0){

			cases.get(0).makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
			dumpStgDebug(source, elseSource, "VerilogSwitch...");
			stgNode.setNextPhase(cases.get(0).stgNode);

			for(int i=1; i<cases.size(); i++){

				moveStack(source, strayChild);
				moveStack(elseSource, strayElseChild);
				cases.get(i).makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
				dumpStgDebug(source, elseSource, "VerilogSwitch....");

				cases.get(i-1).stgNode.setElsePhase(cases.get(i).stgNode);	//条件分岐に失敗したcase の行き先は次のcase比較部に
			}
			strayElseChild.push(cases.get(cases.size()-1).stgNode);	//条件分岐に失敗した"最後の" case の行き先は不明 -> 迷子に
		}
		else{
			strayChild.push(stgNode);	//case がない -> このswitch ステートが迷子になる
		}

		for(VerilogBreak cnt : breakPhase)	//break の処理
			strayChild.push(cnt.stgNode);
	}

	@Override
	protected StateTransGraphNode getFirstPhase(){
		return cond.stgNode;
	}

	protected void generateVerilogCode(VerilogReg regPhase, VerilogCaseStatement phaseControl){

		 StateTransGraphNode.addGoToNextBlockAssign(regPhase, stgNode);
		 StateIdentifier assignState = new StateIdentifier(getParentMethod().methodID, stateID, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, false);
		 VerilogNoneBlockAssign preserveCondSignal = new VerilogNoneBlockAssign(preserveCond, cond.stages.get(0).getDFGraphs().get(0).getRootNode().getDestSignal(), assignState);
		 stgNode.currentPhaseCaseChild.addNoneBlockStat(preserveCondSignal);
		 phaseControl.addChildStat(stgNode.currentPhaseCaseChild);
	}
}