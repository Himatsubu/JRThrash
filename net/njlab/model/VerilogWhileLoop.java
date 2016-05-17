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
public class VerilogWhileLoop  extends VerilogStatementsPhase {

	JCWhileLoop whileLoop;
	VerilogStatAssemblage cond;
	VerilogStatementsPhase body;
	//ArrayList<Integer> breakPhase = new ArrayList<Integer>();	//break フェイズのID	フェイズ遷移最適化による変更
	ArrayList<VerilogContinue> continuePhase = new ArrayList<VerilogContinue>();
	ArrayList<VerilogBreak> breakPhase = new ArrayList<VerilogBreak>();

	VerilogWhileLoop(JCWhileLoop whileLoop, VerilogStatementsPhase parent){
		this.whileLoop = whileLoop;
		this.parent = parent;
		makeVariableStack();
		makeCond();
		makeBody();
	}

	void makeCond(){
		VerilogExprStatement tmp = new VerilogExprStatement(whileLoop.getCondition());
		cond = new VerilogStatAssemblage(tmp, this);
	}

	void makeBody(){
		VerilogStatementsPhase subPhase = VerilogStatementsPhase.makeSubBlock(whileLoop.getStatement(), this);
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
		Dump.tprintln(out, offset, "<WhileLoop>	<Phase>  "+ this.stateID +"  </Phase>");
		if(breakPhase.size()!=0){
			Dump.tprint(out, offset+1, "<BreakPhase>");
			for(int i=0; i<breakPhase.size(); i++)
				Dump.tprint(out, 0, "	"+breakPhase.get(i));
			Dump.tprint(out, 0, "	</BreakPhase>");
			Dump.tprintln(out, offset+1, "\n");
		}
		Dump.tprintln(out, offset+1, "<whileCond>");
		cond.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</whileCond>\n");
		Dump.tprintln(out, offset+1, "<whileBody>");
		body.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</whileBody>\n");
		Dump.tprintln(out, offset, "</WhileLoop>\n");
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){

		cond.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
		dumpStgDebug(source, elseSource, "VerilogWhileLoop");
		moveStack(source, strayChild);
		moveStack(elseSource, strayElseChild);
		body.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
		dumpStgDebug(source, elseSource, "VerilogWhileLoop.");

		while(strayChild.size()>0)		strayChild.pop().setNextPhase(cond.stgNode);	//while以下の迷子ノードの行先は，比較部
		while(strayElseChild.size()>0)	strayElseChild.pop().setElsePhase(cond.stgNode);

		strayElseChild.push(cond.stgNode);//条件分岐失敗時の行先を親に見つけさせる

		for(VerilogContinue cnt : continuePhase)
			cnt.stgNode.setNextPhase(cond.getFirstPhase());	//continue の処理

		for(VerilogBreak cnt : breakPhase)	//break の処理
			strayChild.push(cnt.stgNode);
	}

	@Override
	protected StateTransGraphNode getFirstPhase(){

		StateTransGraphNode firstPhase = body.getFirstPhase();
		if(firstPhase!=null)
			return firstPhase;

		return cond.stgNode;
	}
}






