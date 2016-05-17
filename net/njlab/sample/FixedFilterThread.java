package net.njlab.sample;

import net.njlab.sample.annotation.JRThrashExtToTop;
import net.njlab.sample.annotation.JRThrashForwardingInvalidate;
import net.njlab.sample.annotation.JRThrashUnroll;

/*
 * //配列の bit 幅を増やし, 1ワードに 2つのデータを格納
public class FixedFilterThread extends Thread{

	public final int[] inputWave  = new int[1024];
	public final int[] outputWave = new int[1362];	//1024+multNum+2
	public final short[] filterCoef = new short[338];	//336+2

	short multNum = 336;

	public void run(){
		fixedFilter((short)336, filterCoef, inputWave, outputWave);
	}


	  	//@JRThrashUnroll(dependence = true, unrollNum = 16, loopVariableName = "m")
		public void fixedFilter(short pointNum, short[] filterCoef,
								int[] inputWave, int[] outputWave){

			int output0 = 0;
			int output1 = 0;
			int output2 = 0;
			int output3 = 0;

			short n=(short)(pointNum-1);
			short m=0;
			short tmpCoef0;
			short tmpCoef1;
			short k = (short)(n+m);

			int tmpInput0;
			int tmpInput1;

			while(n>0){

				for (; m<multNum; m++){
					k = (short)(n+m);	//forwarding off にしてレジスタに受けると早い
					tmpCoef0 = this.filterCoef[m<<1];
					tmpCoef1 = filterCoef[(m<<1)+1];

					tmpInput0 = this.inputWave[k];
					tmpInput1 = inputWave[k-1];

					output0 += (tmpCoef0 * tmpInput0);
					output1 += (tmpCoef1 * tmpInput0>>16);
					output2 += (tmpCoef0 * tmpInput1);
					output3 += (tmpCoef1 * tmpInput1>>16);
				}
				this.outputWave[n] = (output1 | 0xFFFF0000) | (output0>>>16) ;
				outputWave[n] =  (output3 | 0xFFFF0000) | (output2>>>16) ;
				output0 = 0;
				output1 = 0;
				output2 = 0;
				output3 = 0;
				n-=2;
				m=0;
			}
		}
}
*/

/* //先読みあり
public class FixedFilterThread extends Thread{

	public final short[] inputWave = new short[2345];	//2048+297
	public final short[] outputWave = new short[2048];
	public final short[] filterCoef = new short[298];

	short multNum = 297;

	public void run(){
		fixedFilter((short)2048, inputWave, outputWave);
	}


	@JRThrashUnroll(dependence = true, unrollNum = 9, loopVariableName = "j")
	public void fixedFilter(short pointNum , short[] inputWave, short[] outputWave){

		int output0 = 0;
	  	int output1 = 0;
		short i = (short)(pointNum-1);
		short j = 0;
		//short k;

		while(i>0){

			j=0;
			short nextCoef = this.filterCoef[j];
			short nextInput0 = this.inputWave[i];
			short nextInput1 = inputWave[i-1];

			for (; j<multNum; ++j){
				//k = (short)(i+j);	//forwarding off にしてレジスタに受けると早い
				//nextCoef = filterCoef[j];
				//output0 += (nextCoef * this.inputWave[k+1]);
				//output1 += (nextCoef * inputWave[k]);

				output0 += (nextCoef * nextInput0);
				output1 += (nextCoef * nextInput1);
				nextCoef = this.filterCoef[j+1];
				nextInput0 = this.inputWave[i+j+1];
				nextInput1 = inputWave[i+j];
			}
			this.outputWave[i] =(short)(output0>>15);
			outputWave[i-1] = (short)(output1>>15);
			output0 = 0;
			output1 = 0;
			i-=2;
		}
	}
}
*/

//先読み無し
public class FixedFilterThread extends Thread{

	@JRThrashExtToTop
	public final short[] inputWave = new short[2371];

	@JRThrashExtToTop
	public final short[] outputWave = new short[2048];

	public final short[] filterCoef = new short[323];

	short multNum = 323;	//357

	public void run(){
		fixedFilter((short)2048, inputWave, outputWave, filterCoef);
	}

	@JRThrashUnroll(unrollType = JRThrashUnroll.simple, unrollNum = 323, loopVariableName = "j")
	//@JRThrashUnroll(unrollType = JRThrashUnroll.simple, unrollNum = 17, loopVariableName = "j")
	private void fixedFilter(short pointNum , short[] inputWave, short[] outputWave, short[] filterCoef){


		int output0 = 0;
	  	int output1 = 0;
		short i = (short)(pointNum-1);
		short k;

		@JRThrashForwardingInvalidate
		short tmpCoef0, inputWave0, tmpCoef1, inputWave1;

		while(i>0){

			for (short j=0; j<multNum; j++){
				k = (short)(i+j);	//forwarding off にしてレジスタに受けると早い
				//output0 += (this.filterCoef[j] * this.inputWave[k+1]);
				//output1 += (filterCoef[j] * inputWave[k]);
				tmpCoef0 = this.filterCoef[j];
				inputWave0 = this.inputWave[k+1];
				tmpCoef1 = filterCoef[j];
				inputWave1 = inputWave[k];
				output0 += tmpCoef0 * inputWave0;
				output1 += tmpCoef1 * inputWave1;
			}

			this.outputWave[i] =(short)(output0>>>16);
			outputWave[i-1] = (short)(output1>>>16);
			output0 = 0;
			output1 = 0;
			i-=2;
		}
	}

}

/**
 * //配列の数を増やし, 奇数偶数に分けてデータを格納
 * public class FixedFilterThread extends Thread{

	public final short[] inputWaveEven = new short[1024];
	public final short[] inputWaveOdd = new short[1024];
	public final short[] outputWaveEven = new short[1362];	//1024+multNum+2
	public final short[] outputWaveOdd = new short[1362];	//1024+multNum+2
	public final short[] filterCoef = new short[338];	//336+2

	short multNum = 336;

	public void run(){
		fixedFilter((short)336, filterCoef, inputWaveEven, inputWaveOdd, outputWaveEven, outputWaveOdd);
	}


	  	@JRThrashUnroll(dependence = true, unrollNum = 16, loopVariableName = "m")
		public void fixedFilter(short pointNum, short[] filterCoef,
								short[] inputWaveEven, short[] inputWaveOdd,
								short[] outputWaveEven, short[] outputWaveOdd){

			int output0 = 0;
			int output1 = 0;
			int output2 = 0;
			int output3 = 0;

			short n=(short)(pointNum-1);
			short m=0;
			short tmpCoef0;
			short tmpCoef1;
			short k = (short)(n+m);

			while(n>0){

				for (; m<multNum; m++){
					k = (short)(n+m);	//forwarding off にしてレジスタに受けると早い
					tmpCoef0 = this.filterCoef[m<<1];
					tmpCoef1 = filterCoef[(m<<1)+1];

					output0 += (tmpCoef0 * this.inputWaveEven[k]);
					output1 += (tmpCoef1 * this.inputWaveOdd[k]);
					output2 += (tmpCoef0 * inputWaveEven[k-1]);
					output3 += (tmpCoef1 * inputWaveOdd[k-1]);

				}
				this.outputWaveEven[n] = (short)(output0>>16);
				this.outputWaveOdd[n] = (short)(output1>>16);
				outputWaveEven[n] = (short)(output2>>16);
				outputWaveOdd[n] = (short)(output3>>16);
				output0 = 0;
				output1 = 0;
				output2 = 0;
				output3 = 0;
				n-=2;
				m=0;
			}
		}
}
 * */
