package net.njlab.circuit.stateManager;

import java.util.Map;
import java.util.TreeMap;

import net.njlab.circuit.VerilogCaseChild;
import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.model.VerilogMethod;

/**
 * @author koike
 * */
public class JRTStatePhase  extends JRTState{

	private int phaseID;
	private VerilogNoneBlockAssign assignExpr;
	private Map<Integer, JRTStateStage> stageID_stageState = new TreeMap<Integer, JRTStateStage>();

	public JRTStatePhase(int phaseID){

		this.phaseID = phaseID;
		if(phaseID == StateIdentifier.stateNotExist)
			System.out.println("DEBUG: error JRTStatePhase");
	}

	protected void addState(StateIdentifier state, VerilogNoneBlockAssign assignExpr){

		int stageID = state.getStageID();

		if(stageID == StateIdentifier.stateNotExist){
			this.assignExpr = assignExpr;
		}
		else{
			JRTStateStage stageState = stageID_stageState.get(stageID);

			if(stageState==null){
				stageState = new JRTStateStage(stageID);
				stageID_stageState.put(stageID, stageState);
			}
			stageState.addState(state, assignExpr);
		}
	}

	protected VerilogCaseChild makeAlways(VerilogMethod method){

		int bitWidth = method.getPhaseReg().bitWidth;
		String phaseIdStr = Integer.toHexString(phaseID);
		VerilogLiteralNumber phaseIdLiteral = new VerilogLiteralNumber(bitWidth, VerilogLiteralNumber.typeHexadecimal, phaseIdStr);

		VerilogCaseChild phaseCaseChild = new VerilogCaseChild();
		phaseCaseChild.setCond(phaseIdLiteral);

		if(assignExpr!=null)
			phaseCaseChild.addNoneBlockStat(assignExpr);

		if(stageID_stageState.size()>0){

			VerilogCaseStatement stageControl = new VerilogCaseStatement();
			stageControl.setBranchSignal(method.getStageReg());

			for(Map.Entry<Integer, JRTStateStage> stage : stageID_stageState.entrySet())
				stageControl.addChildStat( stage.getValue().makeAlways(method ) );

			phaseCaseChild.addChildBlock( stageControl );
		}

		return phaseCaseChild;
	}

}
