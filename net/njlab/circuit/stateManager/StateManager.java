package net.njlab.circuit.stateManager;

import java.io.PrintWriter;
import java.util.Map;
import java.util.TreeMap;

import net.njlab.circuit.VerilogAlways;
import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogIfStatement;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogUnaryExpression;
import net.njlab.model.VerilogClass;
import net.njlab.model.VerilogUnary;

/**
 * @author koike
 * */
public class StateManager {

	private Map<Integer, JRTStateMethod> methodID_methodState = new TreeMap<Integer, JRTStateMethod>();
	private JRTStateReset resetPart = null;
	VerilogAlways always = null;

	public void registerState(StateIdentifier state, VerilogNoneBlockAssign assignExpr){

		if( state.isResetPart() ){
			if(resetPart == null)
				resetPart = new JRTStateReset();

			resetPart.addState(state, assignExpr);


			if(state.getMethodID()!=StateIdentifier.stateNotExist ||
			   state.getPhaseID()!=StateIdentifier.stateNotExist  ||
			   state.getStageID()!=StateIdentifier.stateNotExist  ||
			   state.getStepID()!=StateIdentifier.stateNotExist)
					System.out.println("DEBUG: assert StateManager registerState");
		}
		else{
			int methodID = state.getMethodID();
			JRTStateMethod methodState = methodID_methodState.get(methodID);

			if( methodState==null){
				methodState = new JRTStateMethod(methodID);
				methodID_methodState.put(methodID, methodState);
			}
			methodState.addState(state, assignExpr);
		}
	}

	public void dumpAlways(PrintWriter wout, int offset){

		if(always!=null)
			always.dumpAlways(wout, offset);
	}

	public void makeAlways(VerilogClass parentClass){

		if( methodID_methodState.size()==0 && resetPart==null ){	//代入なし
			return;
		}
		else{
			always = new VerilogAlways(parentClass.getClock(), parentClass);
			VerilogIfStatement processBlock = new VerilogIfStatement();
			processBlock.setCond(parentClass.wireClockEnable);

			if(methodID_methodState.size()!=0 && resetPart==null){	//resetなし
				always.setIfStat(processBlock);
				processBlock.addChildBlock(makeProcessPart(parentClass));
			}
			else if(methodID_methodState.size()==0 && resetPart!=null){	//reset だけ
				always.setIfStat(makeResetPart(parentClass));
			}
			else{	//reset も本処理部分の代入もあり

				VerilogIfStatement resetBlock = makeResetPart(parentClass);
				processBlock.addChildBlock(makeProcessPart(parentClass));
				resetBlock.setElsePart(processBlock);
				always.setIfStat(resetBlock);
			}
		}
	}

	private VerilogCaseStatement makeProcessPart(VerilogClass parentClass){

		VerilogCaseStatement methodControll = new VerilogCaseStatement();
		methodControll.setBranchSignal(parentClass.getProcessingMethodIDreg());

		for(Map.Entry<Integer, JRTStateMethod> method : methodID_methodState.entrySet())
			methodControll.addChildStat( method.getValue().makeAlways(parentClass, parentClass.getMethod(method.getKey()) ));

		return methodControll;
	}

	private VerilogIfStatement makeResetPart(VerilogClass parentClass){

		VerilogIfStatement resetBlock = new VerilogIfStatement();

		if(parentClass.config.isNegativeReset){
			VerilogUnaryExpression resetExpr = new VerilogUnaryExpression(parentClass.getReset(), VerilogUnary.NOT);
			resetBlock.setCond(resetExpr);
		}
		else{
			resetBlock.setCond(parentClass.getReset());
		}
		resetBlock.addThenChildAssign(resetPart.makeAlways());
		return resetBlock;
	}
}











