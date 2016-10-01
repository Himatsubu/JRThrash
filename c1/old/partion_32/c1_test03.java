import net.njlab.sample.annotation.*;
//分割数16

public class c1_test03{
	private static final float[] u = new float[484];
	private static final float[] uu= new float[484];
	private static final float[] q = new float[484];

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
	static final sub25 sub25    = new sub25(); //1-6,17-21
	static final sub26 sub26    = new sub26(); //5-11,15-18
	static final sub27 sub27    = new sub27(); //5-11,17-18
	static final sub28 sub28    = new sub28(); //10-16,15-18
	static final sub29 sub29    = new sub29(); //10-16,17-21
	static final sub30 sub30    = new sub30(); //15-21,15-18
	static final sub31 sub31    = new sub31(); //15-21,17-21

        @JRThrashUnroll(unrollNum=20, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		float dx,dy;

		mx=21;
		my=21;
		dx = 0.05f;
		dy = 0.05f;
		nlast=1;
			
//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 q[j*21+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*21+k] = 0f;
			uu[j*21+k] = 0f;
		}
	}
	
//	計算ループ	
	for(n=1;n<=nlast;n++){
//	境界条件
		for (k = 1; k <= my; k++)
		{
			u[21+k] = 0.5f;
			u[mx*21+k]= 0f;
		}
		
		for (j = 1; j <= mx; j++)
		{
			u[j*21+1] = 1.f;
			u[j*21+my]= 0f;
		}
		
		//クラスに配列をこぴー
		//1-6,1-4
		for(k=1;k<=6;k++)
		{
				sub00.u[21+k]=u[21+k];
				sub00.u[42+k]=u[42+k];
				sub00.u[63+k]=u[63+k];
				sub00.u[84+k]=u[84+k];

				sub01.u[63+k]=u[63+k];
				sub01.u[84+k]=u[84+k];
				sub01.u[105+k]=u[105+k];
				sub01.u[126+k]=u[126+k];

				sub08.u[105+k]=u[105+k];
				sub08.u[126+k]=u[126+k];
				sub08.u[147+k]=u[147+k];
				sub08.u[168+k]=u[168+k];

				sub09.u[147+k]=u[147+k];
				sub09.u[168+k]=u[168+k];
				sub09.u[189+k]=u[189+k];
				sub09.u[210+k]=u[210+k];
				sub09.u[231+k]=u[231+k];

				sub16.u[210+k]=u[210+k];
				sub16.u[231+k]=u[231+k];
				sub16.u[252+k]=u[252+k];
				sub16.u[273+k]=u[273+k];

				sub17.u[252+k]=u[252+k];
				sub17.u[273+k]=u[273+k];
				sub17.u[294+k]=u[294+k];
				sub17.u[315+k]=u[315+k];
				sub17.u[336+k]=u[336+k];

				sub24.u[315+k]=u[315+k];
				sub24.u[336+k]=u[336+k];
				sub24.u[357+k]=u[357+k];
				sub24.u[378+k]=u[378+k];

				sub25.u[357+k]=u[357+k];
				sub25.u[378+k]=u[378+k];
				sub25.u[399+k]=u[399+k];
				sub25.u[420+k]=u[420+k];
				sub25.u[441+k]=u[441+k];
		}
		//5-11,1-4
		for(k=5;k<=11;k++)
		{
				sub02.u[21+k]=u[21+k];
				sub02.u[42+k]=u[42+k];
				sub02.u[63+k]=u[63+k];
				sub02.u[84+k]=u[84+k];

				sub03.u[63+k]=u[63+k];
				sub03.u[84+k]=u[84+k];
				sub03.u[105+k]=u[105+k];
				sub03.u[126+k]=u[126+k];

				sub10.u[105+k]=u[105+k];
				sub10.u[126+k]=u[126+k];
				sub10.u[147+k]=u[147+k];
				sub10.u[168+k]=u[168+k];

				sub11.u[147+k]=u[147+k];
				sub11.u[168+k]=u[168+k];
				sub11.u[189+k]=u[189+k];
				sub11.u[210+k]=u[210+k];
				sub11.u[231+k]=u[231+k];

				sub18.u[210+k]=u[210+k];
				sub18.u[231+k]=u[231+k];
				sub18.u[252+k]=u[252+k];
				sub18.u[273+k]=u[273+k];

				sub19.u[252+k]=u[252+k];
				sub19.u[273+k]=u[273+k];
				sub19.u[294+k]=u[294+k];
				sub19.u[315+k]=u[315+k];
				sub19.u[336+k]=u[336+k];

				sub26.u[315+k]=u[315+k];
				sub26.u[336+k]=u[336+k];
				sub26.u[357+k]=u[357+k];
				sub26.u[378+k]=u[378+k];

				sub27.u[357+k]=u[357+k];
				sub27.u[378+k]=u[378+k];
				sub27.u[399+k]=u[399+k];
				sub27.u[420+k]=u[420+k];
				sub27.u[441+k]=u[441+k];

				sub04.u[26+k]=u[26+k];
				sub04.u[47+k]=u[47+k];
				sub04.u[68+k]=u[68+k];
				sub04.u[89+k]=u[89+k];
 
				sub05.u[68+k]=u[68+k];
				sub05.u[89+k]=u[89+k];
				sub05.u[110+k]=u[110+k];
				sub05.u[131+k]=u[131+k];

				sub12.u[110+k]=u[110+k];
				sub12.u[131+k]=u[131+k];
				sub12.u[152+k]=u[152+k];
				sub12.u[173+k]=u[173+k];

				sub13.u[152+k]=u[152+k];
				sub13.u[173+k]=u[173+k];
				sub13.u[194+k]=u[194+k];
				sub13.u[215+k]=u[215+k];
				sub13.u[236+k]=u[236+k];

				sub20.u[215+k]=u[215+k];
				sub20.u[236+k]=u[236+k];
				sub20.u[257+k]=u[257+k];
				sub20.u[278+k]=u[278+k];

				sub21.u[257+k]=u[257+k];
				sub21.u[278+k]=u[278+k];
				sub21.u[299+k]=u[299+k];
				sub21.u[320+k]=u[320+k];
				sub21.u[341+k]=u[341+k];

				sub28.u[320+k]=u[320+k];
				sub28.u[341+k]=u[341+k];
				sub28.u[362+k]=u[362+k];
				sub28.u[383+k]=u[383+k];

				sub29.u[362+k]=u[362+k];
				sub29.u[383+k]=u[383+k];
				sub29.u[404+k]=u[404+k];
				sub29.u[425+k]=u[425+k];
				sub29.u[446+k]=u[446+k];

				sub06.u[31+k]=u[31+k];
				sub06.u[52+k]=u[52+k];
				sub06.u[73+k]=u[73+k];
				sub06.u[94+k]=u[94+k];

				sub07.u[73+k]=u[73+k];
				sub07.u[94+k]=u[94+k];
				sub07.u[115+k]=u[115+k];
				sub07.u[136+k]=u[136+k];

				sub14.u[115+k]=u[115+k];
				sub14.u[136+k]=u[136+k];
				sub14.u[157+k]=u[157+k];
				sub14.u[178+k]=u[178+k];

				sub15.u[157+k]=u[157+k];
				sub15.u[178+k]=u[178+k];
				sub15.u[199+k]=u[199+k];
				sub15.u[220+k]=u[220+k];
				sub15.u[241+k]=u[241+k];

				sub22.u[220+k]=u[220+k];
				sub22.u[241+k]=u[241+k];
				sub22.u[262+k]=u[262+k];
				sub22.u[283+k]=u[283+k];

				sub23.u[262+k]=u[262+k];
				sub23.u[283+k]=u[283+k];
				sub23.u[304+k]=u[304+k];
				sub23.u[325+k]=u[325+k];
				sub23.u[346+k]=u[346+k];

				sub30.u[325+k]=u[325+k];
				sub30.u[346+k]=u[346+k];
				sub30.u[367+k]=u[367+k];
				sub30.u[388+k]=u[388+k];

				sub31.u[367+k]=u[367+k];
				sub31.u[388+k]=u[388+k];
				sub31.u[409+k]=u[409+k];
				sub31.u[430+k]=u[430+k];
				sub31.u[451+k]=u[451+k];
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
		sub25.start();
		sub26.start();
		sub27.start();
		sub28.start();
		sub29.start();
		sub30.start();
		sub31.start();
	
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
			sub25.start();
			sub26.start();
			sub27.start();
			sub28.start();
			sub29.start();
			sub30.start();
			sub31.start();
		}catch(Exception e){}

		//2-5,2-5
		for(k=2;k<=5;k++)
		{
				u[42+k]=sub00.result[42+k];
				u[63+k]=sub00.result[63+k];
				u[84+k]=sub01.result[84+k];
				u[105+k]=sub01.result[105+k];

				u[126+k]=sub08.result[126+k];
				u[147+k]=sub08.result[147+k];
				u[168+k]=sub09.result[168+k];
				u[189+k]=sub09.result[189+k];
				u[210+k]=sub09.result[210+k];

				u[231+k]=sub16.result[231+k];
				u[252+k]=sub16.result[252+k];
				u[273+k]=sub17.result[273+k];
				u[294+k]=sub17.result[294+k];
				u[315+k]=sub17.result[315+k];

				u[336+k]=sub24.result[336+k];
				u[357+k]=sub24.result[357+k];
				u[378+k]=sub25.result[378+k];
				u[399+k]=sub25.result[399+k];
				u[420+k]=sub25.result[420+k];
		}
		//6-10,2-5
		for(k=6;k<=10;k++)
		{

				u[42+k]=sub02.result[42+k];
				u[63+k]=sub02.result[63+k];
				u[84+k]=sub03.result[84+k];
				u[105+k]=sub03.result[105+k];

				u[126+k]=sub10.result[126+k];
				u[147+k]=sub10.result[147+k];
				u[168+k]=sub11.result[168+k];
				u[189+k]=sub11.result[189+k];
				u[210+k]=sub11.result[210+k];

				u[231+k]=sub18.result[231+k];
				u[252+k]=sub18.result[252+k];
				u[273+k]=sub19.result[273+k];
				u[294+k]=sub19.result[294+k];
				u[315+k]=sub19.result[315+k];

				u[336+k]=sub26.result[336+k];
				u[357+k]=sub26.result[357+k];
				u[378+k]=sub27.result[378+k];
				u[399+k]=sub27.result[399+k];
				u[420+k]=sub27.result[420+k];

				u[47+k]=sub04.result[47+k];
				u[68+k]=sub04.result[68+k];
				u[89+k]=sub05.result[89+k];
				u[110+k]=sub05.result[110+k];

				u[131+k]=sub12.result[131+k];
				u[152+k]=sub12.result[152+k];
				u[173+k]=sub13.result[173+k];
				u[194+k]=sub13.result[194+k];
				u[215+k]=sub13.result[215+k];

				u[236+k]=sub20.result[236+k];
				u[257+k]=sub20.result[257+k];
				u[278+k]=sub21.result[278+k];
				u[299+k]=sub21.result[299+k];
				u[320+k]=sub21.result[320+k];

				u[341+k]=sub28.result[341+k];
				u[362+k]=sub28.result[362+k];
				u[383+k]=sub29.result[383+k];
				u[404+k]=sub29.result[404+k];
				u[425+k]=sub29.result[425+k];

				u[52+k]=sub06.result[52+k];
				u[73+k]=sub06.result[73+k];
				u[94+k]=sub07.result[94+k];
				u[115+k]=sub07.result[115+k];

				u[136+k]=sub14.result[136+k];
				u[157+k]=sub14.result[157+k];
				u[178+k]=sub15.result[178+k];
				u[199+k]=sub15.result[199+k];
				u[220+k]=sub15.result[220+k];

				u[241+k]=sub22.result[241+k];
				u[262+k]=sub22.result[262+k];
				u[283+k]=sub23.result[283+k];
				u[304+k]=sub23.result[304+k];
				u[325+k]=sub23.result[325+k];

				u[346+k]=sub30.result[346+k];
				u[367+k]=sub30.result[367+k];
				u[388+k]=sub31.result[388+k];
				u[409+k]=sub31.result[409+k];
				u[430+k]=sub31.result[430+k];
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
