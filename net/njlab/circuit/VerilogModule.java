package net.njlab.circuit;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;

import com.sun.org.apache.xalan.internal.xsltc.cmdline.Compile;

import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.ipcore.AddFloat;
import net.njlab.ipcore.AddInt;
import net.njlab.ipcore.CompareFloatLT;
import net.njlab.ipcore.CompareIntLT;
import net.njlab.ipcore.DivFloat;
import net.njlab.ipcore.DivInt;
import net.njlab.ipcore.DualPortRAM;
import net.njlab.ipcore.FixedToFloat;
import net.njlab.ipcore.FloatToFixed;
import net.njlab.ipcore.MultFloat;
import net.njlab.ipcore.MultInt;
import net.njlab.ipcore.UserDefined;
import net.njlab.ipcore.VerilogIPcore;
import net.njlab.model.VerilogClass;
import net.njlab.tool.Manager;
import net.njlab.dump.CompileMsgs;

/**
 *  @author Keisuke Koike
 */
public class VerilogModule {

	private ArrayList<VerilogPort> moduleIF = new ArrayList<VerilogPort>();
	private ArrayList<VerilogReg>  registers = new ArrayList<VerilogReg>();
	private ArrayList<VerilogWire> wires = new ArrayList<VerilogWire>();
	private ArrayList<VerilogSignal> RegWirePort = new ArrayList<VerilogSignal>();
	private ArrayList<VerilogSubModule> subModules = new ArrayList<VerilogSubModule>();
	private ArrayList<DualPortRAM> dpRAM = new ArrayList<DualPortRAM>();
	private ArrayList<AddInt> addInt = new ArrayList<AddInt>();
	private ArrayList<MultInt> multInt = new ArrayList<MultInt>();
	private ArrayList<DivInt> divInt = new ArrayList<DivInt>();
	private ArrayList<AddFloat> addFloat = new ArrayList<AddFloat>();
	private ArrayList<MultFloat> multFloat = new ArrayList<MultFloat>();
	private ArrayList<DivFloat> divFloat = new ArrayList<DivFloat>();
	private ArrayList<CompareFloatLT> compareFloatLT = new ArrayList<CompareFloatLT>();
	private ArrayList<CompareIntLT> compareIntLT = new ArrayList<CompareIntLT>();
	private ArrayList<FixedToFloat> fixedToFloat = new ArrayList<FixedToFloat>();
	private ArrayList<FloatToFixed> floatToFixed = new ArrayList<FloatToFixed>();
	private ArrayList<UserDefined> userDefined = new ArrayList<UserDefined>();
	private VerilogAlways allProcess;

	public VerilogClass claz;
	public Config config;

	public VerilogModule(VerilogClass claz){
		this.claz = claz;
		config = claz.config;
	}

	/**
	 * 変数からシグナル(ポート, レジスタ, ワイヤ)を作成する
	 * */
	public void makeSignal(){
		int i;
		for(i=0; i<claz.getMethods().size(); i++)
			claz.getMethods().get(i).makeSignal(this);

		for(i=0; i<claz.getClassVariables().size(); i++)
			claz.getClassVariables().get(i).makeSignal(this);
	}

	public void makeIPcores(){//verilog クラスから呼ぶ (スケジューリング -> makeIP -> スケジューリング情報のレジスタへの登録)

	}

	public void dumpModule(){
		String resultDirName = Manager.getCurrentPass()+"/result";

		File dir = new File(resultDirName);
		if(dir.isDirectory()==false)
			dir.mkdir();

		String fileName = resultDirName+"/"+claz.className+".v";
		File file = new File(fileName);
		PrintWriter wout = null;
	    try{
	    	wout = new PrintWriter(new BufferedWriter(new FileWriter(file)));
	    }
	    catch(IOException e){
	    	CompileMsgs.edumpFailedToMakeFile(fileName, e);
	    }
	    dumpFileInfo(wout);
	    dumpInterFace(wout);
	    //addUsedIPcoreSignal();
	    dumpRegWire(wout);
	    dumpAssignPart(wout);
	    dumpSubModoles(wout);
	    dumpIPcore(wout);
	    dumpAlways(wout);
	    Dump.tprintln(wout, 0, KeyWord.K_endmodule);
	    wout.close();
	    dumpDPRamFile(resultDirName);
	}

	private void dumpFileInfo(PrintWriter wout){
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DATE);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		int minutes = now.get(Calendar.MINUTE);
		//int second = now.get(now.SECOND);

