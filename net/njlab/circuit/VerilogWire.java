package net.njlab.circuit;

/**
 *  @author Keisuke Koike
 */
import java.io.PrintWriter;
import java.util.Map;

import net.njlab.dump.Dump;

public class VerilogWire extends VerilogSignal{

	protected boolean isDeleted = false;
	protected boolean isTmpWire = false;

	public VerilogWire(String wireName, int bitWidth, VerilogExpr assignExpr, boolean isSigned){

		this.setSigName(KeyWord.K_w_+wireName);
		this.bitWidth = bitWidth;
		this.assignExpr = assignExpr;
		this.isSigned = isSigned;

		if(assignExpr==null){
			System.out.println("DEBUG:	VerilogWire wire assign error");
            StackTraceElement[] elements = Thread.currentThread().getStackTrace();
            for (int i = 0; i < elements.length; i++)
            	System.out.println("DEBUG:	error VerilogWire "+elements[i]);
		}

		if(assignExpr instanceof VerilogSignal)
			if(((VerilogSignal)assignExpr).isSigned!=isSigned)
				System.out.println("DEBUG:	error VerilogWire signed error  "+getSigName()+"	"+((VerilogSignal)assignExpr).getSigName());
	}

	public VerilogWire(String wireName, int bitWidth, boolean isSigned){
		this.setSigName(KeyWord.K_w_+wireName);
		this.bitWidth = bitWidth;
		this.isSigned = isSigned;
	}

	public void addAssignSignal(VerilogExpr arbiterSignal, VerilogExpr assignSignal){
		arbiter_assignSignals.put(arbiterSignal, assignSignal);
	}

	public void setAssignExpression(VerilogExpr assignSignal){
		this.assignExpr = assignSignal;

		if(assignExpr instanceof VerilogSignal)
			if(((VerilogSignal)assignExpr).isSigned != isSigned)
				System.out.println("DEBUG:	error VerilogWire signed error..  "+getSigName()+"	"+((VerilogSignal)assignExpr).getSigName());
	}

	@Override
	public void dumpRegWire(PrintWriter out, int offset){

		if(isTmpWire && assignExpr==null && arbiter_assignSignals.size()==0)
			return;

		String signed;
		if(isSigned)
			signed = KeyWord.K_signed;
		else
			signed = "      ";
		Dump.tprintln(out, offset, KeyWord.K_wire+" "+signed+" "+Dump.bitWidthString(bitWidth)+" "+getSigName()+";");
	}

	@Override
	public void dumpAssignStatement(PrintWriter out, int offset){

		if(assignExpr==null && this.arbiter_assignSignals.size()==0)
			return;

		if(arbiter_assignSignals.size()==0){
			Dump.tprintln(out, offset, KeyWord.K_assign+" "+getSigName()+" "+KeyWord.K_assignEQ+" "+assignExpr.getExprString(bitWidth, isSigned)+";");
		}
		else{
			dumpArbiterAssign(out, offset, bitWidth, isSigned);
		}
	}

	public void deleted(){
		isDeleted = true;
	}



	/**
	 * assign name = ( arbiter(0) ? assignSignals(0) : ( arbiter(1) ? assignSignals(1) : ( arbiter(2) ? assignSignals(2) :  assignSignal) )  );
	 * */

	/**
	 * assign name = assignValue; //ex 32'd10202
	 * */
}
