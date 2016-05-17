package net.njlab.circuit.stateManager;

import java.util.Map;
import java.util.TreeMap;

import net.njlab.circuit.VerilogCaseChild;
import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.model.VerilogClass;
import net.njlab.model.VerilogMethod;


/**
 * @author koike
 * */
public class JRTStateMethod extends JRTState{

	private int methodID;
	private VerilogNoneBlockAssign assignExpr;
	private Map<Integer, JRTStatePhase> phaseID_phaseState = new TreeMap<Integer, JRTStatePhase>();

	public JRTStateMethod(int methodID){

		this.methodID = methodID;
		if(methodID == StateIdentifier.stateNotExist){
			System.out.println("DEBUG: error JRTStateMethod");
		}
	}

	protected void addState(StateIdentifier state, VerilogNoneBlockAssign assignExpr){

		int phaseID = state.getPhaseID();

		if(phaseID == StateIdentifier.stateNotExist){
			this.assignExpr = assignExpr;
		}
		else{
			JRTStatePhase phaseState = phaseID_phaseState.get(phaseID);

			if( phaseState==null){
				phaseState = new JRTStatePhase(phaseID);
				phaseID_phaseState.put(phaseID, phaseState);
			}
			phaseState.addState(state, assignExpr);
		}
	}

	protected VerilogCaseChild makeAlways(VerilogClass parentClass, VerilogMethod method){

		int bitWidth = parentClass.getProcessingMethodIDreg().bitWidth;
		String methodIdStr = Integer.toHexString(methodID);
		VerilogLiteralNumber methodIdLiteral = new VerilogLiteralNumber(bitWidth, VerilogLiteralNumber.typeHexadecimal, methodIdStr);

		VerilogCaseChild methodCaseChild = new VerilogCaseChild();
		methodCaseChild.setCond(methodIdLiteral);

		if(assignExpr!=null)
			methodCaseChild.addNoneBlockStat(assignExpr);

		if(phaseID_phaseState.size()>0){

			VerilogCaseStatement phaseControl = new VerilogCaseStatement();
			phaseControl.setBranchSignal(method.getPhaseReg());

			for(Map.Entry<Integer, JRTStatePhase> phase : phaseID_phaseState.entrySet())
				phaseControl.addChildStat( phase.getValue().makeAlways(method ) );

			methodCaseChild.addChildBlock( phaseControl );
		}
		return methodCaseChild;
	}
}













