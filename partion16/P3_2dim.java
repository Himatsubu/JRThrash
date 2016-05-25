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

		kx=20;
		ky=20;
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
			T[j*21+k]=0.0f;
			TT[j*21+k]=0.0f;
			U[j*21+k]=40.0f*YY*(1.0f-YY);
			V[j*21+k]=0.0f;
			}
		}

		for(k=1;k<=7;k++){
			sub00.U[21+k]=U[21+k];
			sub00.U[42+k]=U[42+k];
			sub00.U[63+k]=U[63+k];
			sub00.U[84+k]=U[84+k];
			sub00.U[105+k]=U[105+k];
			sub00.U[126+k]=U[126+k];
			sub00.U[147+k]=U[147+k];

			sub01.U[126+k]=U[126+k];
			sub01.U[147+k]=U[147+k];
			sub01.U[168+k]=U[168+k];
			sub01.U[189+k]=U[189+k];
			sub01.U[210+k]=U[210+k];
			sub01.U[231+k]=U[231+k];

			sub02.U[252+k]=U[252+k];
			sub02.U[273+k]=U[273+k];
			sub02.U[294+k]=U[294+k];
			sub02.U[315+k]=U[315+k];
			sub02.U[336+k]=U[336+k];
			sub02.U[357+k]=U[357+k];

			sub03.U[336+k]=U[336+k];
			sub03.U[357+k]=U[357+k];
			sub03.U[378+k]=U[378+k];
			sub03.U[399+k]=U[399+k];
			sub03.U[420+k]=U[420+k];
			sub03.U[441+k]=U[441+k];

			sub00.V[21+k]=V[21+k];
			sub00.V[42+k]=V[42+k];
			sub00.V[63+k]=V[63+k];
			sub00.V[84+k]=V[84+k];
			sub00.V[105+k]=V[105+k];
			sub00.V[126+k]=V[126+k];
			sub00.V[147+k]=V[147+k];

			sub01.V[126+k]=V[126+k];
			sub01.V[147+k]=V[147+k];
			sub01.V[168+k]=V[168+k];
			sub01.V[189+k]=V[189+k];
			sub01.V[210+k]=V[210+k];
			sub01.V[231+k]=V[231+k];

			sub02.V[252+k]=V[252+k];
			sub02.V[273+k]=V[273+k];
			sub02.V[294+k]=V[294+k];
			sub02.V[315+k]=V[315+k];
			sub02.V[336+k]=V[336+k];
			sub02.V[357+k]=V[357+k];

			sub03.V[336+k]=V[336+k];
			sub03.V[357+k]=V[357+k];
			sub03.V[378+k]=V[378+k];
			sub03.V[399+k]=V[399+k];
			sub03.V[420+k]=V[420+k];
			sub03.V[441+k]=V[441+k];

			sub04.U[21+k+5]=U[21+k+5];
			sub04.U[42+k+5]=U[42+k+5];
			sub04.U[63+k+5]=U[63+k+5];
			sub04.U[84+k+5]=U[84+k+5];
			sub04.U[105+k+5]=U[105+k+5];
			sub04.U[126+k+5]=U[126+k+5];
			sub04.U[147+k+5]=U[147+k+5];

			sub05.U[126+k+5]=U[126+k+5];
			sub05.U[147+k+5]=U[147+k+5];
			sub05.U[168+k+5]=U[168+k+5];
			sub05.U[189+k+5]=U[189+k+5];
			sub05.U[210+k+5]=U[210+k+5];
			sub05.U[231+k+5]=U[231+k+5];

			sub06.U[252+k+5]=U[252+k+5];
			sub06.U[273+k+5]=U[273+k+5];
			sub06.U[294+k+5]=U[294+k+5];
			sub06.U[315+k+5]=U[315+k+5];
			sub06.U[336+k+5]=U[336+k+5];
			sub06.U[357+k+5]=U[357+k+5];

			sub07.U[336+k+5]=U[336+k+5];
			sub07.U[357+k+5]=U[357+k+5];
			sub07.U[378+k+5]=U[378+k+5];
			sub07.U[399+k+5]=U[399+k+5];
			sub07.U[420+k+5]=U[420+k+5];
			sub07.U[441+k+5]=U[441+k+5];

			sub04.V[21+k+5]=V[21+k+5];
			sub04.V[42+k+5]=V[42+k+5];
			sub04.V[63+k+5]=V[63+k+5];
			sub04.V[84+k+5]=V[84+k+5];
			sub04.V[105+k+5]=V[105+k+5];
			sub04.V[126+k+5]=V[126+k+5];
			sub04.V[147+k+5]=V[147+k+5];

			sub05.V[126+k+5]=V[126+k+5];
			sub05.V[147+k+5]=V[147+k+5];
			sub05.V[168+k+5]=V[168+k+5];
			sub05.V[189+k+5]=V[189+k+5];
			sub05.V[210+k+5]=V[210+k+5];
			sub05.V[231+k+5]=V[231+k+5];

			sub06.V[252+k+5]=V[252+k+5];
			sub06.V[273+k+5]=V[273+k+5];
			sub06.V[294+k+5]=V[294+k+5];
			sub06.V[315+k+5]=V[315+k+5];
			sub06.V[336+k+5]=V[336+k+5];
			sub06.V[357+k+5]=V[357+k+5];

			sub07.V[336+k+5]=V[336+k+5];
			sub07.V[357+k+5]=V[357+k+5];
			sub07.V[378+k+5]=V[378+k+5];
			sub07.V[399+k+5]=V[399+k+5];
			sub07.V[420+k+5]=V[420+k+5];
			sub07.V[441+k+5]=V[441+k+5];

			sub08.U[21+k+10]=U[21+k+10];
			sub08.U[42+k+10]=U[42+k+10];
			sub08.U[63+k+10]=U[63+k+10];
			sub08.U[84+k+10]=U[84+k+10];
			sub08.U[105+k+10]=U[105+k+10];
			sub08.U[126+k+10]=U[126+k+10];
			sub08.U[147+k+10]=U[147+k+10];

			sub09.U[126+k+10]=U[126+k+10];
			sub09.U[147+k+10]=U[147+k+10];
			sub09.U[168+k+10]=U[168+k+10];
			sub09.U[189+k+10]=U[189+k+10];
			sub09.U[210+k+10]=U[210+k+10];
			sub09.U[231+k+10]=U[231+k+10];

			sub10.U[252+k+10]=U[252+k+10];
			sub10.U[273+k+10]=U[273+k+10];
			sub10.U[294+k+10]=U[294+k+10];
			sub10.U[315+k+10]=U[315+k+10];
			sub10.U[336+k+10]=U[336+k+10];
			sub10.U[357+k+10]=U[357+k+10];

			sub11.U[336+k+10]=U[336+k+10];
			sub11.U[357+k+10]=U[357+k+10];
			sub11.U[378+k+10]=U[378+k+10];
			sub11.U[399+k+10]=U[399+k+10];
			sub11.U[420+k+10]=U[420+k+10];
			sub11.U[441+k+10]=U[441+k+10];

			sub08.V[21+k+10]=V[21+k+10];
			sub08.V[42+k+10]=V[42+k+10];
			sub08.V[63+k+10]=V[63+k+10];
			sub08.V[84+k+10]=V[84+k+10];
			sub08.V[105+k+10]=V[105+k+10];
			sub08.V[126+k+10]=V[126+k+10];
			sub08.V[147+k+10]=V[147+k+10];

			sub09.V[126+k+10]=V[126+k+10];
			sub09.V[147+k+10]=V[147+k+10];
			sub09.V[168+k+10]=V[168+k+10];
			sub09.V[189+k+10]=V[189+k+10];
			sub09.V[210+k+10]=V[210+k+10];
			sub09.V[231+k+10]=V[231+k+10];

			sub10.V[252+k+10]=V[252+k+10];
			sub10.V[273+k+10]=V[273+k+10];
			sub10.V[294+k+10]=V[294+k+10];
			sub10.V[315+k+10]=V[315+k+10];
			sub10.V[336+k+10]=V[336+k+10];
			sub10.V[357+k+10]=V[357+k+10];

			sub11.V[336+k+10]=V[336+k+10];
			sub11.V[357+k+10]=V[357+k+10];
			sub11.V[378+k+10]=V[378+k+10];
			sub11.V[399+k+10]=V[399+k+10];
			sub11.V[420+k+10]=V[420+k+10];
			sub11.V[441+k+10]=V[441+k+10];
		}

		for(k=16;k<=21;k++){
			sub12.U[21+k]=U[21+k];
			sub12.U[42+k]=U[42+k];
			sub12.U[63+k]=U[63+k];
			sub12.U[84+k]=U[84+k];
			sub12.U[105+k]=U[105+k];
			sub12.U[126+k]=U[126+k];
			sub12.U[147+k]=U[147+k];

			sub13.U[126+k]=U[126+k];
			sub13.U[147+k]=U[147+k];
			sub13.U[168+k]=U[168+k];
			sub13.U[189+k]=U[189+k];
			sub13.U[210+k]=U[210+k];
			sub13.U[231+k]=U[231+k];

			sub14.U[252+k]=U[252+k];
			sub14.U[273+k]=U[273+k];
			sub14.U[294+k]=U[294+k];
			sub14.U[315+k]=U[315+k];
			sub14.U[336+k]=U[336+k];
			sub14.U[357+k]=U[357+k];

			sub15.U[336+k]=U[336+k];
			sub15.U[357+k]=U[357+k];
			sub15.U[378+k]=U[378+k];
			sub15.U[399+k]=U[399+k];
			sub15.U[420+k]=U[420+k];
			sub15.U[441+k]=U[441+k];

			sub12.V[21+k]=V[21+k];
			sub12.V[42+k]=V[42+k];
			sub12.V[63+k]=V[63+k];
			sub12.V[84+k]=V[84+k];
			sub12.V[105+k]=V[105+k];
			sub12.V[126+k]=V[126+k];
			sub12.V[147+k]=V[147+k];

			sub13.V[126+k]=V[126+k];
			sub13.V[147+k]=V[147+k];
			sub13.V[168+k]=V[168+k];
			sub13.V[189+k]=V[189+k];
			sub13.V[210+k]=V[210+k];
			sub13.V[231+k]=V[231+k];

			sub14.V[252+k]=V[252+k];
			sub14.V[273+k]=V[273+k];
			sub14.V[294+k]=V[294+k];
			sub14.V[315+k]=V[315+k];
			sub14.V[336+k]=V[336+k];
			sub14.V[357+k]=V[357+k];

			sub15.V[336+k]=V[336+k];
			sub15.V[357+k]=V[357+k];
			sub15.V[378+k]=V[378+k];
			sub15.V[399+k]=V[399+k];
			sub15.V[420+k]=V[420+k];
			sub15.V[441+k]=V[441+k];
		}
		for (n = 1; n <= nlast; n++){

			//境界条件
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
		for(k=1;k<=7;k++){
			sub00.T[21+k]=T[21+k];
			sub00.T[42+k]=T[42+k];
			sub00.T[63+k]=T[63+k];
			sub00.T[84+k]=T[84+k];
			sub00.T[105+k]=T[105+k];
			sub00.T[126+k]=T[126+k];
			sub00.T[147+k]=T[147+k];

			sub01.T[126+k]=T[126+k];
			sub01.T[147+k]=T[147+k];
			sub01.T[168+k]=T[168+k];
			sub01.T[189+k]=T[189+k];
			sub01.T[210+k]=T[210+k];
			sub01.T[231+k]=T[231+k];

			sub02.T[252+k]=T[252+k];
			sub02.T[273+k]=T[273+k];
			sub02.T[294+k]=T[294+k];
			sub02.T[315+k]=T[315+k];
			sub02.T[336+k]=T[336+k];
			sub02.T[357+k]=T[357+k];

			sub03.T[336+k]=T[336+k];
			sub03.T[357+k]=T[357+k];
			sub03.T[378+k]=T[378+k];
			sub03.T[399+k]=T[399+k];
			sub03.T[420+k]=T[420+k];
			sub03.T[441+k]=T[441+k];

			sub04.T[21+k+5]=T[21+k+5];
			sub04.T[42+k+5]=T[42+k+5];
			sub04.T[63+k+5]=T[63+k+5];
			sub04.T[84+k+5]=T[84+k+5];
			sub04.T[105+k+5]=T[105+k+5];
			sub04.T[126+k+5]=T[126+k+5];
			sub04.T[147+k+5]=T[147+k+5];

			sub05.T[126+k+5]=T[126+k+5];
			sub05.T[147+k+5]=T[147+k+5];
			sub05.T[168+k+5]=T[168+k+5];
			sub05.T[189+k+5]=T[189+k+5];
			sub05.T[210+k+5]=T[210+k+5];
			sub05.T[231+k+5]=T[231+k+5];

			sub06.T[252+k+5]=T[252+k+5];
			sub06.T[273+k+5]=T[273+k+5];
			sub06.T[294+k+5]=T[294+k+5];
			sub06.T[315+k+5]=T[315+k+5];
			sub06.T[336+k+5]=T[336+k+5];
			sub06.T[357+k+5]=T[357+k+5];

			sub07.T[336+k+5]=T[336+k+5];
			sub07.T[357+k+5]=T[357+k+5];
			sub07.T[378+k+5]=T[378+k+5];
			sub07.T[399+k+5]=T[399+k+5];
			sub07.T[420+k+5]=T[420+k+5];
			sub07.T[441+k+5]=T[441+k+5];

			sub08.T[21+k+10]=T[21+k+10];
			sub08.T[42+k+10]=T[42+k+10];
			sub08.T[63+k+10]=T[63+k+10];
			sub08.T[84+k+10]=T[84+k+10];
			sub08.T[105+k+10]=T[105+k+10];
			sub08.T[126+k+10]=T[126+k+10];
			sub08.T[147+k+10]=T[147+k+10];

			sub09.T[126+k+10]=T[126+k+10];
			sub09.T[147+k+10]=T[147+k+10];
			sub09.T[168+k+10]=T[168+k+10];
			sub09.T[189+k+10]=T[189+k+10];
			sub09.T[210+k+10]=T[210+k+10];
			sub09.T[231+k+10]=T[231+k+10];

			sub10.T[252+k+10]=T[252+k+10];
			sub10.T[273+k+10]=T[273+k+10];
			sub10.T[294+k+10]=T[294+k+10];
			sub10.T[315+k+10]=T[315+k+10];
			sub10.T[336+k+10]=T[336+k+10];
			sub10.T[357+k+10]=T[357+k+10];

			sub11.T[336+k+10]=T[336+k+10];
			sub11.T[357+k+10]=T[357+k+10];
			sub11.T[378+k+10]=T[378+k+10];
			sub11.T[399+k+10]=T[399+k+10];
			sub11.T[420+k+10]=T[420+k+10];
			sub11.T[441+k+10]=T[441+k+10];
		}

		for(k=16;k<=21;k++){
			sub12.T[21+k]=T[21+k];
			sub12.T[42+k]=T[42+k];
			sub12.T[63+k]=T[63+k];
			sub12.T[84+k]=T[84+k];
			sub12.T[105+k]=T[105+k];
			sub12.T[126+k]=T[126+k];
			sub12.T[147+k]=T[147+k];

			sub13.T[126+k]=T[126+k];
			sub13.T[147+k]=T[147+k];
			sub13.T[168+k]=T[168+k];
			sub13.T[189+k]=T[189+k];
			sub13.T[210+k]=T[210+k];
			sub13.T[231+k]=T[231+k];

			sub14.T[252+k]=T[252+k];
			sub14.T[273+k]=T[273+k];
			sub14.T[294+k]=T[294+k];
			sub14.T[315+k]=T[315+k];
			sub14.T[336+k]=T[336+k];
			sub14.T[357+k]=T[357+k];

			sub15.T[336+k]=T[336+k];
			sub15.T[357+k]=T[357+k];
			sub15.T[378+k]=T[378+k];
			sub15.T[399+k]=T[399+k];
			sub15.T[420+k]=T[420+k];
			sub15.T[441+k]=T[441+k];
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

		for(k=2;k<=6;k++)
		{
			T[42+k]=sub00.result[42+k];
			T[63+k]=sub00.result[63+k];
			T[84+k]=sub00.result[84+k];
			T[105+k]=sub00.result[105+k];
			T[126+k]=sub00.result[126+k];

			T[147+k]=sub01.result[147+k];
			T[168+k]=sub01.result[168+k];
			T[189+k]=sub01.result[189+k];
			T[210+k]=sub01.result[210+k];
			T[231+k]=sub01.result[231+k];

			T[252+k]=sub02.result[252+k];
			T[273+k]=sub02.result[273+k];
			T[294+k]=sub02.result[294+k];
			T[315+k]=sub02.result[315+k];
			T[336+k]=sub02.result[336+k];

			T[357+k]=sub03.result[357+k];
			T[378+k]=sub03.result[378+k];
			T[399+k]=sub03.result[399+k];
			T[420+k]=sub03.result[420+k];

			T[42+k+5]=sub04.result[42+k+5];
			T[63+k+5]=sub04.result[63+k+5];
			T[84+k+5]=sub04.result[84+k+5];
			T[105+k+5]=sub04.result[105+k+5];
			T[126+k+5]=sub04.result[126+k+5];

			T[147+k+5]=sub05.result[147+k+5];
			T[168+k+5]=sub05.result[168+k+5];
			T[189+k+5]=sub05.result[189+k+5];
			T[210+k+5]=sub05.result[210+k+5];
			T[231+k+5]=sub05.result[231+k+5];

			T[252+k+5]=sub06.result[252+k+5];
			T[273+k+5]=sub06.result[273+k+5];
			T[294+k+5]=sub06.result[294+k+5];
			T[315+k+5]=sub06.result[315+k+5];
			T[336+k+5]=sub06.result[336+k+5];

			T[357+k+5]=sub07.result[357+k+5];
			T[378+k+5]=sub07.result[378+k+5];
			T[399+k+5]=sub07.result[399+k+5];
			T[420+k+5]=sub07.result[420+k+5];
		
			T[42+k+10]=sub08.result[42+k+10];
			T[63+k+10]=sub08.result[63+k+10];
			T[84+k+10]=sub08.result[84+k+10];
			T[105+k+10]=sub08.result[105+k+10];
			T[126+k+10]=sub08.result[126+k+10];

			T[147+k+10]=sub09.result[147+k+10];
			T[168+k+10]=sub09.result[168+k+10];
			T[189+k+10]=sub09.result[189+k+10];
			T[210+k+10]=sub09.result[210+k+10];
			T[231+k+10]=sub09.result[231+k+10];

			T[252+k+10]=sub10.result[252+k+10];
			T[273+k+10]=sub10.result[273+k+10];
			T[294+k+10]=sub10.result[294+k+10];
			T[315+k+10]=sub10.result[315+k+10];
			T[336+k+10]=sub10.result[336+k+10];

			T[357+k+10]=sub11.result[357+k+10];
			T[378+k+10]=sub11.result[378+k+10];
			T[399+k+10]=sub11.result[399+k+10];
			T[420+k+10]=sub11.result[420+k+10];
		}

		for(k=16;k<=21;k++)
		{
			T[42+k]=sub12.result[42+k];
			T[63+k]=sub12.result[63+k];
			T[84+k]=sub12.result[84+k];
			T[105+k]=sub12.result[105+k];
			T[126+k]=sub12.result[126+k];

			T[147+k]=sub13.result[147+k];
			T[168+k]=sub13.result[168+k];
			T[189+k]=sub13.result[189+k];
			T[210+k]=sub13.result[210+k];
			T[231+k]=sub13.result[231+k];

			T[252+k]=sub14.result[252+k];
			T[273+k]=sub14.result[273+k];
			T[294+k]=sub14.result[294+k];
			T[315+k]=sub14.result[315+k];
			T[336+k]=sub14.result[336+k];

			T[357+k]=sub15.result[357+k];
			T[378+k]=sub15.result[378+k];
			T[399+k]=sub15.result[399+k];
			T[420+k]=sub15.result[420+k];
		}
		}
		//System.out.println(T[10*21+10]);
}
}

