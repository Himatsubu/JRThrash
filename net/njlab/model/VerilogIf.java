package net.njlab.model;

import java.io.*;
import java.util.Stack;

import net.njlab.circuit.*;
import net.njlab.dump.Dump;

import openjdk.com.sun.tools.javac.tree.JCTree.*;

/**
 *  @author Keisuke Koike
 */
public class VerilogIf  extends VerilogStatementsPhase {

	JCIf ifStat;
	VerilogStatAssemblage cond;
	VerilogStatementsPhase thenBody, elseBody;

	VerilogIf(JCIf ifStat, VerilogStatementsPhase parent){
		this.ifStat = ifStat;
		this.parent = parent;
		makeVariableStack();
		makeCond();
		makeBody();
	}

	void makeCond(){
		VerilogExprStatement tmp = new VerilogExprStatement(ifStat.getCondition());
		cond = new VerilogStatAssemblage(tmp, this);
	}

	void makeBody(){

		VerilogStatementsPhase subPhase = VerilogStatementsPhase.makeSubBlock(ifStat.getThenStatement(), this);
		if(subPhase==null)
			thenBody = new VerilogBlock(this);
		else
			thenBody = subPhase;

		if(ifStat.getElseStatement()!=null){
			subPhase = VerilogStatementsPhase.makeSubBlock(ifStat.getElseStatement(), this);

			if(subPhase==null)
				elseBody = new VerilogBlock(this);
			else
				elseBody = subPhase;
		}
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		ret |= cond.existERR();
		ret |= thenBody.existERR();
		if(elseBody!=null)
			ret |= elseBody.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<If>	<Phase>  "+ this.stateID +"  </Phase>");
		Dump.tprintln(out, offset+1, "<ifCond>");
		cond.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</ifCond>\n");
		Dump.tprintln(out, offset+1, "<thenBlock>");
		thenBody.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</thenBlock>\n");
		Dump.tprintln(out, offset+1, "<elseBlock>");
		if(elseBody!=null)	elseBody.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</elseBlock>\n");
		Dump.tprintln(out, offset, "</If>\n");
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){

		cond.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
		dumpStgDebug(source, elseSource, "VerilogIf");
		moveStack(source, strayChild);
		moveStack(elseSource, strayElseChild);

		thenBody.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
		dumpStgDebug(source, elseSource, "VerilogIf.");

		if(elseBody!=null){

			Stack<StateTransGraphNode> strayChildFromThenPart = new Stack<StateTransGraphNode>();	//thenパートの迷子ノードを退避
			Stack<StateTransGraphNode> strayElseChildFromThenPart = new Stack<StateTransGraphNode>();	//thenパートの迷子ノードを退避
			moveStack(strayChildFromThenPart, strayChild);
			moveStack(strayElseChildFromThenPart, strayElseChild);
			elseSource.push(cond.stgNode);
			elseBody.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
			dumpStgDebug(source, elseSource, "VerilogIf..");
			moveStack(strayChild, strayChildFromThenPart);		//thenパートの迷子ノードとマージして行き先探しを上位ブロックに任せる
			moveStack(strayElseChild, strayElseChildFromThenPart);
		}
		else{
			strayElseChild.push(cond.stgNode);	//else 節がない場合，cond の分岐失敗時の行き先が不明
		}
	}

	@Override
	protected StateTransGraphNode getFirstPhase(){
		return cond.stgNode;
	}
}








