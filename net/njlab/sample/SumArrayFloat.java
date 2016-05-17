package net.njlab.sample;

import net.njlab.sample.annotation.JRThrashUnroll;

/**
 *  @author Keisuke Koike
 */
public class SumArrayFloat {

	private final double ax[] = new double[1024];
	private final double tmp[] = new double[512];

	@JRThrashUnroll(loopVariableName = "l", unrollNum = 8, unrollType = JRThrashUnroll.modifyLoopVar_IndependentIterator)
	private void setArray(double[] ax){	//テスト用に値をセット

		for(int l=0; l<1024; l+=2){
			ax[l] = (l%17 > 8)  ? l*80.12 : l+2000.07;
			this.ax[l+1] = ((l+1)%17 > 8)  ? (l+1)*80.12 : (l+1)+2000.07;
		}
	}


	/**
	 * ax のデータの合計値を求める（高速版）
	 * */
	public double sumArrayFast(){

		setArray(ax);

		for(int i=1024; i>8;){
			sumArrayFastSub(ax, tmp, i);
			i>>=2;
		}
		return (ax[0]+ax[1]) + (ax[2]+ax[3]);
	}

	@JRThrashUnroll(loopVariableName = "i", unrollNum = 8, unrollType = JRThrashUnroll.copyLoopVar)
	private void sumArrayFastSub(double[] ax, double[] tmp, int num){

		for(int i=0, j=0; i<num; i+=2, ++j)
			tmp[j] = this.ax[i] + ax[i+1];

		for(int i=0, j=0; i < num>>1; i+=2, ++j)
			ax[j] = this.tmp[i] + tmp[i+1];
	}

	/**
	 * ax のデータの合計値を求める
	 * */
	public double sumArray(){

		setArray(ax);

		double result = 0;
		for(int n=0; n<1024; n++)
			result += ax[n];

		return result;
	}
}
