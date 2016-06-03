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

		for(k=1;k<=6;k++){
			sub00.U[21+k]=U[21+k];
			sub00.U[42+k]=U[42+k];
			sub00.U[63+k]=U[63+k];
			sub00.U[84+k]=U[84+k];
			sub00.U[105+k]=U[105+k];
			sub00.U[126+k]=U[126+k];

			sub01.U[105+k]=U[105+k];
			sub01.U[126+k]=U[126+k];
			sub01.U[147+k]=U[147+k];
			sub01.U[168+k]=U[168+k];
			sub01.U[189+k]=U[189+k];
			sub01.U[210+k]=U[210+k];

			sub02.U[189+k]=U[189+k];
			sub02.U[210+k]=U[210+k];
			sub02.U[231+k]=U[231+k];
			sub02.U[252+k]=U[252+k];
			sub02.U[273+k]=U[273+k];
			sub02.U[294+k]=U[294+k];

			sub03.U[273+k]=U[273+k];
			sub03.U[294+k]=U[294+k];
			sub03.U[315+k]=U[315+k];
			sub03.U[336+k]=U[336+k];
			sub03.U[357+k]=U[357+k];

			sub04.U[357+k]=U[357+k];
			sub04.U[378+k]=U[378+k];
			sub04.U[399+k]=U[399+k];
			sub04.U[420+k]=U[420+k];

			sub00.V[21+k]=V[21+k];
			sub00.V[42+k]=V[42+k];
			sub00.V[63+k]=V[63+k];
			sub00.V[84+k]=V[84+k];
			sub00.V[105+k]=V[105+k];
			sub00.V[126+k]=V[126+k];

			sub01.V[105+k]=V[105+k];
			sub01.V[126+k]=V[126+k];
			sub01.V[147+k]=V[147+k];
			sub01.V[168+k]=V[168+k];
			sub01.V[189+k]=V[189+k];
			sub01.V[210+k]=V[210+k];

			sub02.V[189+k]=V[189+k];
			sub02.V[210+k]=V[210+k];
			sub02.V[231+k]=V[231+k];
			sub02.V[252+k]=V[252+k];
			sub02.V[273+k]=V[273+k];
			sub02.V[294+k]=V[294+k];

			sub03.V[273+k]=V[273+k];
			sub03.V[294+k]=V[294+k];
			sub03.V[315+k]=V[315+k];
			sub03.V[336+k]=V[336+k];
			sub03.V[357+k]=V[357+k];

			sub04.V[357+k]=V[357+k];
			sub04.V[378+k]=V[378+k];
			sub04.V[399+k]=V[399+k];
			sub04.V[420+k]=V[420+k];

			sub05.U[21+k+4]=U[21+k+4];
			sub05.U[42+k+4]=U[42+k+4];
			sub05.U[63+k+4]=U[63+k+4];
			sub05.U[84+k+4]=U[84+k+4];
			sub05.U[105+k+4]=U[105+k+4];
			sub05.U[126+k+4]=U[126+k+4];

			sub06.U[105+k+4]=U[105+k+4];
			sub06.U[126+k+4]=U[126+k+4];
			sub06.U[147+k+4]=U[147+k+4];
			sub06.U[168+k+4]=U[168+k+4];
			sub06.U[189+k+4]=U[189+k+4];
			sub06.U[210+k+4]=U[210+k+4];

			sub07.U[189+k+4]=U[189+k+4];
			sub07.U[210+k+4]=U[210+k+4];
			sub07.U[231+k+4]=U[231+k+4];
			sub07.U[252+k+4]=U[252+k+4];
			sub07.U[273+k+4]=U[273+k+4];
			sub07.U[294+k+4]=U[294+k+4];

			sub08.U[273+k+4]=U[273+k+4];
			sub08.U[294+k+4]=U[294+k+4];
			sub08.U[315+k+4]=U[315+k+4];
			sub08.U[336+k+4]=U[336+k+4];
			sub08.U[357+k+4]=U[357+k+4];

			sub09.U[357+k+4]=U[357+k+4];
			sub09.U[378+k+4]=U[378+k+4];
			sub09.U[399+k+4]=U[399+k+4];
			sub09.U[420+k+4]=U[420+k+4];

			sub05.V[21+k+4]=V[21+k+4];
			sub05.V[42+k+4]=V[42+k+4];
			sub05.V[63+k+4]=V[63+k+4];
			sub05.V[84+k+4]=V[84+k+4];
			sub05.V[105+k+4]=V[105+k+4];
			sub05.V[126+k+4]=V[126+k+4];

			sub06.V[105+k+4]=V[105+k+4];
			sub06.V[126+k+4]=V[126+k+4];
			sub06.V[147+k+4]=V[147+k+4];
			sub06.V[168+k+4]=V[168+k+4];
			sub06.V[189+k+4]=V[189+k+4];
			sub06.V[210+k+4]=V[210+k+4];

			sub07.V[189+k+4]=V[189+k+4];
			sub07.V[210+k+4]=V[210+k+4];
			sub07.V[231+k+4]=V[231+k+4];
			sub07.V[252+k+4]=V[252+k+4];
			sub07.V[273+k+4]=V[273+k+4];
			sub07.V[294+k+4]=V[294+k+4];

			sub08.V[273+k+4]=V[273+k+4];
			sub08.V[294+k+4]=V[294+k+4];
			sub08.V[315+k+4]=V[315+k+4];
			sub08.V[336+k+4]=V[336+k+4];
			sub08.V[357+k+4]=V[357+k+4];

			sub09.V[357+k+4]=V[357+k+4];
			sub09.V[378+k+4]=V[378+k+4];
			sub09.V[399+k+4]=V[399+k+4];
			sub09.V[420+k+4]=V[420+k+4];

			sub10.U[21+k+8]=U[21+k+8];
			sub10.U[42+k+8]=U[42+k+8];
			sub10.U[63+k+8]=U[63+k+8];
			sub10.U[84+k+8]=U[84+k+8];
			sub10.U[105+k+8]=U[105+k+8];
			sub10.U[126+k+8]=U[126+k+8];

			sub11.U[105+k+8]=U[105+k+8];
			sub11.U[126+k+8]=U[126+k+8];
			sub11.U[147+k+8]=U[147+k+8];
			sub11.U[168+k+8]=U[168+k+8];
			sub11.U[189+k+8]=U[189+k+8];
			sub11.U[210+k+8]=U[210+k+8];

			sub12.U[189+k+8]=U[189+k+8];
			sub12.U[210+k+8]=U[210+k+8];
			sub12.U[231+k+8]=U[231+k+8];
			sub12.U[252+k+8]=U[252+k+8];
			sub12.U[273+k+8]=U[273+k+8];
			sub12.U[294+k+8]=U[294+k+8];

			sub13.U[273+k+8]=U[273+k+8];
			sub13.U[294+k+8]=U[294+k+8];
			sub13.U[315+k+8]=U[315+k+8];
			sub13.U[336+k+8]=U[336+k+8];
			sub13.U[357+k+8]=U[357+k+8];

			sub14.U[357+k+8]=U[357+k+8];
			sub14.U[378+k+8]=U[378+k+8];
			sub14.U[399+k+8]=U[399+k+8];
			sub14.U[420+k+8]=U[420+k+8];

			sub10.V[21+k+8]=V[21+k+8];
			sub10.V[42+k+8]=V[42+k+8];
			sub10.V[63+k+8]=V[63+k+8];
			sub10.V[84+k+8]=V[84+k+8];
			sub10.V[105+k+8]=V[105+k+8];
			sub10.V[126+k+8]=V[126+k+8];

			sub11.V[105+k+8]=V[105+k+8];
			sub11.V[126+k+8]=V[126+k+8];
			sub11.V[147+k+8]=V[147+k+8];
			sub11.V[168+k+8]=V[168+k+8];
			sub11.V[189+k+8]=V[189+k+8];
			sub11.V[210+k+8]=V[210+k+8];

			sub12.V[189+k+8]=V[189+k+8];
			sub12.V[210+k+8]=V[210+k+8];
			sub12.V[231+k+8]=V[231+k+8];
			sub12.V[252+k+8]=V[252+k+8];
			sub12.V[273+k+8]=V[273+k+8];
			sub12.V[294+k+8]=V[294+k+8];

			sub13.V[273+k+8]=V[273+k+8];
			sub13.V[294+k+8]=V[294+k+8];
			sub13.V[315+k+8]=V[315+k+8];
			sub13.V[336+k+8]=V[336+k+8];
			sub13.V[357+k+8]=V[357+k+8];

			sub14.V[357+k+8]=V[357+k+8];
			sub14.V[378+k+8]=V[378+k+8];
			sub14.V[399+k+8]=V[399+k+8];
			sub14.V[420+k+8]=V[420+k+8];

			sub15.U[21+k+12]=U[21+k+12];
			sub15.U[42+k+12]=U[42+k+12];
			sub15.U[63+k+12]=U[63+k+12];
			sub15.U[84+k+12]=U[84+k+12];
			sub15.U[105+k+12]=U[105+k+12];
			sub15.U[126+k+12]=U[126+k+12];

			sub16.U[105+k+12]=U[105+k+12];
			sub16.U[126+k+12]=U[126+k+12];
			sub16.U[147+k+12]=U[147+k+12];
			sub16.U[168+k+12]=U[168+k+12];
			sub16.U[189+k+12]=U[189+k+12];
			sub16.U[210+k+12]=U[210+k+12];

			sub17.U[189+k+12]=U[189+k+12];
			sub17.U[210+k+12]=U[210+k+12];
			sub17.U[231+k+12]=U[231+k+12];
			sub17.U[252+k+12]=U[252+k+12];
			sub17.U[273+k+12]=U[273+k+12];
			sub17.U[294+k+12]=U[294+k+12];

			sub18.U[273+k+12]=U[273+k+12];
			sub18.U[294+k+12]=U[294+k+12];
			sub18.U[315+k+12]=U[315+k+12];
			sub18.U[336+k+12]=U[336+k+12];
			sub18.U[357+k+12]=U[357+k+12];

			sub19.U[357+k+12]=U[357+k+12];
			sub19.U[378+k+12]=U[378+k+12];
			sub19.U[399+k+12]=U[399+k+12];
			sub19.U[420+k+12]=U[420+k+12];

			sub15.V[21+k+12]=V[21+k+12];
			sub15.V[42+k+12]=V[42+k+12];
			sub15.V[63+k+12]=V[63+k+12];
			sub15.V[84+k+12]=V[84+k+12];
			sub15.V[105+k+12]=V[105+k+12];
			sub15.V[126+k+12]=V[126+k+12];

			sub16.V[105+k+12]=V[105+k+12];
			sub16.V[126+k+12]=V[126+k+12];
			sub16.V[147+k+12]=V[147+k+12];
			sub16.V[168+k+12]=V[168+k+12];
			sub16.V[189+k+12]=V[189+k+12];
			sub16.V[210+k+12]=V[210+k+12];

			sub17.V[189+k+12]=V[189+k+12];
			sub17.V[210+k+12]=V[210+k+12];
			sub17.V[231+k+12]=V[231+k+12];
			sub17.V[252+k+12]=V[252+k+12];
			sub17.V[273+k+12]=V[273+k+12];
			sub17.V[294+k+12]=V[294+k+12];

			sub18.V[273+k+12]=V[273+k+12];
			sub18.V[294+k+12]=V[294+k+12];
			sub18.V[315+k+12]=V[315+k+12];
			sub18.V[336+k+12]=V[336+k+12];
			sub18.V[357+k+12]=V[357+k+12];

			sub19.V[357+k+12]=V[357+k+12];
			sub19.V[378+k+12]=V[378+k+12];
			sub19.V[399+k+12]=V[399+k+12];
			sub19.V[420+k+12]=V[420+k+12];
		}

		for(k=17;k<=21;k++){
			sub20.U[21+k]=U[21+k];
			sub20.U[42+k]=U[42+k];
			sub20.U[63+k]=U[63+k];
			sub20.U[84+k]=U[84+k];
			sub20.U[105+k]=U[105+k];
			sub20.U[126+k]=U[126+k];

			sub21.U[105+k]=U[105+k];
			sub21.U[126+k]=U[126+k];
			sub21.U[147+k]=U[147+k];
			sub21.U[168+k]=U[168+k];
			sub21.U[189+k]=U[189+k];
			sub21.U[210+k]=U[210+k];

			sub22.U[189+k]=U[189+k];
			sub22.U[210+k]=U[210+k];
			sub22.U[231+k]=U[231+k];
			sub22.U[252+k]=U[252+k];
			sub22.U[273+k]=U[273+k];
			sub22.U[294+k]=U[294+k];

			sub23.U[273+k]=U[273+k];
			sub23.U[294+k]=U[294+k];
			sub23.U[315+k]=U[315+k];
			sub23.U[336+k]=U[336+k];
			sub23.U[357+k]=U[357+k];

			sub24.U[357+k]=U[357+k];
			sub24.U[378+k]=U[378+k];
			sub24.U[399+k]=U[399+k];
			sub24.U[420+k]=U[420+k];

			sub20.V[21+k]=V[21+k];
			sub20.V[42+k]=V[42+k];
			sub20.V[63+k]=V[63+k];
			sub20.V[84+k]=V[84+k];
			sub20.V[105+k]=V[105+k];
			sub20.V[126+k]=V[126+k];

			sub21.V[105+k]=V[105+k];
			sub21.V[126+k]=V[126+k];
			sub21.V[147+k]=V[147+k];
			sub21.V[168+k]=V[168+k];
			sub21.V[189+k]=V[189+k];
			sub21.V[210+k]=V[210+k];

			sub22.V[189+k]=V[189+k];
			sub22.V[210+k]=V[210+k];
			sub22.V[231+k]=V[231+k];
			sub22.V[252+k]=V[252+k];
			sub22.V[273+k]=V[273+k];
			sub22.V[294+k]=V[294+k];

			sub23.V[273+k]=V[273+k];
			sub23.V[294+k]=V[294+k];
			sub23.V[315+k]=V[315+k];
			sub23.V[336+k]=V[336+k];
			sub23.V[357+k]=V[357+k];

			sub24.V[357+k]=V[357+k];
			sub24.V[378+k]=V[378+k];
			sub24.V[399+k]=V[399+k];
			sub24.V[420+k]=V[420+k];
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
		for(k=1;k<=6;k++){
			sub00.T[21+k]=T[21+k];
			sub00.T[42+k]=T[42+k];
			sub00.T[63+k]=T[63+k];
			sub00.T[84+k]=T[84+k];
			sub00.T[105+k]=T[105+k];
			sub00.T[126+k]=T[126+k];

			sub01.T[105+k]=T[105+k];
			sub01.T[126+k]=T[126+k];
			sub01.T[147+k]=T[147+k];
			sub01.T[168+k]=T[168+k];
			sub01.T[189+k]=T[189+k];
			sub01.T[210+k]=T[210+k];

			sub02.T[189+k]=T[189+k];
			sub02.T[210+k]=T[210+k];
			sub02.T[231+k]=T[231+k];
			sub02.T[252+k]=T[252+k];
			sub02.T[273+k]=T[273+k];
			sub02.T[294+k]=T[294+k];

			sub03.T[273+k]=T[273+k];
			sub03.T[294+k]=T[294+k];
			sub03.T[315+k]=T[315+k];
			sub03.T[336+k]=T[336+k];
			sub03.T[357+k]=T[357+k];

			sub04.T[357+k]=T[357+k];
			sub04.T[378+k]=T[378+k];
			sub04.T[399+k]=T[399+k];
			sub04.T[420+k]=T[420+k];

			sub05.T[21+k+4]=T[21+k+4];
			sub05.T[42+k+4]=T[42+k+4];
			sub05.T[63+k+4]=T[63+k+4];
			sub05.T[84+k+4]=T[84+k+4];
			sub05.T[105+k+4]=T[105+k+4];
			sub05.T[126+k+4]=T[126+k+4];

			sub06.T[105+k+4]=T[105+k+4];
			sub06.T[126+k+4]=T[126+k+4];
			sub06.T[147+k+4]=T[147+k+4];
			sub06.T[168+k+4]=T[168+k+4];
			sub06.T[189+k+4]=T[189+k+4];
			sub06.T[210+k+4]=T[210+k+4];

			sub07.T[189+k+4]=T[189+k+4];
			sub07.T[210+k+4]=T[210+k+4];
			sub07.T[231+k+4]=T[231+k+4];
			sub07.T[252+k+4]=T[252+k+4];
			sub07.T[273+k+4]=T[273+k+4];
			sub07.T[294+k+4]=T[294+k+4];

			sub08.T[273+k+4]=T[273+k+4];
			sub08.T[294+k+4]=T[294+k+4];
			sub08.T[315+k+4]=T[315+k+4];
			sub08.T[336+k+4]=T[336+k+4];
			sub08.T[357+k+4]=T[357+k+4];

			sub09.T[357+k+4]=T[357+k+4];
			sub09.T[378+k+4]=T[378+k+4];
			sub09.T[399+k+4]=T[399+k+4];
			sub09.T[420+k+4]=T[420+k+4];

			sub10.T[21+k+8]=T[21+k+8];
			sub10.T[42+k+8]=T[42+k+8];
			sub10.T[63+k+8]=T[63+k+8];
			sub10.T[84+k+8]=T[84+k+8];
			sub10.T[105+k+8]=T[105+k+8];
			sub10.T[126+k+8]=T[126+k+8];

			sub11.T[105+k+8]=T[105+k+8];
			sub11.T[126+k+8]=T[126+k+8];
			sub11.T[147+k+8]=T[147+k+8];
			sub11.T[168+k+8]=T[168+k+8];
			sub11.T[189+k+8]=T[189+k+8];
			sub11.T[210+k+8]=T[210+k+8];

			sub12.T[189+k+8]=T[189+k+8];
			sub12.T[210+k+8]=T[210+k+8];
			sub12.T[231+k+8]=T[231+k+8];
			sub12.T[252+k+8]=T[252+k+8];
			sub12.T[273+k+8]=T[273+k+8];
			sub12.T[294+k+8]=T[294+k+8];

			sub13.T[273+k+8]=T[273+k+8];
			sub13.T[294+k+8]=T[294+k+8];
			sub13.T[315+k+8]=T[315+k+8];
			sub13.T[336+k+8]=T[336+k+8];
			sub13.T[357+k+8]=T[357+k+8];

			sub14.T[357+k+8]=T[357+k+8];
			sub14.T[378+k+8]=T[378+k+8];
			sub14.T[399+k+8]=T[399+k+8];
			sub14.T[420+k+8]=T[420+k+8];

			sub15.T[21+k+12]=T[21+k+12];
			sub15.T[42+k+12]=T[42+k+12];
			sub15.T[63+k+12]=T[63+k+12];
			sub15.T[84+k+12]=T[84+k+12];
			sub15.T[105+k+12]=T[105+k+12];
			sub15.T[126+k+12]=T[126+k+12];

			sub16.T[105+k+12]=T[105+k+12];
			sub16.T[126+k+12]=T[126+k+12];
			sub16.T[147+k+12]=T[147+k+12];
			sub16.T[168+k+12]=T[168+k+12];
			sub16.T[189+k+12]=T[189+k+12];
			sub16.T[210+k+12]=T[210+k+12];

			sub17.T[189+k+12]=T[189+k+12];
			sub17.T[210+k+12]=T[210+k+12];
			sub17.T[231+k+12]=T[231+k+12];
			sub17.T[252+k+12]=T[252+k+12];
			sub17.T[273+k+12]=T[273+k+12];
			sub17.T[294+k+12]=T[294+k+12];

			sub18.T[273+k+12]=T[273+k+12];
			sub18.T[294+k+12]=T[294+k+12];
			sub18.T[315+k+12]=T[315+k+12];
			sub18.T[336+k+12]=T[336+k+12];
			sub18.T[357+k+12]=T[357+k+12];

			sub19.T[357+k+12]=T[357+k+12];
			sub19.T[378+k+12]=T[378+k+12];
			sub19.T[399+k+12]=T[399+k+12];
			sub19.T[420+k+12]=T[420+k+12];
		}

		for(k=17;k<=21;k++){
			sub20.T[21+k]=T[21+k];
			sub20.T[42+k]=T[42+k];
			sub20.T[63+k]=T[63+k];
			sub20.T[84+k]=T[84+k];
			sub20.T[105+k]=T[105+k];
			sub20.T[126+k]=T[126+k];

			sub21.T[105+k]=T[105+k];
			sub21.T[126+k]=T[126+k];
			sub21.T[147+k]=T[147+k];
			sub21.T[168+k]=T[168+k];
			sub21.T[189+k]=T[189+k];
			sub21.T[210+k]=T[210+k];

			sub22.T[189+k]=T[189+k];
			sub22.T[210+k]=T[210+k];
			sub22.T[231+k]=T[231+k];
			sub22.T[252+k]=T[252+k];
			sub22.T[273+k]=T[273+k];
			sub22.T[294+k]=T[294+k];

			sub23.T[273+k]=T[273+k];
			sub23.T[294+k]=T[294+k];
			sub23.T[315+k]=T[315+k];
			sub23.T[336+k]=T[336+k];
			sub23.T[357+k]=T[357+k];

			sub24.T[357+k]=T[357+k];
			sub24.T[378+k]=T[378+k];
			sub24.T[399+k]=T[399+k];
			sub24.T[420+k]=T[420+k];
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
		}catch(Exception e){}

		for(k=2;k<=5;k++)
		{
			T[42+k]=sub00.result[42+k];
			T[63+k]=sub00.result[63+k];
			T[84+k]=sub00.result[84+k];
			T[105+k]=sub00.result[105+k];

			T[126+k]=sub01.result[126+k];
			T[147+k]=sub01.result[147+k];
			T[168+k]=sub01.result[168+k];
			T[189+k]=sub01.result[189+k];

			T[210+k]=sub02.result[210+k];
			T[231+k]=sub02.result[231+k];
			T[252+k]=sub02.result[252+k];
			T[273+k]=sub02.result[273+k];

			T[294+k]=sub03.result[294+k];
			T[315+k]=sub03.result[315+k];
			T[336+k]=sub03.result[336+k];
			T[357+k]=sub03.result[357+k];

			T[378+k]=sub04.result[378+k];
			T[399+k]=sub04.result[399+k];
			T[420+k]=sub04.result[420+k];

			T[42+k+4]=sub05.result[42+k+4];
			T[63+k+4]=sub05.result[63+k+4];
			T[84+k+4]=sub05.result[84+k+4];
			T[105+k+4]=sub05.result[105+k+4];

			T[126+k+4]=sub06.result[126+k+4];
			T[147+k+4]=sub06.result[147+k+4];
			T[168+k+4]=sub06.result[168+k+4];
			T[189+k+4]=sub06.result[189+k+4];

			T[210+k+4]=sub07.result[210+k+4];
			T[231+k+4]=sub07.result[231+k+4];
			T[252+k+4]=sub07.result[252+k+4];
			T[273+k+4]=sub07.result[273+k+4];

			T[294+k+4]=sub08.result[294+k+4];
			T[315+k+4]=sub08.result[315+k+4];
			T[336+k+4]=sub08.result[336+k+4];
			T[357+k+4]=sub08.result[357+k+4];

			T[378+k+4]=sub09.result[378+k+4];
			T[399+k+4]=sub09.result[399+k+4];
			T[420+k+4]=sub09.result[420+k+4];

			T[42+k+8]=sub10.result[42+k+8];
			T[63+k+8]=sub10.result[63+k+8];
			T[84+k+8]=sub10.result[84+k+8];
			T[105+k+8]=sub10.result[105+k+8];

			T[126+k+8]=sub11.result[126+k+8];
			T[147+k+8]=sub11.result[147+k+8];
			T[168+k+8]=sub11.result[168+k+8];
			T[189+k+8]=sub10.result[189+k+8];

			T[210+k+8]=sub12.result[210+k+8];
			T[231+k+8]=sub12.result[231+k+8];
			T[252+k+8]=sub12.result[252+k+8];
			T[273+k+8]=sub12.result[273+k+8];

			T[294+k+8]=sub13.result[294+k+8];
			T[315+k+8]=sub13.result[315+k+8];
			T[336+k+8]=sub13.result[336+k+8];
			T[357+k+8]=sub13.result[357+k+8];

			T[378+k+8]=sub14.result[378+k+8];
			T[399+k+8]=sub14.result[399+k+8];
			T[420+k+8]=sub14.result[420+k+8];

			T[42+k+12]=sub15.result[42+k+12];
			T[63+k+12]=sub15.result[63+k+12];
			T[84+k+12]=sub15.result[84+k+12];
			T[105+k+12]=sub15.result[105+k+12];

			T[126+k+12]=sub16.result[126+k+12];
			T[147+k+12]=sub16.result[147+k+12];
			T[168+k+12]=sub16.result[168+k+12];
			T[189+k+12]=sub16.result[189+k+12];

			T[210+k+12]=sub17.result[210+k+12];
			T[231+k+12]=sub17.result[231+k+12];
			T[252+k+12]=sub17.result[252+k+12];
			T[273+k+12]=sub17.result[273+k+12];

			T[294+k+12]=sub18.result[294+k+12];
			T[315+k+12]=sub18.result[315+k+12];
			T[336+k+12]=sub18.result[336+k+12];
			T[357+k+12]=sub18.result[357+k+12];

			T[378+k+12]=sub19.result[378+k+12];
			T[399+k+12]=sub19.result[399+k+12];
			T[420+k+12]=sub19.result[420+k+12];
		}

		for(k=18;k<=20;k++)
		{
			T[42+k]=sub20.result[42+k];
			T[63+k]=sub20.result[63+k];
			T[84+k]=sub20.result[84+k];
			T[105+k]=sub20.result[105+k];

			T[126+k]=sub21.result[126+k];
			T[147+k]=sub21.result[147+k];
			T[168+k]=sub21.result[168+k];
			T[189+k]=sub21.result[189+k];

			T[210+k]=sub22.result[210+k];
			T[231+k]=sub22.result[231+k];
			T[252+k]=sub22.result[252+k];
			T[273+k]=sub22.result[273+k];

			T[294+k]=sub23.result[294+k];
			T[315+k]=sub23.result[315+k];
			T[336+k]=sub23.result[336+k];
			T[357+k]=sub23.result[357+k];

			T[378+k]=sub24.result[378+k];
			T[399+k]=sub24.result[399+k];
			T[420+k]=sub24.result[420+k];
		}


		}
		//System.out.println(T[10*21+10]);
}
}

