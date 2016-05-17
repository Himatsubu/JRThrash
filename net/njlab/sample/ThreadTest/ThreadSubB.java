package net.njlab.sample.ThreadTest;

import net.njlab.sample.annotation.JRThrashExtToTop;
import net.njlab.sample.annotation.JRThrashReadOnlyPort;
import net.njlab.sample.annotation.JRThrashUnroll;
/**
 *  @author Keisuke Koike
 */
public class ThreadSubB  extends Thread{

	@JRThrashExtToTop
	final int[] arrayB = new int[32];

	@JRThrashExtToTop
	int ret;

	@JRThrashReadOnlyPort
	public int numberB;

	@JRThrashUnroll(unrollNum=4, loopVariableName="i", unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){

		setArray();

		for(int i=0; i<32; i++){
			ret += arrayB[i];
		}
	}

	@JRThrashUnroll(unrollNum=4, loopVariableName="i", unrollType=JRThrashUnroll.copyLoopVar)
	private void setArray(){

		for(int i=0; i<32; i++){
			arrayB[i] += i>15 ?  numberB%i : i;
		}
	}

	public int getRet(){
		return ret;
	}
}
