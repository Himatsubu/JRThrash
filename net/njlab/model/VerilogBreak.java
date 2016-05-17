package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Stack;

import net.njlab.circuit.*;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.*;

/**
 *  @author Keisuke Koike
 */
public class VerilogBreak  extends VerilogStatementsPhase{

	JCBreak breakStat;
	int parentLoopPhase = 0;	//break するループ又はswitchのフェイズID
	StateTransGraphNode stgNode;

	VerilogBreak(JCBreak breakStat, VerilogStatementsPhase parent){
		this.breakStat = breakStat;
		this.parent = parent;
		registerToParentLoop();
	}

	private void registerToParentLoop(){

		VerilogStatementsPhase tmp = this;
		while( (!(tmp instanceof VerilogWhileLoop)) &&
			   (!(tmp instanceof VerilogDoWhile  )) &&
			   (!(tmp instanceof VerilogForLoop  )) &&
			   (!(tmp instanceof VerilogSwitch   )) ){
			tmp = tmp.parent;
		}
		if(tmp instanceof VerilogWhileLoop)
			((VerilogWhileLoop)tmp).breakPhase.add(this);
		else if(tmp instanceof VerilogDoWhile)
			((VerilogDoWhile)tmp).breakPhase.add(this);
		else if(tmp instanceof VerilogForLoop)
			((VerilogForLoop)tmp).breakPhase.add(this);
		else if(tmp instanceof VerilogSwitch)
			((VerilogSwitch)tmp).breakPhase.add(this);
		else
			System.out.println("DEBUG:	error break");// for, while, do while 以外でbreak が使われた

		parentLoopPhase = tmp.stateID;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Break>");
		Dump.tprintln(out, offset+1, "<Phase>  "+ this.stateID +"  </Phase>");
		Dump.tprintln(out, offset+1, "<ParentLoopPhase>  "+ parentLoopPhase +"  </ParentLoopPhase>");
		Dump.tprintln(out, offset, "</Break>\n");
	}

	@Override
	public boolean existERR(){
		return !buildSucceed;
	}

	/*フェイズ遷移最適化による変更
	@Override
	public VerilogCaseChild makeCaseChild(){

		VerilogCaseChild breakState = new VerilogCaseChild();
		makeJumpAssign(breakState, phaseLiteral, getParentMethod(), parentLoopPhase);
		return breakState;
	}

	static void makeJumpAssign(VerilogCaseChild thisState, VerilogLiteralNumber phaseLiteral, VerilogMethod parentMethod, int jumpState){

		thisState.setCond(phaseLiteral);
		VerilogSignalString jumpPhase = new VerilogSignalString(parentMethod.regPhase.bitWidth+"'h"+Integer.toHexString(jumpState), parentMethod.regPhase.bitWidth, VerilogSignal.unsigned);
		VerilogNoneBlockAssign prePhaseAssign = new VerilogNoneBlockAssign(parentMethod.regPrePhase, parentMethod.regPhase);
		VerilogNoneBlockAssign phaseAssign = new VerilogNoneBlockAssign(parentMethod.regPhase, jumpPhase);
		thisState.addNoneBlockStat(prePhaseAssign);
		thisState.addNoneBlockStat(phaseAssign);
	}*/

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){

		stgNode = new StateTransGraphNode(this, phaseSignal, phaseLiteral, source, elseSource);
	}

	@Override
	protected StateTransGraphNode getFirstPhase(){
		return this.stgNode;
	}
}
