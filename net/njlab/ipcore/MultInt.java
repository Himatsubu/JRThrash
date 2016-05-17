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
public class MultInt  extends VerilogIPcore{

	public VerilogSignal clock;
	public VerilogReg  portA;
	public VerilogReg  portB;
	public VerilogWire result;
	public Config config;

	MultInt(String instanceName,
			VerilogSignal clock, VerilogReg multiplier, VerilogReg multiplicant, VerilogWire product, VerilogReg newData,
	   		Config config, VerilogClass parentClass){

		latency = config.multIntLatency;
		throughput = config.multIntThroughput;
		this.instanceName = instanceName;
		this.clock = (latency >= 1) ? clock : null;
		this.portA = multiplier;
		this.portB = multiplicant;
		this.newData = newData;
		this.result = product;
		this.config = config;
		this.parentClass = parentClass;
		setClockEnable(config, latency, parentClass.wireClockEnable);
	}

	@Override
	public void dumpInstance(PrintWriter wout, int offset){

		Dump.tprintln(wout, offset, config.multIntModuleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");
		if(clock!=null)
			Dump.tprintln(wout, offset+2, "."+config.multIntClkPort+" ("+clock.getSigName()+"),");
		if(clockEnable!=null)
			Dump.tprintln(wout, offset+2, "."+config.multIntClkEnPort+" ("+clockEnable.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.multIntMultiplicandPort+" ("+portA.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.multIntMultiplierPort+" ("+portB.getSigName()+"),");
		if(newData!=null)
			Dump.tprintln(wout, offset+2, "."+config.multIntNewDataPort+" ("+newData.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.multIntProductPort+" ("+result.getSigName()+")");
		Dump.tprintln(wout, offset+1, ");");
	}

	static public MultInt makeMultIntIP(int num, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+config.multIntModuleName;
		VerilogReg portA = new VerilogReg(initial+KeyWord.K_multiplicand_+num, config.multIntMultiplicandBitWidth , VerilogSignal.signed);
		VerilogReg portB = new VerilogReg(initial+KeyWord.K_multiplier_+num, config.multIntMultiplierBitWidth, VerilogSignal.signed);
		VerilogWire result = new VerilogWire(initial+KeyWord.K_product_+num, config.multIntProductBitWidth, VerilogSignal.signed);
		VerilogReg newData = (config.multIntHaveNewData) ? new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;
		MultInt tmp = new MultInt(config.multIntModuleName+KeyWord.K_inst_+num, claz.getClock(), portA, portB, result, newData, config, claz);
		claz.getModule().addMultInt(tmp);
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