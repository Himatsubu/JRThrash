import net.njlab.sample.annotation.*;

public class P3_2dim{
		private static final float T[] = new float [484];
		private static final float TT[]= new float [484];
		private static final float U[] = new float [484];
		private static final float V[]= new float  [484];

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

		kx=10;
		ky=10;
		mx=kx+1;
		my=ky+1;
		dt=0.0005f;
		nlast=400;

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
			T[j*11+k]=0.0f;
			TT[j*11+k]=0.0f;
			U[j*11+k]=40.0f*YY*(1.0f-YY);
			V[j*11+k]=0.0f;
			}
		}

		for(k=1;k<=6;k++){
			sub00.U[11+k]=U[11+k];
			sub00.V[11+k]=V[11+k];
			sub00.U[22+k]=U[22+k];
			sub00.V[22+k]=V[22+k];
			sub00.U[33+k]=U[33+k];
			sub00.V[33+k]=V[33+k];
			sub00.U[44+k]=U[44+k];
			sub00.V[44+k]=V[44+k];
			sub00.U[55+k]=U[55+k];
			sub00.V[55+k]=V[55+k];
			sub00.U[66+k]=U[66+k];
			sub00.V[66+k]=V[66+k];
			sub01.U[55+k]=U[55+k];
			sub01.V[55+k]=V[55+k];
			sub01.U[66+k]=U[66+k];
			sub01.V[66+k]=V[66+k];
			sub01.U[77+k]=U[77+k];
			sub01.V[77+k]=V[77+k];
			sub01.U[88+k]=U[88+k];
			sub01.V[88+k]=V[88+k];
			sub01.U[99+k]=U[99+k];
			sub01.V[99+k]=V[99+k];
			sub01.U[110+k]=U[110+k];
			sub01.V[110+k]=V[110+k];
			sub01.U[121+k]=U[121+k];
			sub01.V[121+k]=V[121+k];
		}
		for(k=5;k<=11;k++){
			sub02.U[11+k]=U[11+k];
			sub02.V[11+k]=V[11+k];
			sub02.U[22+k]=U[22+k];
			sub02.V[22+k]=V[22+k];
			sub02.U[33+k]=U[33+k];
			sub02.V[33+k]=V[33+k];
			sub02.U[44+k]=U[44+k];
			sub02.V[44+k]=V[44+k];
			sub02.U[55+k]=U[55+k];
			sub02.V[55+k]=V[55+k];
			sub02.U[66+k]=U[66+k];
			sub02.V[66+k]=V[66+k];
			sub03.U[55+k]=U[55+k];
			sub03.V[55+k]=V[55+k];
			sub03.U[66+k]=U[66+k];
			sub03.V[66+k]=V[66+k];
			sub03.U[77+k]=U[77+k];
			sub03.V[77+k]=V[77+k];
			sub03.U[88+k]=U[88+k];
			sub03.V[88+k]=V[88+k];
			sub03.U[99+k]=U[99+k];
			sub03.V[99+k]=V[99+k];
			sub03.U[110+k]=U[110+k];
			sub03.V[110+k]=V[110+k];
			sub03.U[121+k]=U[121+k];
			sub03.V[121+k]=V[121+k];
		}



		for (n = 1; n <= nlast; n++){

//	境界条件
			for (k = 1; k <= my; k++){
				T[1*11+k] = 0.0f;
				T[mx*11+k]= T[(mx-1)*21+k];
			}
		
			for (j = 1; j <= mx; j++){
				T[j*11+1] = 0.0f;
				T[j*11+my]= 0.0f;
			}
			for(j=mx/4;j<=mx/2;j++){
				T[j*11+1]=1.0f;
			}
		
		//クラスに配列をこぴー
			for(k=1;k<=6;k++){
				sub00.T[11+k]=T[11+k];
				sub00.T[22+k]=T[22+k];
				sub00.T[33+k]=T[33+k];
				sub00.T[44+k]=T[44+k];
				sub00.T[55+k]=T[55+k];
				sub00.T[66+k]=T[66+k];
				sub01.T[55+k]=T[55+k];
				sub01.T[66+k]=T[66+k];
				sub01.T[77+k]=T[77+k];
				sub01.T[88+k]=T[88+k];
				sub01.T[99+k]=T[99+k];
				sub01.T[110+k]=T[110+k];
				sub01.T[121+k]=T[121+k];
			}
			for(k=5;k<=11;k++){
				sub02.T[11+k]=T[11+k];
				sub02.T[22+k]=T[22+k];
				sub02.T[33+k]=T[33+k];
				sub02.T[44+k]=T[44+k];
				sub02.T[55+k]=T[55+k];
				sub02.T[66+k]=T[66+k];
				sub03.T[55+k]=T[55+k];
				sub03.T[66+k]=T[66+k];
				sub03.T[77+k]=T[77+k];
				sub03.T[88+k]=T[88+k];
				sub03.T[99+k]=T[99+k];
				sub03.T[110+k]=T[110+k];
				sub03.T[121+k]=T[121+k];
			}

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

		for(k=2;k<=5;k++){
			T[22+k]=sub00.result[22+k];
			T[33+k]=sub00.result[33+k];
			T[44+k]=sub00.result[44+k];
			T[55+k]=sub00.result[55+k];
			T[66+k]=sub01.result[66+k];
			T[77+k]=sub01.result[77+k];
			T[88+k]=sub01.result[88+k];
			T[99+k]=sub01.result[99+k];
			T[110+k]=sub01.result[110+k];
		}
		for(k=6;k<=10;k++){
			T[22+k]=sub02.result[22+k];
			T[33+k]=sub02.result[33+k];
			T[44+k]=sub02.result[44+k];
			T[55+k]=sub02.result[55+k];
			T[66+k]=sub03.result[66+k];
			T[77+k]=sub03.result[77+k];
			T[88+k]=sub03.result[88+k];
			T[99+k]=sub03.result[99+k];
			T[110+k]=sub03.result[110+k];
		}



		}
		//System.out.println(T[10*21+10]);
}
}

