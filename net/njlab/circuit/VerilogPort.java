package net.njlab.circuit;

import java.io.PrintWriter;

import net.njlab.dump.Dump;
import net.njlab.model.VerilogVariableDecl;

/**
 *  @author Keisuke Koike
 */
public class VerilogPort extends VerilogSignal{

	int direction;
	public static final int input = 0;
	public static final int output = 1;
	VerilogVariableDecl originalVariable;
	StringBuffer modulePath = new StringBuffer("");	//このポートの元となった信号（変数）を持つ下位モジュールからのオブジェクト名パス

	public int bramControllSignalType;
	public static final int isBramAddr        = 1;	//このポートは，Bramアドレス制御用信号のポートである
	public static final int isBramRorW        = isBramAddr + 1;	//このポートは，Bramリードライト制御用信号のポートである
	public static final int isBramDataIn      = isBramRorW + 1;	//このポートは，Bram入力データ制御用信号のポートである
	public static final int isBramDataOut     = isBramDataIn + 1;	//このポートは，Bram出力データ制御用信号のポートである
	public static final int isBramClockEnable = isBramDataOut + 1;	//このポートは，Bramクロックイネーブル制御用信号のポートである
	public static final int isBramCacheHit = isBramClockEnable + 1;	//このポートはキャッシュヒット制御用のポートである.
	public static final int isNotBramControl = isBramCacheHit + 1;	//このポートは，Bram制御信号ではない

	public VerilogPort(String portName, int direction, int bitWidth, VerilogExpr assignRegWire, boolean isSigned, VerilogVariableDecl originalVariable, int signalType){

		if(direction==input)
			this.setSigName(KeyWord.K_i_+portName);
		else if(direction==output)
			this.setSigName(KeyWord.K_o_+portName);
		this.direction = direction;
		this.bitWidth = bitWidth;
		this.assignExpr = assignRegWire;
		this.originalVariable = originalVariable;
		this.bramControllSignalType = signalType;

		if(getSigName()==null){
			StackTraceElement[] elements = Thread.currentThread().getStackTrace();
			for (int i = 0; i < elements.length; i++)
				System.out.println("DEBUG:	error VerilogPort "+elements[i]);
		}

		this.isSigned = isSigned;
		if(assignRegWire==null)
			System.out.println("DEBUG:	error port assign");
	}

	public VerilogPort(String portName, int direction, int bitWidth, boolean isSigned, VerilogVariableDecl originalVariable, int signalType){

		if(portName.compareTo(KeyWord.K_clock)==0)
			setSigName(KeyWord.K_clock);
		else if(portName.compareTo(KeyWord.K_reset)==0)
			setSigName(KeyWord.K_reset);
		else if(portName.compareTo(KeyWord.K_reset_n)==0){
			setSigName(KeyWord.K_reset_n);
		}
		else if(portName.compareTo(KeyWord.K_ce)==0){
			setSigName(KeyWord.K_ce);
		}
		else
		{
			if(direction==input)
				setSigName(KeyWord.K_i_+portName);
			else if(direction==output)
				setSigName(KeyWord.K_o_+portName);
		}

		this.direction = direction;
		this.bitWidth = bitWidth;
		this.originalVariable = originalVariable;
		this.bramControllSignalType = signalType;

		if(getSigName()==null){
			StackTraceElement[] elements = Thread.currentThread().getStackTrace();
			for (int i = 0; i < elements.length; i++)
				System.out.println("DEBUG:	error VerilogPort "+elements[i]);
		}
		this.isSigned = isSigned;
	}

	public void addAssignSignal(VerilogExpr arbiterSignal, VerilogExpr assignSignal){
		arbiter_assignSignals.put(arbiterSignal, assignSignal);
	}

	public void setAssignExpression(VerilogExpr assignSignal){
		this.assignExpr = assignSignal;

		if(assignExpr instanceof VerilogSignal)
			if(((VerilogSignal)assignExpr).isSigned!=isSigned)
				System.out.println("DEBUG:	error VerilogPort signed error..  "+getSigName()+"	"+((VerilogSignal)assignExpr).getSigName());
	}

	public void dumpPort(PrintWriter out, int offset){
		if(direction==input)
			Dump.tprint(out, offset, KeyWord.K_input+" ");
		else if(direction==output)
			Dump.tprint(out, offset, KeyWord.K_output);
		if(isSigned)
			Dump.tprint(out, 0, " "+KeyWord.K_signed+" ");
		else
			Dump.tprint(out, 0, "        ");
		Dump.tprint(out, 0, " "+Dump.bitWidthString(bitWidth)+" "+getSigName());
	}

	@Override
	public void dumpAssignStatement(PrintWriter out, int offset){

		if(assignExpr==null && this.arbiter_assignSignals.size()==0) return;

		if(arbiter_assignSignals.size()==0){
			Dump.tprintln(out, offset, KeyWord.K_assign+" "+getSigName()+" "+KeyWord.K_assignEQ+" "+assignExpr.getExprString(bitWidth, isSigned)+";");
		}
		else{
			dumpArbiterAssign(out, offset, bitWidth, isSigned);
		}
	}

	public VerilogVariableDecl getOriginalvariable(){
		return originalVariable;
	}

	public void setModulePath(String modulePath){
		this.modulePath.insert(0, modulePath);
	}

	public String getModulePath(){
		return modulePath.toString();
	}

	public int getDirection(){
		return direction;
	}
}
