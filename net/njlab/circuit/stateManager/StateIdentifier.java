package net.njlab.circuit.stateManager;

/**
 * @author koike
 * */
public class StateIdentifier {

	public static int stateNotExist = -1;
	private int methodID = stateNotExist;	//setter 作成禁止
	private int phaseID = stateNotExist;	//setter 作成禁止
	private int stageID = stateNotExist;	//setter 作成禁止
	private int stepID = stateNotExist;		//setter 作成禁止
	private boolean isResetPart = false;	//setter 作成禁止

	public StateIdentifier(int methodID, int phaseID, int stageID, int stepID, boolean isResetPart){

		this.methodID = methodID;
		this.phaseID = phaseID;
		this.stageID = stageID;
		this.stepID = stepID;
		this.isResetPart = isResetPart;
	}


	protected int getMethodID(){
		return methodID;
	}

	protected int getPhaseID(){
		return phaseID;
	}

	protected int getStageID(){
		return stageID;
	}

	public int getStepID(){
		return stepID;
	}

	protected boolean isResetPart(){
		return isResetPart;
	}
}
