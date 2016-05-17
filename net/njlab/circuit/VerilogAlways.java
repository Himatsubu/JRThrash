package net.njlab.circuit;

import java.io.PrintWriter;

import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;

/**
 *  @author Keisuke Koike
 */

public class VerilogAlways extends VerilogBlockStatement{

	VerilogIfStatement ifStat;
	VerilogCaseStatement caseStat;
	VerilogSignal clk;
	VerilogClass claz;

	public VerilogAlways(VerilogSignal clk, VerilogClass claz){
		this.clk = clk;
		this.claz = claz;
	}

	public void setIfStat(VerilogIfStatement ifStat){
		this.ifStat = ifStat;
	}

	public void setCaseStat(VerilogCaseStatement caseStat){
		this.caseStat = caseStat;
	}

	VerilogIfStatement getResetPart(){
		return ifStat;
	}

	VerilogIfStatement getProcessPart(){
		return ifStat.elsePart;
	}

	public void dumpAlways(PrintWriter wout, int offset){

		String edgeTrigger = claz.config.isPositiveEdge ? (KeyWord.K_posedge) : (KeyWord.K_negedge);
		Dump.tprintln(wout, offset, KeyWord.K_always+"("+edgeTrigger+" "+clk.getExprString(clk.bitWidth, clk.isSigned)+")"+KeyWord.K_begin+"\n");

		if(ifStat!=null)
			ifStat.dumpAlways(wout, offset+1);
		else
			caseStat.dumpAlways(wout, offset+1);

		Dump.tprintln(wout, offset, KeyWord.K_end+"\n\n");
	}
}

/**
 * always@(posedge clk)begin
 *     if(reset)begin ///////////
 *         ...        //ResetPart
 *     end            ///////////
 *
 *     else begin     ///////////
 *        ...         //ProcessPart
 *     end            //////////
 *
 * end
 * */
