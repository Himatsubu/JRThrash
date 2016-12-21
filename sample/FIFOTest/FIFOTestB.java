package net.njlab.sample;

import net.njlab.sample.annotation.JRThrashConvertedIntoIPcore;
import net.njlab.sample.annotation.JRThrashPortBitWidthSpecify;

public class FIFOTestB{
	final int [] arrayA = new int [10];	

	public void run(){
		int i;
/*
		for(i=0;i<10;i++){
			arrayA[i] = i;
		}

		for(i=0;i<10;i++){
			FIFOWrite(arrayA[i]);
		}
*/
		for(i=0;i<10;i++){
			arrayA[i]=simple_fifo(0);
		}	
	}
	
	@JRThrashConvertedIntoIPcore(availableNum=1,latency=0,throughput=1,outputPName="p",
					clockPName="clk",clockEnablePName="ce",resetPName="rst",
					newDataPName="operation_nd",haveClock=true,haveReset=false,haveNewData=false)
	private int simpe_fifo(int a){
		return a;
	}
/*
	@JRThrashConvertedIntoIPcore(availableNum=1,latency=0,throughput=1,outputPName="p",
					clockPName="clk",clockEnablePName="ce",resetPName="rst",
					newDataPName="operation_nd",haveClock=true,haveReset=false,haveNewData=false)
	
	private int FIFORead(){
		int a=10;
		return a;
	}
*/
}
