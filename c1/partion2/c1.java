import net.njlab.sample.annotation.*;
//分割数２

public class c1{
	private static final float[] u = new float[484];
	private static final float[] uu= new float[484];
	private static final float[] q = new float[484];

	static final subup sub00    = new subup();
	static final subunder sub01 = new subunder();

        @JRThrashUnroll(unrollNum=20, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		float dx,dy;

		mx=21;
		my=21;
		dx = 0.05f;
		dy = 0.05f;
		nlast=400;
			
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
		for(k=1;k<=11;k++)
		{

				sub00.u[21+k]=u[21+k];
				sub00.u[42+k]=u[42+k];
				sub00.u[63+k]=u[63+k];
				sub00.u[84+k]=u[84+k];
				sub00.u[105+k]=u[105+k];
				sub00.u[126+k]=u[126+k];
				sub00.u[147+k]=u[147+k];
				sub00.u[168+k]=u[168+k];
				sub00.u[189+k]=u[189+k];
				sub00.u[210+k]=u[210+k];
				sub00.u[231+k]=u[231+k];
				sub00.u[252+k]=u[252+k];
				sub00.u[273+k]=u[273+k];
				sub00.u[294+k]=u[294+k];
				sub00.u[315+k]=u[315+k];
				sub00.u[336+k]=u[336+k];
				sub00.u[357+k]=u[357+k];
				sub00.u[378+k]=u[378+k];
				sub00.u[399+k]=u[399+k];
				sub00.u[420+k]=u[420+k];
				sub00.u[441+k]=u[441+k];
		}
		sub00.start();

		for(k=10;k<=my;k++)
		{
				sub01.u[21+k]=u[21+k];
				sub01.u[42+k]=u[42+k];
				sub01.u[63+k]=u[63+k];
				sub01.u[84+k]=u[84+k];
				sub01.u[105+k]=u[105+k];
				sub01.u[126+k]=u[126+k];
				sub01.u[147+k]=u[147+k];
				sub01.u[168+k]=u[168+k];
				sub01.u[189+k]=u[189+k];
				sub01.u[210+k]=u[210+k];
				sub01.u[231+k]=u[231+k];
				sub01.u[252+k]=u[252+k];
				sub01.u[273+k]=u[273+k];
				sub01.u[294+k]=u[294+k];
				sub01.u[315+k]=u[315+k];
				sub01.u[336+k]=u[336+k];
				sub01.u[357+k]=u[357+k];
				sub01.u[378+k]=u[378+k];
				sub01.u[399+k]=u[399+k];
				sub01.u[420+k]=u[420+k];
				sub01.u[441+k]=u[441+k];
		}

		sub01.start();
	
		try{
			sub00.join();
			sub01.join();
		}catch(Exception e){}

		
		for(k=2;k<=10;k++)
		{
				u[2*21+k]=sub00.result[2*21+k];
				u[3*21+k]=sub00.result[3*21+k];
				u[4*21+k]=sub00.result[4*21+k];
				u[5*21+k]=sub00.result[5*21+k];
				u[6*21+k]=sub00.result[6*21+k];
				u[7*21+k]=sub00.result[7*21+k];
				u[8*21+k]=sub00.result[8*21+k];
				u[9*21+k]=sub00.result[9*21+k];
				u[10*21+k]=sub00.result[10*21+k];
				u[11*21+k]=sub00.result[11*21+k];
				u[12*21+k]=sub00.result[12*21+k];
				u[13*21+k]=sub00.result[13*21+k];
				u[14*21+k]=sub00.result[14*21+k];
				u[15*21+k]=sub00.result[15*21+k];
				u[16*21+k]=sub00.result[16*21+k];
				u[17*21+k]=sub00.result[17*21+k];
				u[18*21+k]=sub00.result[18*21+k];
				u[19*21+k]=sub00.result[19*21+k];
				u[20*21+k]=sub00.result[20*21+k];
		}
		for(k=11;k<=20;k++)
		{
				u[2*21+k]=sub01.result[2*21+k];
				u[3*21+k]=sub01.result[3*21+k];
				u[4*21+k]=sub01.result[4*21+k];
				u[5*21+k]=sub01.result[5*21+k];
				u[6*21+k]=sub01.result[6*21+k];
				u[7*21+k]=sub01.result[7*21+k];
				u[8*21+k]=sub01.result[8*21+k];
				u[9*21+k]=sub01.result[9*21+k];
				u[10*21+k]=sub01.result[10*21+k];
				u[11*21+k]=sub01.result[11*21+k];
				u[12*21+k]=sub01.result[12*21+k];
				u[13*21+k]=sub01.result[13*21+k];
				u[14*21+k]=sub01.result[14*21+k];
				u[15*21+k]=sub01.result[15*21+k];
				u[16*21+k]=sub01.result[16*21+k];
				u[17*21+k]=sub01.result[17*21+k];
				u[18*21+k]=sub01.result[18*21+k];
				u[19*21+k]=sub01.result[19*21+k];
				u[20*21+k]=sub01.result[20*21+k];
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
		//System.out.println(u[210+10]);
	}
}
