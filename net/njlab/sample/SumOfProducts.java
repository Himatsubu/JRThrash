package net.njlab.sample;

import net.njlab.sample.annotation.*;

public class SumOfProducts {

	@JRThrashUnroll(unrollType = JRThrashUnroll.copyLoopVar, unrollNum = 8, loopVariableName = "i")
	public float sumOfProducts(@JRThrashCacheEnable(cacheLatency=1) float[] arrayA,
							   @JRThrashCacheEnable(cacheLatency=1) float[] arrayB,
							   int len){

		setInitValue(arrayA, arrayB, len);

		float ret = 0;
		for(int i=0; i<len; ++i)
			ret += arrayA[i] * arrayB[i];

		return ret;
	}

	@JRThrashUnroll(unrollType = JRThrashUnroll.copyLoopVar, unrollNum = 8, loopVariableName = "i")
	private void setInitValue(@JRThrashCacheEnable(cacheLatency=1) float[] arrayA,
							  @JRThrashCacheEnable(cacheLatency=1) float[] arrayB,
							  int len){

		for(int i=0; i<len; ++i){
			arrayA[i] = i;
			arrayB[i] = i+1;
		}
	}
}
