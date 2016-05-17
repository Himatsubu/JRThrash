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
public class FixedToFloat  extends VerilogIPcore{

	public VerilogSignal clock;
	public VerilogReg  portA;
	public VerilogWire result;
	public Config config;

	public FixedToFloat(String instanceName,
						VerilogReg portA, VerilogWire result, VerilogReg newData, VerilogSignal clock,
						Config config, VerilogClass parentClass){

		latency = config.fixedToFloatLatency;
		throughput = config.fixedToFloatThroughput;
		this.instanceName = instanceName;
		this.clock =  (latency >= 1) ? clock : null;
		this.portA = portA;
		this.result = result;
		this.newData = newData;
		this.config = config;
		this.parentClass = parentClass;
		setClockEnable(config, latency, parentClass.wireClockEnable);
	}

	@Override
	public void dumpInstance(PrintWriter wout, int offset){

		Dump.tprintln(wout, offset, config.fixedToFloatModuleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");
		if(clock!=null)
			Dump.tprintln(wout, offset+2, "."+config.fixedToFloatClkPort+" ("+clock.getSigName()+"),");
		if(clockEnable!=null)
			Dump.tprintln(wout, offset+2, "."+config.fixedToFloatClkEnPort+" ("+clockEnable.getSigName()+"),");
		if(newData!=null)
			Dump.tprintln(wout, offset+2, "."+config.fixedToFloatNewDataPort+" ("+newData.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.fixedToFloatSrcPort+" ("+portA.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.fixedToFloatResultPort+" ("+result.getSigName()+")");
		Dump.tprintln(wout, offset+1, ");");
	}

	static public FixedToFloat makeFixedToFloatIP(int num, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+config.fixedToFloatModuleName;
		VerilogReg portA = new VerilogReg(initial+KeyWord.K_fixed_+num, config.fixedToFloatSrcBitWidth , VerilogSignal.signed);
		VerilogWire result = new VerilogWire(initial+KeyWord.K_floating_+num, config.fixedToFloatResultBitWidth, VerilogSignal.unsigned);
		VerilogReg newData= (config.fixedToFloatHaveNewData) ? new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;
		FixedToFloat tmp = new FixedToFloat(config.fixedToFloatModuleName+KeyWord.K_inst_+num, portA, result, newData, claz.getClock(), config, claz);
		claz.getModule().addFixedToFloat(tmp);
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
