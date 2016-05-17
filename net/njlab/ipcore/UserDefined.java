package net.njlab.ipcore;

import java.io.PrintWriter;
import java.util.*;
import net.njlab.circuit.*;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;
import net.njlab.model.ConvertedIPinfo;
import net.njlab.model.VerilogMethod;
import net.njlab.model.VerilogVariableDecl;

public class UserDefined extends VerilogIPcore{

	public String moduleName;
	public String clockName;
	public String clockEnablePname;
	public String newDataPortName;

	public String[] inputPortNames;
	public VerilogReg[] inputPortRegs;

	public String outputPortName;
	public VerilogWire outputWire;

	public VerilogSignal clock;
	public Config config;

	UserDefined(String moduleName, String instanceName, int latency, int throughput, Config config, VerilogClass parentClass){

			this.latency = (latency < 0) ? 0 : latency;
			this.throughput = (throughput < 1) ? 1 : throughput;
			this.moduleName = moduleName;
			this.instanceName = instanceName;
			this.config = config;
			this.parentClass = parentClass;
	}

	public void setPortSignal(String clockName, VerilogSignal clockSignal, String newDataPortName, VerilogReg newDataReg, String clockEnablePname,
							  String[] inputPortNames, VerilogReg[] inputPortRegs, String outputPortName, VerilogWire outputWire,
							  String resetName, VerilogSignal resetSignal){

		this.clockName = clockName;
		this.clock = clockSignal;
		this.newDataPortName = newDataPortName;
		this.newData = newDataReg;
		this.resetName = resetName;
		this.reset = resetSignal;
		this.clockEnablePname = clockEnablePname;

		this.inputPortNames = inputPortNames;
		this.inputPortRegs  = inputPortRegs;
		this.outputPortName = outputPortName;
		this.outputWire     = outputWire;
		setClockEnable(config, latency, parentClass.wireClockEnable);
	}

	@Override
	public void dumpInstance(PrintWriter wout, int offset){

		Dump.tprintln(wout, offset, moduleName);
		Dump.tprintln(wout, offset+1, instanceName+"(");

		String comma = ",";

		if(clock!=null){
			if(clockEnable==null && reset==null && newData==null && inputPortNames==null && outputWire==null)	comma = "";
			Dump.tprintln(wout, offset+2, "."+clockName+" ("+clock.getSigName()+")"+comma);
		}

		if(clockEnable!=null){
			if(reset==null && newData==null && inputPortNames==null && outputWire==null)	comma = "";
			Dump.tprintln(wout, offset+2, "."+clockEnablePname+" ("+clockEnable.getSigName()+")"+comma);
		}

		if(reset!=null){
			if(newData==null && inputPortNames==null && outputWire==null)	comma = "";
			Dump.tprintln(wout, offset+2, "."+resetName+" ("+reset.getSigName()+")"+comma);
		}

		if(newData!=null){
			if(inputPortRegs==null && outputWire==null)	comma = "";
			Dump.tprintln(wout, offset+2, "."+newDataPortName+" ("+newData.getSigName()+")"+comma);
		}
		if(inputPortRegs!=null){
			for(int i=0; i<inputPortRegs.length; i++){
				if(i==inputPortRegs.length-1 && outputWire==null)	comma = "";
				Dump.tprintln(wout, offset+2, "."+inputPortNames[i]+" ("+inputPortRegs[i].getSigName()+")"+comma+"	// in "+inputPortRegs[i].bitWidth+"bit");
			}
		}
		if(outputWire!=null)
			Dump.tprintln(wout, offset+2, "."+outputPortName+" ("+outputWire.getSigName()+")"+"	// out "+outputWire.bitWidth+"bit");
		Dump.tprintln(wout, offset+1, ");");
	}

	@Override
	public void addSignalToModule(){

		if(inputPortRegs!=null)
			for(VerilogReg inputPortReg : inputPortRegs)
				parentClass.getModule().addRegister(inputPortReg);

		if(outputWire!=null)
			parentClass.getModule().addWire(outputWire);

		if(newData!=null)
			parentClass.getModule().addRegister(newData);
	}

	static public UserDefined makeUserDefinedIP(int num, VerilogMethod convertedMethod, VerilogClass claz, Config config){

		String initial = KeyWord.K_ip_+convertedMethod.getMethodName();
		String moduleName = convertedMethod.getMethodName();
		ConvertedIPinfo  ipInfo = convertedMethod.getConvertedInfo();
		UserDefined userDefinedCore = new UserDefined(moduleName, moduleName+KeyWord.K_inst_+num, ipInfo.getLatency(), ipInfo.getThrouput(), config, claz);

		//newDataポート作成
		VerilogReg newData = ipInfo.getHaveNewDataPort() ?  new VerilogReg(initial+KeyWord.K_newData+num, 1, VerilogSignal.unsigned) : null;

		//出力ワイヤ信号作成
		VerilogWire result = null;
		if(convertedMethod.getRetType().compareTo("void")!=0)
			result = new VerilogWire(initial+KeyWord.K_result_+num, ipInfo.getOutputBitWidth(), VerilogVariableDecl.isSigned(convertedMethod.getRetType()));
		else
			result = null;

		//入力ポートレジスタ作成
		int paramNum = convertedMethod.vdecls.size();
		String[] inputPortNames = (paramNum>0) ? new String[paramNum] : null;
		VerilogReg[] inputPortRegs = (paramNum>0) ? new VerilogReg[paramNum] : null;

		for(int i=0; i<paramNum; ++i){
			String portName = convertedMethod.vdecls.get(i).getName();
			inputPortNames[i] = portName;
			inputPortRegs[i] = new VerilogReg(initial+"_"+portName+"_"+num, ipInfo.getInputBitWidth()[i] , VerilogVariableDecl.isSigned(convertedMethod.vdecls.get(i).getType() ));
		}

		VerilogSignal clockSignal = ipInfo.getHaveClockPort() ? claz.getClock() : null;
		VerilogSignal resetSignal = ipInfo.getHaveResetPort() ? claz.getReset() : null;

		userDefinedCore.setPortSignal(ipInfo.getClockPortName(), clockSignal, ipInfo.getNewDataPortName(), newData, ipInfo.getClockEnablePortName(),
									  inputPortNames, inputPortRegs, ipInfo.getOutputPortName(), result,
									  ipInfo.getResetPortName(), resetSignal );
		claz.getModule().addUserDefined(userDefinedCore);
		return userDefinedCore;
	}

}

















