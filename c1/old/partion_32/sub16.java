import net.njlab.sample.annotation.*;

public class sub16 extends Thread{
        final float[] u      = new float[484];
	//final float[] q      = new float[484];
	final float[] result = new float[484];

        @JRThrashUnroll(unrollNum=4, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
                float r1 = 0.2f;
		float r2 = 0.2f;
		float dt = 0.0005f;
		float dx = 0.05f;
		float dy = 0.05f;
		//float q;

		for(k=2;k<=5;k++){
			for(j=11;j<=12;j++){
			//q=100f*dx*(j-1)*dy*(k-1);
			result[j*21+k]= u[j*21+k]+r1*(u[(j+1)*21+k]-2.0f*u[j*21+k]+u[(j-1)*21+k])
			+r2*(u[j*21+k+1]-2.0f*u[j*21+k]+u[j*21+k-1])+dt*100f*dx*(j-1)*dy*(k-1);			
			}
		}
        }

}
