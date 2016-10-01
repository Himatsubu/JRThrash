import net.njlab.sample.annotation.*;
//分割数４,１重ループでのパイプライン実行

public class c1_test02{
	private static final float[] u = new float[484];
	//private static final float[] uu= new float[484];
	//private static final float[] q = new float[484];

	static final sub00 sub00    = new sub00();
	static final sub01 sub01    = new sub01();
	static final sub02 sub02    = new sub02();
	static final sub03 sub03    = new sub03();

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		float dx,dy;

		mx=11;
		my=11;
		dx = 0.05f;
		dy = 0.05f;
		nlast=400;
			
//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 //q[j*11+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*11+k] = 0f;
			//uu[j*11+k] = 0f;
		}
	}
	
//	計算ループ	
	for(n=1;n<=nlast;n++){
//	境界条件
		for (j = 1; j <= my; j++)
		{
			u[1*11+j] = 0.5f;
			u[mx*11+j]= 0f;
			u[j*11+1] = 1.f;
			u[j*11+my]= 0f;
		}
		

		//10-21,10-21
		for(k=5;k<=my;k++)
		{
			sub02.u[11+k]=u[11+k];
			sub02.u[22+k]=u[22+k];
			sub02.u[33+k]=u[33+k];
			sub02.u[44+k]=u[44+k];
			sub02.u[55+k]=u[55+k];
			sub02.u[66+k]=u[66+k];

			sub03.u[55+k]=u[55+k];
			sub03.u[66+k]=u[66+k];
			sub03.u[77+k]=u[77+k];
			sub03.u[88+k]=u[88+k];
			sub03.u[99+k]=u[99+k];
			sub03.u[110+k]=u[110+k];
			sub03.u[121+k]=u[121+k];
		}
		sub02.start();
		sub03.start();

		//1-11,10-21
		for(k=1;k<=6;k++)
		{
			sub00.u[11+k]=u[11+k];
			sub00.u[22+k]=u[22+k];
			sub00.u[33+k]=u[33+k];
			sub00.u[44+k]=u[44+k];
			sub00.u[55+k]=u[55+k];
			sub00.u[66+k]=u[66+k];

			sub01.u[55+k]=u[55+k];
			sub01.u[66+k]=u[66+k];
			sub01.u[77+k]=u[77+k];
			sub01.u[88+k]=u[88+k];
			sub01.u[99+k]=u[99+k];
			sub01.u[110+k]=u[110+k];
			sub01.u[121+k]=u[121+k];

		}
		sub01.start();
		sub00.start();

		try{
			sub00.join();
			sub01.join();
			sub02.join();
			sub03.join();
		}catch(Exception e){}

		//2-10,2-10
		for(k=2;k<=5;k++)
		{
			u[22+k]=sub00.result[22+k];
			u[33+k]=sub00.result[33+k];
			u[44+k]=sub00.result[44+k];
			u[55+k]=sub00.result[55+k];

			u[55+k]=sub01.result[55+k];
			u[66+k]=sub01.result[66+k];
			u[77+k]=sub01.result[77+k];
			u[88+k]=sub01.result[88+k];
			u[99+k]=sub01.result[99+k];
			u[110+k]=sub01.result[110+k];
		}	
		//11-20,2-10
		for(k=6;k<=10;k++)
		{
			u[22+k]=sub02.result[22+k];
			u[33+k]=sub02.result[33+k];
			u[44+k]=sub02.result[44+k];
			u[55+k]=sub02.result[55+k];

			u[55+k]=sub03.result[55+k];
			u[66+k]=sub03.result[66+k];
			u[77+k]=sub03.result[77+k];
			u[88+k]=sub03.result[88+k];
			u[99+k]=sub03.result[99+k];
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
