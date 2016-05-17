package net.njlab.sample;

import net.njlab.sample.annotation.JRThrashUnroll;

/**
 *  @author Keisuke Koike
 */
public class MultArray {

	private final int ax[][] = new int[3][5];
	private final int bx[][] = new int[5][3];
	public final int result[][] = new int[3][3];


	private void setArray(){//テスト用に値をセット

		int i,j;

		for(i=0; i<3; i++){
			for(j=0; j<5; j++){
				ax[i][j] = (i+1)*41+j;
				bx[j][i] = j<3 ? (i+2)*61+j : -j*66;
			}
		}

		for(i=0; i<3; i++){
			for(j=0; j<3; j++){
				result[i][j] = 0;
			}
		}
	}

	@JRThrashUnroll(loopVariableName = "k", unrollNum = 5, unrollType = JRThrashUnroll.copyLoopVar)
	public void multArray(){

		setArray();

		int tmp=0;
		for(int i=0; i<3; i++){
			for(int j=0; j<3; j++){
				for(int k=0; k<5; k++){
					tmp += ax[i][k]*bx[k][j];
				}
				result[i][j] = tmp;
				tmp=0;
			}
		}
	}


	/*@JRThrashUnroll(loopVariableName = "k", unrollNum = 5, unrollType = JRThrashUnroll.simple)
	public void multArray(){

		setArray();

		int tmp=0;
		for(int i=0; i<3; i++){
			for(int j=0; j<3; j++){
				for(int k=0; k<5; k++){
					tmp += ax[i][k]*bx[k][j];
				}
				result[i][j] = tmp;
				tmp=0;
			}
		}
	}*/

}

