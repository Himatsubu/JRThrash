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
public class CompareFloatLT  extends VerilogIPcore{

	public VerilogReg portA;
	public VerilogReg portB;
	public VerilogWire result;
	public VerilogSignal clock;
	public Config config;

	public CompareFloatLT(String instanceName,
						  VerilogReg portA, VerilogReg portB, VerilogWire result, VerilogReg newData, VerilogSignal clock,
						  Config config, VerilogClass parentClass){

		latency = config.floatLessThanLatency;
		throughput = config.floatLessThanThroughput;
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

		Dump.tprintln(wout, offset, config.cmpFloatLtModuleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");
		if(clock!=null)
			Dump.tprintln(wout, offset+2, "."+config.cmpFloatLtClkPort+" ("+clock.getSigName()+"),");
		if(clockEnable!=null)
			Dump.tprintln(wout, offset+2, "."+config.cmpFloatLtClkEnPort+" ("+clockEnable.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.cmpFloatLtLeftPort+" ("+portA.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.cmpFloatLtRightPort+" ("+portB.getSigName()+"),");
		if(newData!=null)
			Dump.tprintln(wout, offset+2, "."+config.cmpFloatLtNewDataPort+" ("+newData.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.cmpFloatLtResultPort+" ("+result.getSigName()+")");
		Dump.tprintln(wout, offset+1, ");");
	}


	static public CompareFloatLT makeCompareFloatLtIP(int num, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+config.cmpFloatLtModuleName;

		VerilogReg portA = new VerilogReg(initial+KeyWord.K_portA_+num, config.cmpFloatLtLeftBitWidth , VerilogSignal.unsigned);
		VerilogReg portB = new VerilogReg(initial+KeyWord.K_portB_+num, config.cmpFloatLtRightBitWidth, VerilogSignal.unsigned);
		VerilogWire result = new VerilogWire(initial+KeyWord.K_result_+num, config.cmpFloatLtResultBitWidth, VerilogSignal.unsigned);
		VerilogReg newData= (config.floatLessThanHaveNewData) ? new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;
		CompareFloatLT tmp = new CompareFloatLT(config.cmpFloatLtModuleName+KeyWord.K_inst_+num, portA, portB, result, newData, claz.getClock(), config, claz);
		claz.getModule().addCompareFloatLT(tmp);
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
