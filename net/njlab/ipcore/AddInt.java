package net.njlab.ipcore;

import java.io.PrintWriter;

import net.njlab.circuit.KeyWord;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogWire;
import net.njlab.config.*;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;

/**
 *  @author Keisuke Koike
 */
public class AddInt  extends VerilogIPcore{

	public VerilogSignal clock;
	public VerilogReg portA;
	public VerilogReg portB;
	public VerilogWire result;
	public VerilogReg addOrSub;
	public Config config;

	AddInt(String instanceName,
				  VerilogReg portA, VerilogReg portB, VerilogWire result, VerilogReg addOrSub, VerilogReg newData, VerilogSignal clock,
				  Config config, VerilogClass parentClass){

		latency = config.addIntLatency;
		throughput = config.addIntThroughput;
		this.instanceName = instanceName;
		this.clock = (latency >= 1) ? clock : null;
		this.addOrSub = addOrSub;
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

		Dump.tprintln(wout, offset, config.addIntModuleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");
		if(clock!=null)
			Dump.tprintln(wout, offset+2, "."+config.addIntClkPort+" ("+clock.getSigName()+"),");
		if(clockEnable!=null)
			Dump.tprintln(wout, offset+2, "."+config.addIntClkEnPort+" ("+clockEnable.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.addIntAddOrSub+" ("+addOrSub.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.addIntLeftPort+" ("+portA.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.addIntRightPort+" ("+portB.getSigName()+"),");
		if(newData!=null)
			Dump.tprintln(wout, offset+2, "."+config.addIntNewDataPort+" ("+newData.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.addIntSumPort+" ("+result.getSigName()+")");
		Dump.tprintln(wout, offset+1, ");");
	}

	static public AddInt makeAddIntIP(int num, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+config.addIntModuleName;
		VerilogReg portA = new VerilogReg(initial+KeyWord.K_portA_+num, config.addIntLeftBitWidth , VerilogSignal.signed);
		VerilogReg portB = new VerilogReg(initial+KeyWord.K_portB_+num, config.addIntRightBitWidth, VerilogSignal.signed);
		VerilogWire result = new VerilogWire(initial+KeyWord.K_result_+num, config.addIntSumBitWidth, VerilogSignal.signed);
		VerilogReg addOrSub = new VerilogReg(initial+KeyWord.K_addSub_+num, config.addIntAddOrSubBitWidth, VerilogSignal.unsigned);
		VerilogReg newData= (config.addIntHaveNewData) ? new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;
		AddInt tmp = new AddInt(config.addIntModuleName+KeyWord.K_inst_+num, portA, portB, result, addOrSub, newData, claz.getClock(), config, claz);
		claz.getModule().addAddInt(tmp);
		return tmp;
	}

	@Override
	public void addSignalToModule(){
		parentClass.getModule().addRegister(portA);
		parentClass.getModule().addRegister(portB);
		parentClass.getModule().addWire(result);
		parentClass.getModule().addRegister(addOrSub);
		if(newData!=null)
			parentClass.getModule().addRegister(newData);
	}
}
