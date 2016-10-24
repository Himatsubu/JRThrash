import net.njlab.sample.annotation.*;

public class sub10 extends Thread{
        final float[] u      = new float[4515];
	//final float[] q     = new float[484];
	final float[] result = new float[4515];

@JRThrashUnroll(unrollNum=6, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;
		int tmpj;
                float r1 = 0.2f;
		float r2 = 0.2f;
		float dt = 0.0005f;
		float dx = 0.05f;
		float dy = 0.05f;
		float q;
		for(k=65;k<=96;k++){
			u[1*129+k]=0.5f;
			u[129*129+k]=0.0f;
		}
		for(j=2;j<=33;j++){
			//tmpj=j-63;
			u[j*129+1]=1.f;
			u[j*129+129]=0.0f;
		}

		for(k=65;k<=96;k++){
			for(j=2;j<=33;j++){
			//tmpj=j-63;
			//q=100f*dx*(j-1)*dy*(k-1);
			result[j*129+k]= u[j*129+k]+r1*(u[(j+1)*129+k]-2.0f*u[j*129+k]+u[(j-1)*129+k])
			+r2*(u[j*129+k+1]-2.0f*u[j*129+k]+u[j*129+k-1])+dt*100f*dx*(j+63-1)*dy*(k-1);			
			
			}
		}
		for(k=65;k<=96;k++){
			for(j=2;j<=33;j++){
				//tmpj=j-63;
				u[j*129+k]=result[j*129+k];
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
