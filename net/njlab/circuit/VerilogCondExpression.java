package net.njlab.circuit;


/**
 *  @author Keisuke Koike
 */
public class VerilogCondExpression extends VerilogExpr{

	VerilogSignal condSignal;
	VerilogSignal trueSignal;
	VerilogSignal falseSignal;

	public VerilogCondExpression(VerilogSignal condSignal, VerilogSignal trueSignal, VerilogSignal falseSignal){
		this.condSignal = condSignal;
		this.trueSignal = trueSignal;
		this.falseSignal = falseSignal;
	}

	@Override
	public String getExprString(int modifiedBitWidth, boolean parentSignType){

		return "(("+condSignal.getExprString(condSignal.bitWidth, condSignal.isSigned)+") ? "+
				trueSignal.getExprString(modifiedBitWidth, trueSignal.isSigned) +" : "+ falseSignal.getExprString(modifiedBitWidth, falseSignal.isSigned)+")";
	}
}
