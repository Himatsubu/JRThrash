package net.njlab.circuit;

import java.io.PrintWriter;
import java.util.ArrayList;
import net.njlab.dump.Dump;

/**
 *  @author Keisuke Koike
 */
public class VerilogIfStatement extends VerilogBlockStatement{

	VerilogExpr cond = null;	//cond == null -> else
	VerilogIfStatement elsePart;
	ArrayList<VerilogBlockStatement> childBlock = new ArrayList<VerilogBlockStatement>();
	ArrayList<VerilogNoneBlockAssign> thenChildAssign = new ArrayList<VerilogNoneBlockAssign>();

	public VerilogIfStatement(){}

	public void setCond(VerilogExpr cond){
		this.cond = cond;
	}

	public void setElsePart(VerilogIfStatement elsePart){
		this.elsePart = elsePart;
	}

	public void addChildBlock(VerilogBlockStatement childBlock){
		this.childBlock.add(childBlock);
	}

	public void addThenChildAssign(VerilogNoneBlockAssign thenChild){
		this.thenChildAssign.add(thenChild);
	}

	/**
	 * 連なった if～else パートの最後に isStat を追加
	 * */
	public void setLastElsePart(VerilogIfStatement ifStat){

		VerilogIfStatement tmp = this;
		do{
			if(tmp.elsePart==null){
				tmp.setElsePart(ifStat);
				break;
			}
			else{
				tmp = tmp.elsePart;
			}
		}
		while(true);
	}

	@Override
	void dumpAlways(PrintWriter wout, int offset){

		if(cond!=null){
			Dump.tprintln(wout, offset, KeyWord.K_if+"("+cond.getExprString(cond.bitWidth, VerilogSignal.signed)+") "+KeyWord.K_begin);
		}
		else
			Dump.tprintln(wout, offset, KeyWord.K_begin);

		for(int i=0; i<thenChildAssign.size(); i++){
			thenChildAssign.get(i).dumpNonBlockAssign(wout, offset+1);

			if(i==thenChildAssign.size()-1)
				Dump.tprintln(wout, 0, "");
		}

		for(int i=0; i<childBlock.size(); i++){
			childBlock.get(i).dumpAlways(wout, offset+1);
		}
		Dump.tprintln(wout, offset, KeyWord.K_end);

		if(elsePart!=null){
			Dump.tprintln(wout, offset, KeyWord.K_else);
			elsePart.dumpAlways(wout, offset);
		}
	}
}
/**
 *  if(cond) begin
 *  	if()begin	//childBlock
 *
 *  	end
 *  	regA <= regB + regC;	//<-thenChildAssign
 *  end
 *  else if()begin  //////////
 *  				//elsePart
 *  end				//////////
 *
 */