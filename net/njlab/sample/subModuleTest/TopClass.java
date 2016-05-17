package net.njlab.sample.subModuleTest;
import net.njlab.dump.CompileMsgs;
import net.njlab.sample.annotation.*;
/**
 *  @author Keisuke Koike
 */

public class TopClass{

	public final SubClassA subClassA = new SubClassA();
	public final SubClassA subClassAX = new SubClassA();
	public final SubClassB subClassB = new SubClassB();
	private final int[] arrayX  = new int[32];

	public double mainRoutine(@JRThrashCacheEnable(cacheLatency=1) int[] arrayY, int dataNum){

		int subARet=0;
		int subBRet=0;
		int subXRet=0;

		subXRet = setValueToChildArray(arrayY,  arrayX, dataNum);
		subARet = subClassA.subAprocess(arrayX, arrayY, dataNum);
		subBRet = subClassB.subBprocess(arrayY, arrayX, dataNum);

		return subARet + subBRet + subXRet;
	}

	private int setValueToChildArray(int[] ax, int[] bx, int dataNum){

		for(int i=0; i<dataNum; ++i){
			subClassA.arrayA[i] = i+i+1;
			subClassAX.arrayA[i] = 10;
			subClassB.arrayB[i] = subClassA.arrayA[i];
		}
		return subRoutine(ax, bx, dataNum);
	}

	@JRThrashUnroll(unrollNum=4, loopVariableName="i", unrollType=JRThrashUnroll.copyLoopVar)
	private int subRoutine(int[] ax, int[] bx, int dataNum){

		int i=0;
		for(i=0; i<dataNum; ++i){
			ax[i] = (i-dataNum)*(i-dataNum);
			bx[i] = (i+dataNum+dataNum)/(i-dataNum);
		}

		int ret = 0;
		for(i=0; i<dataNum; i++){
			ret += ax[i] + bx[i];
		}
		return ret;
	}
}







