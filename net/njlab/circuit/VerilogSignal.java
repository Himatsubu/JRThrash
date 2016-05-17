package net.njlab.circuit;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import net.njlab.dump.Dump;

/**
 *  @author Keisuke Koike
 */
public class VerilogSignal extends VerilogExpr{

	private String name;
	//public String assignValue;//assign する数値
	//public VerilogSignal assignSignal; //assign するレジスタやワイヤ
	public VerilogExpr assignExpr; //assign する式
	// assign するレジスタやワイヤの選択信号(arbiter)  と  assign するレジスタやワイヤ (assignSignal)
	public Map<VerilogExpr, VerilogExpr> arbiter_assignSignals = new HashMap<VerilogExpr, VerilogExpr>();

	public boolean isSigned;
	public static final boolean signed = true;
	public static final boolean unsigned = false;
	public void dumpRegWire(PrintWriter out, int offset){}
	public void dumpAssignStatement(PrintWriter out, int offset){}

	@Override
	public String getExprString(int modifiedBitWidth, boolean parentSignType){

		String ret;
		if(bitWidth < modifiedBitWidth){//拡張を要する

			int remainder = modifiedBitWidth - bitWidth;
			if((parentSignType==VerilogSignal.signed)  && isSigned)	//自分もassign先も符号付 => 最上位bit拡張
				ret = "$signed( {{"+remainder+"{"+name+"["+(bitWidth-1)+"]}}, "+name+"} )";
			else
				ret =  "{"+remainder+"'h0, "+name+"}";
		}
		else if(bitWidth > modifiedBitWidth){

			if((parentSignType==VerilogSignal.signed)  && isSigned)
				ret = "$signed( "+name + "["+(modifiedBitWidth-1)+":0] )";
			else
				ret = name + "["+(modifiedBitWidth-1)+":0]";
		}
		else{//bit幅の変更無し
			ret = name;
		}
		return ret;
	}

	protected void dumpArbiterAssign(PrintWriter out, int offset, int bitWidth, boolean isSigned){

		StringBuffer assignString = new StringBuffer("");
		int signalCount = 0;

		for(Map.Entry<VerilogExpr, VerilogExpr>  arbiter_assignSignals : this.arbiter_assignSignals.entrySet()){

			++signalCount;
			String arbiterName = arbiter_assignSignals.getKey().getExprString(arbiter_assignSignals.getKey().bitWidth, isSigned);
			String assignSignalName = arbiter_assignSignals.getValue().getExprString(bitWidth, VerilogSignal.signed);
			assignString.append("( "+arbiterName+" ? "+assignSignalName+" : ");

			if(signalCount==this.arbiter_assignSignals.size()){

				if(assignExpr!=null){
					assignString.append(assignExpr.getExprString(bitWidth, isSigned));
				}
				else{
					System.out.println("DEBUG:	error VerilogSignal dumpArbiterAssign");
					String sign = isSigned ? VerilogLiteralNumber.typeSignedHexadecimal : VerilogLiteralNumber.typeHexadecimal;
					VerilogSignalString zero = new VerilogSignalString(bitWidth+sign+"0", bitWidth, isSigned);
					assignString.append(zero.getExprString(zero.bitWidth, zero.isSigned));
				}
			}
		}
		while(signalCount>0){
			assignString.append(" ) ");
			signalCount--;
		}
		Dump.tprintln(out, offset, KeyWord.K_assign+" "+name+" "+KeyWord.K_assignEQ+" "+assignString.toString()+";");
	}

//	/**
//	 * for debug ワイヤ最適化で消されたワイヤが使われていないかチェック
//	 * */
//	private boolean checkDeletedWireIsUsed(){
//
//		if(this instanceof VerilogWire)
//			return ((VerilogWire)this).isDeleted;
//
//		return false;
//	}

	public String getSigName(){

		return name;
	}

	public void setSigName(String name){
		this.name = name;
	}
}














