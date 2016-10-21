import net.njlab.sample.annotation.*;

public class P3_2dim{
		private static final float T[] = new float [16900];
		private static final float TT[]= new float [16900];
		private static final float U[] = new float [16900];
		private static final float V[]= new float  [16900];

	static final subup sub00    = new subup();
	static final subunder sub01 = new subunder();

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
//	public static void main(String[] args){
		int k,j,n;
		int mx,my;
		float dt,dx,dy,r1,r2,r3,r4,YY;

		int kx,ky,nlast;

		kx=128;
		ky=128;
		mx=kx+1;
		my=ky+1;
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
			T[j*129+k]=0.0f;
			TT[j*129+k]=0.0f;
			U[j*129+k]=40.0f*YY*(1.0f-YY);
			V[j*129+k]=0.0f;
			}
		}

		for(k=1;k<=65;k++){
			for(j=1;j<=mx;j++){
				sub00.U[j*129+k]=U[j*129+k];
				sub00.V[j*129+k]=U[j*129+k];
				sub00.T[j*129+k]=T[j*129+k];
			}
		}
		
		for(k=64;k<=129;k++){
			for(j=1;j<=129;j++){
				sub01.U[j*129+k]=U[j*129+k];
				sub01.V[j*129+k]=U[j*129+k];
				sub01.T[j*129+k]=T[j*129+k];
			}
		}
		
//	計算ループ
		for (n = 1; n <= nlast; n++){

//	境界条件
			for (k = 1; k <= my; k++){
				T[1*21+k] = 0.0f;
				T[mx*21+k]= T[(mx-1)*21+k];
				}
		
			for (j = 1; j <= mx; j++){
				T[j*21+1] = 0.0f;
				T[j*21+my]= 0.0f;
			}
			for(j=mx/4;j<=mx/2;j++){
				T[j*21+1]=1.0f;
			}
		
		//クラスに配列をこぴー
		sub00.start();
		sub01.start();	
		try{
			sub00.join();
			sub01.join();
		}catch(Exception e){}

			for(j=1;j<=129;j++){
				sub00.U[j*129+64]=sub01.result[j*129+64];
				sub01.U[j*129+64]=sub00.result[j*129+65];
			}	
		}
		for(k=2;k<=64;k++){
			for(j=2;j<=128;j++){
				U[j*129+k]=sub00.result[j*129+k];
			}
		}
		for(k=65;k<=128;k++){
			for(j=2;j<=128;j++){
				U[j*129+k]=sub01.result[j*129+k];
			}
		}


		//System.out.println(T[10*21+10]);
}
}
