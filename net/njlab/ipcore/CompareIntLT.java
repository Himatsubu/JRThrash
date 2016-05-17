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
public class CompareIntLT  extends VerilogIPcore{

	public VerilogReg portA;
	public VerilogReg portB;
	public VerilogWire result;
	public VerilogSignal clock;
	public Config config;

	public CompareIntLT(String instanceName,
						  VerilogReg portA, VerilogReg portB, VerilogWire result, VerilogReg newData, VerilogSignal clock,
						  Config config, VerilogClass parentClass){

		latency = config.intLessThanLatency;
		throughput = config.intLessThanThroughput;
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

		Dump.tprintln(wout, offset, config.cmpIntLtModuleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");
		if(clock!=null)
			Dump.tprintln(wout, offset+2, "."+config.cmpIntLtClkPort+" ("+clock.getSigName()+"),");
		if(clockEnable!=null)
			Dump.tprintln(wout, offset+2, "."+config.cmpIntLtClkEnPort+" ("+clockEnable.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.cmpIntLtLeftPort+" ("+portA.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.cmpIntLtRightPort+" ("+portB.getSigName()+"),");
		if(newData!=null)
			Dump.tprintln(wout, offset+2, "."+config.cmpIntLtNewDataPort+" ("+newData.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.cmpIntLtResultPort+" ("+result.getSigName()+")");
		Dump.tprintln(wout, offset+1, ");");
	}

	static public CompareIntLT makeCompareIntLtIP(int num, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+config.cmpIntLtModuleName;
		VerilogReg portA = new VerilogReg(initial+KeyWord.K_portA_+num, config.cmpIntLtLeftBitWidth , VerilogSignal.signed);
		VerilogReg portB = new VerilogReg(initial+KeyWord.K_portB_+num, config.cmpIntLtRightBitWidth, VerilogSignal.signed);
		VerilogReg newData= (config.intLessThanHaveNewData) ? new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;
		VerilogWire result = new VerilogWire(initial+KeyWord.K_result_+num, config.cmpIntLtResultBitWidth, VerilogSignal.unsigned);
		CompareIntLT tmp = new CompareIntLT(config.cmpIntLtModuleName+KeyWord.K_inst_+num, portA, portB, result, newData, claz.getClock(), config, claz);
		claz.getModule().addCompareIntLT(tmp);
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
