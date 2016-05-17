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
public class DivInt  extends VerilogIPcore{

	public VerilogSignal clock;
	public VerilogReg portA;	//被除数
	public VerilogReg portB;	//除数
	public VerilogWire quotientPort;	//商
	public VerilogWire fractionalPort; //余り
	public Config config;


	public DivInt(String instanceName,
				   VerilogSignal clock, VerilogReg dividendPort, VerilogReg divisorPort, VerilogWire quotientPort, VerilogWire fractionalPort, VerilogReg newData,
				   Config config, VerilogClass parentClass){

		latency = config.divIntLatency;
		throughput = config.divIntThroughput;
		this.instanceName = instanceName;
		this.clock = (latency >= 1) ? clock : null;
		this.portA = dividendPort;
		this.portB = divisorPort;
		this.quotientPort = quotientPort;
		this.fractionalPort = fractionalPort;
		this.newData = newData;
		this.config = config;
		this.parentClass = parentClass;
		setClockEnable(config, latency, parentClass.wireClockEnable);
	}

	@Override
	public void dumpInstance(PrintWriter wout, int offset){

		Dump.tprintln(wout, offset, config.divIntModuleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");
		if(clock!=null)
			Dump.tprintln(wout, offset+2, "."+config.divIntClkPort+" ("+clock.getSigName()+"),");
		if(clockEnable!=null)
			Dump.tprintln(wout, offset+2, "."+config.divIntClkEnPort+" ("+clockEnable.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.divIntDividendPort+" ("+portA.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.divIntDivisorPort+" ("+portB.getSigName()+"),");
		if(newData!=null)
			Dump.tprintln(wout, offset+2, "."+config.divIntNewDataPort+" ("+newData.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.divIntFractionalPort+" ("+fractionalPort.getSigName()+"),");
		Dump.tprintln(wout, offset+2, "."+config.divIntQuotientPort+" ("+quotientPort.getSigName()+")");
		Dump.tprintln(wout, offset+1, ");");
	}

	static public DivInt makeDivIntIP(int num, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+config.divIntModuleName;
		VerilogReg portA = new VerilogReg(initial+KeyWord.K_dividend_+num, config.divIntDividendBitWidth , VerilogSignal.signed);
		VerilogReg portB = new VerilogReg(initial+KeyWord.K_divisor_+num, config.divIntDivisorBitWidth, VerilogSignal.signed);
		VerilogWire result = new VerilogWire(initial+KeyWord.K_quotient_+num, config.divIntQuotientBitWidth, VerilogSignal.signed);
		VerilogWire fractional = new VerilogWire(initial+KeyWord.K_fractional_+num, config.divIntFractionalBitWidth, VerilogSignal.signed);
		VerilogReg newData= (config.divIntHaveNewData) ? new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;
		DivInt tmp = new DivInt(config.divIntModuleName+KeyWord.K_inst_+num, claz.getClock(), portA, portB, result, fractional, newData, config, claz);
		claz.getModule().addDivInt(tmp);
		return tmp;
	}

	@Override
	public void addSignalToModule(){
		parentClass.getModule().addRegister(portA);
		parentClass.getModule().addRegister(portB);
		parentClass.getModule().addWire(quotientPort);
		parentClass.getModule().addWire(fractionalPort);
		if(newData!=null)
			parentClass.getModule().addRegister(newData);
	}
}
