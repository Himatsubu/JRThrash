import net.njlab.sample.annotation.*;

public class sub00 extends Thread{
        final float[] u      = new float[16900];
	//final float[] q      = new float[16900];
	final float[] result = new float[16900];
	float r1,r2,dx,dy,dt;

        @JRThrashUnroll(unrollNum=6, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
                dx=1f/128;
		dy=1f/128;
		dt=0.0005f;
		r1=dt/(dx*dx);
		r2=dt/(dy*dy);

		for(k=2;k<=65;k++){
			for(j=2;j<=33;j++){
			//q=100f*dx*(j-1)*dy*(k-1);
			result[j*129+k]= u[j*129+k]+r1*(u[(j+1)*129+k]-2.0f*u[j*129+k]+u[(j-1)*129+k])
			+r2*(u[j*129+k+1]-2.0f*u[j*129+k]+u[j*129+k-1])+dt*100f*dx*(j-1)*dy*(k-1);		
			}
		}
        }

}
