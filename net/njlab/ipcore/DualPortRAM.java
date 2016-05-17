package net.njlab.ipcore;

import java.io.PrintWriter;
import java.util.Calendar;

import net.njlab.dump.Dump;
import net.njlab.circuit.KeyWord;
import net.njlab.circuit.VerilogModule;
import net.njlab.circuit.VerilogSignal;
import net.njlab.config.*;

/**
 *  @author Keisuke Koike
 */
public class DualPortRAM  extends VerilogIPcore{

	VerilogSignal clockSignal;
	VerilogSignal w_or_r_0;
	VerilogSignal addr0;
	VerilogSignal din0;
	VerilogSignal dout0;
	VerilogSignal ce0;
	VerilogSignal w_or_r_1;
	VerilogSignal addr1;
	VerilogSignal din1;
	VerilogSignal dout1;
	VerilogSignal ce1;
	VerilogModule parentModule;
	int addrBitWidth;
	int dataBitWidth;
	int depth;

	public DualPortRAM( int addrBitWidth, int dataBitWidth, int depth,
						VerilogModule parentModule, String instanceName, VerilogSignal clockSignal,
						VerilogSignal w_or_r_0, VerilogSignal addr0, VerilogSignal din0, VerilogSignal dout0, VerilogSignal ce0,
						VerilogSignal w_or_r_1, VerilogSignal addr1, VerilogSignal din1, VerilogSignal dout1, VerilogSignal ce1,
						Config config){

		this.addrBitWidth = addrBitWidth;
		this.dataBitWidth = dataBitWidth;
		this.depth = depth;
		this.instanceName = KeyWord.K_dpram + instanceName;
		this.clockSignal = clockSignal;
		this.w_or_r_0 = w_or_r_0;
		this.addr0 = addr0;
		this.din0 = din0;
		this.dout0 = dout0;
		this.ce0 = ce0;
		this.w_or_r_1 = w_or_r_1;
		this.addr1 = addr1;
		this.din1 = din1;
		this.dout1 = dout1;
		this.ce1 = ce1;
		this.parentModule = parentModule;
		latency = config.bramLatency;
		throughput = config.bramThroughput;
	}

	public static void dumpDualPortRamFile(PrintWriter wout, Config config){

		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DATE);
		int hour = now.get(now.HOUR_OF_DAY);
		int minutes = now.get(now.MINUTE);
		//int second = now.get(now.SECOND);

		Dump.tprintln(wout, 0, "/*");
		Dump.tprintln(wout, 0, "TimeStamp:	"+year+"/"+ ++month+"/"+day+"		"+hour+":"+minutes);
		Dump.tprintln(wout, 0, "*/");
		Dump.tprintln(wout, 0, "");
		Dump.tprintln(wout, 0, "");

		Dump.tprintln(wout, 0, KeyWord.K_module+" "+config.bramModuleName);
		Dump.tprintln(wout, 1, "#( "+KeyWord.K_parameter+" "+KeyWord.K_DWIDTH+" = 32, "+KeyWord.K_AWIDTH+" = 10, "+KeyWord.K_WORDS+" =1024 )");
		Dump.tprintln(wout, 0, "(");
		Dump.tprintln(wout, 1, KeyWord.K_input+" "+config.bramClk0Pname+",");
		if(!config.isCommonClock)
			Dump.tprintln(wout, 1, KeyWord.K_input+" "+config.bramClk1Pname+",");
		Dump.tprintln(wout, 1, KeyWord.K_input+" "+config.bramRorW0Pname+",");
		Dump.tprintln(wout, 1, KeyWord.K_input+" "+config.bramRorW1Pname+",");
		Dump.tprintln(wout, 1, KeyWord.K_input+" ["+KeyWord.K_AWIDTH+"-1:0] "+config.bramAddr0Pname+",");
		Dump.tprintln(wout, 1, KeyWord.K_input+" ["+KeyWord.K_AWIDTH+"-1:0] "+config.bramAddr1Pname+",");
		Dump.tprintln(wout, 1, KeyWord.K_input+" ["+KeyWord.K_DWIDTH+"-1:0] "+config.bramDataIn0Pname+",");
		Dump.tprintln(wout, 1, KeyWord.K_input+" ["+KeyWord.K_DWIDTH+"-1:0] "+config.bramDataIn1Pname+",");
		Dump.tprintln(wout, 1, KeyWord.K_output+" ["+KeyWord.K_DWIDTH+"-1:0] "+config.bramDataOut0Pname+",");
		Dump.tprintln(wout, 1, KeyWord.K_output+" ["+KeyWord.K_DWIDTH+"-1:0] "+config.bramDataOut1Pname+",");
		Dump.tprintln(wout, 1, KeyWord.K_input+" "+config.bramClkEnable0Pname+",");
		Dump.tprintln(wout, 1, KeyWord.K_input+" "+config.bramClkEnable1Pname);

