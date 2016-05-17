package net.njlab.circuit;

/**
 *  @author Keisuke Koike
 */
public class VerilogLiteralNumber extends VerilogExpr{

	String numberString;
	String type;

	public final static String typeDecimal = "'d";
	public final static String typeHexadecimal = "'h";
	public final static String typeBinary = "'b";
	public final static String typeSignedDecimal = "'sd";
	public final static String typeSignedHexadecimal = "'sh";
	public final static String typeSignedBinary = "'sb";

	public VerilogLiteralNumber(int bitWidth, String type, String number){
		numberString = number;
		this.type = type;
		this.bitWidth = bitWidth;
	}

	@Override
	public String getExprString(int modifiedBitWidth, boolean expandType){//Literal はビット拡張も縮小もしない
		return bitWidth+type+numberString;
	}

	public int getNumber(){

		if(type.compareTo(typeHexadecimal)==0 || type.compareTo(typeSignedHexadecimal)==0)
			return Integer.parseInt(numberString, 16);

		if(type.compareTo(typeDecimal)==0 || type.compareTo(typeSignedDecimal)==0)
			return Integer.parseInt(numberString);

		return Integer.parseInt(numberString, 2);
	}
}
