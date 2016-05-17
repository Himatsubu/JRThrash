package net.njlab.model;
import net.njlab.circuit.*;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.*;
import java.io.*;
import java.util.Stack;

/**
 *  @author Keisuke Koike
 */
public class VerilogReturn  extends VerilogStatementsPhase{

	JCReturn returnStat;
	VerilogStatAssemblage retExpr;
	StateTransGraphNode stgNode;

	VerilogReturn(JCReturn returnStat, VerilogStatementsPhase parent){
		this.returnStat = returnStat;
		this.parent = parent;
		makeVariableStack();
		if(returnStat.getExpression()!=null){
			retExpr = new VerilogStatAssemblage( new VerilogExprStatement(returnStat.getExpression()), this );
			retExpr.trueReturnStat(parent.getParentMethod().getRetType());
		}
		getParentMethod().returnStat.add(this);
	}

	public boolean existERR(){
		boolean ret = !buildSucceed;
		if(retExpr!=null)
			ret |= retExpr.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<Return>	<Phase>  "+ this.stateID +"  </Phase>\n");
		if(retExpr!=null) retExpr.dump(out, offset+1);
		Dump.tprintln(out, offset, "</Return>\n");
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){
		if(retExpr==null){
			stgNode = new StateTransGraphNode(this, phaseSignal, phaseLiteral, source, elseSource);
		}
		else{
			retExpr.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
			stgNode = new StateTransGraphNode(this, phaseSignal, phaseLiteral, strayChild, strayElseChild);
		}
		//return の行先は， method が直接処理する
	}

	@Override
	protected StateTransGraphNode getFirstPhase(){
		return this.stgNode;
	}

	protected void generateVerilogCode(VerilogReg regPhase, VerilogCaseStatement phaseControl){

		 StateTransGraphNode.addGoToNextBlockAssign(regPhase, stgNode);
		 if(retExpr!=null){
			 StateIdentifier assignState = new StateIdentifier(getParentMethod().methodID, stateID, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, false);
			 VerilogNoneBlockAssign assignRetValue = new VerilogNoneBlockAssign(getParentMethod().regRet, retExpr.stages.get(0).getDFGraphs().get(0).getRootNode().getDestSignal(), assignState);
			 stgNode.currentPhaseCaseChild.addNoneBlockStat(assignRetValue);
		 }
		 phaseControl.addChildStat(stgNode.currentPhaseCaseChild);
	}
}
