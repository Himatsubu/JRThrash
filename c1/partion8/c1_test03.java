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
		
		for(k=1;k<=6;k++){
			sub00.u[21+k]=u[21+k];
			sub00.u[42+k]=u[42+k];
			sub00.u[63+k]=u[63+k];
			sub00.u[84+k]=u[84+k];
			sub00.u[105+k]=u[105+k];
			sub00.u[126+k]=u[126+k];
			sub01.u[105+k]=u[105+k];
			sub01.u[126+k]=u[126+k];
			sub01.u[147+k]=u[147+k];
			sub01.u[168+k]=u[168+k];
			sub01.u[189+k]=u[189+k];
			sub01.u[210+k]=u[210+k];
			sub01.u[231+k]=u[231+k];
			sub02.u[210+k]=u[210+k];
			sub02.u[231+k]=u[231+k];
			sub02.u[252+k]=u[252+k];
			sub02.u[273+k]=u[273+k];
			sub02.u[294+k]=u[294+k];
			sub02.u[315+k]=u[315+k];
			sub02.u[336+k]=u[336+k];
			sub03.u[315+k]=u[315+k];
			sub03.u[336+k]=u[336+k];
			sub03.u[357+k]=u[357+k];
			sub03.u[378+k]=u[378+k];
			sub03.u[399+k]=u[399+k];
			sub03.u[420+k]=u[420+k];
			sub03.u[441+k]=u[441+k];
		}
		for(k=5;k<=11;k++){
			sub04.u[21+k]=u[21+k];
			sub04.u[42+k]=u[42+k];
			sub04.u[63+k]=u[63+k];
			sub04.u[84+k]=u[84+k];
			sub04.u[105+k]=u[105+k];
			sub04.u[126+k]=u[126+k];
			sub05.u[105+k]=u[105+k];
			sub05.u[126+k]=u[126+k];
			sub05.u[147+k]=u[147+k];
			sub05.u[168+k]=u[168+k];
			sub05.u[189+k]=u[189+k];
			sub05.u[210+k]=u[210+k];
			sub05.u[231+k]=u[231+k];
			sub06.u[210+k]=u[210+k];
			sub06.u[231+k]=u[231+k];
			sub06.u[252+k]=u[252+k];
			sub06.u[273+k]=u[273+k];
			sub06.u[294+k]=u[294+k];
			sub06.u[315+k]=u[315+k];
			sub06.u[336+k]=u[336+k];
			sub07.u[315+k]=u[315+k];
			sub07.u[336+k]=u[336+k];
			sub07.u[357+k]=u[357+k];
			sub07.u[378+k]=u[378+k];
			sub07.u[399+k]=u[399+k];
			sub07.u[420+k]=u[420+k];
			sub07.u[441+k]=u[441+k];
			sub08.u[21+k+5]=u[21+k+5];
			sub08.u[42+k+5]=u[42+k+5];
			sub08.u[63+k+5]=u[63+k+5];
			sub08.u[84+k+5]=u[84+k+5];
			sub08.u[105+k+5]=u[105+k+5];
			sub08.u[126+k+5]=u[126+k+5];
			sub09.u[105+k+5]=u[105+k+5];
			sub09.u[126+k+5]=u[126+k+5];
			sub09.u[147+k+5]=u[147+k+5];
			sub09.u[168+k+5]=u[168+k+5];
			sub09.u[189+k+5]=u[189+k+5];
			sub09.u[210+k+5]=u[210+k+5];
			sub09.u[231+k+5]=u[231+k+5];
			sub10.u[210+k+5]=u[210+k+5];
			sub10.u[231+k+5]=u[231+k+5];
			sub10.u[252+k+5]=u[252+k+5];
			sub10.u[273+k+5]=u[273+k+5];
			sub10.u[294+k+5]=u[294+k+5];
			sub10.u[315+k+5]=u[315+k+5];
			sub10.u[336+k+5]=u[336+k+5];
			sub11.u[315+k+5]=u[315+k+5];
			sub11.u[336+k+5]=u[336+k+5];
			sub11.u[357+k+5]=u[357+k+5];
			sub11.u[378+k+5]=u[378+k+5];
			sub11.u[399+k+5]=u[399+k+5];
			sub11.u[420+k+5]=u[420+k+5];
			sub11.u[441+k+5]=u[441+k+5];
			sub12.u[21+k+10]=u[21+k+10];
			sub12.u[42+k+10]=u[42+k+10];
			sub12.u[63+k+10]=u[63+k+10];
			sub12.u[84+k+10]=u[84+k+10];
			sub12.u[105+k+10]=u[105+k+10];
			sub12.u[126+k+10]=u[126+k+10];
			sub13.u[105+k+10]=u[105+k+10];
			sub13.u[126+k+10]=u[126+k+10];
			sub13.u[147+k+10]=u[147+k+10];
			sub13.u[168+k+10]=u[168+k+10];
			sub13.u[189+k+10]=u[189+k+10];
			sub13.u[210+k+10]=u[210+k+10];
			sub13.u[231+k+10]=u[231+k+10];
			sub14.u[210+k+10]=u[210+k+10];
			sub14.u[231+k+10]=u[231+k+10];
			sub14.u[252+k+10]=u[252+k+10];
			sub14.u[273+k+10]=u[273+k+10];
			sub14.u[294+k+10]=u[294+k+10];
			sub14.u[315+k+10]=u[315+k+10];
			sub14.u[336+k+10]=u[336+k+10];
			sub15.u[315+k+10]=u[315+k+10];
			sub15.u[336+k+10]=u[336+k+10];
			sub15.u[357+k+10]=u[357+k+10];
			sub15.u[378+k+10]=u[378+k+10];
			sub15.u[399+k+10]=u[399+k+10];
			sub15.u[420+k+10]=u[420+k+10];
			sub15.u[441+k+10]=u[441+k+10];
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
		for(k=2;k<=5;k++){
			u[42+k]=sub00.result[42+k];
			u[63+k]=sub00.result[63+k];
			u[84+k]=sub00.result[84+k];
			u[105+k]=sub00.result[105+k];
			u[126+k]=sub01.result[126+k];
			u[147+k]=sub01.result[147+k];
			u[168+k]=sub01.result[168+k];
			u[189+k]=sub01.result[189+k];
			u[210+k]=sub01.result[210+k];
			u[231+k]=sub02.result[231+k];
			u[252+k]=sub02.result[252+k];
			u[273+k]=sub02.result[273+k];
			u[294+k]=sub02.result[294+k];
			u[315+k]=sub02.result[315+k];
			u[336+k]=sub03.result[336+k];
			u[357+k]=sub03.result[357+k];
			u[378+k]=sub03.result[378+k];
			u[399+k]=sub03.result[399+k];
			u[420+k]=sub03.result[420+k];
		}
		for(k=6;k<=10;k++){
			u[42+k]=sub04.result[42+k];
			u[63+k]=sub04.result[63+k];
			u[84+k]=sub04.result[84+k];
			u[105+k]=sub04.result[105+k];
			u[126+k]=sub05.result[126+k];
			u[147+k]=sub05.result[147+k];
			u[168+k]=sub05.result[168+k];
			u[189+k]=sub05.result[189+k];
			u[210+k]=sub05.result[210+k];
			u[231+k]=sub06.result[231+k];
			u[252+k]=sub06.result[252+k];
			u[273+k]=sub06.result[273+k];
			u[294+k]=sub06.result[294+k];
			u[315+k]=sub06.result[315+k];
			u[336+k]=sub07.result[336+k];
			u[357+k]=sub07.result[357+k];
			u[378+k]=sub07.result[378+k];
			u[399+k]=sub07.result[399+k];
			u[420+k]=sub07.result[420+k];
			u[42+k+5]=sub08.result[42+k+5];
			u[63+k+5]=sub08.result[63+k+5];
			u[84+k+5]=sub08.result[84+k+5];
			u[105+k+5]=sub08.result[105+k+5];
			u[126+k+5]=sub09.result[126+k+5];
			u[147+k+5]=sub09.result[147+k+5];
			u[168+k+5]=sub09.result[168+k+5];
			u[189+k+5]=sub09.result[189+k+5];
			u[210+k+5]=sub09.result[210+k+5];
			u[231+k+5]=sub10.result[231+k+5];
			u[252+k+5]=sub10.result[252+k+5];
			u[273+k+5]=sub10.result[273+k+5];
			u[294+k+5]=sub10.result[294+k+5];
			u[315+k+5]=sub10.result[315+k+5];
			u[336+k+5]=sub11.result[336+k+5];
			u[357+k+5]=sub11.result[357+k+5];
			u[378+k+5]=sub11.result[378+k+5];
			u[399+k+5]=sub11.result[399+k+5];
			u[420+k+5]=sub11.result[420+k+5];
			u[42+k+10]=sub12.result[42+k+10];
			u[63+k+10]=sub12.result[63+k+10];
			u[84+k+10]=sub12.result[84+k+10];
			u[105+k+10]=sub12.result[105+k+10];
			u[126+k+10]=sub13.result[126+k+10];
			u[147+k+10]=sub13.result[147+k+10];
			u[168+k+10]=sub13.result[168+k+10];
			u[189+k+10]=sub13.result[189+k+10];
			u[210+k+10]=sub13.result[210+k+10];
			u[231+k+10]=sub14.result[231+k+10];
			u[252+k+10]=sub14.result[252+k+10];
			u[273+k+10]=sub14.result[273+k+10];
			u[294+k+10]=sub14.result[294+k+10];
			u[315+k+10]=sub14.result[315+k+10];
			u[336+k+10]=sub15.result[336+k+10];
			u[357+k+10]=sub15.result[357+k+10];
			u[378+k+10]=sub15.result[378+k+10];
			u[399+k+10]=sub15.result[399+k+10];
			u[420+k+10]=sub15.result[420+k+10];
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
