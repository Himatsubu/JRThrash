//import net.njlab.sample.annotation.JRThrashUnroll;
//import net.njlab.sample.annotation.JRThrashForwardingInvalidate;

public class P3{
		private final float T[][] = new float [102][102];
		private final float TT[][]= new float [102][102];
		private final float U[][] = new float [102][102];
		private final float V[][] = new float [102][102];
	//@JRThrashUnroll(loopVariableName="j",unrollNum=10,unrollType=JRThrashUnroll.copyLoopVar)
//	public void run(){
	public void main(String[] args){
		//final float T[][] = new float [51][51];
		//final float TT[][]= new float [51][51];
		//final float U[][] = new float [51][51];
		//final float V[][] = new float [51][51];

		int k,j,n;
		int mx,my;
		float dt,dx,dy,r1,r2,r3,r4,YY;

		int kx,ky,nlast;

		kx=100;
		ky=100;
		mx=kx+1;
		my=ky+1;
		dt=0.0005f;
		nlast=1;

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
			T[j][k]=0.0f;
			TT[j][k]=0.0f;
			U[j][k]=40.0f*YY*(1.0f-YY);
			V[j][k]=0.0f;
			}
		}

//	計算ループ
		for (n = 1; n <= nlast; n++){

//	境界条件
			for (k = 1; k <= my; k++){
				T[1][k] = 0.0f;
				T[mx][k]= T[mx-1][k];
				}
		
			for (j = 1; j <= mx; j++){
				T[j][1] = 0.0f;
				T[j][my]= 0.0f;
			}
			for(j=mx/4;j<=mx/2;j++){
				T[j][1]=1.0f;
			}

//	次の時間での温度の計算
			for (k = 2; k <= my-1; k++){
				for (j = 2; j <= mx-1; j++){
	     			      TT[j][k]= T[j][k]-r1*U[j][k]*(T[j+1][k]-T[j-1][k])
	     		                    	-r2*V[j][k]*(T[j][k+1]-T[j][k-1])
	     			              +r3*(T[j+1][k]-2.0f*T[j][k]+T[j-1][k])
	     			              +r4*(T[j][k+1]-2.0f*T[j][k]+T[j][k-1]);
				}
			}
			for (k = 2; k <= my-1; k++){
				for (j = 2; j <= mx-1; j++){
					T[j][k] = TT[j][k];
				}
			}
		}
		System.out.println(T[10][10]);
}
}

