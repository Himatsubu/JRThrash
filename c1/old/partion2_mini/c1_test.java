import net.njlab.sample.annotation.*;
//分割数２

public class c1_test{
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

		mx=11;
		my=11;
		dx = 0.05f;
		dy = 0.05f;
		nlast=2;
			
//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 q[j*11+k] = 100f*dx*(j-1)*dy*(k-1);
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
			u[mx*11+j]= 0f;
			u[j*11+1] = 1f;
			u[j*11+my]= 0f;
		}
		
		//クラスに配列をこぴー
		for(k=1;k<=6;k++)
		{
			sub00.u[11+k]=u[11+k];
			sub00.u[22+k]=u[22+k];
			sub00.u[33+k]=u[33+k];
			sub00.u[44+k]=u[44+k];
			sub00.u[55+k]=u[55+k];
			sub00.u[66+k]=u[66+k];
			sub00.u[77+k]=u[77+k];
			sub00.u[88+k]=u[88+k];
			sub00.u[99+k]=u[99+k];
			sub00.u[110+k]=u[110+k];
			sub00.u[121+k]=u[121+k];
	
		}
		sub00.start();

		for(k=5;k<=my;k++)
		{
			sub01.u[11+k]=u[11+k];
			sub01.u[22+k]=u[22+k];
			sub01.u[33+k]=u[33+k];
			sub01.u[44+k]=u[44+k];
			sub01.u[55+k]=u[55+k];
			sub01.u[66+k]=u[66+k];
			sub01.u[77+k]=u[77+k];
			sub01.u[88+k]=u[88+k];
			sub01.u[99+k]=u[99+k];
			sub01.u[110+k]=u[110+k];
			sub01.u[121+k]=u[121+k];

		}

		sub01.start();
	
		try{
			sub00.join();
			sub01.join();
		}catch(Exception e){}

		
		for(k=2;k<=5;k++)
		{
			u[22+k]=sub00.result[22+k];
			u[33+k]=sub00.result[33+k];
			u[44+k]=sub00.result[44+k];
			u[55+k]=sub00.result[55+k];
			u[66+k]=sub00.result[66+k];
			u[77+k]=sub00.result[77+k];
			u[88+k]=sub00.result[88+k];
			u[99+k]=sub00.result[99+k];
			u[110+k]=sub00.result[110+k];

		}
		for(k=6;k<=10;k++)
		{
			u[22+k]=sub01.result[22+k];
			u[33+k]=sub01.result[33+k];
			u[44+k]=sub01.result[44+k];
			u[55+k]=sub01.result[55+k];
			u[66+k]=sub01.result[66+k];
			u[77+k]=sub01.result[77+k];
			u[88+k]=sub01.result[88+k];
			u[99+k]=sub01.result[99+k];
			u[110+k]=sub01.result[110+k];

		}
/*
		for(k=2;k<=my-1;k++)
		{
			for(j=2;j<=mx-1;j++)
			{
				System.out.println(k+" "+j+" "+u[j*11+k]);
			}
		}
*/
			
		}
		//System.out.println(u[110+10]);
	}
}
