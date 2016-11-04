import net.njlab.sample.annotation.*;

public class sub00 extends Thread{
        final float[] u      = new float[2452];
	//final float[] q      = new float[484];
	final float[] result = new float[2452];

@JRThrashUnroll(unrollNum=6, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
                float r1 = 0.2f;
		float r2 = 0.2f;
		float dt = 0.0005f;
		float dx = 0.05f;
		float dy = 0.05f;
		//float q;

		for(k=1;k<=33;k++){
			u[1*129+k]=0.5f;
			u[129*129+k]=0.0f;
		}
		for(j=1;j<=17;j++){
			u[j*129+1]=1.f;
			u[j*129+129]=0.0f;
		}


		for(k=2;k<=32;k++){
			for(j=2;j<=16;j++){
			//q=100f*dx*(j-1)*dy*(k-1);
			result[j*129+k]= u[j*129+k]+r1*(u[(j+1)*129+k]-2.0f*u[j*129+k]+u[(j-1)*129+k])
			+r2*(u[j*129+k+1]-2.0f*u[j*129+k]+u[j*129+k-1])+dt*100f*dx*(j-1)*dy*(k-1);		
			}
		}
		for(k=2;k<=32;k++){
			for(j=2;j<=16;j++){
				u[j*129+k]=result[j*129+k];
			}
		}
        }

}