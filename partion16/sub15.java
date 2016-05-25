import net.njlab.sample.annotation.*;


public class sub15 extends Thread{
        final float[] T      = new float[484];
	final float[] V      = new float[484];
	final float[] U      = new float[484];
	final float[] result = new float[484];

        @JRThrashUnroll(unrollNum=5, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
		float dt,dx,dy,r1,r2,r3,r4,YY;

		dx=0.2f;
		dy=0.05f;
		r1=0.00125f;
		r2=0.005f;
		r3=0.0125f;
		r4=0.2f;
//	次の時間での温度の計算
		for (k = 17; k <= 20; k++){
			for (j = 17; j <= 20; j++){
	     		      result[j*21+k]= T[j*21+k]-r1*U[j*21+k]*(T[(j+1)*21+k]-T[(j-1)*21+k])
	     	                    	-r2*V[j*21+k]*(T[j*21+k+1]-T[j*21+k-1])
	     		              +r3*(T[(j+1)*21+k]-2.0f*T[j*21+k]+T[(j-1)*21+k])
	     		              +r4*(T[j*21+k+1]-2.0f*T[j*21+k]+T[j*21+k-1]);
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
