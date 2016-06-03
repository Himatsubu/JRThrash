import net.njlab.sample.annotation.*;


public class sub08 extends Thread{
        final float[] T      = new float[10404];
	final float[] V      = new float[10404];
	final float[] U      = new float[10404];
	final float[] result = new float[10404];

        @JRThrashUnroll(unrollNum=10, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
		float dt,dx,dy,r1,r2,r3,r4,YY;

		dx=0.133333340f;
                dy=3.33333351e-02f;
   		r1=1.87499996e-03f;
   		r2=7.49999983e-03f;
   		r3=2.81249974e-02f;
  		r4=0.449999958f; 
//	次の時間での温度の計算
		for (k = 22; k <= 41; k++){
			for (j = 62; j <= 81; j++){
	     		      result[j*101+k]= T[j*101+k]-r1*U[j*101+k]*(T[(j+1)*101+k]-T[(j-1)*101+k])
	     	                    	-r2*V[j*101+k]*(T[j*101+k+1]-T[j*101+k-1])
	     		              +r3*(T[(j+1)*101+k]-2.0f*T[j*101+k]+T[(j-1)*101+k])
	     		              +r4*(T[j*101+k+1]-2.0f*T[j*101+k]+T[j*101+k-1]);
			}
		}
/*
		uu[j][k]= u[j][k]+r1*(u[j+1][k]-2.0f*u[j][k]+u[j-1][k])
			+r2*(u[j][k+1]-2.0f*u[j][k]+u[j][k-1])+dt*q[j][k];
		sub[i].u[3]=u[j*101+k];
		sub[i].u[1]=u[j*101+k-1];
		sub[i].u[5]=u[j*101+k+1];
		sub[i].u[2]=u[(j-1)*101+k];
		sub[i].u[4]=u[(j+1)*101+k];
*/
		
        }

}
