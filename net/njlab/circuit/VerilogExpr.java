package net.njlab.circuit;

/**
 *  @author Keisuke Koike
 */
public class VerilogExpr {//Verilog HDL の式
	public int bitWidth = 0;

	/**
	 * bit拡張or縮小をして式を返す
	 * @param modifiedBitWidth 拡張or縮小するビット幅
	 * @param parentSignType assign先のシグナルの符号
	 * */
	public String getExprString(int modifiedBitWidth, boolean parentSignType){
		return null;
	}
}
