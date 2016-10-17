import net.njlab.sample.annotation.*;

public class sub06 extends Thread{
        final float[] u      = new float[4514];
	//final float[] q      = new float[4514];
	final float[] result = new float[4514];
	float r1,r2,dx,dy,dt;

        @JRThrashUnroll(unrollNum=6, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
		int tmpj;
	
		dx=1f/128;
		dy=1f/128;
		dt=0.0005f;
		r1=dt/(dx*dx);
		r2=dt/(dy*dy);

		for(k=64;k<=129;k++){
			u[1*129+k]=0.5f;
			u[129*129+k]=0.0f;
		}
		for(j=64;j<=97;j++){
			tmpj=j-63;
			u[tmpj*129+1]=1.f;
			u[tmpj*129+129]=0.0f;
		}

		for(k=65;k<=128;k++){
			for(j=65;j<=96;j++){
			tmpj=j-63;
			//q=100f*dx*(j-1)*dy*(k-1);
			result[tmpj*129+k]= u[tmpj*129+k]+r1*(u[(tmpj+1)*129+k]-2.0f*u[tmpj*129+k]+u[(tmpj-1)*129+k])
			+r2*(u[tmpj*129+k+1]-2.0f*u[tmpj*129+k]+u[tmpj*129+k-1])+dt*100f*dx*(j-1)*dy*(k-1);			
			
			}
		}
		for(k=65;k<=128;k++){
			for(j=65;j<=96;j++){
				tmpj=j-63;
				u[tmpj*129+k]=result[tmpj*129+k];
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
