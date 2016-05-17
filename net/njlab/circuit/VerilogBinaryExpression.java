package net.njlab.circuit;

import net.njlab.dump.Dump;
import net.njlab.model.VerilogBinary;

/**
 *  @author Keisuke Koike
 */
public class VerilogBinaryExpression extends VerilogExpr{

	VerilogSignal rightExpr;
	VerilogSignal leftExpr;
	String binaryOp;

	public VerilogBinaryExpression(VerilogSignal leftExpr, VerilogSignal rightExpr, String binaryOp){
		this.rightExpr = rightExpr;
		this.leftExpr = leftExpr;

		if(binaryOp.compareTo(VerilogBinary.OR)==0 || binaryOp.compareTo(VerilogBinary.AND)==0 ||
		   binaryOp.compareTo(VerilogBinary.EQ)==0 || binaryOp.compareTo(VerilogBinary.NE)==0  ||
		   binaryOp.compareTo(VerilogBinary.LT)==0 || binaryOp.compareTo(VerilogBinary.GT)==0  ||
		   binaryOp.compareTo(VerilogBinary.LE)==0 || binaryOp.compareTo(VerilogBinary.GE)==0){

			bitWidth = 1;
	    }
		else if(binaryOp.compareTo(VerilogBinary.BITOR)==0  || binaryOp.compareTo(VerilogBinary.BITXOR)==0 ||
				binaryOp.compareTo(VerilogBinary.BITAND)==0 || binaryOp.compareTo(VerilogBinary.PLUS)==0   ||
				binaryOp.compareTo(VerilogBinary.MINUS)==0  || binaryOp.compareTo(VerilogBinary.MUL)==0    ||
				binaryOp.compareTo(VerilogBinary.DIV)==0    || binaryOp.compareTo(VerilogBinary.MOD)==0){

			if(rightExpr.bitWidth > leftExpr.bitWidth)
				bitWidth = rightExpr.bitWidth;
			else
				bitWidth = leftExpr.bitWidth;
		}
		else if(binaryOp.compareTo(VerilogBinary.SL)==0  || binaryOp.compareTo(VerilogBinary.SR)==0 ||
				binaryOp.compareTo(VerilogBinary.USR)==0){
			bitWidth = leftExpr.bitWidth;
		}
		this.binaryOp = binaryOp;
	}

	/*//1bit
    public static final String OR =     "||";   // ||
    public static final String AND =    "&&";   // &&
    public static final String EQ =     "==";   // ==
    public static final String NE =     "!=";   // !=
    public static final String LT =     "<";    // <
    public static final String GT =     ">";    // >
    public static final String LE =     "<=";   // <=
    public static final String GE =     ">=";   // >=

	//左右のうち大きい方
    public static final String BITOR =  "|";    // |
    public static final String BITXOR = "^";    // ^
    public static final String BITAND = "&";    // &
	public static final String PLUS =   "+";    // +
    public static final String MINUS =  "-";    // -
    public static final String MUL =    "*";    // *
    public static final String DIV =    "/";    // /
    public static final String MOD =    "%";    // %

	//左
    public static final String SL =     "<<";   // <<
    public static final String SR =     ">>";   // >>
    public static final String USR =    ">>>";  // >>>
*/
	@Override
	public String getExprString(int modifiedBitWidth, boolean parentSignType){

		String rightExprString = null, leftExprString = null;

		if(binaryOp.compareTo(VerilogBinary.OR)==0 || binaryOp.compareTo(VerilogBinary.AND)==0 ||
		   binaryOp.compareTo(VerilogBinary.EQ)==0 || binaryOp.compareTo(VerilogBinary.NE)==0  ||
		   binaryOp.compareTo(VerilogBinary.LT)==0 || binaryOp.compareTo(VerilogBinary.GT)==0  ||
		   binaryOp.compareTo(VerilogBinary.LE)==0 || binaryOp.compareTo(VerilogBinary.GE)==0){

			if(leftExpr.bitWidth > rightExpr.bitWidth){	//左辺のbit幅 > 右辺のbit幅
				leftExprString = leftExpr.getExprString(leftExpr.bitWidth, true);
				//左右ともsigned -> 最上位bit拡張,     左右どちらかが unsigned -> 0拡張
				rightExprString = rightExpr.getExprString(leftExpr.bitWidth, leftExpr.isSigned && rightExpr.isSigned);
			}
			else if(leftExpr.bitWidth < rightExpr.bitWidth){
				rightExprString = rightExpr.getExprString(rightExpr.bitWidth, true);
				//左右ともsigned -> 最上位bit拡張,     左右どちらかが unsigned -> 0拡張
				leftExprString = leftExpr.getExprString(rightExpr.bitWidth, leftExpr.isSigned && rightExpr.isSigned);
			}
			else{
				leftExprString = leftExpr.getExprString(leftExpr.bitWidth, true);
				rightExprString = rightExpr.getExprString(rightExpr.bitWidth, true);
			}
		}
		//両辺の拡張のみ行う（切り詰めは行わない）{left op right}[MSB:LSB] がシミュレータでエラー
		else if(binaryOp.compareTo(VerilogBinary.BITOR)==0  || binaryOp.compareTo(VerilogBinary.BITXOR)==0 ||
				binaryOp.compareTo(VerilogBinary.BITAND)==0 || binaryOp.compareTo(VerilogBinary.PLUS)==0   ||
				binaryOp.compareTo(VerilogBinary.MINUS)==0  || binaryOp.compareTo(VerilogBinary.MUL)==0    ||
				binaryOp.compareTo(VerilogBinary.DIV)==0    || binaryOp.compareTo(VerilogBinary.MOD)==0){

			int maxBitWidth = Math.max(modifiedBitWidth, Math.max(leftExpr.bitWidth, rightExpr.bitWidth));
			if(maxBitWidth>leftExpr.bitWidth)
				leftExprString = leftExpr.getExprString(maxBitWidth, leftExpr.isSigned && rightExpr.isSigned);
			else
				leftExprString = leftExpr.getExprString(leftExpr.bitWidth, true);

			if(maxBitWidth>rightExpr.bitWidth)
				rightExprString = rightExpr.getExprString(maxBitWidth, leftExpr.isSigned && rightExpr.isSigned);
			else
				rightExprString = rightExpr.getExprString(rightExpr.bitWidth, true);
		}
		//assign先と比べて, 左辺の拡張のみ行う（切り詰めは行わない）{left op right}[MSB:LSB] がシミュレータでエラー
		else if(binaryOp.compareTo(VerilogBinary.SL)==0  || binaryOp.compareTo(VerilogBinary.SR)==0 ||
				binaryOp.compareTo(VerilogBinary.USR)==0){

			//シフトは左辺の符号に応じて拡張
			if(modifiedBitWidth>leftExpr.bitWidth)
				leftExprString = leftExpr.getExprString(modifiedBitWidth, leftExpr.isSigned);
			else
				leftExprString = leftExpr.getExprString(leftExpr.bitWidth, true);
			rightExprString = rightExpr.getExprString(rightExpr.bitWidth, true);
		}
		return "("+leftExprString+" "+ binaryOp+" "+ rightExprString+")";
	}
}
