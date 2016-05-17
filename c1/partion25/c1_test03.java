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

		mx=21;
		my=21;
		dx = 0.05f;
		dy = 0.05f;
		nlast=2;
			
//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 //q[j*21+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*21+k] = 0f;
			uu[j*21+k] = 0f;
		}
	}
	
//	計算ループ	
	for(n=1;n<=nlast;n++){
//	境界条件
		for (j = 1; j <= my; j++)
		{
			u[21+j] = 0.5f;
			u[mx*21+j]= 0f;
		
			u[j*21+1] = 1.f;
			u[j*21+my]= 0f;
		}
	
		//クラスに配列をこぴー
		//1-6,1-6
		for(k=1;k<=5;k++)
		{
				sub00.u[1*21+k]=u[1*21+k];
				sub00.u[2*21+k]=u[2*21+k];
				sub00.u[3*21+k]=u[3*21+k];
				sub00.u[4*21+k]=u[4*21+k];
				sub00.u[5*21+k]=u[5*21+k];
		
				sub01.u[4*21+k]=u[4*21+k];
				sub01.u[5*21+k]=u[5*21+k];
				sub01.u[6*21+k]=u[6*21+k];
				sub01.u[7*21+k]=u[7*21+k];
				sub01.u[8*21+k]=u[8*21+k];
				sub01.u[9*21+k]=u[9*21+k];

				sub02.u[8*21+k]=u[8*21+k];
				sub02.u[9*21+k]=u[9*21+k];
				sub02.u[10*21+k]=u[10*21+k];
				sub02.u[11*21+k]=u[11*21+k];
				sub02.u[12*21+k]=u[12*21+k];
				sub02.u[13*21+k]=u[13*21+k];
		
				sub03.u[12*21+k]=u[12*21+k];
				sub03.u[13*21+k]=u[13*21+k];
				sub03.u[14*21+k]=u[14*21+k];
				sub03.u[15*21+k]=u[15*21+k];
				sub03.u[16*21+k]=u[16*21+k];
				sub03.u[17*21+k]=u[17*21+k];

				sub04.u[16*21+k]=u[16*21+k];
				sub04.u[17*21+k]=u[17*21+k];
				sub04.u[18*21+k]=u[18*21+k];
				sub04.u[19*21+k]=u[19*21+k];
				sub04.u[20*21+k]=u[20*21+k];
				sub04.u[21*21+k]=u[21*21+k];
		}

		//1-6,5-11
		for(k=4;k<=9;k++)
		{
				sub05.u[1*21+k]=u[1*21+k];
				sub05.u[2*21+k]=u[2*21+k];
				sub05.u[3*21+k]=u[3*21+k];
				sub05.u[4*21+k]=u[4*21+k];
				sub05.u[5*21+k]=u[5*21+k];
		
				sub06.u[4*21+k]=u[4*21+k];
				sub06.u[5*21+k]=u[5*21+k];
				sub06.u[6*21+k]=u[6*21+k];
				sub06.u[7*21+k]=u[7*21+k];
				sub06.u[8*21+k]=u[8*21+k];
				sub06.u[9*21+k]=u[9*21+k];

				sub07.u[8*21+k]=u[8*21+k];
				sub07.u[9*21+k]=u[9*21+k];
				sub07.u[10*21+k]=u[10*21+k];
				sub07.u[11*21+k]=u[11*21+k];
				sub07.u[12*21+k]=u[12*21+k];
				sub07.u[13*21+k]=u[13*21+k];
		
				sub08.u[12*21+k]=u[12*21+k];
				sub08.u[13*21+k]=u[13*21+k];
				sub08.u[14*21+k]=u[14*21+k];
				sub08.u[15*21+k]=u[15*21+k];
				sub08.u[16*21+k]=u[16*21+k];
				sub08.u[17*21+k]=u[17*21+k];

				sub09.u[16*21+k]=u[16*21+k];
				sub09.u[17*21+k]=u[17*21+k];
				sub09.u[18*21+k]=u[18*21+k];
				sub09.u[19*21+k]=u[19*21+k];
				sub09.u[20*21+k]=u[20*21+k];
				sub09.u[21*21+k]=u[21*21+k];
				
				sub10.u[1*21+k+4]=u[1*21+k+4];
				sub10.u[2*21+k+4]=u[2*21+k+4];
				sub10.u[3*21+k+4]=u[3*21+k+4];
				sub10.u[4*21+k+4]=u[4*21+k+4];
				sub10.u[5*21+k+4]=u[5*21+k+4];
		
				sub11.u[4*21+k+4]=u[4*21+k+4];
				sub11.u[5*21+k+4]=u[5*21+k+4];
				sub11.u[6*21+k+4]=u[6*21+k+4];
				sub11.u[7*21+k+4]=u[7*21+k+4];
				sub11.u[8*21+k+4]=u[8*21+k+4];
				sub11.u[9*21+k+4]=u[9*21+k+4];

				sub12.u[8*21+k+4]=u[8*21+k+4];
				sub12.u[9*21+k+4]=u[9*21+k+4];
				sub12.u[10*21+k+4]=u[10*21+k+4];
				sub12.u[11*21+k+4]=u[11*21+k+4];
				sub12.u[12*21+k+4]=u[12*21+k+4];
				sub12.u[13*21+k+4]=u[13*21+k+4];
		
				sub13.u[12*21+k+4]=u[12*21+k+4];
				sub13.u[13*21+k+4]=u[13*21+k+4];
				sub13.u[14*21+k+4]=u[14*21+k+4];
				sub13.u[15*21+k+4]=u[15*21+k+4];
				sub13.u[16*21+k+4]=u[16*21+k+4];
				sub13.u[17*21+k+4]=u[17*21+k+4];

				sub14.u[16*21+k+4]=u[16*21+k+4];
				sub14.u[17*21+k+4]=u[17*21+k+4];
				sub14.u[18*21+k+4]=u[18*21+k+4];
				sub14.u[19*21+k+4]=u[19*21+k+4];
				sub14.u[20*21+k+4]=u[20*21+k+4];
				sub14.u[21*21+k+4]=u[21*21+k+4];	
		
				sub15.u[1*21+k+8]=u[1*21+k+8];
				sub15.u[2*21+k+8]=u[2*21+k+8];
				sub15.u[3*21+k+8]=u[3*21+k+8];
				sub15.u[4*21+k+8]=u[4*21+k+8];
				sub15.u[5*21+k+8]=u[5*21+k+8];
		
				sub16.u[4*21+k+8]=u[4*21+k+8];
				sub16.u[5*21+k+8]=u[5*21+k+8];
				sub16.u[6*21+k+8]=u[6*21+k+8];
				sub16.u[7*21+k+8]=u[7*21+k+8];
				sub16.u[8*21+k+8]=u[8*21+k+8];
				sub16.u[9*21+k+8]=u[9*21+k+8];

				sub17.u[8*21+k+8]=u[8*21+k+8];
				sub17.u[9*21+k+8]=u[9*21+k+8];
				sub17.u[10*21+k+8]=u[10*21+k+8];
				sub17.u[11*21+k+8]=u[11*21+k+8];
				sub17.u[12*21+k+8]=u[12*21+k+8];
				sub17.u[13*21+k+8]=u[13*21+k+8];
		
				sub18.u[12*21+k+8]=u[12*21+k+8];
				sub18.u[13*21+k+8]=u[13*21+k+8];
				sub18.u[14*21+k+8]=u[14*21+k+8];
				sub18.u[15*21+k+8]=u[15*21+k+8];
				sub18.u[16*21+k+8]=u[16*21+k+8];
				sub18.u[17*21+k+8]=u[17*21+k+8];

				sub19.u[16*21+k+8]=u[16*21+k+8];
				sub19.u[17*21+k+8]=u[17*21+k+8];
				sub19.u[18*21+k+8]=u[18*21+k+8];
				sub19.u[19*21+k+8]=u[19*21+k+8];
				sub19.u[20*21+k+8]=u[20*21+k+8];
				sub19.u[21*21+k+8]=u[21*21+k+8];	
	
				sub20.u[1*21+k+12]=u[1*21+k+12];
				sub20.u[2*21+k+12]=u[2*21+k+12];
				sub20.u[3*21+k+12]=u[3*21+k+12];
				sub20.u[4*21+k+12]=u[4*21+k+12];
				sub20.u[5*21+k+12]=u[5*21+k+12];
		
				sub21.u[4*21+k+12]=u[4*21+k+12];
				sub21.u[5*21+k+12]=u[5*21+k+12];
				sub21.u[6*21+k+12]=u[6*21+k+12];
				sub21.u[7*21+k+12]=u[7*21+k+12];
				sub21.u[8*21+k+12]=u[8*21+k+12];
				sub21.u[9*21+k+12]=u[9*21+k+12];

				sub22.u[8*21+k+12]=u[8*21+k+12];
				sub22.u[9*21+k+12]=u[9*21+k+12];
				sub22.u[10*21+k+12]=u[10*21+k+12];
				sub22.u[11*21+k+12]=u[11*21+k+12];
				sub22.u[12*21+k+12]=u[12*21+k+12];
				sub22.u[13*21+k+12]=u[13*21+k+12];
		
				sub23.u[12*21+k+12]=u[12*21+k+12];
				sub23.u[13*21+k+12]=u[13*21+k+12];
				sub23.u[14*21+k+12]=u[14*21+k+12];
				sub23.u[15*21+k+12]=u[15*21+k+12];
				sub23.u[16*21+k+12]=u[16*21+k+12];
				sub23.u[17*21+k+12]=u[17*21+k+12];

				sub24.u[16*21+k+12]=u[16*21+k+12];
				sub24.u[17*21+k+12]=u[17*21+k+12];
				sub24.u[18*21+k+12]=u[18*21+k+12];
				sub24.u[19*21+k+12]=u[19*21+k+12];
				sub24.u[20*21+k+12]=u[20*21+k+12];
				sub24.u[21*21+k+12]=u[21*21+k+12];		
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

		//2-5,2-5
		for(k=2;k<=4;k++)
		{
				u[2*21+k]=sub00.result[2*21+k];
				u[3*21+k]=sub00.result[3*21+k];
				u[4*21+k]=sub00.result[4*21+k];
		
				u[5*21+k]=sub01.result[5*21+k];
				u[6*21+k]=sub01.result[6*21+k];
				u[7*21+k]=sub01.result[7*21+k];
				u[8*21+k]=sub01.result[8*21+k];
		
				u[9*21+k]=sub02.result[9*21+k];
				u[10*21+k]=sub02.result[10*21+k];
				u[11*21+k]=sub02.result[11*21+k];
				u[12*21+k]=sub02.result[12*21+k];
		
				u[13*21+k]=sub03.result[13*21+k];
				u[14*21+k]=sub03.result[14*21+k];
				u[15*21+k]=sub03.result[15*21+k];
				u[16*21+k]=sub03.result[16*21+k];
			
				u[17*21+k]=sub04.result[17*21+k];
				u[18*21+k]=sub04.result[18*21+k];
				u[19*21+k]=sub04.result[19*21+k];
				u[20*21+k]=sub04.result[20*21+k];
		}
		//6-10,6-10
		for(k=5;k<=8;k++)
		{
				u[2*21+k]=sub05.result[2*21+k];
				u[3*21+k]=sub05.result[3*21+k];
				u[4*21+k]=sub05.result[4*21+k];
		
				u[5*21+k]=sub06.result[5*21+k];
				u[6*21+k]=sub06.result[6*21+k];
				u[7*21+k]=sub06.result[7*21+k];
				u[8*21+k]=sub06.result[8*21+k];
		
				u[9*21+k]=sub07.result[9*21+k];
				u[10*21+k]=sub07.result[10*21+k];
				u[11*21+k]=sub07.result[11*21+k];
				u[12*21+k]=sub07.result[12*21+k];
		
				u[13*21+k]=sub08.result[13*21+k];
				u[14*21+k]=sub08.result[14*21+k];
				u[15*21+k]=sub08.result[15*21+k];
				u[16*21+k]=sub08.result[16*21+k];
			
				u[17*21+k]=sub09.result[17*21+k];
				u[18*21+k]=sub09.result[18*21+k];
				u[19*21+k]=sub09.result[19*21+k];
				u[20*21+k]=sub09.result[20*21+k];
		}
		
		//11-15,6-10
		for(k=9;k<=12;k++)
		{
				u[2*21+k+4]=sub10.result[2*21+k+4];
				u[3*21+k+4]=sub10.result[3*21+k+4];
				u[4*21+k+4]=sub10.result[4*21+k+4];
		
				u[5*21+k+4]=sub11.result[5*21+k+4];
				u[6*21+k+4]=sub11.result[6*21+k+4];
				u[7*21+k+4]=sub11.result[7*21+k+4];
				u[8*21+k+4]=sub11.result[8*21+k+4];
		
				u[9*21+k+4]=sub12.result[9*21+k+4];
				u[10*21+k+4]=sub12.result[10*21+k+4];
				u[11*21+k+4]=sub12.result[11*21+k+4];
				u[12*21+k+4]=sub12.result[12*21+k+4];
		
				u[13*21+k+4]=sub13.result[13*21+k+4];
				u[14*21+k+4]=sub13.result[14*21+k+4];
				u[15*21+k+4]=sub13.result[15*21+k+4];
				u[16*21+k+4]=sub13.result[16*21+k+4];
			
				u[17*21+k+4]=sub14.result[17*21+k+4];
				u[18*21+k+4]=sub14.result[18*21+k+4];
				u[19*21+k+4]=sub14.result[19*21+k+4];
				u[20*21+k+4]=sub14.result[20*21+k+4];
	
				u[2*21+k+8]=sub15.result[2*21+k+8];
				u[3*21+k+8]=sub15.result[3*21+k+8];
				u[4*21+k+8]=sub15.result[4*21+k+8];
		
				u[5*21+k+8]=sub16.result[5*21+k+8];
				u[6*21+k+8]=sub16.result[6*21+k+8];
				u[7*21+k+8]=sub16.result[7*21+k+8];
				u[8*21+k+8]=sub16.result[8*21+k+8];
		
				u[9*21+k+8]=sub17.result[9*21+k+8];
				u[10*21+k+8]=sub17.result[10*21+k+8];
				u[11*21+k+8]=sub17.result[11*21+k+8];
				u[12*21+k+8]=sub17.result[12*21+k+8];
		
				u[13*21+k+8]=sub18.result[13*21+k+8];
				u[14*21+k+8]=sub18.result[14*21+k+8];
				u[15*21+k+8]=sub18.result[15*21+k+8];
				u[16*21+k+8]=sub18.result[16*21+k+8];
			
				u[17*21+k+8]=sub19.result[17*21+k+8];
				u[18*21+k+8]=sub19.result[18*21+k+8];
				u[19*21+k+8]=sub19.result[19*21+k+8];
				u[20*21+k+8]=sub19.result[20*21+k+8];

				u[2*21+k+12]=sub20.result[2*21+k+12];
				u[3*21+k+12]=sub20.result[3*21+k+12];
				u[4*21+k+12]=sub20.result[4*21+k+12];
		
				u[5*21+k+12]=sub21.result[5*21+k+12];
				u[6*21+k+12]=sub21.result[6*21+k+12];
				u[7*21+k+12]=sub21.result[7*21+k+12];
				u[8*21+k+12]=sub21.result[8*21+k+12];
		
				u[9*21+k+12]=sub22.result[9*21+k+12];
				u[10*21+k+12]=sub22.result[10*21+k+12];
				u[11*21+k+12]=sub22.result[11*21+k+12];
				u[12*21+k+12]=sub22.result[12*21+k+12];
		
				u[13*21+k+12]=sub23.result[13*21+k+12];
				u[14*21+k+12]=sub23.result[14*21+k+12];
				u[15*21+k+12]=sub23.result[15*21+k+12];
				u[16*21+k+12]=sub23.result[16*21+k+12];
			
				u[17*21+k+12]=sub24.result[17*21+k+12];
				u[18*21+k+12]=sub24.result[18*21+k+12];
				u[19*21+k+12]=sub24.result[19*21+k+12];
				u[20*21+k+12]=sub24.result[20*21+k+12];
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
