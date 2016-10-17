import net.njlab.sample.annotation.*;

public class sub14 extends Thread{
        final float[] u     = new float[4515];
	//final float[] q     = new float[484];
	final float[] result = new float[4515];

        @JRThrashUnroll(unrollNum=5, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
		int tmpj;
                float r1 = 0.2f;
		float r2 = 0.2f;
		float dt = 0.0005f;
		float dx = 0.05f;
		float dy = 0.05f;
		float q;
		for(k=97;k<=128;k++){
			u[1*129+k]=0.5f;
			u[129*129+k]=0.0f;
		}
		for(j=65;j<=96;j++){
			tmpj=j-63;
			u[tmpj*129+1]=1.f;
			u[tmpj*129+129]=0.0f;
		}

		for(k=97;k<=128;k++){
			for(j=65;j<=96;j++){
			//q=100f*dx*(j-1)*dy*(k-1);
			tmpj=j-63;
			result[tmpj*129+k]= u[tmpj*129+k]+r1*(u[(tmpj+1)*129+k]-2.0f*u[tmpj*129+k]+u[(tmpj-1)*129+k])
			+r2*(u[tmpj*129+k+1]-2.0f*u[tmpj*129+k]+u[tmpj*129+k-1])+dt*100f*dx*(j-1)*dy*(k-1);			
			
			}
		}
		for(k=97;k<=128;k++){
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
