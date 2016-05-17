package net.njlab.circuit;

import java.io.PrintWriter;

import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.dump.Dump;

/**
 *  @author Keisuke Koike
 */
public class VerilogNoneBlockAssign{

	private VerilogReg destReg;
	private VerilogSignal srcReg;

	public VerilogNoneBlockAssign(VerilogReg destReg, VerilogSignal srcReg, StateIdentifier assignState){

		this.state = assignState;
		this.destReg = destReg;
		this.srcReg = srcReg;
		if(destReg.isSigned!=srcReg.isSigned)
			System.out.println("DEBUG:	error VerilogNoneBlockAssign	"+destReg.getSigName()+"	"+srcReg.getSigName());

		if(assignState!=null)
			destReg.registerState(assignState, this);
	}

	public void dumpNonBlockAssign(PrintWriter wout, int offset){
		Dump.tprintln(wout, offset,
					  destReg.getExprString(destReg.bitWidth, destReg.isSigned)+" "+KeyWord.K_noneBlock+" "+srcReg.getExprString(destReg.bitWidth, destReg.isSigned)+";");
	}

	public VerilogReg getDestReg(){
		return destReg;
	}

	public VerilogSignal getSrcReg(){
		return srcReg;
	}

	// for debugging
	private StateIdentifier state;

	public StateIdentifier getState(){
		return state;
	}
}
