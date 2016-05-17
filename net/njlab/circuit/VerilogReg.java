package net.njlab.circuit;

import java.io.PrintWriter;

import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.circuit.stateManager.StateManager;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;

/**
 *  @author Keisuke Koike
 */
public class VerilogReg extends VerilogSignal implements Comparable<VerilogReg>{

	VerilogSignal methodStart = null;		//メソッド開始時に値を代入するレジスタの場合のメソッド開始を命令するシグナル
	VerilogSignal methodStartValue = null; //メソッド開始時に値を代入するレジスタの場合のメソッド開始時に代入するシグナル
	public int usedTime = 0;
	private int tmpRegID;
	private StateManager stateManager = new StateManager();

	public VerilogReg(String regName, int bitWidth, boolean isSigned){
		this.setSigName(KeyWord.K_r_+regName);
		this.bitWidth = bitWidth;
		this.isSigned = isSigned;
	}

	@Override
	public void dumpRegWire(PrintWriter out, int offset){
		String signed;
		if(isSigned)
			signed = KeyWord.K_signed;
		else
			signed = "      ";
		Dump.tprintln(out, offset, KeyWord.K_reg+"  "+signed+" "+Dump.bitWidthString(bitWidth)+" "+getSigName()+";");
	}

	@Override
	public int compareTo(VerilogReg obj){
        int n1 = this.usedTime;
        int n2 = obj.usedTime;

        if(n1==n2)
        	return 0;

        return n1 < n2 ? -1 : 1;
    }

	public int getTmpRegID(){
		return tmpRegID;
	}

	public void setTmpRegID(int regID){
		tmpRegID = regID;
	}

	protected void registerState(StateIdentifier state, VerilogNoneBlockAssign assignExpr){

		stateManager.registerState(state, assignExpr);
	}

	protected void dumpAlways(PrintWriter wout, int offset){
		stateManager.dumpAlways(wout, offset);
	}

	protected void makeAlways(VerilogClass parentClass){
		stateManager.makeAlways(parentClass);
	}
}
