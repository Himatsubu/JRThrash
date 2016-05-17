package net.njlab.ipcore;

import java.io.PrintWriter;

import net.njlab.circuit.KeyWord;
import net.njlab.circuit.VerilogPort;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogWire;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;

/**
 *  @author Keisuke Koike
 */
public class MultFloat  extends VerilogIPcore{	//portA * portB = result

	public VerilogSignal clock;
	public VerilogReg  portA;
	public VerilogReg  portB;
	public VerilogWire result;
	public Config config;


	public MultFloat(String instanceName,
					 VerilogReg portA, VerilogReg portB, VerilogWire result, VerilogReg newData, VerilogPort clock,
				   	 Config config, VerilogClass parentClass){

		latency = config.multFloatLatency;
		throughput = config.multFloatThroughput;
		this.instanceName = instanceName;
		this.clock = (latency >= 1) ? clock : null;
		this.portA = portA;
		this.portB = portB;
		this.newData = newData;
		this.result = result;
		this.config = config;
		this.parentClass = parentClass;
		setClockEnable(config, latency, parentClass.wireClockEnable);
	}

	@Override
	public void dumpInstance(PrintWriter wout, int offset){

		Dump.tprintln(wout, offset, config.multFloatModuleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");
		if(clock!=null)
			Dump.tprintln(wout, offset+2, "."+config.multFloatClkPort+" ("+clock.getSigName()+"),");
		if(clockEnable!=null)
			Dump.tprintln(wout, offset+2, "."+config.multFloatClkEnPort+" ("+clockEnable.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.multFloatMultiplicandPort+" ("+portA.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.multFloatMultiplierPort+" ("+portB.getSigName()+"),");
		if(newData!=null)
			Dump.tprintln(wout, offset+2, "."+config.multFloatNewDataPort+" ("+newData.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.multFloatProductPort+" ("+result.getSigName()+")");
		Dump.tprintln(wout, offset+1, ");");
	}

	static public MultFloat makeMultFloatIP(int num, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+config.multFloatModuleName;
		VerilogReg portA = new VerilogReg(initial+KeyWord.K_multiplicand_+num, config.multFloatMultiplicandBitWidth , VerilogSignal.unsigned);
		VerilogReg portB = new VerilogReg(initial+KeyWord.K_multiplier_+num, config.multFloatMultiplierBitWidth, VerilogSignal.unsigned);
		VerilogWire result = new VerilogWire(initial+KeyWord.K_product_+num, config.multFloatProductBitWidth, VerilogSignal.unsigned);
		VerilogReg newData = (config.multFloatHaveNewData) ? new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;
		MultFloat tmp = new MultFloat(config.multFloatModuleName+KeyWord.K_inst_+num, portA, portB, result, newData, claz.getClock(), config, claz);
		claz.getModule().addMultFloat(tmp);
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
