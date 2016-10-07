import net.njlab.sample.annotation.*;


public class subup extends Thread{
        final float[] u      = new float[16900];
	//final float[] q      = new float[16900];
	final float[] result = new float[16900];
	float r1,r2,dx,dy,dt;



        @JRThrashUnroll(unrollNum=8, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
/*
                float r1 = 0.2f;
		float r2 = 0.2f;
		float dx = 0.05f;
		float dy = 0.05f;
		float dt = 0.0005f;
*/
		dx=1f/(129-1);
		dy=1f/(129-1);
		dt=0.005f;
		r1=dt/(dx*dx);
		r2=dt/(dy*dy);
		for(k=65;k<=129;k++){
			u[1*129+k]=0.5f;
			u[129*129+k]=0.0f;
		}
		for(j=1;j<=129;j++){
			u[j*129+1]=1.f;
			u[j*129+129]=0.0f;
		}


		for(k=2;k<=64;k++){
			for(j=2;j<=128;j++){
			result[j*129+k]= u[j*129+k]+r1*(u[(j+1)*129+k]-2.0f*u[j*129+k]+u[(j-1)*129+k])
			+r2*(u[j*129+k+1]-2.0f*u[j*129+k]+u[j*129+k-1])+dt*100f*dx*(j-1)*dy*(k-1);			
			}
		}
		for(k=2;j<=64;k++){
			for(j=2;j<=128;j++){
				u[j*129+k]=result[j*129+k];
			}
		}

		
        }

}
