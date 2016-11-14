import net.njlab.sample.annotation.*;

public class sub99 extends Thread{
        final float[] u      = new float[4515];
	//final float[] u1[(j+1)*129+k]     = new float[4515];
	//final float[] u1[(j+1)*129+k]     = new float[4515];
	final float[] result = new float[4515];

@JRThrashUnroll(unrollNum=6, loopVariableName="j", unrollType=JRThrashUnroll.modifyLoopVar_IndependentIterator)
        public void run(){
		int k,j;
                float r1 = 0.2f;
		float r2 = 0.2f;
		float dt = 0.0005f;
		float dx = 0.05f;
		float dy = 0.05f;
		float tmp;


		for(k=2;k<=32;k++){
			for(j=2;j<=32;j++){
			tmp=u[j*129+k];
			result[j*129+k]= tmp+r1*(u[(j+1)*129+k]-2.0f*tmp+u[(j-1)*129+k])
				+r2*(u[j*129+k+1]-2.0f*tmp+u[j*129+k-1])+dt*100f*dx*(j-1)*dy*(k-1);		
			}
		}
		for(k=2;k<=32;k++){
			for(j=2;j<=32;j++){
				u[j*129+k]=result[j*129+k];
			}
		}
        }

}
