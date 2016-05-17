package net.njlab.model;
import java.io.*;
import java.util.Stack;

import net.njlab.circuit.VerilogCaseChild;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.*;

/**
 *  @author Keisuke Koike
 */
public class VerilogContinue  extends VerilogStatementsPhase{

	JCContinue continueStat;
	int parentLoopPhase = 0;	//continue するループのフェイズID
	StateTransGraphNode stgNode;

	VerilogContinue(JCContinue continueStat, VerilogStatementsPhase parent){
		this.continueStat = continueStat;
		this.parent = parent;
		registerToParentLoop();
	}

	private void registerToParentLoop(){

		VerilogStatementsPhase tmp = this;
		while( (!(tmp instanceof VerilogWhileLoop)) &&
			   (!(tmp instanceof VerilogDoWhile  )) &&
			   (!(tmp instanceof VerilogForLoop  )) ){
			tmp = tmp.parent;
		}
		if(tmp instanceof VerilogWhileLoop){
			((VerilogWhileLoop)tmp).continuePhase.add(this);
		}
		else if(tmp instanceof VerilogDoWhile){
			((VerilogDoWhile)tmp).continuePhase.add(this);
		}
		else if(tmp instanceof VerilogForLoop){
			((VerilogForLoop)tmp).continuePhase.add(this);
		}
		else
			System.out.println("DEBUG:	error continue");// for, while, do while 以外でcontinue が使われた
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Continue>");
		Dump.tprintln(out, offset+1, "<Phase>  "+ this.stateID +"  </Phase>");
		Dump.tprintln(out, offset+1, "<JumpPhase>  "+ parentLoopPhase +"  </JumpPhase>");
		Dump.tprintln(out, offset, "</Continue>\n");
	}

	@Override
    public boolean existERR(){
    	return !buildSucceed;
    }

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
