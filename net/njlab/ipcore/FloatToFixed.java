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
public class FloatToFixed  extends VerilogIPcore{

	public VerilogSignal clock;
	public VerilogReg  portA;
	public VerilogWire result;
	public Config config;

	public FloatToFixed(String instanceName,
			   			VerilogReg portA, VerilogWire result, VerilogReg newData, VerilogSignal clock,
				   		Config config, VerilogClass parentClass){

		latency = config.floatToFixedLatency;
		throughput = config.floatToFixedThroughput;
		this.instanceName = instanceName;
		this.clock = (latency >= 1) ? clock : null;
		this.portA = portA;
		this.result = result;
		this.newData = newData;
		this.config = config;
		this.parentClass = parentClass;
		setClockEnable(config, latency, parentClass.wireClockEnable);
	}

	@Override
	public void dumpInstance(PrintWriter wout, int offset){

		Dump.tprintln(wout, offset, config.floatToFixedModuleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");
		if(clock!=null)
			Dump.tprintln(wout, offset+2, "."+config.floatToFixedClkPort+" ("+clock.getSigName()+"),");
		if(clockEnable!=null)
			Dump.tprintln(wout, offset+2, "."+config.floatToFixedClkEnPort+" ("+clockEnable.getSigName()+"),");
		if(newData!=null)
			Dump.tprintln(wout, offset+2, "."+config.floatToFixedNewDataPort+" ("+newData.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.floatToFixedSrcPort+" ("+portA.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.floatToFixedResultPort+" ("+result.getSigName()+")");
		Dump.tprintln(wout, offset+1, ");");
	}

	static public FloatToFixed makeFloatToFixedIP(int num, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+config.floatToFixedModuleName;
		VerilogReg portA = new VerilogReg(initial+KeyWord.K_floating_+num, config.floatToFixedSrcBitWitdh , VerilogSignal.unsigned);
		VerilogWire result = new VerilogWire(initial+KeyWord.K_fixed_+num, config.floatToFixedResultWitdh, VerilogSignal.signed);
		VerilogReg newData= (config.floatToFixedHaveNewData) ? new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;
		FloatToFixed tmp = new FloatToFixed(config.floatToFixedModuleName+KeyWord.K_inst_+num, portA, result, newData, claz.getClock(), config, claz);
		claz.getModule().addFloatToFixed(tmp);
		return tmp;
	}

	@Override
	public void addSignalToModule(){
		parentClass.getModule().addRegister(portA);
		parentClass.getModule().addWire(result);
		if(newData!=null)
			parentClass.getModule().addRegister(newData);
	}
}
