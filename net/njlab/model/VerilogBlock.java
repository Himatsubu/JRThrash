package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Stack;

import net.njlab.dfg.DFGraphManager;
import net.njlab.dfg.DFGraphNode;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.JCBlock;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpressionStatement;
import openjdk.com.sun.tools.javac.tree.JCTree.JCStatement;
import openjdk.com.sun.tools.javac.tree.JCTree.JCVariableDecl;

/**
 *  @author Keisuke Koike
 */
public class VerilogBlock extends VerilogStatementsPhase {

	JCBlock block;
	ArrayList<VerilogStatementsPhase> subBlock = new ArrayList<VerilogStatementsPhase>();

	public VerilogBlock(JCBlock block, VerilogStatementsPhase parent){
		this.parent = parent;
		this.block = block;
		makeVariableStack();
		assembleSubBlock();
	}

	public VerilogBlock(JCExpressionStatement exprStat, VerilogStatementsPhase parent){
		this.parent = parent;
		makeVariableStack();
		VerilogStatAssemblage tmp = new VerilogStatAssemblage(exprStat, this);
		subBlock.add(tmp);
	}

	protected VerilogBlock(VerilogStatementsPhase parent){
		this.parent = parent;
		makeVariableStack();
	}

	void assembleSubBlock(){	//if や for, switch 等の前後で連続する ExpressionStatement, VariableDecl を VerilogStatementAssemblage に格納数する
								//VerilogStatementAssemblage は VerilogIf や VerilogForLoop 等と同様にサブブロックとして扱う
		ArrayList<VerilogStatement> statements = new ArrayList<VerilogStatement>();

		for(JCStatement statement : block.getStatements()){

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
					subBlock.add( subPhase );
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
			if(subBlock.get(i)!=null)
				ret |= subBlock.get(i).existERR();
		}
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Block>	<Phase>  "+ this.stateID +"  </Phase>\n");
		for(int i=0; i<subBlock.size(); i++)
			subBlock.get(i).dump(out, offset+1);
		Dump.tprintln(out, offset, "</Block>\n");
	}

	public void unrollStatements(String updateOp, VerilogVariableDecl loopVariable, int unrollNum, int unrollType, DFGraphNode updateExpressionNode, DFGraphManager updateGraph){

		//vdecls == forブロック内部で宣言された変数 -> 展開個数分コピー
		((VerilogStatAssemblage)subBlock.get(0)).setUnrollParam(loopVariable, unrollNum, unrollType);
		((VerilogStatAssemblage)subBlock.get(0)).unrollStatements(vdecls, updateOp, updateExpressionNode);
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){

		if(subBlock.size()==0){	//空ブロックの場合，source の状態遷移先が無いので， source が迷子ノードになる

			moveStack(strayChild, source);
			moveStack(strayElseChild, elseSource);
			return;
		}

		for(int i=0; i<subBlock.size(); i++){

			subBlock.get(i).makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
			dumpStgDebug(source, elseSource, "VerilogBlock");
			if(i!=subBlock.size()-1){
				moveStack(source, strayChild);	//迷子ノードは遷移元ノードとなる
				moveStack(elseSource, strayElseChild);
			}
		}
	}

	@Override
	protected StateTransGraphNode getFirstPhase(){

		for(int i=0; i<subBlock.size(); i++){

			StateTransGraphNode firstPhase = subBlock.get(i).getFirstPhase();
			if(firstPhase!=null){
				return firstPhase;
			}
		}
		return null;
	}

	protected boolean mergeForUpdatePart(VerilogStatAssemblage update){

		if(subBlock.size()>0 && subBlock.get(subBlock.size()-1) instanceof  VerilogStatAssemblage){
			((VerilogStatAssemblage)subBlock.get(subBlock.size()-1)).setForUpdatePart(update);
			return true;
		}
		return false;
	}

	protected void setForInitPart(VerilogStatAssemblage init){

		((VerilogStatAssemblage)subBlock.get(subBlock.size()-1)).setForInitPart(init);
	}
}




