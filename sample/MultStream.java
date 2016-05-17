package net.njlab.sample;
import net.njlab.sample.annotation.*;

/**
 *  @author Keisuke Koike
 */
public class MultStream {

	int ax=0, bx=1, cx=2, dx=10, ex, fx;

	@JRThrashUnroll(loopVariableName = "i", unrollNum = 4, unrollType = JRThrashUnroll.simple)
	public void multStream(int[] a, int b[], int result[]){

		int i;
		for(i=0; i<64; i++){	//テスト用に値をセット
			a[i] = i+3;
			b[i] = i+7;
		}

		//typeA(a, b, result);
		typeB(a, b, result);
		//typeC(a, b, result);
		//typeD(a, b, result);
		//typeE(a, b, result);
	}


	@JRThrashUnroll(loopVariableName = "i", unrollNum = 4, unrollType = JRThrashUnroll.simple)
	private void typeA(int[] a, int b[], int result[]){	//回路規模小 & 処理速度高 (最適)

		int i,j;
		for(i=0, j=0; i<64; i++, j++)
			result[j] = a[i]*b[i];
	}

	@JRThrashUnroll(loopVariableName = "i", unrollNum = 4, unrollType = JRThrashUnroll.copyLoopVar) // お勧め
	private void typeB(int[] a, int b[], int result[]){	//回路規模小 & 処理速度高

		int i;
		for(i=0; i<64; ++i)
			result[i] = a[i]*b[i];
	}

	@JRThrashUnroll(loopVariableName = "i", unrollNum = 4, unrollType = JRThrashUnroll.modifyLoopVar)
	private void typeC(int[] a, int b[], int result[]){	//回路規模大 & 処理速度高

		int i;
		for(i=0; i<64; i++)
			result[i] = a[i]*b[i];
	}

	@JRThrashUnroll(loopVariableName = "i", unrollNum = 4, unrollType = JRThrashUnroll.modifyLoopVar_IndependentIterator)
	private void typeD(int[] a, int b[], int result[]){	//回路規模大 & 処理速度高

		int i;
		for(i=0; i<64; i++)
			result[i] = a[i]*b[i];
	}

	@JRThrashUnroll(loopVariableName = "i", unrollNum = 4, unrollType = JRThrashUnroll.simple)
	private void typeE(int[] a, int b[], int result[]){	//回路規模小 & 処理速度低

		int i;
		for(i=0; i<64; i++)
			result[i] = a[i]*b[i];
	}

}
