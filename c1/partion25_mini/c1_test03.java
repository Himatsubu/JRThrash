import net.njlab.sample.annotation.*;
//分割数16

public class c1_test03{
	private static final float[] u = new float[484];
	private static final float[] uu= new float[484];
	//private static final float[] q = new float[484];

	static final sub00 sub00    = new sub00(); //1-6,1-4
	static final sub01 sub01    = new sub01(); //1-6,3-6
	static final sub02 sub02    = new sub02(); //5-11,1-4
	static final sub03 sub03    = new sub03(); //5-11,3-6
	static final sub04 sub04    = new sub04(); //10-16,1-4
	static final sub05 sub05    = new sub05(); //10-16,3-6
	static final sub06 sub06    = new sub06(); //15-21,1-4
	static final sub07 sub07    = new sub07(); //15-21,3-6
	static final sub08 sub08    = new sub08(); //1-6,5-8
	static final sub09 sub09    = new sub09(); //1-6,7-11
	static final sub10 sub10    = new sub10(); //5-11,5-8
	static final sub11 sub11    = new sub11(); //5-11,7-11
	static final sub12 sub12    = new sub12(); //10-16,5-8
	static final sub13 sub13    = new sub13(); //10-16,7-11
	static final sub14 sub14    = new sub14(); //15-21,5-8
	static final sub15 sub15    = new sub15(); //15-21,7-11
	static final sub16 sub16    = new sub16(); //1-6,10-13
	static final sub17 sub17    = new sub17(); //1-6,12-16
	static final sub18 sub18    = new sub18(); //5-11,10-13
	static final sub19 sub19    = new sub19(); //5-11,12-16
	static final sub20 sub20    = new sub20(); //10-16,10-13
	static final sub21 sub21    = new sub21(); //10-16,12-16
	static final sub22 sub22    = new sub22(); //15-21,10-13
	static final sub23 sub23    = new sub23(); //15-21,12-16
	static final sub24 sub24    = new sub24(); //1-6,15-18

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		float dx,dy;

		mx=11;
		my=11;
		dx = 0.05f;
		dy = 0.05f;
		nlast=1;
			
//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 //q[j*21+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*11+k] = 0f;
			uu[j*11+k] = 0f;
		}
	}
	
