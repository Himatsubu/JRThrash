package net.njlab.ipcore;

import java.io.PrintWriter;

import net.njlab.circuit.KeyWord;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogWire;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;

/**
 *  @author Keisuke Koike
 */
public class DivFloat  extends VerilogIPcore{ //portA / portB = result

	public VerilogSignal clock;
	public VerilogReg portA;
	public VerilogReg portB;
	public VerilogWire result;
	public Config config;

	public DivFloat(String instanceName,
			   		VerilogReg portA, VerilogReg portB, VerilogWire result, VerilogReg newData, VerilogSignal clock,
			   		Config config, VerilogClass parentClass){

		latency = config.divFloatLatency;
		throughput = config.divFloatThroughput;
		this.instanceName = instanceName;
		this.clock = (latency >= 1) ? clock : null;
		this.portA = portA;
		this.portB = portB;
		this.result = result;
		this.newData = newData;
		this.config = config;
		this.parentClass = parentClass;
		setClockEnable(config, latency, parentClass.wireClockEnable);
	}

	@Override
	public void dumpInstance(PrintWriter wout, int offset){

		Dump.tprintln(wout, offset, config.divFloatModuleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");
		if(clock!=null)
			Dump.tprintln(wout, offset+2, "."+config.divFloatClkPort+" ("+clock.getSigName()+"),");
		if(clockEnable!=null)
			Dump.tprintln(wout, offset+2, "."+config.divFloatClkEnPort+" ("+clockEnable.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.divFloatDividendPort+" ("+portA.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.divFloatDivisorPort+" ("+portB.getSigName()+"),");
		if(newData!=null)
			Dump.tprintln(wout, offset+2, "."+config.divFloatNewDataPort+" ("+newData.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.divFloatQuotientPort+" ("+result.getSigName()+")");
		Dump.tprintln(wout, offset+1, ");");
	}

	static public DivFloat makeDivFloatIP(int num, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+config.divFloatModuleName;
		VerilogReg portA = new VerilogReg(initial+KeyWord.K_dividend_+num, config.divFloatDividendBitWidth , VerilogSignal.unsigned);
		VerilogReg portB = new VerilogReg(initial+KeyWord.K_divisor_+num, config.divFloatDivisorBitWidth, VerilogSignal.unsigned);
		VerilogWire result = new VerilogWire(initial+KeyWord.K_quotient_+num, config.divFloatQuotientBitWidth, VerilogSignal.unsigned);
		VerilogReg newData= (config.divFloatHaveNewData) ? new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;
		DivFloat tmp = new DivFloat(config.divFloatModuleName+KeyWord.K_inst_+num, portA, portB, result, newData, claz.getClock(), config, claz);
		claz.getModule().addDivFloat(tmp);
		return tmp;
	}

	@Override
	public void addSignalToModule(){
		parentClass.getModule().addRegister(portA);
		parentClass.getModule().addRegister(portB);
		parentClass.getModule().addWire(result);
		if(newData!=null)
			parentClass.getModule().addRegister(newData);
	}
}
