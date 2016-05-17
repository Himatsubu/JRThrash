import net.njlab.sample.annotation.*;
//分割数16

public class c1_test03{
	private static final float[] u = new float[1024];
	private static final float[] uu= new float[1024];
	//private static final float[] q = new float[484];

	static final sub00 sub00    = new sub00(); //1-6,1-6
	static final sub01 sub01    = new sub01(); //5-11,1-6
	static final sub02 sub02    = new sub02(); //10-16,1-6
	static final sub03 sub03    = new sub03(); //15-21,1-6
	static final sub04 sub04    = new sub04(); //1-6,5-11
	static final sub05 sub05    = new sub05(); //5-11,5-11
	static final sub06 sub06    = new sub06(); //10-16,5-11
	static final sub07 sub07    = new sub07(); //15-21,5-11
	static final sub08 sub08    = new sub08(); //1-6,10-16
	static final sub09 sub09    = new sub09(); //5-11,10-16
	static final sub10 sub10    = new sub10(); //10-16,10-16
	static final sub11 sub11    = new sub11(); //15-21,10-16
	static final sub12 sub12    = new sub12(); //1-6,15-21
	static final sub13 sub13    = new sub13(); //5-11,15-21
	static final sub14 sub14    = new sub14(); //10-16,15-21
	static final sub15 sub15    = new sub15(); //15-21,15-21

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		//float dx,dy;
		mx=11;
		my=11;
		//dx = 0.05f;
		//dy = 0.05f;
		nlast=400;
		
//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 //q[j*11+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*11+k] = 0f;
			uu[j*11+k] = 0f;
		}
	}
	
