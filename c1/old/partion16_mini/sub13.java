import net.njlab.sample.annotation.*;

public class sub13 extends Thread{
        final float[] u      = new float[1024];
	//final float[] q      = new float[484];
	final float[] result = new float[1024];

        @JRThrashUnroll(unrollNum=5, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
                float r1 = 0.2f;
		float r2 = 0.2f;
		float dt = 0.0005f;
		float dx = 0.05f;
		float dy = 0.05f;
		float q;

		for(k=8;k<=10;k++){
			for(j=4;j<=5;j++){
			//q=100f*dx*(j-1)*dy*(k-1);
			result[j*11+k]= u[j*11+k]+r1*(u[(j+1)*11+k]-2.0f*u[j*11+k]+u[(j-1)*11+k])
			+r2*(u[j*11+k+1]-2.0f*u[j*11+k]+u[j*11+k-1])+dt*100f*dx*(j-1)*dy*(k-1);			
			}
		}
/*
		uu[j][k]= u[j][k]+r1*(u[j+1][k]-2.0f*u[j][k]+u[j-1][k])
			+r2*(u[j][k+1]-2.0f*u[j][k]+u[j][k-1])+dt*q[j][k];
		sub[i].u[3]=u[j*11+k];
		sub[i].u[1]=u[j*11+k-1];
		sub[i].u[5]=u[j*11+k+1];
		sub[i].u[2]=u[(j-1)*11+k];
		sub[i].u[4]=u[(j+1)*11+k];
*/
		
        }

}
