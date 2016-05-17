package net.njlab.sample.subModuleTest;

import net.njlab.sample.annotation.JRThrashCacheEnable;
import net.njlab.sample.annotation.JRThrashUnroll;

/**
 *  @author Keisuke Koike
 */
public class SubClassB {

	final int[] arrayB  = new int[32];

	@JRThrashUnroll(unrollNum=4, loopVariableName="i", unrollType=JRThrashUnroll.copyLoopVar)
	public int subBprocess(@JRThrashCacheEnable(cacheLatency=1) int[] ax, int[] bx, int dataNum){

		int i=0;
		for(i=0; i<dataNum; i++){
			ax[i] = (i-dataNum)*13;
			bx[i] = (i-dataNum)*20;
			arrayB[i] += arrayB[i]*i;
		}

		int ret = 0;
		for(i=0; i<dataNum; i++){
			ret += ax[i] + bx[i] + arrayB[i];
		}
		return ret;
	}
}
