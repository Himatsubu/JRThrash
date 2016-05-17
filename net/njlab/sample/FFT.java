package net.njlab.sample;

import net.njlab.sample.annotation.JRThrashForwardingInvalidate;
import net.njlab.sample.annotation.JRThrashUnroll;


/**
 *  @author Keisuke Koike
 */
public class FFT {

	final float[] dataRe= new float[1024];
	final float[] dataIm= new float[1024];
	final float[] wRe = new float[512];
	final float[] wIm = new float[512];
	short dataNum = 1024;

	void fft_start(){

		fft(dataRe, dataIm);
	}

	//@JRThrashUnroll(unrollType = JRThrashUnroll.simple, unrollNum = 32, loopVariableName = "k_rd")
	@JRThrashUnroll(unrollType = JRThrashUnroll.simple, unrollNum = 16, loopVariableName = "k_rd")
	private void fft(float[] dataRe, float[] dataIm){

		short i, j;
		@JRThrashForwardingInvalidate
		short k_rd, k_wr;
		j=(short)(dataNum>>1);

		float data_Re;
		float data_Im;
		float data_wRe;
		float data_wIm;
		float dataRe_N;
		float dataIm_N;
		float tmpRe;
		float tmpIm;

		@JRThrashForwardingInvalidate
		short m;
		short rd, wr;
		short wrx, rdx;

		boolean gotoNextStageRd = false;
		boolean gotoNextStageWr = false;

		for(i=1, m=0; i<dataNum; i<<=1, j>>=1, m=0){
			for(k_rd=0, k_wr=0, rd=0, wr=0; k_rd<i; ){

				rdx = (short)(rd+i);
				wrx = (short)(wr+i);
				data_wRe = wRe[m];
				data_wIm = wIm[m];

				dataRe_N = dataRe[rd];
				dataIm_N = dataIm[rd];
				data_Re = dataRe[rdx];
				data_Im = dataIm[rdx];

				tmpRe = data_Re * data_wRe + data_Im * data_wIm;
				tmpIm = data_Im * data_wRe - data_Re * data_wIm;

				this.dataRe[wrx] = dataRe_N - tmpRe;
				this.dataIm[wrx] = dataIm_N - tmpIm;
				this.dataRe[wr] = dataRe_N + tmpRe;
				this.dataIm[wr] = dataIm_N + tmpIm;

				rd+=i<<1;
				wr+=i<<1;

				gotoNextStageRd = !(rd<dataNum);
				gotoNextStageWr = !(wr<dataNum);

				k_rd = (short)(gotoNextStageRd ? k_rd+1 : k_rd);
				k_wr = (short)(gotoNextStageWr ? k_wr+1 : k_wr);
				m    = (short)(gotoNextStageRd ? m+j    : m);
				rd   = (short)(gotoNextStageRd ? k_rd   : rd);
				wr   = (short)(gotoNextStageWr ? k_wr   : wr);
			}
		}
	}
}

/*
short dataNum = 1024;
short i, j, k, n;
j=(short)(dataNum/2);
float data_Re;
float data_Im;
float data_wRe;
float data_wIm;
float dataRe_N;
float dataIm_N;
float tmpRe;
float tmpIm;
short m,l, h, g;

for(i=1; i<dataNum; i<<=1, j>>=1){
	for(k=0; k<i; k++){
		for(n=k, h=k, m=(short)(j*k); n<dataNum; n+=i<<1, h=n ){

			l = (short)(n+i);
			g = (short)(h+i);
			data_wRe = wRe[m];
			data_wIm = wIm[m];
			data_Re = dataRe[l];
			data_Im = dataIm[l];

			tmpRe = data_Re * data_wRe - data_Im * data_wIm;
			tmpIm = data_Im * data_wRe + data_Re * data_wIm;

			dataRe_N = dataRe[n];
			dataIm_N = dataIm[n];

			this.dataRe[g] = dataRe_N - tmpRe;
			this.dataIm[g] = dataIm_N - tmpIm;

			this.dataRe[h] = dataRe_N + tmpRe;
			this.dataIm[h] = dataIm_N + tmpIm;
		}
	}
}*/
