import net.njlab.sample.annotation.*;

public class sub04 extends Thread{
        final float[] u      = new float[16900];
	//final float[] q      = new float[16900];
	final float[] result = new float[16900];
	float dt,dx,dy,r1,r2;

        @JRThrashUnroll(unrollNum=5, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
		dx=1f/128;
		dy=1f/128;
		dt=0.0005f;
		r1=dt/(dx*dx);
		r2=dt/(dy*dy);                

		for(k=65;k<=128;k++){
			for(j=2;j<=32;j++){
			//q=100f*dx*(j-1)*dy*(k-1);
			result[j*129+k]= u[j*129+k]+r1*(u[(j+1)*129+k]-2.0f*u[j*129+k]+u[(j-1)*129+k])
			+r2*(u[j*129+k+1]-2.0f*u[j*129+k]+u[j*129+k-1])+dt*100f*dx*(j-1)*dy*(k-1);			
			}
		}
/*
		uu[j][k]= u[j][k]+r1*(u[j+1][k]-2.0f*u[j][k]+u[j-1][k])
			+r2*(u[j][k+1]-2.0f*u[j][k]+u[j][k-1])+dt*q[j][k];
		sub[i].u[3]=u[j*21+k];
		sub[i].u[1]=u[j*21+k-1];
		sub[i].u[5]=u[j*21+k+1];
		sub[i].u[2]=u[(j-1)*21+k];
		sub[i].u[4]=u[(j+1)*21+k];
*/
		
        }

}
