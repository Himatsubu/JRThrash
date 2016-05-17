package net.njlab.circuit;

/**
 *  @author Keisuke Koike
 */
public class VerilogSignalString extends VerilogSignal{

	String exprString;
	VerilogSignal originalSignal;

	public VerilogSignalString(String exprString, VerilogSignal originalSignal){
		this.exprString = exprString;
		this.originalSignal = originalSignal;
		this.bitWidth = originalSignal.bitWidth;
		isSigned = originalSignal.isSigned;
	}

	public VerilogSignalString(String exprString, int bitWidth, boolean isSigned){
		this.exprString = exprString;
		this.bitWidth = bitWidth;
		this.isSigned = isSigned;
	}

	@Override
	public String getExprString(int modifiedBitWidth, boolean expandType){
		return exprString;
	}

	static public VerilogSignalString getZero(int bitWidth, boolean isSigned){

		String sign = isSigned ? VerilogLiteralNumber.typeSignedHexadecimal : VerilogLiteralNumber.typeHexadecimal;
		VerilogSignalString zero = new VerilogSignalString(bitWidth+sign+"0", bitWidth, isSigned);
		return zero;
	}
}