		Dump.tprintln(wout, 0, "/*");
		Dump.tprintln(wout, 0, "TimeStamp:	"+year+"/"+ ++month+"/"+day+"		"+hour+":"+minutes);
		Dump.tprintln(wout, 0, "*/");
		Dump.tprintln(wout, 0, "");
		Dump.tprintln(wout, 0, "");
	}

	private void dumpInterFace(PrintWriter wout){
		int i;
		Dump.tprintln(wout, 0, KeyWord.K_module+" "+claz.className+"(");
		for(i=0; i<moduleIF.size(); i++){
			moduleIF.get(i).dumpPort(wout, 1);
			if(i!=moduleIF.size()-1)
				Dump.tprint(wout, 0, ",");
			Dump.tprintln(wout, 1, "");
		}
		Dump.tprintln(wout, 0, ");");
		Dump.tprintln(wout, 0, "");
	}

	private void dumpRegWire(PrintWriter wout){
		int i;
		for(i=0; i<RegWirePort.size(); i++)
			RegWirePort.get(i).dumpRegWire(wout, 1);
		Dump.tprintln(wout, 0, "");
	}

	private void dumpAssignPart(PrintWriter wout){
		int i;
		for(i=0; i<RegWirePort.size(); i++)
			RegWirePort.get(i).dumpAssignStatement(wout, 1);
		Dump.tprintln(wout, 0, "\n");
	}

	private void dumpSubModoles(PrintWriter wout){
		int i;
		for(i=0; i<subModules.size(); i++){
			subModules.get(i).dumpInstance(wout, 1);
			Dump.tprintln(wout, 0, "");
		}
	}

	private void dumpIPcore(PrintWriter wout){
		dumpBRAM(wout);
		dumpIntOpIPcore(wout);
		dumpFloatOpIPcore(wout);
		dumpUserDefinedIPcore(wout);
	}

	private void dumpBRAM(PrintWriter wout){
		int i=0;
		for(i=0; i<dpRAM.size(); i++){
			dpRAM.get(i).dumpInstance(wout, 1);
			Dump.tprintln(wout, 0, "");
		}
	}

	private void dumpDPRamFile(String resultDirName){

		if(config.useBramLibrary){

			String fileName = resultDirName+"/"+config.bramModuleName+".v";
			File file = new File(fileName);

			if(!file.exists()){
				PrintWriter wout = null;
				try{
			    	wout = new PrintWriter(new BufferedWriter(new FileWriter(file)));
			    }
			    catch(IOException e){
			    	CompileMsgs.edumpFailedToMakeFile(fileName, e);
			    }
				DualPortRAM.dumpDualPortRamFile(wout, config);
				wout.close();
				CompileMsgs.mdumpMakeDPRAM();
			}
		}
	}

	public void addUsedIPcoreSignal(){
		addIntOpIPcoreSignal();
		addFloatOpIPcoreSignal();
		addUserDefinedIPcoreSignal();
	}

	private void addIntOpIPcoreSignal(){

		for(int i=0; i<addInt.size(); i++)
			if(addInt.get(i).usedTime>=1)
				addInt.get(i).addSignalToModule();

		for(int i=0; i<multInt.size(); i++)
			if(multInt.get(i).usedTime>=1)
				multInt.get(i).addSignalToModule();

		for(int i=0; i<divInt.size(); i++)
			if(divInt.get(i).usedTime>=1)
				divInt.get(i).addSignalToModule();

		for(int i=0; i<compareIntLT.size(); i++)
			if(compareIntLT.get(i).usedTime>=1)
				compareIntLT.get(i).addSignalToModule();
	}

	private void addFloatOpIPcoreSignal(){

		for(int i=0; i<addFloat.size(); i++)
			if(addFloat.get(i).usedTime>=1)
				addFloat.get(i).addSignalToModule();

		for(int i=0; i<multFloat.size(); i++)
			if(multFloat.get(i).usedTime>=1)
				multFloat.get(i).addSignalToModule();

		for(int i=0; i<divFloat.size(); i++)
			if(divFloat.get(i).usedTime>=1)
				divFloat.get(i).addSignalToModule();

		for(int i=0; i<compareFloatLT.size(); i++)
			if(compareFloatLT.get(i).usedTime>=1)
				compareFloatLT.get(i).addSignalToModule();

		for(int i=0; i<fixedToFloat.size(); i++)
			if(fixedToFloat.get(i).usedTime>=1)
				fixedToFloat.get(i).addSignalToModule();

		for(int i=0; i<floatToFixed.size(); i++)
			if(floatToFixed.get(i).usedTime>=1)
				floatToFixed.get(i).addSignalToModule();
	}

	private void addUserDefinedIPcoreSignal(){

		for(int i=0; i<userDefined.size(); i++)
			if(userDefined.get(i).usedTime>=1)
				userDefined.get(i).addSignalToModule();
	}

	private void dumpAlways(PrintWriter wout){

		if(claz.config.genCodeForCompressedState){
			for(VerilogReg reg : registers)
				reg.dumpAlways(wout, 1);
		}
		else{
			allProcess.dumpAlways(wout, 1);
		}
	}

	public void addPort(VerilogPort port){

		moduleIF.add(port);
		RegWirePort.add(port);
	}

	public void addRegister(VerilogReg reg){
		registers.add(reg);
		RegWirePort.add(reg);
	}

	public void addWire(VerilogWire wire){
		wires.add(wire);
		RegWirePort.add(wire);
	}

	public void addDualPortRAM(DualPortRAM dpram){
		dpRAM.add(dpram);
	}

	public void addAddInt(AddInt ipcore){
		addInt.add(ipcore);
	}

	public void addMultInt(MultInt ipcore){
		multInt.add(ipcore);
	}

	public void addDivInt(DivInt ipcore){
		divInt.add(ipcore);
	}

	public void addAddFloat(AddFloat ipcore){
		addFloat.add(ipcore);
	}

	public void addMultFloat(MultFloat ipcore){
		multFloat.add(ipcore);
	}

	public void addDivFloat(DivFloat ipcore){
		divFloat.add(ipcore);
	}

	public void addCompareFloatLT(CompareFloatLT ipcore){
		compareFloatLT.add(ipcore);
	}

	public void addCompareIntLT(CompareIntLT ipcore){
		compareIntLT.add(ipcore);
	}

	public void addFixedToFloat(FixedToFloat ipcore){
		fixedToFloat.add(ipcore);
	}

	public void addFloatToFixed(FloatToFixed ipcore){
		floatToFixed.add(ipcore);
	}

	public void addUserDefined(UserDefined ipcore){
		userDefined.add(ipcore);
	}

	private void dumpIntOpIPcore(PrintWriter wout){

		for(int i=0; i<addInt.size(); i++){
			if(addInt.get(i).usedTime>=1){
				addInt.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}

		for(int i=0; i<multInt.size(); i++){
			if(multInt.get(i).usedTime>=1){
				multInt.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}

		for(int i=0; i<divInt.size(); i++){
			if(divInt.get(i).usedTime>=1){
				divInt.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}

		for(int i=0; i<compareIntLT.size(); i++){
			if(compareIntLT.get(i).usedTime>=1){
				compareIntLT.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}
	}

	private void dumpFloatOpIPcore(PrintWriter wout){

		for(int i=0; i<addFloat.size(); i++){
			if(addFloat.get(i).usedTime>=1){
				addFloat.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}

		for(int i=0; i<multFloat.size(); i++){
			if(multFloat.get(i).usedTime>=1){
				multFloat.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}

		for(int i=0; i<divFloat.size(); i++){
			if(divFloat.get(i).usedTime>=1){
				divFloat.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}

		for(int i=0; i<compareFloatLT.size(); i++){
			if(compareFloatLT.get(i).usedTime>=1){
				compareFloatLT.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}

		for(int i=0; i<fixedToFloat.size(); i++){
			if(fixedToFloat.get(i).usedTime>=1){
				fixedToFloat.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}

		for(int i=0; i<floatToFixed.size(); i++){
			if(floatToFixed.get(i).usedTime>=1){
				floatToFixed.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}
	}

	private void dumpUserDefinedIPcore(PrintWriter wout){

		for(int i=0; i<userDefined.size(); i++){
			if(userDefined.get(i).usedTime>=1){
				userDefined.get(i).dumpInstance(wout, 1);
				Dump.tprintln(wout, 0, "");
			}
		}
	}

	public void setAlways(VerilogAlways allProcess){
		this.allProcess = allProcess;
	}

	public void newDataReset(VerilogIfStatement resetPart){

		ArrayList<VerilogIPcore> allIPcore = new ArrayList<VerilogIPcore>();
		allIPcore.addAll(addInt);
		allIPcore.addAll(multInt);
		allIPcore.addAll(divInt);
		allIPcore.addAll(addFloat);
		allIPcore.addAll(multFloat);
		allIPcore.addAll(divFloat);
		allIPcore.addAll(compareFloatLT);
		allIPcore.addAll(compareIntLT);
		allIPcore.addAll(fixedToFloat);
		allIPcore.addAll(floatToFixed);

		StateIdentifier resetState = new StateIdentifier(StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, true);

		for(int i=0; i<allIPcore.size(); i++){
			if(allIPcore.get(i).usedTime>0 && allIPcore.get(i).newData!=null){
				VerilogNoneBlockAssign resetNewData = new VerilogNoneBlockAssign(allIPcore.get(i).newData, claz.boolFalse, resetState);
				resetPart.addThenChildAssign(resetNewData);
			}
		}
	}

	public ArrayList<VerilogPort> getModuleIF(){
		return moduleIF;
	}

	public void addSubModule(VerilogSubModule subModule){
		subModules.add(subModule);
	}

	public ArrayList<VerilogSubModule> getSubModules(){
		return subModules;
	}

	public void makeAlways(){

		for(VerilogReg reg : registers)
			reg.makeAlways(claz);
	}

	public void deleteWire(VerilogWire deletedWire){

		wires.remove(deletedWire);
		RegWirePort.remove(deletedWire);
	}
}












