package net.njlab.sample;

import net.njlab.sample.annotation.JRThrashUnroll;




/**
 *  @author Keisuke Koike
 */
public class DivStreamFloat {

	/*@JRThrashUnroll(loopVariableName = "i", unrollNum = 16, unrollType = JRThrashUnroll.simple)
	public void divStream(double[] a, double b[], double result[]){

		int i, j, k=3;
		for(i=0, j=0; i<64; i++, j++){	//テスト用に値をセット
			a[j] = i*i;
			b[j] = i+0.5;
		}

		for(i=0, j=0; i<64; i++, j++)
			result[j] = a[i]/b[i];
	}*/


	@JRThrashUnroll(loopVariableName = "i", unrollNum = 16, unrollType = JRThrashUnroll.copyLoopVar)
	public void divStream(double[] a, double b[], double result[]){

		int i;
		for(i=0; i<64; i++){	//テスト用に値をセット
			a[i] = i*i;
			b[i] = i+0.5;
		}

		for(i=0; i<64; i++)
			result[i] = a[i]/b[i];
	}

}
