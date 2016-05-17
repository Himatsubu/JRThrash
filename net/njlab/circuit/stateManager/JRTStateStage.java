package net.njlab.circuit.stateManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import net.njlab.circuit.VerilogCaseChild;
import net.njlab.circuit.VerilogExpr;
import net.njlab.circuit.VerilogIfStatement;
import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.model.VerilogBinary;
import net.njlab.model.VerilogMethod;


/**
 * @author koike
 * */
public class JRTStateStage extends JRTState{

	private int stageID;
	private VerilogNoneBlockAssign assignExpr;
	private Map<Integer, JRTStateStep> stepID_stepState = new TreeMap<Integer, JRTStateStep>();
	static private ArrayList<JRTStateStep> stepList = new ArrayList<JRTStateStep>();	//作業用 array

	//代入元 signal と その signal に代入するステップの集合
	private Map<VerilogSignal, ArrayList<JRTStateStep>> assignSignal_stepState = new HashMap<VerilogSignal, ArrayList<JRTStateStep>>();

	public JRTStateStage(int stageID){

		this.stageID = stageID;
		if(stageID == StateIdentifier.stateNotExist)
			System.out.println("DEBUG: error JRTStateStage");
	}

	protected void addState(StateIdentifier state, VerilogNoneBlockAssign assignExpr){

		int stepID = state.getStepID();

		if(stepID == StateIdentifier.stateNotExist)
			this.assignExpr = assignExpr;
		else
			stepID_stepState.put(stepID, new JRTStateStep(stepID, assignExpr));
	}

	protected VerilogCaseChild makeAlways(VerilogMethod method){

		int bitWidth = method.getStageReg().bitWidth;
		String stageIdStr = Integer.toHexString(stageID);
		VerilogLiteralNumber phaseIdLiteral = new VerilogLiteralNumber(bitWidth, VerilogLiteralNumber.typeHexadecimal, stageIdStr);

		VerilogCaseChild stageCaseChild = new VerilogCaseChild();
		stageCaseChild.setCond(phaseIdLiteral);

		if(assignExpr!=null)
			stageCaseChild.addNoneBlockStat(assignExpr);

		if(stepID_stepState.size() > 0){
			make_Signal_Step_Map();
			sortStepsInStepID();
			stageCaseChild.addChildBlock( makeIfStatForCompressState(method) );
		}
		return stageCaseChild;
	}

	private void make_Signal_Step_Map(){

		for(Map.Entry<Integer, JRTStateStep> stepID_step: stepID_stepState.entrySet()){

			JRTStateStep step = stepID_step.getValue();
			VerilogSignal srcSignal = step.getNbAssign().getSrcReg();
			ArrayList<JRTStateStep> stepListOwnSameSrc = assignSignal_stepState.get(srcSignal);

			if(stepListOwnSameSrc == null){
				stepListOwnSameSrc = new ArrayList<JRTStateStep>();
				assignSignal_stepState.put(srcSignal, stepListOwnSameSrc);
			}
			stepListOwnSameSrc.add(step);
		}
	}

	private void sortStepsInStepID(){

		Comparator cmp = new Comparator(){

			public int compare(Object obj0, Object obj1){
				JRTStateStep ary0 = (JRTStateStep)obj0;
				JRTStateStep ary1 = (JRTStateStep)obj1;
				return ary0.getStepID() - ary1.getStepID();
			}
		};

		for(Map.Entry<VerilogSignal, ArrayList<JRTStateStep>> signal_Steps: assignSignal_stepState.entrySet()){

			ArrayList<JRTStateStep> stepsOwnSameSrc = signal_Steps.getValue();
			Collections.sort(stepsOwnSameSrc, cmp);
		}
	}

	private VerilogIfStatement makeIfStatForCompressState(VerilogMethod method){

		VerilogIfStatement ifStat = null;//new VerilogIfStatement();

		for(Map.Entry<VerilogSignal, ArrayList<JRTStateStep>> signal_stepState : assignSignal_stepState.entrySet()){

			VerilogExpr condExpr = makeIfCondForCompressState(signal_stepState.getValue(), method);
			if( ifStat==null ){
				ifStat = new VerilogIfStatement();
				ifStat.setCond(condExpr);
				ifStat.addThenChildAssign(signal_stepState.getValue().get(0).getNbAssign());
			}
			else{
				VerilogIfStatement seqIfStat = new VerilogIfStatement();
				seqIfStat.setCond(condExpr);
				seqIfStat.addThenChildAssign(signal_stepState.getValue().get(0).getNbAssign());
				ifStat.setLastElsePart(seqIfStat);
			}
		}

		return ifStat;
	}


	/**
	 * ステートを圧縮しつつ if 文の条件部分を作る<br>
	 * 例: step = 1, 2, 3, 4, 7 =>  if(1<=regStepID && 4<=regStepID) || regStepID==7) <br>
	 * */
	private VerilogExpr makeIfCondForCompressState(ArrayList<JRTStateStep> stepsOwnSameSrc, VerilogMethod method){

		stepList.clear();
		stepList.add(stepsOwnSameSrc.get(0));
		String condStr = null;

		for(int i=1; i<stepsOwnSameSrc.size(); ++i){

			int prevStepID = stepList.get(stepList.size()-1).getStepID();
			int currentStepID = stepsOwnSameSrc.get(i).getStepID();

			if(prevStepID+1 == currentStepID){	//ステップが連続している
				stepList.add(stepsOwnSameSrc.get(i));
			}
			else{
				if(condStr == null)
					condStr = JRTStateStep.makeIfStateCond(stepList, method.getStepRegister());
				else
					condStr += " "+VerilogBinary.OR+" "+JRTStateStep.makeIfStateCond(stepList, method.getStepRegister());

				stepList.clear();
				stepList.add(stepsOwnSameSrc.get(i));
			}
		}

		if(condStr == null)
			condStr = JRTStateStep.makeIfStateCond(stepList, method.getStepRegister());
		else
			condStr += " "+VerilogBinary.OR+" "+JRTStateStep.makeIfStateCond(stepList, method.getStepRegister());

		VerilogSignalString condStrSignal = new VerilogSignalString(condStr, 1, VerilogSignal.unsigned);
		return condStrSignal;
	}
}

















