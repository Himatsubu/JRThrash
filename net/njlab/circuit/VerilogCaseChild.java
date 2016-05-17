package net.njlab.circuit;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.dump.Dump;

/**
 *  @author Keisuke Koike
 */
public class VerilogCaseChild extends VerilogBlockStatement{

	VerilogLiteralNumber cond;
	private boolean isDefault = false;
	ArrayList<VerilogNoneBlockAssign> noneBlockAssign = new ArrayList<VerilogNoneBlockAssign>();
	ArrayList<VerilogBlockStatement> childBlock = new ArrayList<VerilogBlockStatement>();

	public void setCond(VerilogLiteralNumber literal){
		cond = literal;
	}

	public void addChildBlock(VerilogBlockStatement childBlock){
		this.childBlock.add(childBlock);
	}

	public void addNoneBlockStat(VerilogNoneBlockAssign assign){
		noneBlockAssign.add(assign);
	}

	public ArrayList<VerilogNoneBlockAssign> getNoneBlockAssign(){
		return noneBlockAssign;
	}

	public void setIsDefault(boolean isDefault){
		this.isDefault = isDefault;
	}

	public boolean getIsDefault(){
		return isDefault;
	}

	public ArrayList<VerilogBlockStatement> getChildBlock(){
		return childBlock;
	}

	public int getCondNumber(){

		if(isDefault)
			System.out.println("DEBUG: error VerilogCaseChild getCondNumber");

		return cond.getNumber();
	}

	void dumpAlways(PrintWriter wout, int offset){

		if(isDefault)
			Dump.tprintln(wout, offset, KeyWord.K_default+": "+KeyWord.K_begin);
		else
			Dump.tprintln(wout, offset, cond.getExprString(cond.bitWidth, VerilogSignal.signed)+": "+KeyWord.K_begin);

		for(int i=0; i<noneBlockAssign.size(); i++){
			noneBlockAssign.get(i).dumpNonBlockAssign(wout, offset+1);
		}

		for(int i=0; i<childBlock.size(); i++){
			childBlock.get(i).dumpAlways(wout, offset+1);
		}

		Dump.tprintln(wout, offset, KeyWord.K_end+"\n");
	}

	public boolean haveStepControlAssign(VerilogReg stepControlReg){

		for(VerilogNoneBlockAssign assign : noneBlockAssign){
			if(assign.getDestReg()==stepControlReg)
				return true;
		}
		return false;
	}
}
