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
		for(k=1;k<=5;k++){
			sub00.u[21+k]=u[21+k];
			sub00.u[42+k]=u[42+k];
			sub00.u[63+k]=u[63+k];
			sub00.u[84+k]=u[84+k];
			sub00.u[105+k]=u[105+k];
			sub01.u[84+k]=u[84+k];
			sub01.u[105+k]=u[105+k];
			sub01.u[126+k]=u[126+k];
			sub01.u[147+k]=u[147+k];
			sub01.u[168+k]=u[168+k];
			sub01.u[189+k]=u[189+k];
			sub02.u[168+k]=u[168+k];
			sub02.u[189+k]=u[189+k];
			sub02.u[210+k]=u[210+k];
			sub02.u[231+k]=u[231+k];
			sub02.u[252+k]=u[252+k];
			sub02.u[273+k]=u[273+k];
			sub03.u[252+k]=u[252+k];
			sub03.u[273+k]=u[273+k];
			sub03.u[294+k]=u[294+k];
			sub03.u[315+k]=u[315+k];
			sub03.u[336+k]=u[336+k];
			sub03.u[357+k]=u[357+k];
			sub04.u[336+k]=u[336+k];
			sub04.u[357+k]=u[357+k];
			sub04.u[378+k]=u[378+k];
			sub04.u[399+k]=u[399+k];
			sub04.u[420+k]=u[420+k];
		}
		for(k=4;k<=9;k++){
			sub05.u[21+k]=u[21+k];
			sub05.u[42+k]=u[42+k];
			sub05.u[63+k]=u[63+k];
			sub05.u[84+k]=u[84+k];
			sub05.u[105+k]=u[105+k];
			sub06.u[84+k]=u[84+k];
			sub06.u[105+k]=u[105+k];
			sub06.u[126+k]=u[126+k];
			sub06.u[147+k]=u[147+k];
			sub06.u[168+k]=u[168+k];
			sub06.u[189+k]=u[189+k];
			sub07.u[168+k]=u[168+k];
			sub07.u[189+k]=u[189+k];
			sub07.u[210+k]=u[210+k];
			sub07.u[231+k]=u[231+k];
			sub07.u[252+k]=u[252+k];
			sub07.u[273+k]=u[273+k];
			sub08.u[252+k]=u[252+k];
			sub08.u[273+k]=u[273+k];
			sub08.u[294+k]=u[294+k];
			sub08.u[315+k]=u[315+k];
			sub08.u[336+k]=u[336+k];
			sub08.u[357+k]=u[357+k];
			sub09.u[336+k]=u[336+k];
			sub09.u[357+k]=u[357+k];
			sub09.u[378+k]=u[378+k];
			sub09.u[399+k]=u[399+k];
			sub09.u[420+k]=u[420+k];
			sub10.u[21+k+4]=u[21+k+4];
			sub10.u[42+k+4]=u[42+k+4];
			sub10.u[63+k+4]=u[63+k+4];
			sub10.u[84+k+4]=u[84+k+4];
			sub10.u[105+k+4]=u[105+k+4];
			sub11.u[84+k+4]=u[84+k+4];
			sub11.u[105+k+4]=u[105+k+4];
			sub11.u[126+k+4]=u[126+k+4];
			sub11.u[147+k+4]=u[147+k+4];
			sub11.u[168+k+4]=u[168+k+4];
			sub11.u[189+k+4]=u[189+k+4];
			sub12.u[168+k+4]=u[168+k+4];
			sub12.u[189+k+4]=u[189+k+4];
			sub12.u[210+k+4]=u[210+k+4];
			sub12.u[231+k+4]=u[231+k+4];
			sub12.u[252+k+4]=u[252+k+4];
			sub12.u[273+k+4]=u[273+k+4];
			sub13.u[252+k+4]=u[252+k+4];
			sub13.u[273+k+4]=u[273+k+4];
			sub13.u[294+k+4]=u[294+k+4];
			sub13.u[315+k+4]=u[315+k+4];
			sub13.u[336+k+4]=u[336+k+4];
			sub13.u[357+k+4]=u[357+k+4];
			sub14.u[336+k+4]=u[336+k+4];
			sub14.u[357+k+4]=u[357+k+4];
			sub14.u[378+k+4]=u[378+k+4];
			sub14.u[399+k+4]=u[399+k+4];
			sub14.u[420+k+4]=u[420+k+4];
			sub15.u[21+k+8]=u[21+k+8];
			sub15.u[42+k+8]=u[42+k+8];
			sub15.u[63+k+8]=u[63+k+8];
			sub15.u[84+k+8]=u[84+k+8];
			sub15.u[105+k+8]=u[105+k+8];
			sub16.u[84+k+8]=u[84+k+8];
			sub16.u[105+k+8]=u[105+k+8];
			sub16.u[126+k+8]=u[126+k+8];
			sub16.u[147+k+8]=u[147+k+8];
			sub16.u[168+k+8]=u[168+k+8];
			sub16.u[189+k+8]=u[189+k+8];
			sub17.u[168+k+8]=u[168+k+8];
			sub17.u[189+k+8]=u[189+k+8];
			sub17.u[210+k+8]=u[210+k+8];
			sub17.u[231+k+8]=u[231+k+8];
			sub17.u[252+k+8]=u[252+k+8];
			sub17.u[273+k+8]=u[273+k+8];
			sub18.u[252+k+8]=u[252+k+8];
			sub18.u[273+k+8]=u[273+k+8];
			sub18.u[294+k+8]=u[294+k+8];
			sub18.u[315+k+8]=u[315+k+8];
			sub18.u[336+k+8]=u[336+k+8];
			sub18.u[357+k+8]=u[357+k+8];
			sub19.u[336+k+8]=u[336+k+8];
			sub19.u[357+k+8]=u[357+k+8];
			sub19.u[378+k+8]=u[378+k+8];
			sub19.u[399+k+8]=u[399+k+8];
			sub19.u[420+k+8]=u[420+k+8];
			sub20.u[21+k+12]=u[21+k+12];
			sub20.u[42+k+12]=u[42+k+12];
			sub20.u[63+k+12]=u[63+k+12];
			sub20.u[84+k+12]=u[84+k+12];
			sub20.u[105+k+12]=u[105+k+12];
			sub21.u[84+k+12]=u[84+k+12];
			sub21.u[105+k+12]=u[105+k+12];
			sub21.u[126+k+12]=u[126+k+12];
			sub21.u[147+k+12]=u[147+k+12];
			sub21.u[168+k+12]=u[168+k+12];
			sub21.u[189+k+12]=u[189+k+12];
			sub22.u[168+k+12]=u[168+k+12];
			sub22.u[189+k+12]=u[189+k+12];
			sub22.u[210+k+12]=u[210+k+12];
			sub22.u[231+k+12]=u[231+k+12];
			sub22.u[252+k+12]=u[252+k+12];
			sub22.u[273+k+12]=u[273+k+12];
			sub23.u[252+k+12]=u[252+k+12];
			sub23.u[273+k+12]=u[273+k+12];
			sub23.u[294+k+12]=u[294+k+12];
			sub23.u[315+k+12]=u[315+k+12];
			sub23.u[336+k+12]=u[336+k+12];
			sub23.u[357+k+12]=u[357+k+12];
			sub24.u[336+k+12]=u[336+k+12];
			sub24.u[357+k+12]=u[357+k+12];
			sub24.u[378+k+12]=u[378+k+12];
			sub24.u[399+k+12]=u[399+k+12];
			sub24.u[420+k+12]=u[420+k+12];
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
		for(k=2;k<=4;k++){
			sub00.u[42+k]=result[42+k];
			sub00.u[63+k]=result[63+k];
			sub00.u[84+k]=result[84+k];
			sub01.u[105+k]=result[105+k];
			sub01.u[126+k]=result[126+k];
			sub01.u[147+k]=result[147+k];
			sub01.u[168+k]=result[168+k];
			sub02.u[189+k]=result[189+k];
			sub02.u[210+k]=result[210+k];
			sub02.u[231+k]=result[231+k];
			sub02.u[252+k]=result[252+k];
			sub03.u[273+k]=result[273+k];
			sub03.u[294+k]=result[294+k];
			sub03.u[315+k]=result[315+k];
			sub03.u[336+k]=result[336+k];
			sub04.u[357+k]=result[357];
			sub04.u[378+k]=result[378];
			sub04.u[399+k]=result[399];
			sub04.u[420+k]=result[420];
		}
		for(k=5;k<=8;k++){
			sub05.u[42+k]=result[42+k];
			sub05.u[63+k]=result[63+k];
			sub05.u[84+k]=result[84+k];
			sub06.u[105+k]=result[105+k];
			sub06.u[126+k]=result[126+k];
			sub06.u[147+k]=result[147+k];
			sub06.u[168+k]=result[168+k];
			sub07.u[189+k]=result[189+k];
			sub07.u[210+k]=result[210+k];
			sub07.u[231+k]=result[231+k];
			sub07.u[252+k]=result[252+k];
			sub08.u[273+k]=result[273+k];
			sub08.u[294+k]=result[294+k];
			sub08.u[315+k]=result[315+k];
			sub08.u[336+k]=result[336+k];
			sub09.u[357+k]=result[357+k];
			sub09.u[378+k]=result[378+k];
			sub09.u[399+k]=result[399+k];
			sub09.u[420+k]=result[420+k];
			sub10.u[42+k+4]=result[42+k+4];
			sub10.u[63+k+4]=result[63+k+4];
			sub10.u[84+k+4]=result[84+k+4];
			sub11.u[105+k+4]=result[105+k+4];
			sub11.u[126+k+4]=result[126+k+4];
			sub11.u[147+k+4]=result[147+k+4];
			sub11.u[168+k+4]=result[168+k+4];
			sub12.u[189+k+4]=result[189+k+4];
			sub12.u[210+k+4]=result[210+k+4];
			sub12.u[231+k+4]=result[231+k+4];
			sub12.u[252+k+4]=result[252+k+4];
			sub13.u[273+k+4]=result[273+k+4];
			sub13.u[294+k+4]=result[294+k+4];
			sub13.u[315+k+4]=result[315+k+4];
			sub13.u[336+k+4]=result[336+k+4];
			sub14.u[357+k+4]=result[357+k+4];
			sub14.u[378+k+4]=result[378+k+4];
			sub14.u[399+k+4]=result[399+k+4];
			sub14.u[420+k+4]=result[420+k+4];
			sub15.u[42+k+8]=result[42+k+8];
			sub15.u[63+k+8]=result[63+k+8];
			sub15.u[84+k+8]=result[84+k+8];
			sub16.u[105+k+8]=result[105+k+8];
			sub16.u[126+k+8]=result[126+k+8];
			sub16.u[147+k+8]=result[147+k+8];
			sub16.u[168+k+8]=result[168+k+8];
			sub17.u[189+k+8]=result[189+k+8];
			sub17.u[210+k+8]=result[210+k+8];
			sub17.u[231+k+8]=result[231+k+8];
			sub17.u[252+k+8]=result[252+k+8];
			sub18.u[273+k+8]=result[273+k+8];
			sub18.u[294+k+8]=result[294+k+8];
			sub18.u[315+k+8]=result[315+k+8];
			sub18.u[336+k+8]=result[336+k+8];
			sub19.u[357+k+8]=result[357+k+8];
			sub19.u[378+k+8]=result[378+k+8];
			sub19.u[399+k+8]=result[399+k+8];
			sub19.u[420+k+8]=result[420+k+8];
			sub20.u[42+k+12]=result[42+k+12];
			sub20.u[63+k+12]=result[63+k+12];
			sub20.u[84+k+12]=result[84+k+12];
			sub21.u[105+k+12]=result[105+k+12];
			sub21.u[126+k+12]=result[126+k+12];
			sub21.u[147+k+12]=result[147+k+12];
			sub21.u[168+k+12]=result[168+k+12];
			sub22.u[189+k+12]=result[189+k+12];
			sub22.u[210+k+12]=result[210+k+12];
			sub22.u[231+k+12]=result[231+k+12];
			sub22.u[252+k+12]=result[252+k+12];
			sub23.u[273+k+12]=result[273+k+12];
			sub23.u[294+k+12]=result[294+k+12];
			sub23.u[315+k+12]=result[315+k+12];
			sub23.u[336+k+12]=result[336+k+12];
			sub24.u[357+k+12]=result[357+k+12];
			sub24.u[378+k+12]=result[378+k+12];
			sub24.u[399+k+12]=result[399+k+12];
			sub24.u[420+k+12]=result[420+k+12];
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
