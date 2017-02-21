import net.njlab.sample.annotation.*;

public class sub extends Thread{

	final float[] a = new float[1];
	final float[] b = new float[1];	
	float result;

        @JRThrashUnroll(unrollNum=10, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(/*float a,float b*/){
		float x = 0.0f;
		float y = 0.0f;
		float x1, y1;

		int n;

		for(n = 0; n < 100; n++){
			x1 = x*x-y*y+a[0];
			y1 = 2.0f*x*y+b[0]; 
			if(x1*x1+y1*y1>4.0) result = n;//発散

			x = x1;
			y = y1;
		}
		result = 0;
	}
}	
