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
	static final sub04 sub04 = new sub04();
	static final sub05 sub05 = new sub05();
	static final sub06 sub06 = new sub06();
	static final sub07 sub07 = new sub07();
	static final sub08 sub08 = new sub08();
	static final sub09 sub09 = new sub09();
	static final sub10 sub10 = new sub10();
	static final sub11 sub11 = new sub11();
	static final sub12 sub12 = new sub12();
	static final sub13 sub13 = new sub13();
	static final sub14 sub14 = new sub14();
	static final sub15 sub15 = new sub15();

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
		for(k=1;k<=4;k++){
			sub00.U[11+k]=U[11+k];
			sub00.V[11+k]=V[11+k];
			sub00.U[22+k]=U[22+k];
			sub00.V[22+k]=V[22+k];
			sub00.U[33+k]=U[33+k];
			sub00.V[33+k]=V[33+k];
			sub00.U[44+k]=U[44+k];
			sub00.V[44+k]=V[44+k];
			sub01.U[33+k]=U[33+k];
			sub01.V[33+k]=V[33+k];
			sub01.U[44+k]=U[44+k];
			sub01.V[44+k]=V[44+k];
			sub01.U[55+k]=U[55+k];
			sub01.V[55+k]=V[55+k];
			sub01.U[66+k]=U[66+k];
			sub01.V[66+k]=V[66+k];
			sub02.U[55+k]=U[55+k];
			sub02.V[55+k]=V[55+k];
			sub02.U[66+k]=U[66+k];
			sub02.V[66+k]=V[66+k];
			sub02.U[77+k]=U[77+k];
			sub02.V[77+k]=V[77+k];
			sub02.U[88+k]=U[88+k];
			sub02.V[88+k]=V[88+k];
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
			sub04.U[11+k+2]=U[11+k+2];
			sub04.V[11+k+2]=V[11+k+2];
			sub04.U[22+k+2]=U[22+k+2];
			sub04.V[22+k+2]=V[22+k+2];
			sub04.U[33+k+2]=U[33+k+2];
			sub04.V[33+k+2]=V[33+k+2];
			sub04.U[44+k+2]=U[44+k+2];
			sub04.V[44+k+2]=V[44+k+2];
			sub05.U[33+k+2]=U[33+k+2];
			sub05.V[33+k+2]=V[33+k+2];
			sub05.U[44+k+2]=U[44+k+2];
			sub05.V[44+k+2]=V[44+k+2];
			sub05.U[55+k+2]=U[55+k+2];
			sub05.V[55+k+2]=V[55+k+2];
			sub05.U[66+k+2]=U[66+k+2];
			sub05.V[66+k+2]=V[66+k+2];
			sub06.U[55+k+2]=U[55+k+2];
			sub06.V[55+k+2]=V[55+k+2];
			sub06.U[66+k+2]=U[66+k+2];
			sub06.V[66+k+2]=V[66+k+2];
			sub06.U[77+k+2]=U[77+k+2];
			sub06.V[77+k+2]=V[77+k+2];
			sub06.U[88+k+2]=U[88+k+2];
			sub06.V[88+k+2]=V[88+k+2];
			sub07.U[77+k+2]=U[77+k+2];
			sub07.V[77+k+2]=V[77+k+2];
			sub07.U[88+k+2]=U[88+k+2];
			sub07.V[88+k+2]=V[88+k+2];
			sub07.U[99+k+2]=U[99+k+2];
			sub07.V[99+k+2]=V[99+k+2];
			sub07.U[110+k+2]=U[110+k+2];
			sub07.V[110+k+2]=V[110+k+2];
			sub07.U[121+k+2]=U[121+k+2];
			sub07.V[121+k+2]=V[121+k+2];
			sub08.U[11+k+4]=U[11+k+4];
			sub08.V[11+k+4]=V[11+k+4];
			sub08.U[22+k+4]=U[22+k+4];
			sub08.V[22+k+4]=V[22+k+4];
			sub08.U[33+k+4]=U[33+k+4];
			sub08.V[33+k+4]=V[33+k+4];
			sub08.U[44+k+4]=U[44+k+4];
			sub08.V[44+k+4]=V[44+k+4];
			sub09.U[33+k+4]=U[33+k+4];
			sub09.V[33+k+4]=V[33+k+4];
			sub09.U[44+k+4]=U[44+k+4];
			sub09.V[44+k+4]=V[44+k+4];
			sub09.U[55+k+4]=U[55+k+4];
			sub09.V[55+k+4]=V[55+k+4];
			sub09.U[66+k+4]=U[66+k+4];
			sub09.V[66+k+4]=V[66+k+4];
			sub10.U[55+k+4]=U[55+k+4];
			sub10.V[55+k+4]=V[55+k+4];
			sub10.U[66+k+4]=U[66+k+4];
			sub10.V[66+k+4]=V[66+k+4];
			sub10.U[77+k+4]=U[77+k+4];
			sub10.V[77+k+4]=V[77+k+4];
			sub10.U[88+k+4]=U[88+k+4];
			sub10.V[88+k+4]=V[88+k+4];
			sub11.V[77+k+4]=V[77+k+4];
			sub11.U[77+k+4]=U[77+k+4];
			sub11.V[88+k+4]=V[88+k+4];
			sub11.U[88+k+4]=U[88+k+4];
			sub11.V[99+k+4]=V[99+k+4];
			sub11.U[99+k+4]=U[99+k+4];
			sub11.V[110+k+4]=V[110+k+4];
			sub11.U[110+k+4]=U[110+k+4];
			sub11.V[121+k+4]=V[121+k+4];
			sub11.U[121+k+4]=U[121+k+4];
		}
		for(k=7;k<=11;k++){
			sub12.U[11+k]=U[11+k];
			sub12.V[11+k]=V[11+k];
			sub12.U[22+k]=U[22+k];
			sub12.V[22+k]=V[22+k];
			sub12.U[33+k]=U[33+k];
			sub12.V[33+k]=V[33+k];
			sub12.U[44+k]=U[44+k];
			sub12.V[44+k]=V[44+k];
			sub13.U[33+k]=U[33+k];
			sub13.V[33+k]=V[33+k];
			sub13.U[44+k]=U[44+k];
			sub13.V[44+k]=V[44+k];
			sub13.U[55+k]=U[55+k];
			sub13.V[55+k]=V[55+k];
			sub13.U[66+k]=U[66+k];
			sub13.V[66+k]=V[66+k];
			sub14.U[55+k]=U[55+k];
			sub14.V[55+k]=V[55+k];
			sub14.U[66+k]=U[66+k];
			sub14.V[66+k]=V[66+k];
			sub14.U[77+k]=U[77+k];
			sub14.V[77+k]=V[77+k];
			sub14.U[88+k]=U[88+k];
			sub14.V[88+k]=V[88+k];
			sub15.U[77+k]=U[77+k];
			sub15.V[77+k]=V[77+k];
			sub15.U[88+k]=U[88+k];
			sub15.V[88+k]=V[88+k];
			sub15.U[99+k]=U[99+k];
			sub15.V[99+k]=V[99+k];
			sub15.U[110+k]=U[110+k];
			sub15.V[110+k]=V[110+k];
			sub15.U[121+k]=U[121+k];
			sub15.V[121+k]=V[121+k];
		}



		for (k = 1; k <= my; k++){
			for (j = 1; j<= mx; j++){
			YY=dy*(k-1);
			T[j*11+k]=0.0f;
			TT[j*11+k]=0.0f;
			U[j*11+k]=40.0f*YY*(1.0f-YY);
			V[j*11+k]=0.0f;
			}
		}

		for (n = 1; n <= nlast; n++){

			//境界条件
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
			for(k=1;k<=4;k++){
				sub00.T[11+k]=T[11+k];
				sub00.T[22+k]=T[22+k];
				sub00.T[33+k]=T[33+k];
				sub00.T[44+k]=T[44+k];
				sub01.T[33+k]=T[33+k];
				sub01.T[44+k]=T[44+k];
				sub01.T[55+k]=T[55+k];
				sub01.T[66+k]=T[66+k];
				sub02.T[55+k]=T[55+k];
				sub02.T[66+k]=T[66+k];
				sub02.T[77+k]=T[77+k];
				sub02.T[88+k]=T[88+k];
				sub03.T[77+k]=T[77+k];
				sub03.T[88+k]=T[88+k];
				sub03.T[99+k]=T[99+k];
				sub03.T[110+k]=T[110+k];
				sub03.T[121+k]=T[121+k];
				sub04.T[11+k+2]=T[11+2];
				sub04.T[22+k+2]=T[22+2];
				sub04.T[33+k+2]=T[33+2];
				sub04.T[44+k+2]=T[44+2];
				sub05.T[33+k+2]=T[33+k+2];
				sub05.T[44+k+2]=T[44+k+2];
				sub05.T[55+k+2]=T[55+k+2];
				sub05.T[66+k+2]=T[66+k+2];
				sub06.T[55+k+2]=T[55+k+2];
				sub06.T[66+k+2]=T[66+k+2];
				sub06.T[77+k+2]=T[77+k+2];
				sub06.T[88+k+2]=T[88+k+2];
				sub07.T[77+k+2]=T[77+k+2];
				sub07.T[88+k+2]=T[88+k+2];
				sub07.T[99+k+2]=T[99+k+2];
				sub07.T[110+k+2]=T[110+k+2];
				sub07.T[121+k+2]=T[121+k+2];
				sub08.T[11+k+4]=T[11+k+4];
				sub08.T[22+k+4]=T[22+k+4];
				sub08.T[33+k+4]=T[33+k+4];
				sub08.T[44+k+4]=T[44+k+4];
				sub09.T[33+k+4]=T[33+k+4];
				sub09.T[44+k+4]=T[44+k+4];
				sub09.T[55+k+4]=T[55+k+4];
				sub09.T[66+k+4]=T[66+k+4];
				sub10.T[55+k+4]=T[55+k+4];
				sub10.T[66+k+4]=T[66+k+4];
				sub10.T[77+k+4]=T[77+k+4];
				sub10.T[88+k+4]=T[88+k+4];
				sub11.T[77+k+4]=T[77+k+4];
				sub11.T[88+k+4]=T[88+k+4];
				sub11.T[99+k+4]=T[99+k+4];
				sub11.T[110+k+4]=T[110+k+4];
				sub11.T[121+k+4]=T[121+k+4];
			}
			for(k=7;k<=11;k++){
				sub12.T[11+k]=T[11+k];
				sub12.T[22+k]=T[22+k];
				sub12.T[33+k]=T[33+k];
				sub12.T[44+k]=T[44+k];
				sub13.T[33+k]=T[33+k];
				sub13.T[44+k]=T[44+k];
				sub13.T[55+k]=T[55+k];
				sub13.T[66+k]=T[66+k];
				sub14.T[55+k]=T[55+k];
				sub14.T[66+k]=T[66+k];
				sub14.T[77+k]=T[77+k];
				sub14.T[88+k]=T[88+k];
				sub15.T[77+k]=T[77+k];
				sub15.T[88+k]=T[88+k];
				sub15.T[99+k]=T[99+k];
				sub15.T[110+k]=T[110+k];
				sub15.T[121+k]=T[121+k];
			}

		sub00.start();
		sub01.start();
		sub02.start();
		sub03.start();
		sub04.start();
		sub05.start();
		sub06.start();
		sub07.start();
		sub08.start();
		sub09.start();
		sub10.start();
		sub11.start();
		sub12.start();
		sub13.start();
		sub14.start();
		sub15.start();
		try{
			sub00.join();
			sub01.join();
			sub02.join();
			sub03.join();
			sub04.join();
			sub05.join();
			sub06.join();
			sub07.join();
			sub08.join();
			sub09.join();
			sub10.join();
			sub11.join();
			sub12.join();
			sub13.join();
			sub14.join();
			sub15.join();
		}catch(Exception e){}
		for(k=2;k<=3;k++){
			T[22+k]=sub00.result[22+k];
			T[33+k]=sub00.result[33+k];
			T[44+k]=sub01.result[44+k];
			T[55+k]=sub01.result[55+k];
			T[66+k]=sub02.result[66+k];
			T[77+k]=sub02.result[77+k];
			T[88+k]=sub03.result[88+k];
			T[99+k]=sub03.result[99+k];
			T[110+k]=sub03.result[110+k];
			T[22+k+2]=sub04.result[22+k+2];
			T[33+k+2]=sub04.result[33+k+2];
			T[44+k+2]=sub05.result[44+k+2];
			T[55+k+2]=sub05.result[55+k+2];
			T[66+k+2]=sub06.result[66+k+2];
			T[77+k+2]=sub06.result[77+k+2];
			T[88+k+2]=sub07.result[88+k+2];
			T[99+k+2]=sub07.result[99+k+2];
			T[110+k+2]=sub07.result[110+k+2];
			T[22+k+4]=sub08.result[22+k+4];
			T[33+k+4]=sub08.result[33+k+4];
			T[44+k+4]=sub09.result[44+k+4];
			T[55+k+4]=sub09.result[55+k+4];
			T[66+k+4]=sub10.result[66+k+4];
			T[77+k+4]=sub10.result[77+k+4];
			T[88+k+4]=sub11.result[88+k+4];
			T[99+k+4]=sub11.result[99+k+4];
			T[110+k+4]=sub11.result[110+k+4];
		}
		for(k=8;k<=10;k++){
			T[22+k]=sub12.result[22+k];
			T[33+k]=sub12.result[33+k];
			T[44+k]=sub13.result[44+k];
			T[55+k]=sub13.result[55+k];
			T[66+k]=sub14.result[66+k];
			T[77+k]=sub14.result[77+k];
			T[88+k]=sub15.result[88+k];
			T[99+k]=sub15.result[99+k];
			T[110+k]=sub15.result[110+k];
		}


		}
		//System.out.println(T[10*21+10]);
}
}

