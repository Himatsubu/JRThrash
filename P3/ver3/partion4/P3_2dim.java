import net.njlab.sample.annotation.*;

public class P3_2dim{
		private static final float T[] = new float [16900];
		private static final float TT[]= new float [16900];
		private static final float U[] = new float [16900];
		private static final float V[]= new float  [16900];

	static final sub00 sub00 = new sub00();
	static final sub01 sub01 = new sub01();
	static final sub02 sub02 = new sub02();
	static final sub03 sub03 = new sub03();

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
			T[j*21+k]=0.0f;
			TT[j*21+k]=0.0f;
			U[j*21+k]=40.0f*YY*(1.0f-YY);
			V[j*21+k]=0.0f;
			}
		}

		for(k=1;k<=65;k++){
			for(j=1;j<=65;j++){
				sub00.U[j*129+k]=U[j*129+k];
				sub00.V[j*129+k]=V[j*129+k];
				sub00.T[j*129+k]=T[j*129+k];	
			}
			for(j=64;j<=129;j++){
				sub01.U[(j-63)*129+k]=U[j*129+k];
				sub01.V[(j-63)*129+k]=V[j*129+k];
				sub01.T[(j-63)*129+k]=T[j*129+k];
			}
		}
		for(k=64;k<=129;k++){
			for(j=1;j<=65;j++){
				sub02.U[j*129+k]=U[j*129+k];
				sub02.V[j*129+k]=V[j*129+k];
				sub03.T[j*129+k]=T[j*129+k];
			}
			for(j=64;j<=129;j++){
				sub03.U[(j-63)*129+k]=U[j*129+k];
				sub03.V[(j-63)*129+k]=V[j*129+k];
				sub03.T[(j-63)*129+k]=T[j*129+k];
			}
		}


		for (n = 1; n <= nlast; n++){

			sub00.start();
			sub01.start();
			sub02.start();
			sub03.start();
			try{
				sub00.join();
				sub01.join();
				sub02.join();
				sub03.join();
			}catch(Exception e){}
			
			for(k=2;k<=64;k++){
				sub00.result[65*129+k]=sub01.result[(65-63)*129+k];
				sub01.result[(64-63)*129+k]=sub00.result[64*129+k];
			}
			for(j=2;j<=64;j++){
				sub00.result[j*129+65]=sub02.result[j*129+65];
				sub02.result[j*129+64]=sub00.result[j*129+64];
			}
			for(k=65;k<=128;k++){
				sub02.result[65*129+k]=sub03.result[(65-63)*129+k];
				sub03.result[(64-63)*129+k]=sub02.result[64*129+k];
			}
			for(j=65;j<=128;j++){
				sub01.result[(j-63)*129+65]=sub03.result[j*129+k];
				sub03.result[(j-63)*129+64]=sub01.result[j*129+k];
			}

		}
		for(k=2;k<=64;k++){
			for(j=2;j<=64;j++)  {T[j*129+k]=sub00.result[j*129+k];}
			for(j=65;j<=128;j++){T[j*129+k]=sub01.result[(j-63)*129+k];}
		}
		for(k=65;k<=128;k++){
			for(j=2;j<=64;j++)  {T[j*129+k]=sub02.result[j*129+k];}
			for(j=65;j<=128;j++){T[j*129+k]=sub03.result[(j-63)*129+k];}
		}
		//System.out.println(T[10*21+10]);
}
}

