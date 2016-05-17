package net.njlab.model;
import java.io.*;
import java.util.ArrayList;
import java.util.Stack;

import net.njlab.circuit.VerilogCaseChild;
import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogIfStatement;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.dump.Dump;

import openjdk.com.sun.tools.javac.tree.JCTree.*;

/**
 *  @author Keisuke Koike
 */
public class VerilogDoWhile  extends VerilogStatementsPhase {

	JCDoWhileLoop doWhile;
	VerilogStatAssemblage cond;
	VerilogStatementsPhase body;
	//ArrayList<Integer> breakPhase = new ArrayList<Integer>();	//break フェイズのID	フェイズ遷移最適化による変更
	ArrayList<VerilogContinue> continuePhase = new ArrayList<VerilogContinue>();
	ArrayList<VerilogBreak> breakPhase = new ArrayList<VerilogBreak>();

	VerilogDoWhile(JCDoWhileLoop doWhile, VerilogStatementsPhase parent){
		this.doWhile = doWhile;
		this.parent = parent;
		makeVariableStack();
		makeCond();
		makeBody();
	}

	void makeCond(){
		VerilogExprStatement tmp = new VerilogExprStatement(doWhile.getCondition());
		cond = new VerilogStatAssemblage(tmp, this);
	}

	void makeBody(){

		VerilogStatementsPhase subPhase = VerilogStatementsPhase.makeSubBlock(doWhile.getStatement(), this);

		//skip 対策
		if(subPhase==null)
			body = new VerilogContinue(null, this);
		else
			body = subPhase;
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		ret |= cond.existERR();
		ret |= body.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<DoWhile>	<Phase>  "+ this.stateID +"  </Phase>");
		if(breakPhase.size()!=0){
			Dump.tprint(out, offset+1, "<BreakPhase>");
			for(int i=0; i<breakPhase.size(); i++)
				Dump.tprint(out, 0, "	"+breakPhase.get(i));
			Dump.tprint(out, 0, "	</BreakPhase>");
			Dump.tprintln(out, offset+1, "\n");
		}
		Dump.tprintln(out, offset+1, "<doWhileCond>");
		cond.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</doWhileCond>\n");
		Dump.tprintln(out, offset+1, "<doWhileBody>");
		body.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</doWhileBody>\n");
		Dump.tprintln(out, offset, "</DoWhile>\n");
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){

		body.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
		dumpStgDebug(source, elseSource, "VerilogDoWhileLoop");
		moveStack(source, strayChild);
		moveStack(elseSource, strayElseChild);
		cond.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
		dumpStgDebug(source, elseSource, "VerilogDoWhileLoop.");
		strayChild.pop();	//cond の行先は block の最初なので，迷子ノードから外す．

		StateTransGraphNode firstNode = body.getFirstPhase();
		if(firstNode==null)
			cond.stgNode.setNextPhase(cond.stgNode);//body 以下に遷移先が見つからなかった -> cond の行先は cond
		else
			cond.stgNode.setNextPhase(firstNode);//cond の行先は，body 以下の最初のフェイズ

		strayElseChild.push(cond.stgNode);//条件分岐失敗時の行先を親に見つけさせる

		for(VerilogContinue cnt : continuePhase)
			cnt.stgNode.setNextPhase(cond.getFirstPhase());	//continue の処理

		for(VerilogBreak cnt : breakPhase)	//break の処理
			strayChild.push(cnt.stgNode);
	}

	@Override
	protected StateTransGraphNode getFirstPhase(){
		return cond.stgNode;
	}
}
