package net.njlab.model;

import java.util.ArrayList;
import java.util.Stack;

import net.njlab.circuit.VerilogCaseChild;
import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.circuit.stateManager.StateIdentifier;
/**
 *  @author Keisuke Koike
 */
public class StateTransGraphNode {

	private VerilogStatementsPhase currentPhase;	//現在のフェイズ
	private StateTransGraphNode nextPhase;	//次に遷移すべきフェイズ
	private StateTransGraphNode elsePhase;	//条件分岐失敗したときに遷移するフェイズ
	private ArrayList<StateTransGraphNode> prePhase = new ArrayList<StateTransGraphNode>(); //遷移元フェイズ
	boolean codeGeneDone = false;
	private VerilogSignalString currentPhaseSignal;	//フェイズ番号
	private VerilogLiteralNumber currentPhaseLiteral;	//フェイズ番号
	protected VerilogCaseChild currentPhaseCaseChild = new VerilogCaseChild();

	public StateTransGraphNode(VerilogStatementsPhase currentPhase, VerilogSignalString currentPhaseSignal, VerilogLiteralNumber currentPhaseLiteral,
							   Stack<StateTransGraphNode> prePhase, Stack<StateTransGraphNode> prePhaseElse){

		this.currentPhase = currentPhase;
		this.currentPhaseLiteral = currentPhaseLiteral;
		this.currentPhaseSignal = currentPhaseSignal;

		while(prePhase.size()>0){
			StateTransGraphNode preNode = prePhase.pop();
			preNode.setNextPhase(this);
			this.prePhase.add(preNode);
		}

		while(prePhaseElse.size()>0){
			StateTransGraphNode preNode = prePhaseElse.pop();
			preNode.setElsePhase(this);
			this.prePhase.add(preNode);
		}
		currentPhaseCaseChild.setCond(currentPhaseLiteral);
	}

	public StateTransGraphNode(VerilogStatementsPhase currentPhase, VerilogSignalString currentPhaseSignal, VerilogLiteralNumber currentPhaseLiteral){

		this.currentPhase = currentPhase;
		this.currentPhaseLiteral = currentPhaseLiteral;
		this.currentPhaseSignal = currentPhaseSignal;
		currentPhaseCaseChild.setCond(currentPhaseLiteral);
	}

	public void setNextPhase(StateTransGraphNode nextPhase){

		if(this.nextPhase!=null)
			System.out.println("DEBUG:	error StateTransGraphNode setNextPhase"+"  old:"+this.nextPhase.getCurrentPhaseLiteral().getExprString(getCurrentPhaseLiteral().bitWidth, false)+"	new:"+nextPhase.getCurrentPhaseLiteral().getExprString(getCurrentPhaseLiteral().bitWidth, false));

		this.nextPhase = nextPhase;
		nextPhase.prePhase.add(this);
	}

	public void setElsePhase(StateTransGraphNode elsePhase){

		if(this.elsePhase!=null)
			System.out.println("DEBUG:	error StateTransGraphNode setElsePhase"+"  old:"+this.elsePhase.getCurrentPhaseLiteral().getExprString(getCurrentPhaseLiteral().bitWidth, false)+"	new:"+elsePhase.getCurrentPhaseLiteral().getExprString(getCurrentPhaseLiteral().bitWidth, false));

		this.elsePhase = elsePhase;
		elsePhase.prePhase.add(this);
	}

	public StateTransGraphNode getNextPhase(){
		return nextPhase;
	}

	public StateTransGraphNode getElsePhase(){
		return elsePhase;
	}

	public void generateVerilogCode(VerilogReg regPhase, VerilogCaseStatement phaseControl){

		if(codeGeneDone)
			return;

		if(currentPhase instanceof VerilogMethod){	//メソッドから生成されるノードは，開始ノードと終了ノードの2つがあるため，メソッドクラス内で別に処理する

		}
		else if(currentPhase instanceof VerilogForLoop){
			addGoToNextBlockAssign(regPhase, this);
			phaseControl.addChildStat(currentPhaseCaseChild);
		}
		else if(currentPhase instanceof VerilogSwitch){
			((VerilogSwitch)currentPhase).generateVerilogCode(regPhase, phaseControl);
		}
		else if(currentPhase instanceof VerilogCase){
			((VerilogCase)currentPhase).generateVerilogCode(regPhase, phaseControl);
		}
		else if(currentPhase instanceof VerilogBreak){
			addGoToNextBlockAssign(regPhase, this);
			phaseControl.addChildStat(currentPhaseCaseChild);
		}
		else if(currentPhase instanceof VerilogContinue){
			addGoToNextBlockAssign(regPhase, this);
			phaseControl.addChildStat(currentPhaseCaseChild);
		}
		else if(currentPhase instanceof VerilogReturn){
			((VerilogReturn)currentPhase).generateVerilogCode(regPhase, phaseControl);
		}
		else if(currentPhase instanceof VerilogStatAssemblage){
			((VerilogStatAssemblage)currentPhase).generateVerilogCode(regPhase, phaseControl);
		}

		codeGeneDone = true;

		if(nextPhase!=null)
			nextPhase.generateVerilogCode(regPhase, phaseControl);

		if(elsePhase!=null)
			elsePhase.generateVerilogCode(regPhase, phaseControl);
	}

	static void addGoToNextBlockAssign(VerilogReg regPhase, StateTransGraphNode currentNode){

		VerilogStatementsPhase currentPhase = currentNode.currentPhase;
		StateIdentifier assignState = new StateIdentifier(currentPhase.getParentMethod().methodID, currentPhase.phaseLiteral.getNumber(), StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, false);
		VerilogNoneBlockAssign gotoNextAssign = new VerilogNoneBlockAssign(regPhase, currentNode.nextPhase.currentPhaseSignal, assignState);
		currentNode.currentPhaseCaseChild.addNoneBlockStat(gotoNextAssign);
	}

	public VerilogLiteralNumber getCurrentPhaseLiteral(){
		return currentPhaseLiteral;
	}

	public VerilogSignalString getCurrentPhaseSignal(){
		return currentPhaseSignal;
	}
}