//	計算ループ	
	for(n=1;n<=nlast;n++){
//	境界条件
		for (j = 1; j <= my; j++)
		{
			u[1*11+j] = 0.5f;
			u[11*mx+j]= 0f;
			u[j*11+1] = 1.f;
			u[j*11+my]= 0f;
		}
		
		for(k=1;k<=4;k++){
			sub00.u[11+k]=u[11+k];
			sub00.u[22+k]=u[22+k];
			sub00.u[33+k]=u[33+k];
			sub00.u[44+k]=u[44+k];

			sub01.u[33+k]=u[33+k];
			sub01.u[44+k]=u[44+k];
			sub01.u[55+k]=u[55+k];
			sub01.u[66+k]=u[66+k];

			sub02.u[55+k]=u[55+k];
			sub02.u[66+k]=u[66+k];
			sub02.u[77+k]=u[77+k];
			sub02.u[88+k]=u[88+k];

			sub03.u[77+k]=u[77+k];
			sub03.u[88+k]=u[88+k];
			sub03.u[99+k]=u[99+k];
			sub03.u[110+k]=u[110+k];
			sub03.u[121+k]=u[121+k];

			sub04.u[11+k+2]=u[11+k+2];
			sub04.u[22+k+2]=u[22+k+2];
			sub04.u[33+k+2]=u[33+k+2];
			sub04.u[44+k+2]=u[44+k+2];

			sub05.u[33+k+2]=u[33+k+2];
			sub05.u[44+k+2]=u[44+k+2];
			sub05.u[55+k+2]=u[55+k+2];
			sub05.u[66+k+2]=u[66+k+2];

			sub06.u[55+k+2]=u[55+k+2];
			sub06.u[66+k+2]=u[66+k+2];
			sub06.u[77+k+2]=u[77+k+2];
			sub06.u[88+k+2]=u[88+k+2];

			sub07.u[77+k+2]=u[77+k+2];
			sub07.u[88+k+2]=u[88+k+2];
			sub07.u[99+k+2]=u[99+k+2];
			sub07.u[110+k+2]=u[110+k+2];
			sub07.u[121+k+2]=u[121+k+2];
	
			sub08.u[11+k+4]=u[11+k+4];
			sub08.u[22+k+4]=u[22+k+4];
			sub08.u[33+k+4]=u[33+k+4];
			sub08.u[44+k+4]=u[44+k+4];

			sub09.u[33+k+4]=u[33+k+4];
			sub09.u[44+k+4]=u[44+k+4];
			sub09.u[55+k+4]=u[55+k+4];
			sub09.u[66+k+4]=u[66+k+4];

			sub10.u[55+k+4]=u[55+k+4];
			sub10.u[66+k+4]=u[66+k+4];
			sub10.u[77+k+4]=u[77+k+4];
			sub10.u[88+k+4]=u[88+k+4];

			sub11.u[77+k+4]=u[77+k+4];
			sub11.u[88+k+4]=u[88+k+4];
			sub11.u[99+k+4]=u[99+k+4];
			sub11.u[110+k+4]=u[110+k+4];
			sub11.u[121+k+4]=u[121+k+4];
		}

		for(k=7;k<=11;k++){
			sub12.u[11+k]=u[11+k];
			sub12.u[22+k]=u[22+k];
			sub12.u[33+k]=u[33+k];
			sub12.u[44+k]=u[44+k];

			sub13.u[33+k]=u[33+k];
			sub13.u[44+k]=u[44+k];
			sub13.u[55+k]=u[55+k];
			sub13.u[66+k]=u[66+k];

			sub14.u[55+k]=u[55+k];
			sub14.u[66+k]=u[66+k];
			sub14.u[77+k]=u[77+k];
			sub14.u[88+k]=u[88+k];

			sub15.u[77+k]=u[77+k];
			sub15.u[88+k]=u[88+k];
			sub15.u[99+k]=u[99+k];
			sub15.u[110+k]=u[110+k];
			sub15.u[121+k]=u[121+k];
		}

		sub00.start();
		sub04.start();
		sub08.start();
		sub12.start();
		sub01.start();
		sub02.start();
		sub03.start();
		sub05.start();
		sub06.start();
		sub07.start();
		sub09.start();
		sub10.start();
		sub11.start();
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

			u[22+k]=sub00.result[22+k];
			u[33+k]=sub00.result[33+k];

			u[44+k]=sub01.result[44+k];
			u[55+k]=sub01.result[55+k];

			u[66+k]=sub02.result[66+k];
			u[77+k]=sub02.result[77+k];

			u[88+k]=sub03.result[88+k];
			u[99+k]=sub03.result[99+k];
			u[110+k]=sub03.result[110+k];

			u[22+k+2]=sub04.result[22+k+2];
			u[33+k+2]=sub04.result[33+k+2];

			u[44+k+2]=sub05.result[44+k+2];
			u[55+k+2]=sub05.result[55+k+2];

			u[66+k+2]=sub06.result[66+k+2];
			u[77+k+2]=sub06.result[77+k+2];

			u[88+k+2]=sub07.result[88+k+2];
			u[99+k+2]=sub07.result[99+k+2];
			u[110+k+2]=sub07.result[110+k+2];
	
			u[22+k+4]=sub08.result[22+k+4];
			u[33+k+4]=sub08.result[33+k+4];

			u[44+k+4]=sub09.result[44+k+4];
			u[55+k+4]=sub09.result[55+k+4];

			u[66+k+4]=sub10.result[66+k+4];
			u[77+k+4]=sub10.result[77+k+4];

			u[88+k+4]=sub11.result[88+k+4];
			u[99+k+4]=sub11.result[99+k+4];
			u[110+k+4]=sub11.result[110+k+4];
		}


		for(k=8;k<=10;k++){

			u[22+k]=sub12.result[22+k];
			u[33+k]=sub12.result[33+k];

			u[44+k]=sub13.result[44+k];
			u[55+k]=sub13.result[55+k];

			u[66+k]=sub14.result[66+k];
			u[77+k]=sub14.result[77+k];

			u[88+k]=sub15.result[88+k];
			u[99+k]=sub15.result[99+k];
			u[110+k]=sub03.result[110+k];
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
		//System.out.println(u[10*21+10]);
	}
}
