package net.njlab.sample;

import net.njlab.sample.annotation.JRThrashConvertedIntoIPcore;
import net.njlab.sample.annotation.JRThrashPortBitWidthSpecify;
import net.njlab.sample.annotation.JRThrashUnroll;

public class Effecter {

	public final short[] bufferInA = new short[1024];
	public final short[] bufferInB = new short[1024];
	public final short[] bufferOutA = new short[1024];
	public final short[] bufferOutB = new short[1024];
	int phase = 0;
	short bufSize = 1024;

	@JRThrashUnroll(unrollType = JRThrashUnroll.simple, unrollNum = 8, loopVariableName = "i")
	public boolean voiceChange(short rateA, short rateB, short threshold, boolean bufSelect, byte function){

		if(function==0){
			if(!bufSelect)
				multSine(rateA, rateB, bufferInA, bufferOutA);
			else
				multSine(rateA, rateB, bufferInB, bufferOutB);
		}
		else if(function==1){

			if(!bufSelect)
				becomeHigh(bufferInA, bufferOutA);
			else
				becomeHigh(bufferInB, bufferOutB);
		}
		else if(function==2){

			if(!bufSelect)
				distortion(threshold, bufferInA, bufferOutA);
			else
				distortion(threshold, bufferInB, bufferOutB);
		}
		else {
			if(!bufSelect)
				echo(bufferInA, bufferOutA);
			else
				echo(bufferInB, bufferOutB);
		}

		return bufSelect;
	}



	@JRThrashUnroll(unrollType = JRThrashUnroll.simple, unrollNum = 8, loopVariableName = "i")
	private void multSine(short rateA, short rateB, short[] bufferIn, short[] bufferOut){

		int mulWave;
		//int input;
		for (int i=0, j=0; i<bufSize; ++i, ++j, ++phase){
			int input = bufferIn[i];
			mulWave = input * ((Sin((short)(rateA*phase)) + Sin((short)(rateB*phase)) ));
			bufferOut[j] = (short)(((mulWave>>16)*7 + input)>>3);
		}
	}

	private void becomeHigh(short[] bufferIn, short[] bufferOut){
/*
		int tmp;
		int bufSizeDiv2 = bufSize>>1;

		for (int i=0, j=0; i<bufSize; i+=2, ++j){
			tmp = bufferIn[i];
			bufferOut[j] = (short)tmp;
			bufferOut[j+bufSizeDiv2] = (short)tmp;
		}*/

		int bufSizeDiv2 = bufSize>>1;
		int tmp;
		int sinTmp;
		for (int i=0, j=0; i<bufSize; i+=2, ++j){
			sinTmp = Sin((short)(4*i));
			tmp = (short)((bufferIn[i]*sinTmp)>>16);
			bufferOut[j] = (short)tmp;
			bufferOut[j+bufSizeDiv2] = (short)tmp;
		}
	}

	private void distortion(short rateA, short[] bufferIn, short[] bufferOut){

		short bufIn;

		for (int i=0, j=0; i<bufSize; ++i, ++j){

			bufIn = bufferIn[i];

			if(bufIn < 0)
				bufferOut[j] = (short)((-rateA > bufIn) ? -rateA :  bufIn);
			else
				bufferOut[j] = (short)((bufIn > rateA) ? rateA :  bufIn);
		}
	}

	private void echo(short[] bufferIn, short[] bufferOut){


		for (int i=0, j=0; i<bufSize; ++i, ++j){
			bufferOut[j] = (short)((bufferOut[i]+ bufferIn[i])>>1 );
		}
	}

	@JRThrashConvertedIntoIPcore(availableNum = 2, latency = 2, throughput = 1,
								 outputPName = "sine", clockPName = "clk", clockEnablePName = "ce", resetPName = "rst", newDataPName = "operation_nd",
								 haveClock = true, haveReset = false, haveNewData = false)
	@JRThrashPortBitWidthSpecify(inputBitWidth = "13", outputBitWidth = 15)
	private short Sin(short phase_in){
		phase_in = (short)(0x1FFF & phase_in);
		short ret = (short)(Math.sin( (2.0*Math.PI*phase_in / 8192))*16383/*32767*/);
		return ret;
	}
}
