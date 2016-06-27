import net.njlab.sample.annotation.*;
//分割数16

public class c1{
	private static final float[] u = new float[484];
	private static final float[] uu= new float[484];
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
		mx=21;
		my=21;
		//dx = 0.05f;
		//dy = 0.05f;
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
			u[1*21+j] = 0.5f;
			u[441+j]= 0f;
			u[j*21+1] = 1.f;
			u[j*21+my]= 0f;
		}
		
		//クラスに配列をこぴー
		//5-11,5-11 49
		for(k=5;k<=11;k++)
		{

				sub05.u[105+k]=u[105+k];
				sub06.u[110+k]=u[110+k];
				sub07.u[120+k]=u[120+k];
				sub09.u[210+k]=u[210+k];
				sub10.u[215+k]=u[215+k];
				sub11.u[220+k]=u[220+k];
				sub13.u[315+k]=u[315+k];
				sub14.u[320+k]=u[320+k];
				sub15.u[325+k]=u[325+k];

				sub05.u[126+k]=u[126+k];
				sub06.u[131+k]=u[131+k];
				sub07.u[136+k]=u[136+k];
				sub09.u[231+k]=u[231+k];
				sub10.u[236+k]=u[236+k];
				sub11.u[241+k]=u[241+k];
				sub13.u[336+k]=u[336+k];
				sub14.u[341+k]=u[341+k];
				sub15.u[346+k]=u[346+k];

				sub05.u[147+k]=u[147+k];
				sub06.u[152+k]=u[152+k];
				sub07.u[157+k]=u[157+k];
				sub09.u[252+k]=u[252+k];
				sub10.u[257+k]=u[257+k];
				sub11.u[262+k]=u[262+k];
				sub13.u[357+k]=u[357+k];
				sub14.u[362+k]=u[362+k];
				sub15.u[367+k]=u[367+k];

				sub05.u[168+k]=u[168+k];
				sub06.u[173+k]=u[173+k];
				sub07.u[178+k]=u[178+k];
				sub09.u[273+k]=u[273+k];
				sub10.u[278+k]=u[278+k];
				sub11.u[283+k]=u[283+k];
				sub13.u[378+k]=u[378+k];
				sub14.u[383+k]=u[383+k];
				sub15.u[388+k]=u[388+k];

				sub05.u[189+k]=u[189+k];
				sub06.u[194+k]=u[194+k];
				sub07.u[199+k]=u[199+k];
				sub09.u[294+k]=u[294+k];
				sub10.u[299+k]=u[299+k];
				sub11.u[304+k]=u[304+k];
				sub13.u[399+k]=u[399+k];
				sub14.u[404+k]=u[404+k];
				sub15.u[409+k]=u[409+k];

				sub05.u[210+k]=u[210+k];
				sub06.u[215+k]=u[215+k];
				sub07.u[220+k]=u[220+k];
				sub09.u[315+k]=u[315+k];
				sub10.u[320+k]=u[320+k];
				sub11.u[325+k]=u[325+k];
				sub13.u[420+k]=u[420+k];
				sub14.u[425+k]=u[425+k];
				sub15.u[430+k]=u[430+k];

				sub05.u[231+k]=u[231+k];
				sub06.u[236+k]=u[236+k];
				sub07.u[241+k]=u[241+k];
				sub09.u[336+k]=u[336+k];
				sub10.u[341+k]=u[341+k];
				sub11.u[346+k]=u[346+k];
				sub13.u[441+k]=u[441+k];
				sub14.u[446+k]=u[446+k];
				sub15.u[451+k]=u[451+k];


				sub01.u[21+k]=u[21+k];
				sub02.u[26+k]=u[26+k];
				sub03.u[31+k]=u[31+k];

				sub01.u[42+k]=u[42+k];
				sub02.u[47+k]=u[47+k];
				sub03.u[52+k]=u[52+k];

				sub01.u[63+k]=u[63+k];
				sub02.u[68+k]=u[68+k];
				sub03.u[73+k]=u[73+k];

				sub01.u[84+k]=u[84+k];
				sub02.u[89+k]=u[89+k];
				sub03.u[94+k]=u[94+k];

				sub01.u[105+k]=u[105+k];
				sub02.u[110+k]=u[110+k];
				sub03.u[120+k]=u[120+k];

				sub01.u[126+k]=u[126+k];
				sub02.u[131+k]=u[131+k];
				sub03.u[136+k]=u[136+k];

		}
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
		//1-6,5-11 42
		for(k=1;k<=6;k++)
		{
	
				sub04.u[105+k]=u[105+k];
				sub08.u[210+k]=u[210+k];
				sub12.u[315+k]=u[315+k];

				sub04.u[126+k]=u[126+k];
				sub08.u[231+k]=u[231+k];
				sub12.u[336+k]=u[336+k];

				sub04.u[147+k]=u[147+k];
				sub08.u[252+k]=u[252+k];
				sub12.u[357+k]=u[357+k];

				sub04.u[168+k]=u[168+k];
				sub08.u[273+k]=u[273+k];
				sub12.u[399+k]=u[399+k];

				sub04.u[210+k]=u[210+k];
				sub08.u[315+k]=u[315+k];
				sub12.u[420+k]=u[420+k];

				sub04.u[231+k]=u[231+k];
				sub08.u[336+k]=u[336+k];
				sub12.u[441+k]=u[441+k];

				sub00.u[21+k]=u[21+k];
				sub00.u[42+k]=u[42+k];
				sub00.u[63+k]=u[63+k];
				sub00.u[84+k]=u[84+k];
				sub00.u[105+k]=u[105+k];
				sub00.u[126+k]=u[126+k];

		}

		sub00.start();
		sub04.start();
		sub08.start();
		sub12.start();	
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

		//2-5,2-5
		for(k=2;k<=5;k++)
		{
				u[42+k]=sub00.result[42+k];
				u[63+k]=sub00.result[63+k];
				u[84+k]=sub00.result[84+k];
				u[105+k]=sub00.result[105+k];

				u[126+k]=sub04.result[126+k];
				u[231+k]=sub08.result[231+k];
				u[336+k]=sub12.result[336+k];

				u[147+k]=sub04.result[147+k];
				u[252+k]=sub08.result[252+k];
				u[357+k]=sub12.result[357+k];

				u[168+k]=sub04.result[168+k];
				u[273+k]=sub08.result[273+k];
				u[378+k]=sub12.result[378+k];

				u[189+k]=sub04.result[189+k];
				u[294+k]=sub08.result[294+k];
				u[399+k]=sub12.result[399+k];

				u[210+k]=sub04.result[210+k];
				u[315+k]=sub08.result[315+k];
				u[420+k]=sub12.result[420+k];
	
		}
		//6-10,2-5
		for(k=6;k<=10;k++)
		{


				u[42+k]=sub01.result[42+k];
				u[47+k]=sub02.result[47+k];
				u[52+k]=sub03.result[52+k];

				u[63+k]=sub01.result[63+k];
				u[68+k]=sub02.result[68+k];
				u[73+k]=sub03.result[73+k];

				u[84+k]=sub01.result[84+k];
				u[89+k]=sub02.result[89+k];
				u[94+k]=sub03.result[94+k];

				u[105+k]=sub01.result[105+k];
				u[110+k]=sub02.result[110+k];
				u[115+k]=sub03.result[115+k];
			
				u[126+k]=sub05.result[126+k];
				u[131+k]=sub06.result[131+k];
				u[136+k]=sub07.result[136+k];
				u[231+k]=sub09.result[231+k];
				u[236+k]=sub10.result[236+k];
				u[241+k]=sub11.result[241+k];
				u[336+k]=sub13.result[336+k];
				u[341+k]=sub14.result[341+k];
				u[346+k]=sub15.result[346+k];

				u[147+k]=sub05.result[147+k];
				u[152+k]=sub06.result[152+k];
				u[157+k]=sub07.result[157+k];
				u[252+k]=sub09.result[252+k];
				u[257+k]=sub10.result[257+k];
				u[262+k]=sub11.result[262+k];
				u[357+k]=sub13.result[357+k];
				u[362+k]=sub14.result[362+k];
				u[367+k]=sub15.result[367+k];

				u[168+k]=sub05.result[168+k];
				u[173+k]=sub06.result[173+k];
				u[178+k]=sub07.result[178+k];
				u[273+k]=sub09.result[273+k];
				u[278+k]=sub10.result[278+k];
				u[283+k]=sub11.result[283+k];
				u[378+k]=sub13.result[378+k];
				u[383+k]=sub14.result[383+k];
				u[388+k]=sub15.result[388+k];

				u[189+k]=sub05.result[189+k];
				u[194+k]=sub06.result[194+k];
				u[199+k]=sub07.result[199+k];
				u[294+k]=sub09.result[294+k];
				u[299+k]=sub10.result[299+k];
				u[304+k]=sub11.result[304+k];
				u[399+k]=sub13.result[399+k];
				u[404+k]=sub14.result[404+k];
				u[409+k]=sub15.result[409+k];

				u[210+k]=sub05.result[210+k];
				u[215+k]=sub06.result[215+k];
				u[220+k]=sub07.result[220+k];
				u[315+k]=sub09.result[315+k];
				u[320+k]=sub10.result[320+k];
				u[325+k]=sub11.result[325+k];
				u[420+k]=sub13.result[420+k];
				u[425+k]=sub14.result[425+k];
				u[430+k]=sub15.result[430+k];
			
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
