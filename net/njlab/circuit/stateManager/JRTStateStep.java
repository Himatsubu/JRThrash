package net.njlab.circuit.stateManager;

import java.util.ArrayList;

import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.model.VerilogBinary;
import net.njlab.model.VerilogMethod;

/**
 * @author koike
 * */
public class JRTStateStep  extends JRTState{


	private int stepID;
	private VerilogNoneBlockAssign assignExpr;

	public JRTStateStep(int stepID, VerilogNoneBlockAssign assignExpr){

		//System.out.println("JRTStateStep   "+stepID+"  "+assignExpr.getDestReg().name+"  "+assignExpr.getSrcReg().name);

		this.assignExpr = assignExpr;
		this.stepID = stepID;
		if(stepID == StateIdentifier.stateNotExist)
			System.out.println("DEBUG: error JRTStateStage");
	}

	protected void addState(StateIdentifier state, VerilogNoneBlockAssign assignExpr){
		System.out.println("DEBUG: erro dont call JRTStateSteo addState");
	}


	protected VerilogSignalString makeEQbinary(VerilogMethod method){

		int bitWidth = method.getStepRegister().bitWidth;

		String eqBinaryString = "("+method.getStepRegister().getSigName()+VerilogBinary.EQ+bitWidth+VerilogLiteralNumber.typeHexadecimal+Integer.toHexString(stepID)+")";
		VerilogSignalString eqBinarySignal = new VerilogSignalString(eqBinaryString, 1, VerilogSignal.unsigned);
		return eqBinarySignal;

		/*
		VerilogLiteralNumber stepLiteral = new VerilogLiteralNumber(bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(stepID));
		VerilogSignalString stepLiteralString = new VerilogSignalString(stepLiteral.getExprString(bitWidth, VerilogSignal.unsigned), bitWidth, VerilogSignal.unsigned);
		VerilogBinaryExpression eqBinary = new VerilogBinaryExpression(method.getStepRegister(), stepLiteralString, VerilogBinary.EQ);	//regStep == literal
		VerilogSignalString eqBinaryString = new VerilogSignalString(eqBinary.getExprString(1, VerilogSignal.unsigned), 1, VerilogSignal.unsigned);
		return eqBinaryString;*/
	}

	static String makeIfStateCond(ArrayList<JRTStateStep> continuitySteps, VerilogReg stepReg){

		int stepNumOfUsingInequality = 4;	//この変数以上の連続するステップから, 不等号形式でステートを作成する   stepID = 4,5,6,7  =>  (4<=regStep && regStep<=7)
		String retStr = "";
		int bitWidth = stepReg.bitWidth;

		if(stepNumOfUsingInequality <= continuitySteps.size()){
			VerilogLiteralNumber startStep = new VerilogLiteralNumber(bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(continuitySteps.get(0).stepID));
			VerilogLiteralNumber endStep = new VerilogLiteralNumber(bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(continuitySteps.get(continuitySteps.size()-1).stepID));

			retStr += startStep.getExprString(bitWidth, VerilogSignal.unsigned) + VerilogBinary.LE + stepReg.getSigName();
			retStr += " "+VerilogBinary.AND+" ";
			retStr += stepReg.getSigName() + VerilogBinary.LE + endStep.getExprString(bitWidth, VerilogSignal.unsigned);
			retStr = "("+retStr+")";
		}
		else{
			VerilogLiteralNumber stepLiteral = new VerilogLiteralNumber(bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(continuitySteps.get(0).stepID));
			retStr += "("+stepReg.getSigName() + VerilogBinary.EQ + stepLiteral.getExprString(bitWidth, VerilogSignal.unsigned)+")";

			for(int i=1; i<continuitySteps.size(); ++i){
				stepLiteral = new VerilogLiteralNumber(bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(continuitySteps.get(i).stepID));
				retStr += " "+VerilogBinary.OR+" ("+stepReg.getSigName() + VerilogBinary.EQ + stepLiteral.getExprString(bitWidth, VerilogSignal.unsigned)+")";
			}
		}
		return retStr;
	}

	protected VerilogNoneBlockAssign getNbAssign(){
		return assignExpr;
	}

	protected int getStepID(){
		return stepID;
	}
}
