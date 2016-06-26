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
		for(k=1;k<=8;k++){
			sub00.u[21+k]=u[21+k];
			sub00.u[42+k]=u[42+k];
			sub00.u[63+k]=u[63+k];
			sub00.u[84+k]=u[84+k];
			sub00.u[105+k]=u[105+k];
			sub00.u[126+k]=u[126+k];
			sub00.u[147+k]=u[147+k];
			sub00.u[168+k]=u[168+k];
			sub01.u[147+k]=u[147+k];
			sub01.u[168+k]=u[168+k];
			sub01.u[189+k]=u[189+k];
			sub01.u[210+k]=u[210+k];
			sub01.u[231+k]=u[231+k];
			sub01.u[252+k]=u[252+k];
			sub01.u[273+k]=u[273+k];
			sub01.u[294+k]=u[294+k];
			sub02.u[273+k]=u[273+k];
			sub02.u[294+k]=u[294+k];
			sub02.u[315+k]=u[315+k];
			sub02.u[336+k]=u[336+k];
			sub02.u[357+k]=u[357+k];
			sub02.u[378+k]=u[378+k];
			sub02.u[399+k]=u[399+k];
			sub02.u[420+k]=u[420+k];
			sub02.u[441+k]=u[441+k];
			sub03.u[21+k+6]=u[21+k+6];
			sub03.u[42+k+6]=u[42+k+6];
			sub03.u[63+k+6]=u[63+k+6];
			sub03.u[84+k+6]=u[84+k+6];
			sub03.u[105+k+6]=u[105+k+6];
			sub03.u[126+k+6]=u[126+k+6];
			sub03.u[147+k+6]=u[147+k+6];
			sub03.u[168+k+6]=u[168+k+6];
			sub04.u[147+k+6]=u[147+k+6];
			sub04.u[168+k+6]=u[168+k+6];
			sub04.u[189+k+6]=u[189+k+6];
			sub04.u[210+k+6]=u[210+k+6];
			sub04.u[231+k+6]=u[231+k+6];
			sub04.u[252+k+6]=u[252+k+6];
			sub04.u[273+k+6]=u[273+k+6];
			sub04.u[294+k+6]=u[294+k+6];
			sub05.u[273+k+6]=u[273+k+6];
			sub05.u[294+k+6]=u[294+k+6];
			sub05.u[315+k+6]=u[315+k+6];
			sub05.u[336+k+6]=u[336+k+6];
			sub05.u[357+k+6]=u[357+k+6];
			sub05.u[378+k+6]=u[378+k+6];
			sub05.u[399+k+6]=u[399+k+6];
			sub05.u[420+k+6]=u[420+k+6];
			sub05.u[441+k+6]=u[441+k+6];
		}
		for(k=13;k<=21;k++){
			sub06.u[21+k]=u[21+k];
			sub06.u[42+k]=u[42+k];
			sub06.u[63+k]=u[63+k];
			sub06.u[84+k]=u[84+k];
			sub06.u[105+k]=u[105+k];
			sub06.u[126+k]=u[126+k];
			sub06.u[147+k]=u[147+k];
			sub06.u[168+k]=u[168+k];
			sub07.u[147+k]=u[147+k];
			sub07.u[168+k]=u[168+k];
			sub07.u[189+k]=u[189+k];
			sub07.u[210+k]=u[210+k];
			sub07.u[231+k]=u[231+k];
			sub07.u[252+k]=u[252+k];
			sub07.u[273+k]=u[273+k];
			sub07.u[294+k]=u[294+k];
			sub08.u[273+k]=u[273+k];
			sub08.u[294+k]=u[294+k];
			sub08.u[315+k]=u[315+k];
			sub08.u[336+k]=u[336+k];
			sub08.u[357+k]=u[357+k];
			sub08.u[378+k]=u[378+k];
			sub08.u[399+k]=u[399+k];
			sub08.u[420+k]=u[420+k];
			sub08.u[441+k]=u[441+k];
		}

		sub01.start();
		sub02.start();
		sub03.start();
		sub05.start();
		sub06.start();
		sub07.start();
		sub00.start();
		sub04.start();
		sub08.start();

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
		}catch(Exception e){}
		for(k=2;k<=7;k++){
			u[42+k]=sub00.result[42+k];
			u[63+k]=sub00.result[63+k];
			u[84+k]=sub00.result[84+k];
			u[105+k]=sub00.result[105+k];
			u[126+k]=sub00.result[126+k];
			u[147+k]=sub00.result[147+k];
			u[168+k]=sub01.result[168+k];
			u[189+k]=sub01.result[189+k];
			u[210+k]=sub01.result[210+k];
			u[231+k]=sub01.result[231+k];
			u[252+k]=sub01.result[252+k];
			u[273+k]=sub01.result[273+k];
			u[294+k]=sub02.result[294+k];
			u[315+k]=sub02.result[315+k];
			u[336+k]=sub02.result[336+k];
			u[357+k]=sub02.result[357+k];
			u[378+k]=sub02.result[378+k];
			u[399+k]=sub02.result[399+k];
			u[420+k]=sub02.result[420+k];
			u[42+k+6]=sub03.result[42+k+6];
			u[63+k+6]=sub03.result[63+k+6];
			u[84+k+6]=sub03.result[84+k+6];
			u[105+k+6]=sub03.result[105+k+6];
			u[126+k+6]=sub03.result[126+k+6];
			u[147+k+6]=sub03.result[147+k+6];
			u[168+k+6]=sub04.result[168+k+6];
			u[189+k+6]=sub04.result[189+k+6];
			u[210+k+6]=sub04.result[210+k+6];
			u[231+k+6]=sub04.result[231+k+6];
			u[252+k+6]=sub04.result[252+k+6];
			u[273+k+6]=sub04.result[273+k+6];
			u[294+k+6]=sub05.result[294+k+6];
			u[315+k+6]=sub05.result[315+k+6];
			u[336+k+6]=sub05.result[336+k+6];
			u[357+k+6]=sub05.result[357+k+6];
			u[378+k+6]=sub05.result[378+k+6];
			u[399+k+6]=sub05.result[399+k+6];
			u[420+k+6]=sub05.result[420+k+6];
		}
		for(k=14;k<=20;k++){
			u[42+k]=sub06.result[42+k];
			u[63+k]=sub06.result[63+k];
			u[84+k]=sub06.result[84+k];
			u[105+k]=sub06.result[105+k];
			u[126+k]=sub06.result[126+k];
			u[147+k]=sub06.result[147+k];
			u[168+k]=sub07.result[168+k];
			u[189+k]=sub07.result[189+k];
			u[210+k]=sub07.result[210+k];
			u[231+k]=sub07.result[231+k];
			u[252+k]=sub07.result[252+k];
			u[273+k]=sub07.result[273+k];
			u[294+k]=sub08.result[294+k];
			u[315+k]=sub08.result[315+k];
			u[336+k]=sub08.result[336+k];
			u[357+k]=sub08.result[357+k];
			u[378+k]=sub08.result[378+k];
			u[399+k]=sub08.result[399+k];
			u[420+k]=sub08.result[420+k];
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
