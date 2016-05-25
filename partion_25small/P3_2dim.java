import net.njlab.sample.annotation.*;

public class P3_2dim{
	private static final float T[] = new float [1024];
	private static final float TT[]= new float [1024];
	private static final float U[] = new float [1024];
	private static final float V[]= new float  [1024];

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
	static final sub16 sub16 = new sub16();
	static final sub17 sub17 = new sub17();
	static final sub18 sub18 = new sub18();
	static final sub19 sub19 = new sub19();
	static final sub20 sub20 = new sub20();
	static final sub21 sub21 = new sub21();
	static final sub22 sub22 = new sub22();
	static final sub23 sub23 = new sub23();
	static final sub24 sub24 = new sub24();

        @JRThrashUnroll(unrollNum=7,loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
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
			T[j*11+k]=0.0f;
			TT[j*11+k]=0.0f;
			U[j*11+k]=40.0f*YY*(1.0f-YY);
			V[j*11+k]=0.0f;
			}
		}

		for(k=1;k<=3;k++){
			sub00.U[11+k]=U[11+k];
			sub00.V[11+k]=V[11+k];
			sub00.U[22+k]=U[22+k];
			sub00.V[22+k]=V[22+k];
			sub00.U[33+k]=U[33+k];
			sub00.V[33+k]=V[33+k];
			sub01.U[22+k]=U[22+k];
			sub01.V[22+k]=V[22+k];
			sub01.U[33+k]=U[33+k];
			sub01.V[33+k]=V[33+k];
			sub01.U[44+k]=U[44+k];
			sub01.V[44+k]=V[44+k];
			sub01.U[55+k]=U[55+k];
			sub01.V[55+k]=V[55+k];
			sub02.U[44+k]=U[44+k];
			sub02.V[44+k]=V[44+k];
			sub02.U[55+k]=U[55+k];
			sub02.V[55+k]=V[55+k];
			sub02.U[66+k]=U[66+k];
			sub02.V[66+k]=V[66+k];
			sub02.U[77+k]=U[77+k];
			sub02.V[77+k]=V[77+k];
			sub03.U[66+k]=U[66+k];
			sub03.V[66+k]=V[66+k];
			sub03.U[77+k]=U[77+k];
			sub03.V[77+k]=V[77+k];
			sub03.U[88+k]=U[88+k];
			sub03.V[88+k]=V[88+k];
			sub03.U[99+k]=U[99+k];
			sub03.V[99+k]=V[99+k];
			sub04.U[88+k]=U[88+k];
			sub04.V[88+k]=V[88+k];
			sub04.U[99+k]=U[99+k];
			sub04.V[99+k]=V[99+k];
			sub04.U[110+k]=U[110+k];
			sub04.V[110+k]=V[110+k];
			sub04.U[121+k]=U[121+k];
			sub04.V[121+k]=V[121+k];
		}
		for(k=2;k<=5;k++){
			sub05.U[11+k]=U[11+k];
			sub05.V[11+k]=V[11+k];
			sub05.U[22+k]=U[22+k];
			sub05.V[22+k]=V[22+k];
			sub05.U[33+k]=U[33+k];
			sub05.V[33+k]=V[33+k];
			sub06.U[22+k]=U[22+k];
			sub06.V[22+k]=V[22+k];
			sub06.U[33+k]=U[33+k];
			sub06.V[33+k]=V[33+k];
			sub06.U[44+k]=U[44+k];
			sub06.V[44+k]=V[44+k];
			sub06.U[55+k]=U[55+k];
			sub06.V[55+k]=V[55+k];
			sub07.U[44+k]=U[44+k];
			sub07.V[44+k]=V[44+k];
			sub07.U[55+k]=U[55+k];
			sub07.V[55+k]=V[55+k];
			sub07.U[66+k]=U[66+k];
			sub07.V[66+k]=V[66+k];
			sub07.U[77+k]=U[77+k];
			sub07.V[77+k]=V[77+k];
			sub08.U[66+k]=U[66+k];
			sub08.V[66+k]=V[66+k];
			sub08.U[77+k]=U[77+k];
			sub08.V[77+k]=V[77+k];
			sub08.U[88+k]=U[88+k];
			sub08.V[88+k]=V[88+k];
			sub08.U[99+k]=U[99+k];
			sub08.V[99+k]=V[99+k];
			sub09.U[88+k]=U[88+k];
			sub09.V[88+k]=V[88+k];
			sub09.U[99+k]=U[99+k];
			sub09.V[99+k]=V[99+k];
			sub09.U[110+k]=U[110+k];
			sub09.V[110+k]=V[110+k];
			sub09.U[121+k]=U[121+k];
			sub09.V[121+k]=V[121+k];
			sub10.U[11+k+2]=U[11+k+2];
			sub10.V[11+k+2]=V[11+k+2];
			sub10.U[22+k+2]=U[22+k+2];
			sub10.V[22+k+2]=V[22+k+2];
			sub10.U[33+k+2]=U[33+k+2];
			sub10.V[33+k+2]=V[33+k+2];
			sub11.V[22+k+2]=V[22+k+2];
			sub11.U[22+k+2]=U[22+k+2];
			sub11.V[33+k+2]=V[33+k+2];
			sub11.U[33+k+2]=U[33+k+2];
			sub11.V[44+k+2]=V[44+k+2];
			sub11.U[44+k+2]=U[44+k+2];
			sub11.V[55+k+2]=V[55+k+2];
			sub11.U[55+k+2]=U[55+k+2];
			sub12.U[44+k+2]=U[44+k+2];
			sub12.V[44+k+2]=V[44+k+2];
			sub12.U[55+k+2]=U[55+k+2];
			sub12.V[55+k+2]=V[55+k+2];
			sub12.U[66+k+2]=U[66+k+2];
			sub12.V[66+k+2]=V[66+k+2];
			sub12.U[77+k+2]=U[77+k+2];
			sub12.V[77+k+2]=V[77+k+2];
			sub13.U[66+k+2]=U[66+k+2];
			sub13.V[66+k+2]=V[66+k+2];
			sub13.U[77+k+2]=U[77+k+2];
			sub13.V[77+k+2]=V[77+k+2];
			sub13.U[88+k+2]=U[88+k+2];
			sub13.V[88+k+2]=V[88+k+2];
			sub13.U[99+k+2]=U[99+k+2];
			sub13.V[99+k+2]=V[99+k+2];
			sub14.U[88+k+2]=U[88+k+2];
			sub14.V[88+k+2]=V[88+k+2];
			sub14.U[99+k+2]=U[99+k+2];
			sub14.V[99+k+2]=V[99+k+2];
			sub14.U[110+k+2]=U[110+k+2];
			sub14.V[110+k+2]=V[110+k+2];
			sub14.U[121+k+2]=U[121+k+2];
			sub14.V[121+k+2]=V[121+k+2];
			sub15.U[11+k+4]=U[11+k+4];
			sub15.V[11+k+4]=V[11+k+4];
			sub15.U[22+k+4]=U[22+k+4];
			sub15.V[22+k+4]=V[22+k+4];
			sub15.U[33+k+4]=U[33+k+4];
			sub15.V[33+k+4]=V[33+k+4];
			sub16.U[22+k+4]=U[22+k+4];
			sub16.V[22+k+4]=V[22+k+4];
			sub16.U[33+k+4]=U[33+k+4];
			sub16.V[33+k+4]=V[33+k+4];
			sub16.U[44+k+4]=U[44+k+4];
			sub16.V[44+k+4]=V[44+k+4];
			sub16.U[55+k+4]=U[55+k+4];
			sub16.V[55+k+4]=V[55+k+4];
			sub17.U[44+k+4]=U[44+k+4];
			sub17.V[44+k+4]=V[44+k+4];
			sub17.U[55+k+4]=U[55+k+4];
			sub17.V[55+k+4]=V[55+k+4];
			sub17.U[66+k+4]=U[66+k+4];
			sub17.V[66+k+4]=V[66+k+4];
			sub17.U[77+k+4]=U[77+k+4];
			sub17.V[77+k+4]=V[77+k+4];
			sub18.U[66+k+4]=U[66+k+4];
			sub18.V[66+k+4]=V[66+k+4];
			sub18.U[77+k+4]=U[77+k+4];
			sub18.V[77+k+4]=V[77+k+4];
			sub18.U[88+k+4]=U[88+k+4];
			sub18.V[88+k+4]=V[88+k+4];
			sub18.U[99+k+4]=U[99+k+4];
			sub18.V[99+k+4]=V[99+k+4];
			sub19.U[88+k+4]=U[88+k+4];
			sub19.V[88+k+4]=V[88+k+4];
			sub19.U[99+k+4]=U[99+k+4];
			sub19.V[99+k+4]=V[99+k+4];
			sub19.U[110+k+4]=U[110+k+4];
			sub19.V[110+k+4]=V[110+k+4];
			sub19.U[121+k+4]=U[121+k+4];
			sub19.V[121+k+4]=V[121+k+4];
			sub20.U[11+k+6]=U[11+k+6];
			sub20.V[11+k+6]=V[11+k+6];
			sub20.U[22+k+6]=U[22+k+6];
			sub20.V[22+k+6]=V[22+k+6];
			sub20.U[33+k+6]=U[33+k+6];
			sub20.V[33+k+6]=V[33+k+6];
			sub21.U[22+k+6]=U[22+k+6];
			sub21.V[22+k+6]=V[22+k+6];
			sub21.U[33+k+6]=U[33+k+6];
			sub21.V[33+k+6]=V[33+k+6];
			sub21.U[44+k+6]=U[44+k+6];
			sub21.V[44+k+6]=V[44+k+6];
			sub21.U[55+k+6]=U[55+k+6];
			sub21.V[55+k+6]=V[55+k+6];
			sub22.U[44+k+6]=U[44+k+6];
			sub22.V[44+k+6]=V[44+k+6];
			sub22.U[55+k+6]=U[55+k+6];
			sub22.V[55+k+6]=V[55+k+6];
			sub22.U[66+k+6]=U[66+k+6];
			sub22.V[66+k+6]=V[66+k+6];
			sub22.U[77+k+6]=U[77+k+6];
			sub22.V[77+k+6]=V[77+k+6];
			sub23.U[66+k+6]=U[66+k+6];
			sub23.V[66+k+6]=V[66+k+6];
			sub23.U[77+k+6]=U[77+k+6];
			sub23.V[77+k+6]=V[77+k+6];
			sub23.U[88+k+6]=U[88+k+6];
			sub23.V[88+k+6]=V[88+k+6];
			sub23.U[99+k+6]=U[99+k+6];
			sub23.V[99+k+6]=V[99+k+6];
			sub24.U[88+k+6]=U[88+k+6];
			sub24.V[88+k+6]=V[88+k+6];
			sub24.U[99+k+6]=U[99+k+6];
			sub24.V[99+k+6]=V[99+k+6];
			sub24.U[110+k+6]=U[110+k+6];
			sub24.V[110+k+6]=V[110+k+6];
			sub24.U[121+k+6]=U[121+k+6];
			sub24.V[121+k+6]=V[121+k+6];
		}

	

		for (n = 1; n <= nlast; n++){

			//境界条件
			for (k = 1; k <= my; k++){
				T[1*11+k] = 0.0f;
				T[mx*11+k]= T[(mx-1)*11+k];
			}
		
			for (j = 1; j <= mx; j++){
				T[j*11+1] = 0.0f;
				T[j*11+my]= 0.0f;
			}
			for(j=mx/4;j<=mx/2;j++){
				T[j*11+1]=1.0f;
			}
		
		//クラスに配列をこぴー
		for(k=1;k<=3;k++){
			sub00.T[11+k]=T[11+k];
			sub00.T[22+k]=T[22+k];
			sub00.T[33+k]=T[33+k];
			sub01.T[22+k]=T[22+k];
			sub01.T[33+k]=T[33+k];
			sub01.T[44+k]=T[44+k];
			sub02.T[44+k]=T[44+k];
			sub02.T[55+k]=T[55+k];
			sub02.T[66+k]=T[66+k];
			sub02.T[77+k]=T[77+k];
			sub03.T[66+k]=T[66+k];
			sub03.T[77+k]=T[77+k];
			sub03.T[88+k]=T[88+k];
			sub03.T[99+k]=T[99+k];
			sub04.T[88+k]=T[88+k];
			sub04.T[99+k]=T[99+k];
			sub04.T[110+k]=T[110+k];
			sub04.T[121+k]=T[121+k];
		}
		for(k=2;k<=5;k++){
			sub05.T[11+k]=T[11+k];
			sub05.T[22+k]=T[22+k];
			sub05.T[33+k]=T[33+k];
			sub06.T[22+k]=T[22+k];
			sub06.T[33+k]=T[33+k];
			sub06.T[44+k]=T[44+k];
			sub07.T[44+k]=T[44+k];
			sub07.T[55+k]=T[55+k];
			sub07.T[66+k]=T[66+k];
			sub07.T[77+k]=T[77+k];
			sub08.T[66+k]=T[66+k];
			sub08.T[77+k]=T[77+k];
			sub08.T[88+k]=T[88+k];
			sub08.T[99+k]=T[99+k];
			sub09.T[88+k]=T[88+k];
			sub09.T[99+k]=T[99+k];
			sub09.T[110+k]=T[110+k];
			sub09.T[121+k]=T[121+k];
			sub10.T[11+k+2]=T[11+k+2];
			sub10.T[22+k+2]=T[22+k+2];
			sub10.T[33+k+2]=T[33+k+2];
			sub11.T[22+k+2]=T[22+k+2];
			sub11.T[33+k+2]=T[33+k+2];
			sub11.T[44+k+2]=T[44+k+2];
			sub12.T[44+k+2]=T[44+k+2];
			sub12.T[55+k+2]=T[55+k+2];
			sub12.T[66+k+2]=T[66+k+2];
			sub12.T[77+k+2]=T[77+k+2];
			sub13.T[66+k+2]=T[66+k+2];
			sub13.T[77+k+2]=T[77+k+2];
			sub13.T[88+k+2]=T[88+k+2];
			sub13.T[99+k+2]=T[99+k+2];
			sub14.T[88+k+2]=T[88+k+2];
			sub14.T[99+k+2]=T[99+k+2];
			sub14.T[110+k+2]=T[110+k+2];
			sub14.T[121+k+2]=T[121+k+2];
			sub15.T[11+k+4]=T[11+k+4];
			sub15.T[22+k+4]=T[22+k+4];
			sub15.T[33+k+4]=T[33+k+4];
			sub16.T[22+k+4]=T[22+k+4];
			sub16.T[33+k+4]=T[33+k+4];
			sub16.T[44+k+4]=T[44+k+4];
			sub17.T[44+k+4]=T[44+k+4];
			sub17.T[55+k+4]=T[55+k+4];
			sub17.T[66+k+4]=T[66+k+4];
			sub17.T[77+k+4]=T[77+k+4];
			sub18.T[66+k+4]=T[66+k+4];
			sub18.T[77+k+4]=T[77+k+4];
			sub18.T[88+k+4]=T[88+k+4];
			sub18.T[99+k+4]=T[99+k+4];
			sub19.T[88+k+4]=T[88+k+4];
			sub19.T[99+k+4]=T[99+k+4];
			sub19.T[110+k+4]=T[110+k+4];
			sub19.T[121+k+4]=T[121+k+4];
			sub20.T[11+k+6]=T[11+k+6];
			sub20.T[22+k+6]=T[22+k+6];
			sub20.T[33+k+6]=T[33+k+6];
			sub21.T[22+k+6]=T[22+k+6];
			sub21.T[33+k+6]=T[33+k+6];
			sub21.T[44+k+6]=T[44+k+6];
			sub22.T[44+k+6]=T[44+k+6];
			sub22.T[55+k+6]=T[55+k+6];
			sub22.T[66+k+6]=T[66+k+6];
			sub22.T[77+k+6]=T[77+k+6];
			sub23.T[66+k+6]=T[66+k+6];
			sub23.T[77+k+6]=T[77+k+6];
			sub23.T[88+k+6]=T[88+k+6];
			sub23.T[99+k+6]=T[99+k+6];
			sub24.T[88+k+6]=T[88+k+6];
			sub24.T[99+k+6]=T[99+k+6];
			sub24.T[110+k+6]=T[110+k+6];
			sub24.T[121+k+6]=T[121+k+6];
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
		sub16.start();
		sub17.start();
		sub18.start();
		sub19.start();
		sub20.start();
		sub21.start();
		sub22.start();
		sub23.start();
		sub24.start();
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
			sub16.join();
			sub17.join();
			sub18.join();
			sub19.join();
			sub20.join();
			sub21.join();
			sub22.join();
			sub23.join();
			sub24.join();
		}catch(Exception e){}

		T[22+k]=sub00.result[22+k];
		T[33+k]=sub01.result[33+k];
		T[44+k]=sub01.result[44+k];
		T[55+k]=sub02.result[55+k];
		T[66+k]=sub02.result[66+k];
		T[77+k]=sub03.result[77+k];
		T[88+k]=sub03.result[88+k];
		T[99+k]=sub04.result[99+k];
		T[110+k]=sub04.result[110+k];
		
		for(k=3;k<=4;k++){
			T[22+k]=sub05.result[22+k];
			T[33+k]=sub06.result[33+k];
			T[44+k]=sub06.result[44+k];
			T[55+k]=sub07.result[55+k];
			T[66+k]=sub07.result[66+k];
			T[77+k]=sub08.result[77+k];
			T[88+k]=sub08.result[88+k];
			T[99+k]=sub09.result[99+k];
			T[110+k]=sub09.result[110+k];
			T[22+k+2]=sub10.result[22+k+2];
			T[33+k+2]=sub11.result[33+k+2];
			T[44+k+2]=sub11.result[44+k+2];
			T[55+k+2]=sub12.result[55+k+2];
			T[66+k+2]=sub12.result[66+k+2];
			T[77+k+2]=sub13.result[77+k+2];
			T[88+k+2]=sub13.result[88+k+2];
			T[99+k+2]=sub14.result[99+k+2];
			T[110+k+2]=sub14.result[110+k+2];
			T[22+k+4]=sub15.result[22+k+4];
			T[33+k+4]=sub16.result[33+k+4];
			T[44+k+4]=sub16.result[44+k+4];
			T[55+k+4]=sub17.result[55+k+4];
			T[66+k+4]=sub17.result[66+k+4];
			T[77+k+4]=sub18.result[77+k+4];
			T[88+k+4]=sub18.result[88+k+4];
			T[99+k+4]=sub19.result[99+k+4];
			T[110+k+4]=sub19.result[110+k+4];
			T[22+k+6]=sub20.result[22+k+6];
			T[33+k+6]=sub21.result[33+k+6];
			T[44+k+6]=sub21.result[44+k+6];
			T[55+k+6]=sub22.result[55+k+6];
			T[66+k+6]=sub22.result[66+k+6];
			T[77+k+6]=sub23.result[77+k+6];
			T[88+k+6]=sub23.result[88+k+6];
			T[99+k+6]=sub24.result[99+k+6];
			T[110+k+6]=sub24.result[110+k+6];
		}

		}
		//System.out.println(T[10*21+10]);
}
}