		Dump.tprintln(wout, 0,");\n");
		Dump.tprintln(wout, 0,"// (* RAM_STYLE=\"BLOCK\" *)	//If Xilinx xst doesn't regard this source code as Block RAM, remove the left comment");
		Dump.tprintln(wout, 1, KeyWord.K_reg+" ["+KeyWord.K_DWIDTH+"-1:0] mem ["+KeyWord.K_WORDS+"-1:0];");
		Dump.tprintln(wout, 1, KeyWord.K_reg+" ["+KeyWord.K_DWIDTH+"-1:0] "+KeyWord.K_r_+config.bramDataOut0Pname+";");
		Dump.tprintln(wout, 1, KeyWord.K_reg+" ["+KeyWord.K_DWIDTH+"-1:0] "+KeyWord.K_r_+config.bramDataOut1Pname+";");
		Dump.tprintln(wout, 1, KeyWord.K_assign+" "+config.bramDataOut0Pname+" = "+KeyWord.K_r_+config.bramDataOut0Pname+";");
		Dump.tprintln(wout, 1, KeyWord.K_assign+" "+config.bramDataOut1Pname+" = "+KeyWord.K_r_+config.bramDataOut1Pname+";");
		Dump.tprintln(wout, 0, "");

		String edgeTrigger = config.isPositiveEdge ? (KeyWord.K_posedge) : (KeyWord.K_negedge);

		Dump.tprintln(wout, 1, KeyWord.K_always+"("+edgeTrigger+" "+config.bramClk0Pname+") "+KeyWord.K_begin);
		Dump.tprintln(wout, 2, KeyWord.K_if+"("+config.bramClkEnable0Pname+") "+KeyWord.K_begin);
		Dump.tprintln(wout, 3, KeyWord.K_if+"("+config.bramRorW0Pname+") ");
		Dump.tprintln(wout, 4, "mem["+config.bramAddr0Pname+"] "+KeyWord.K_noneBlock+" "+config.bramDataIn0Pname+";\n");
		Dump.tprintln(wout, 3, KeyWord.K_r_+config.bramDataOut0Pname+" "+KeyWord.K_noneBlock+" mem["+config.bramAddr0Pname+"];");
		Dump.tprintln(wout, 2, KeyWord.K_end);
		Dump.tprintln(wout, 1, KeyWord.K_end);
		Dump.tprintln(wout, 0, "");

		if(config.isCommonClock)
			Dump.tprintln(wout, 1, KeyWord.K_always+"("+edgeTrigger+" "+config.bramClk0Pname+") "+KeyWord.K_begin);
		else
			Dump.tprintln(wout, 1, KeyWord.K_always+"("+edgeTrigger+" "+config.bramClk1Pname+") "+KeyWord.K_begin);

		Dump.tprintln(wout, 2, KeyWord.K_if+"("+config.bramClkEnable1Pname+") "+KeyWord.K_begin);
		Dump.tprintln(wout, 3, KeyWord.K_if+"("+config.bramRorW1Pname+") ");
		Dump.tprintln(wout, 4, "mem["+config.bramAddr1Pname+"] "+KeyWord.K_noneBlock+" "+config.bramDataIn1Pname+";\n");

		Dump.tprintln(wout, 3, KeyWord.K_r_+config.bramDataOut1Pname+" "+KeyWord.K_noneBlock+" mem["+config.bramAddr1Pname+"];");

		Dump.tprintln(wout, 2, KeyWord.K_end);
		Dump.tprintln(wout, 1, KeyWord.K_end);
		Dump.tprintln(wout, 0, "");
		Dump.tprintln(wout, 0, KeyWord.K_endmodule);
	}

	public void dumpInstance(PrintWriter wout, int offset){

		if(parentModule.config.useBramLibrary){
			Dump.tprintln(wout, offset, parentModule.config.bramModuleName+ " #(."+KeyWord.K_DWIDTH+"("+dataBitWidth+"), ."+KeyWord.K_AWIDTH+"("+addrBitWidth+"), ."+KeyWord.K_WORDS+"("+depth+") )");
			Dump.tprintln(wout, offset+1, instanceName+"(");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramClk0Pname+" ("+clockSignal.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramClkEnable0Pname+" ("+ce0.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramAddr0Pname+" ("+addr0.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramDataIn0Pname+" ("+din0.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramDataOut0Pname+" ("+dout0.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramRorW0Pname+" ("+w_or_r_0.getSigName()+"),");
			if(!parentModule.config.isCommonClock)
				Dump.tprintln(wout, offset+2, "."+parentModule.config.bramClk1Pname+" ("+clockSignal.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramClkEnable1Pname+" ("+ce1.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramAddr1Pname+" ("+addr1.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramDataIn1Pname+" ("+din1.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramDataOut1Pname+" ("+dout1.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramRorW1Pname+" ("+w_or_r_1.getSigName()+")");
			Dump.tprintln(wout, offset+1, ");");
		}
		else{
			Dump.tprintln(wout, offset, parentModule.config.bramModuleName);
			Dump.tprintln(wout, offset+1, instanceName+"(");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramClk0Pname+" ("+clockSignal.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramClkEnable0Pname+" ("+ce0.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramAddr0Pname+" ("+addr0.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramDataIn0Pname+" ("+din0.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramDataOut0Pname+" ("+dout0.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramRorW0Pname+" ("+w_or_r_0.getSigName()+"),");
			if(!parentModule.config.isCommonClock)
				Dump.tprintln(wout, offset+2, "."+parentModule.config.bramClk1Pname+" ("+clockSignal.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramClkEnable1Pname+" ("+ce1.getSigName()+")");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramAddr1Pname+" ("+addr1.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramDataIn1Pname+" ("+din1.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramDataOut1Pname+" ("+dout1.getSigName()+"),");
			Dump.tprintln(wout, offset+2, "."+parentModule.config.bramRorW1Pname+" ("+w_or_r_1.getSigName()+")");
			Dump.tprintln(wout, offset+1, ");");
		}
	}

	@Override
	public void addSignalToModule(){}
}
