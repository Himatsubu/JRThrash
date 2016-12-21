package net.njlab.sample.ThreadTest;

import net.njlab.sample.annotation.JRThrashConvertedIntoIPcore;
import net.njlab.sample.annotation.JRThrashExtToTop;
import net.njlab.sample.annotation.JRThrashPortBitWidthSpecify;
import net.njlab.sample.annotation.JRThrashReadOnlyPort;
import net.njlab.sample.annotation.JRThrashUnroll;
/**
 *  @author Keisuke Koike
 */
public class ThreadSubA extends Thread{

	@JRThrashExtToTop
	final int[][] arrayA = new int[4][8];

	@JRThrashExtToTop
	int ret;

	@JRThrashReadOnlyPort
	public int numberA;

	@JRThrashUnroll(unrollNum=4, loopVariableName="j", unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){

		for(int i=0; i<4; ++i){
			for(int j=0; j<8; ++j){
				ret += arrayA[i][j];
			}
		}
	}

	@JRThrashUnroll(unrollNum=4, loopVariableName="j", unrollType=JRThrashUnroll.copyLoopVar)
	private void setArray(){

		for(int i=0; i<4; ++i){
			for(int j=0; j<8; ++j){
				arrayA[i][j] -= j>7 ? (numberA%i)+j : i;
			}
		}
	}

	public int getRet(){
		return ret;
	}
}
