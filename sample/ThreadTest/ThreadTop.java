package net.njlab.sample.ThreadTest;

import net.njlab.sample.annotation.JRThrashUnroll;

/**
 *  @author Keisuke Koike
 */
public class ThreadTop {

	final public ThreadSubA subA = new ThreadSubA();
	final public ThreadSubB subB = new ThreadSubB();

	private final int[] topArray = new int[32];
	int ret, subRet;

	public int threadTopMain(){

		setValueToChildArray();
		subA.start();
		subB.start();
		threadTopSub(topArray);

		try{
			subA.join();
			subB.join();
		}
		catch(Exception e){}

		subRet = subA.getRet();
		ret += subRet;
		subRet = subB.getRet();
		ret += subRet;
		return ret;
	}

	@JRThrashUnroll(unrollNum=4, loopVariableName="i", unrollType=JRThrashUnroll.copyLoopVar)
	private void threadTopSub(int[] topArray){

		int i;
		for(i=0; i<32; i++){
			topArray[i] = i;
		}

		for(i=0; i<32; i++){
			ret += topArray[i];
		}
	}


	@JRThrashUnroll(unrollNum=4, loopVariableName="j", unrollType=JRThrashUnroll.copyLoopVar)
	private void setValueToChildArray(){

		for(int i=0; i<4; ++i){
			for(int j=0; j<8; ++j){
				subA.arrayA[i][j] = (i+j)*15;
				subB.arrayB[i*8+j] = subA.arrayA[i][j]*34;
			}
		}
	}
}
