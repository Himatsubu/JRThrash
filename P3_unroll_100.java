import net.njlab.sample.annotation.JRThrashUnroll;
import net.njlab.sample.annotation.JRThrashForwardingInvalidate;

public class P3_unroll_100{
		private static final float T[] = new float [10404];
		private static final float TT[]= new float [10404];
		private static final float U[] = new float [10404];
		private static final float V[]= new float  [10404];

	@JRThrashUnroll(loopVariableName="j",unrollNum=5,unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
//	public static void main(String[] args){
		int k,j,n;
		int mx,my;
		float dt,dx,dy,r1,r2,r3,r4,YY;

		int kx,ky,nlast;

		kx=100;
		ky=100;
		mx=101;
		my=101;
		dt=0.0005f;
		nlast=2;

		dx=4f/(mx-1);
		dy=1f/(my-1);
		r1=0.5f*dt/dx;
		r2=0.5f*dt/dy;
		r3=dt/(dx*dx);
		r4=dt/(dy*dy);
/*

		dx=0.2f;
		dy=0.05f;
		r1=0.00125f;
		r2=0.005f;
		r3=0.0125f;
		r4=0.2f;	
*/
		for (k = 1; k <= my; k++){
			for (j = 1; j<= mx; j++){
			YY=dy*(k-1);
			T[j*101+k]=0.0f;
			TT[j*101+k]=0.0f;
			U[j*101+k]=40.0f*YY*(1.0f-YY);
			V[j*101+k]=0.0f;
			}
		}

//	計算ループ
		for (n = 1; n <= nlast; n++){

//	境界条件
		for (k = 1; k <= my; k++){
			T[1*101+k] = 0.0f;
			T[mx*101+k]= T[(mx-1)*101+k];
			}
		
		for (j = 1; j <= mx; j++){
			T[j*101+1] = 0.0f;
			T[j*101+my]= 0.0f;
		}
		for(j=mx/4;j<=mx/2;j++){
			T[j*101+1]=1.0f;
		}

//	次の時間での温度の計算
		for (k = 2; k <= my-1; k++){
			for (j = 2; j <= mx-1; j++){
     			      TT[j*101+k]= T[j*101+k]-r1*U[j*101+k]*(T[(j+1)*101+k]-T[(j-1)*101+k])
     		                    	-r2*V[j*101+k]*(T[j*101+k+1]-T[j*101+k-1])
     			              +r3*(T[(j+1)*101+k]-2.0f*T[j*101+k]+T[(j-1)*101+k])
     			              +r4*(T[j*101+k+1]-2.0f*T[j*101+k]+T[j*101+k-1]);
			}
		}
		for (k = 2; k <= my-1; k++){
			for (j = 2; j <= mx-1; j++){
				T[j*101+k] = TT[j*101+k];
			}
		}
		}
//		System.out.println(T[10*101+10]);
}
}

