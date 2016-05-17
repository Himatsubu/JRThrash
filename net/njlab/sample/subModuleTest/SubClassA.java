package net.njlab.sample.subModuleTest;

import net.njlab.sample.annotation.JRThrashCacheEnable;
import net.njlab.sample.annotation.JRThrashUnroll;


/**
 *  @author Keisuke Koike
 */
public class SubClassA {

	final int[] arrayA  = new int[32];

	@JRThrashUnroll(unrollNum=4, loopVariableName="i", unrollType=JRThrashUnroll.copyLoopVar)
	public int subAprocess(int[] ax, @JRThrashCacheEnable(cacheLatency=1)int[] bx, int dataNum){

		int i=0;
		for(i=0; i<dataNum; i++){
			ax[i] = 665/(i-dataNum);
			bx[i] = 440/(i-dataNum);
			arrayA[i] = 771/arrayA[i];
		}

		int ret = 0;
		for(i=0; i<dataNum; i++){
			ret += ax[i] + bx[i] + arrayA[i];
		}
		return ret;
	}
}
