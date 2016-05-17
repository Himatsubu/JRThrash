package net.njlab.circuit;

import java.io.PrintWriter;
import java.util.*;
import net.njlab.dump.Dump;

/**
 *  @author Keisuke Koike
 */
public class VerilogCaseStatement extends VerilogBlockStatement{

	ArrayList<VerilogCaseChild> childStat = new ArrayList<VerilogCaseChild>();
	VerilogSignal branch;

	public void addChildStat(VerilogCaseChild child){
		childStat.add(child);
	}

	public void setBranchSignal(VerilogSignal branchSignal){
		branch = branchSignal;
	}

	public ArrayList<VerilogCaseChild> getChildStat(){
		return childStat;
	}

	void dumpAlways(PrintWriter wout, int offset){

		Dump.tprintln(wout, 0, "");
		Dump.tprintln(wout, offset, KeyWord.K_case+"("+branch.getExprString(branch.bitWidth, VerilogSignal.signed)+") ");
		for(int i=0; i<childStat.size(); i++){
			childStat.get(i).dumpAlways(wout, offset+1);
		}
		Dump.tprintln(wout, offset, KeyWord.K_endcase);
	}
}
