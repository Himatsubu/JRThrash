package net.njlab.circuit;

/**
 *  @author Keisuke Koike
 */
public class VerilogUnaryExpression extends VerilogExpr{

	VerilogSignal signal;
	String opString;

	public static String  plus = "+";
	public static String  minus = "-";
	public static String  tilde = "~";
	public static String  not = "!";

	public VerilogUnaryExpression(VerilogSignal signal, String opString){
		this.signal = signal;
		this.opString = opString;
		if(opString.compareTo(plus)==0 || opString.compareTo(minus)==0 || opString.compareTo(tilde)==0){
			this.opString =opString;
			bitWidth = signal.bitWidth;
		}
		else if(opString.compareTo(not)==0){
			this.opString =opString;
			bitWidth = 1;
		}
		else{
			System.out.println("DEBUG:	VerilogUnary error operation");
		}
	}
/*
    public static final int POS = ERRONEOUS + 1;             // +
    public static final int NEG = POS + 1;                   // -
    public static final int NOT = NEG + 1;                   // !
    public static final int COMPL = NOT + 1;                 // ~
*/
	@Override
	public String getExprString(int modifiedBitWidth, boolean parentSignType){

		String ret;
		if(bitWidth < modifiedBitWidth){//拡張を要する
			int remainder = modifiedBitWidth - bitWidth;
			if(parentSignType==VerilogSignal.signed && signal.isSigned)	//自分もassign先も符号付 => 最上位bit拡張
				ret = "("+opString + "{ {"+remainder+"{"+signal.getSigName()+"["+(bitWidth-1)+"]}}, "+signal.getSigName()+"})";
			else
				ret =  "("+opString + "{"+remainder+"'d0, "+signal.getSigName()+"})";
		}
		else if(bitWidth > modifiedBitWidth){//縮小を要する
			ret = "( "+opString+signal.getSigName() + "["+(modifiedBitWidth-1)+":0] )";
		}
		else{
			ret = "( "+opString+signal.getSigName()+" )";
		}
		return ret;
	}
}
