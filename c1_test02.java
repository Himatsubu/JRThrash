import net.njlab.sample.annotation.*;
//分割数４

public class c1_test02{
	private static final float[] u = new float[484];
	private static final float[] uu= new float[484];
	private static final float[] q = new float[484];

	static final sub00 sub00    = new sub00();
	static final sub01 sub01    = new sub01();
	static final sub02 sub02    = new sub02();
	static final sub03 sub03    = new sub03();

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
			u[1*21+k] = 0.5f;
			u[mx*21+k]= 0f;
		}
		
		for (j = 1; j <= mx; j++)
		{
			u[j*21+1] = 1.f;
			u[j*21+my]= 0f;
		}
		

		//10-21,10-21
		for(k=5;k<=my;k++)
		{
			for(j=5;j<=mx;j++)
			{
				sub03.u[j*21+k]=u[j*21+k];
				sub03.q[j*21+k]=q[j*21+k];
			}
		}
		sub03.start();

		//1-11,10-21
		for(k=1;k<=6;k++)
		{
			for(j=5;j<=mx;j++)
			{
				sub01.u[j*21+k]=u[j*21+k];
				sub01.q[j*21+k]=q[j*21+k];
			}
		}
		sub01.start();
		//10-21,1-11
		for(k=5;k<=my;k++)
		{
			for(j=1;j<=6;j++)
			{
				sub02.u[j*21+k]=u[j*21+k];
				sub02.q[j*21+k]=q[j*21+k];
			}
		}
		sub02.start();
		//クラスに配列をこぴー
		//1-11,1-11
		for(k=1;k<=6;k++)
		{
			for(j=1;j<=6;j++)
			{
				sub00.u[j*21+k]=u[j*21+k];
				sub00.q[j*21+k]=q[j*21+k];
			}
		}
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
			for(j=2;j<=5;j++)
			{
				u[j*21+k]=sub00.result[j*21+k];
			}
		}
		//2-10,11-20
		for(k=2;k<=5;k++)
		{
			for(j=6;j<=mx-1;j++)
			{
				u[j*21+k]=sub01.result[j*21+k];
			}
		}	
		//11-20,2-10
		for(k=6;k<=10;k++)
		{
			for(j=2;j<=5;j++)
			{
				u[j*21+k]=sub02.result[j*21+k];
			}
		}
		//11-20,11-20
		for(k=6;k<=10;k++)
		{
			for(j=6;j<=mx-1;j++)
			{
				u[j*21+k]=sub03.result[j*21+k];
			}
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
