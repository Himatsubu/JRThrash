import net.njlab.sample.annotation.*;


public class sub06 extends Thread{
        final float[] T      = new float[484];
	final float[] V      = new float[484];
	final float[] U      = new float[484];
	final float[] result = new float[484];

        @JRThrashUnroll(unrollNum=5, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j,kx,ky,mx,my;
		float dt,dx,dy,r1,r2,r3,r4,YY;

		kx=128;
		ky=128;
		mx=kx+1;
		my=ky+1;
		dt=0.0005f;

		dx=4f/(mx-1);
		dy=1f/(my-1);
		r1=0.5f*dt/dx;
		r2=0.5f*dt/dy;
		r3=dt/(dx*dx);
		r4=dt/(dy*dy);

		for (k = 1; k <= my; k++){
			T[1*129+k] = 0.0f;
			T[mx*129+k]= T[(mx-1)*129+k];
		}
		
		for (j = 1; j <= mx; j++){
			T[j*129+1] = 0.0f;
			T[j*129+my]= 0.0f;
		}
		for(j=mx/4;j<=mx/2;j++){
			T[j*129+1]=1.0f;
		}
//	次の時間での温度の計算
		for (k = 65; k <= 128; k++){
			for (j = 65; j <= 96; j++){
	     		      result[j*129+k]= T[j*129+k]-r1*U[j*129+k]*(T[(j+1)*129+k]-T[(j-1)*129+k])
	     	                    	-r2*V[j*129+k]*(T[j*129+k+1]-T[j*129+k-1])
	     		              +r3*(T[(j+1)*129+k]-2.0f*T[j*129+k]+T[(j-1)*129+k])
	     		              +r4*(T[j*129+k+1]-2.0f*T[j*129+k]+T[j*129+k-1]);
			}
		}
/*
		uu[j][k]= u[j][k]+r1*(u[j+1][k]-2.0f*u[j][k]+u[j-1][k])
			+r2*(u[j][k+1]-2.0f*u[j][k]+u[j][k-1])+dt*q[j][k];
		sub[i].u[3]=u[j*129+k];
		sub[i].u[1]=u[j*129+k-1];
		sub[i].u[5]=u[j*129+k+1];
		sub[i].u[2]=u[(j-1)*129+k];
		sub[i].u[4]=u[(j+1)*129+k];
*/
		
        }

}
