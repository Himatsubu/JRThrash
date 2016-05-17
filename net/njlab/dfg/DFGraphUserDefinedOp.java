package net.njlab.dfg;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.TmpSignals;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogWire;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.ipcore.UserDefined;
import net.njlab.ipcore.VerilogIPcore;
import net.njlab.model.VerilogClass;
import net.njlab.model.VerilogMethod;
import net.njlab.model.VerilogMethodInv;
import net.njlab.scheduling.SchedulingListSet;

public class DFGraphUserDefinedOp extends DFGraphMethodInv{

	VerilogIPcore assignedIPcore;

	public DFGraphUserDefinedOp(VerilogMethod method, VerilogMethodInv methodInv, DFGraphNode[] args, int destType){

		super(method, methodInv, args, destType);
	}

	@Override
	public void computePriority(int minCntlStp, Config config){

		minNodeOperatingStep = method.getConvertedInfo().getLatency() + 1;
		minCntlStpFromThisNode = minCntlStp + minNodeOperatingStep;
		priority = minCntlStpFromThisNode;

		for(int i=0; i<args.length; i++)
			args[i].computePriority(minCntlStpFromThisNode, config);
		destTypeIsReg = false;
	}

	@Override
	public void assignControlStep(int controlStep, SchedulingListSet listSet){

		boolean allSrcIsFinished = true;

		//すべてのソースノードのコントロ－ルステップ割り当てが終了しているかチェック
		for(int i=0; i<args.length; i++){
			if(args[i].assignState==notAssigned)
				args[i].assignControlStep(controlStep, listSet);
			allSrcIsFinished &= (args[i].assignState==finished);
		}

		//if(impossibleToAssignforALAP(controlStep))	//ALAPスケジューリングの割り当て可能ステップに達していない
		//	return;

		if(allSrcIsFinished){
			int startEnableStep = -1;
			for(int i=0; i<args.length; i++)
				startEnableStep = Math.max(startEnableStep, getStartEnableStep(args[i], controlStep));

			if(startEnableStep <= controlStep){	//このステップ以前にソースノードの計算が終了している
				enqueueList(listSet, controlStep);
			}
		}
	}


	private void enqueueList(SchedulingListSet listSet, int controlStep){
		listSet.userDefined.get(method).addList(this);
		assignState = waiting;
	}

	public void setIPcoreAndControlStep(VerilogIPcore ipcore, int controlStep){

		assignedIPcore = ipcore;
		startStep = controlStep;

		if(args.length==0)
			endStep = startStep + ipcore.latency;	//入力が無いので, 入力ポートのレジスタに代入するステップが要らない
		else
			setEndStep(ipcore.latency, true);

		assignState = finished;
		//debug
		boolean allSrcIsFinished = true;
		for(DFGraphNode arg : args)
			allSrcIsFinished &= (arg.assignState==finished);

		if(allSrcIsFinished){	//ソースが割り当て済み

			int startEnableStep = -1;
			for(DFGraphNode arg : args)
				startEnableStep = Math.max(startEnableStep, getStartEnableStep(arg, controlStep));

			if(!(startEnableStep <= controlStep))	//このステップ以前にソースノードの計算が終了していない
				System.out.println("DEBUG:	error DFGraphBinary  setIPcoreAndControlStep");
		}
		else{
			System.out.println("DEBUG:	error DFGraphBinary  setIPcoreAndControlStep.");
		}
	}


	@Override
	public void assignDestSignal(VerilogClass parentClass){

		if(method.getRetType().compareTo("void")==0){
			destSignal = null;
			return;
		}

		if(destTypeIsReg){
			destSignal = allocateTmpReg();
		}
		else{
			TmpSignals tmpSignals = parentClass.getTmpSignals();
			destSignal = tmpSignals.getWire(getBitWidth(), isSignedType());
		}
	}


	@Override
	public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		for(int i=0; i<args.length; i++){
			VerilogNoneBlockAssign noneBlockAssign = new VerilogNoneBlockAssign(((UserDefined)assignedIPcore).inputPortRegs[i], args[i].destSignal, startState);
			registerNoneBlockAssign(controlStep, noneBlockAssign, startStep);
		}

		makeNewDataAssign(controlStep, methodID, phaseID, stageID);

		if(destSignal==null)	//返り値が void のとき
			return;

		if(method.getRetType().compareTo("void")==0)
			System.out.println("DEBUG:	error DFGraphUseDefine makeAlways");

		if(destTypeIsReg){
			StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);
			VerilogNoneBlockAssign noneBlockAssign = new VerilogNoneBlockAssign(((VerilogReg)destSignal), ((UserDefined)assignedIPcore).outputWire, endState);
			registerNoneBlockAssign(controlStep, noneBlockAssign, endStep);
		}
		else{
			((VerilogWire)destSignal).setAssignExpression( ((UserDefined)assignedIPcore).outputWire );
		}
	}

	private void makeNewDataAssign(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		if(assignedIPcore.newData!=null){

			StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
			VerilogNoneBlockAssign newDataHigh = new VerilogNoneBlockAssign(assignedIPcore.newData,  parentManager.parentClass.boolTrue, startState);
			VerilogNoneBlockAssign newDataLow  = new VerilogNoneBlockAssign(assignedIPcore.newData,  parentManager.parentClass.boolFalse, startState);
			registerNoneBlockAssign(controlStep, newDataHigh, startStep);
			if(assignedIPcore.throughput>=2)	//スループット1の場合, startStep + 1 ステップ目に同時に newData 信号にアクセスする可能性がある
				registerNoneBlockAssign(controlStep, newDataLow, startStep+1);
		}
	}

	@Override
	public int getAssignedToNewRegStep(){

		return startStep;
	}

	/**
	 * destTypeIsReg  -> false
	 * !destTypeIsReg -> true
	 **/
	@Override
	public boolean destSignalIsNotSaved(){

		if(destTypeIsReg)
			return false;

		return true;
	}

	@Override
	public void dumpNode(PrintWriter wout, int offset){

		DFGraphNode sa;

		Dump.tprintln(wout, offset, "<UserDefined>");
		super.dumpNode(wout, offset+1);
		Dump.tprintln(wout, offset+1, "<ipName>	"+methodInv.methodName+"	</ipName>");
		for(DFGraphNode arg : args){
			Dump.tprintln(wout, offset+1, "<arg>");
			arg.dumpNode(wout, offset+2);
			Dump.tprintln(wout, offset+1, "</arg>");
		}
		Dump.tprintln(wout, offset+1, "<component><!--"+Dump.translateHTML("		IPcore : "+assignedIPcore.getInstanceName()+"	")+"--></component>");
		Dump.tprintln(wout, offset, "</UserDefined>");
	}

	@Override
	public void setComponentSign(){
		componentSigniture = assignedIPcore.hashCode();
	}
}





















