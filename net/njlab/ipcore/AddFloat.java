package net.njlab.ipcore;

import java.io.PrintWriter;
import net.njlab.model.*;
import net.njlab.circuit.KeyWord;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogWire;
import net.njlab.config.*;
import net.njlab.dump.Dump;

/**
 *  @author Keisuke Koike
 */
public class AddFloat extends VerilogIPcore{	//portA+portB = result

	public VerilogSignal clock;
	public VerilogReg portA;
	public VerilogReg portB;
	public VerilogWire result;
	public Config config;

	AddFloat(String instanceName,
			VerilogReg portA, VerilogReg portB, VerilogWire result, VerilogReg newData, VerilogSignal clock,
			Config config, VerilogClass parentClass){

			latency = config.addFloatLatency;
			throughput = config.addFloatThroughput;
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

		Dump.tprintln(wout, offset, config.addFloatModuleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");
		if(clock!=null)
			Dump.tprintln(wout, offset+2, "."+config.addFloatClkPort+" ("+clock.getSigName()+"),");
		if(clockEnable!=null)
			Dump.tprintln(wout, offset+2, "."+config.addFloatClkEnPort+" ("+clockEnable.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.addFloatLeftPort+" ("+portA.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.addFloatRightPort+" ("+portB.getSigName()+"),");
		if(newData!=null)
			Dump.tprintln(wout, offset+2, "."+config.addFloatNewDataPort+" ("+newData.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.addFloatSumPort+" ("+result.getSigName()+")");
		Dump.tprintln(wout, offset+1, ");");
	}

	static public AddFloat makeAddFloatIP(int num, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+config.addFloatModuleName;
		VerilogReg portA = new VerilogReg(initial+KeyWord.K_portA_+num, config.addFloatLeftBitWidth , VerilogSignal.unsigned);
		VerilogReg portB = new VerilogReg(initial+KeyWord.K_portB_+num, config.addFloatRightBitWidth, VerilogSignal.unsigned);
		VerilogWire result = new VerilogWire(initial+KeyWord.K_result_+num, config.addFloatSumBitWidth, VerilogSignal.unsigned);
		VerilogReg newData= (config.addFloatHaveNewData) ? new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;
		AddFloat tmp = new AddFloat(config.addFloatModuleName+KeyWord.K_inst_+num, portA, portB, result, newData, claz.getClock(), config, claz);
		claz.getModule().addAddFloat(tmp);
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