//	計算ループ	
	for(n=1;n<=nlast;n++){
//	境界条件
		for (j = 1; j <= my; j++)
		{
			u[11+j] = 0.5f;
			u[11*11+j]= 0f;
		
			u[j*11+1] = 1.f;
			u[j*11+my]= 0f;
		}
	
		//クラスに配列をこぴー
		//1-6,1-6
		for(k=1;k<=3;k++)
		{
			sub00.u[11+k]=u[11+k];
			sub00.u[22+k]=u[22+k];
			sub00.u[33+k]=u[33+k];

			sub01.u[22+k]=u[22+k];
			sub01.u[33+k]=u[33+k];
			sub01.u[44+k]=u[44+k];
			sub01.u[55+k]=u[55+k];

			sub02.u[44+k]=u[44+k];
			sub02.u[55+k]=u[55+k];
			sub02.u[66+k]=u[66+k];
			sub02.u[77+k]=u[77+k];

			sub03.u[66+k]=u[66+k];
			sub03.u[77+k]=u[77+k];
			sub03.u[88+k]=u[88+k];
			sub03.u[99+k]=u[99+k];

			sub04.u[88+k]=u[88+k];
			sub04.u[99+k]=u[99+k];
			sub04.u[110+k]=u[110+k];
			sub04.u[121+k]=u[121+k];
		}

		for(k=2;k<=5;k++)
		{
			sub05.u[11+k]=u[11+k];
			sub05.u[22+k]=u[22+k];
			sub05.u[33+k]=u[33+k];

			sub06.u[22+k]=u[22+k];
			sub06.u[33+k]=u[33+k];
			sub06.u[44+k]=u[44+k];
			sub06.u[55+k]=u[55+k];

			sub07.u[44+k]=u[44+k];
			sub07.u[55+k]=u[55+k];
			sub07.u[66+k]=u[66+k];
			sub07.u[77+k]=u[77+k];

			sub08.u[66+k]=u[66+k];
			sub08.u[77+k]=u[77+k];
			sub08.u[88+k]=u[88+k];
			sub08.u[99+k]=u[99+k];

			sub09.u[88+k]=u[88+k];
			sub09.u[99+k]=u[99+k];
			sub09.u[110+k]=u[110+k];
			sub09.u[121+k]=u[121+k];

			sub10.u[11+k+2]=u[11+k+2];
			sub10.u[22+k+2]=u[22+k+2];
			sub10.u[33+k+2]=u[33+k+2];
			
			sub11.u[22+k+2]=u[22+k+2];
			sub11.u[33+k+2]=u[33+k+2];
			sub11.u[44+k+2]=u[44+k+2];
			sub11.u[55+k+2]=u[55+k+2];

			sub12.u[44+k+2]=u[44+k+2];
			sub12.u[55+k+2]=u[55+k+2];
			sub12.u[66+k+2]=u[66+k+2];
			sub12.u[77+k+2]=u[77+k+2];

			sub13.u[66+k+2]=u[66+k+2];
			sub13.u[77+k+2]=u[77+k+2];
			sub13.u[88+k+2]=u[88+k+2];
			sub13.u[99+k+2]=u[99+k+2];

			sub14.u[88+k+2]=u[88+k+2];
			sub14.u[99+k+2]=u[99+k+2];
			sub14.u[110+k+2]=u[110+k+2];
			sub14.u[121+k+2]=u[121+k+2];

			sub15.u[11+k+4]=u[11+k+4];
			sub15.u[22+k+4]=u[22+k+4];
			sub15.u[33+k+4]=u[33+k+4];

			sub16.u[22+k+4]=u[22+k+4];
			sub16.u[33+k+4]=u[33+k+4];
			sub16.u[44+k+4]=u[44+k+4];
			sub16.u[55+k+4]=u[55+k+4];

			sub17.u[44+k+4]=u[44+k+4];
			sub17.u[55+k+4]=u[55+k+4];
			sub17.u[66+k+4]=u[66+k+4];
			sub17.u[77+k+4]=u[77+k+4];

			sub18.u[66+k+4]=u[66+k+4];
			sub18.u[77+k+4]=u[77+k+4];
			sub18.u[88+k+4]=u[88+k+4];
			sub18.u[99+k+4]=u[99+k+4];

			sub19.u[88+k+4]=u[88+k+4];
			sub19.u[99+k+4]=u[99+k+4];
			sub19.u[110+k+4]=u[110+k+4];
			sub19.u[121+k+4]=u[121+k+4];

			sub20.u[11+k+6]=u[11+k+6];
			sub20.u[22+k+6]=u[22+k+6];
			sub20.u[33+k+6]=u[33+k+6];

			sub21.u[22+k+6]=u[22+k+6];
			sub21.u[33+k+6]=u[33+k+6];
			sub21.u[44+k+6]=u[44+k+6];
			sub21.u[55+k+6]=u[55+k+6];

			sub22.u[44+k+6]=u[44+k+6];
			sub22.u[55+k+6]=u[55+k+6];
			sub22.u[66+k+6]=u[66+k+6];
			sub22.u[77+k+6]=u[77+k+6];

			sub23.u[66+k+6]=u[66+k+6];
			sub23.u[77+k+6]=u[77+k+6];
			sub23.u[88+k+6]=u[88+k+6];
			sub23.u[99+k+6]=u[99+k+6];

			sub24.u[88+k+6]=u[88+k+6];
			sub24.u[99+k+6]=u[99+k+6];
			sub24.u[110+k+6]=u[110+k+6];
			sub24.u[121+k+6]=u[121+k+6];
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


			u[22+2]=sub00.result[22+2];
			u[33+2]=sub01.result[33+2];
			u[44+2]=sub01.result[44+2];
			u[55+2]=sub02.result[55+2];
			u[66+2]=sub02.result[66+2];
			u[77+2]=sub03.result[77+2];
			u[88+2]=sub03.result[88+2];
			u[99+2]=sub04.result[99+2];
			u[110+2]=sub04.result[110+2];


		for(k=3;k<=4;k++)
		{
			u[22+k]=sub05.result[22+k];
			u[33+k]=sub06.result[33+k];
			u[44+k]=sub06.result[44+k];
			u[55+k]=sub07.result[55+k];
			u[66+k]=sub07.result[66+k];
			u[77+k]=sub08.result[77+k];
			u[88+k]=sub08.result[88+k];
			u[99+k]=sub09.result[99+k];
			u[110+k]=sub09.result[110+k];

			u[22+k+2]=sub10.result[22+k+2];
			u[33+k+2]=sub11.result[33+k+2];
			u[44+k+2]=sub11.result[44+k+2];
			u[55+k+2]=sub12.result[55+k+2];
			u[66+k+2]=sub12.result[66+k+2];
			u[77+k+2]=sub13.result[77+k+2];
			u[88+k+2]=sub13.result[88+k+2];
			u[99+k+2]=sub14.result[99+k+2];
			u[110+k+2]=sub14.result[110+k+2];

			u[22+k+4]=sub15.result[22+k+4];
			u[33+k+4]=sub16.result[33+k+4];
			u[44+k+4]=sub16.result[44+k+4];
			u[55+k+4]=sub17.result[55+k+4];
			u[66+k+4]=sub17.result[66+k+4];
			u[77+k+4]=sub18.result[77+k+4];
			u[88+k+4]=sub18.result[88+k+4];
			u[99+k+4]=sub19.result[99+k+4];
			u[110+k+4]=sub19.result[110+k+4];

			u[22+k+6]=sub20.result[22+k+6];
			u[33+k+6]=sub21.result[33+k+6];
			u[44+k+6]=sub21.result[44+k+6];
			u[55+k+6]=sub22.result[55+k+6];
			u[66+k+6]=sub22.result[66+k+6];
			u[77+k+6]=sub23.result[77+k+6];
			u[88+k+6]=sub23.result[88+k+6];
			u[99+k+6]=sub24.result[99+k+6];
			u[110+k+6]=sub24.result[110+k+6];
		}

/*
		for(k=2;k<=my-1;k++)
		{
			for(j=2;j<=mx-1;j++)
			{
				System.out.println(k+" "+j+" "+u[j*21+k]);
			}
		}
*/
			
		}
		//System.out.println(u[210]);
	}
}
