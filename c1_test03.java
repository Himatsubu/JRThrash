import net.njlab.sample.annotation.*;
//分割数16

public class c1_test02{
	private static final float[] u = new float[484];
	private static final float[] uu= new float[484];
	private static final float[] q = new float[484];

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
		
		//クラスに配列をこぴー
		//1-6,1-6
		for(k=1;k<=6;k++)
		{
			for(j=1;j<=6;j++)
			{
				sub00.u[j*21+k]=u[j*21+k];
				sub00.q[j*21+k]=q[j*21+k];
			}
		}
		//5-11,1-6
		for(k=5;k<=11;k++)
		{
			for(j=1;j<=6;j++)
			{
				sub01.u[j*21+k]=u[j*21+k];
				sub01.q[j*21+k]=q[j*21+k];
			}
		}
		//10-16,1-6
		for(k=10;k<=16;k++)
		{
			for(j=1;j<=6;j++)
			{
				sub02.u[j*21+k]=u[j*21+k];
				sub02.q[j*21+k]=q[j*21+k];
			}
		}
		//15-21,1-6
		for(k=15;k<=my;k++)
		{
			for(j=1;j<=6;j++)
			{
				sub03.u[j*21+k]=u[j*21+k];
				sub03.q[j*21+k]=q[j*21+k];
			}
		}

		//1-6,5-11
		for(k=1;k<=6;k++)
		{
			for(j=5;j<=11;j++)
			{	
				sub04.u[j*21+k]=u[j*21+k];
				sub04.q[j*21+k]=q[j*21+k];
			}
		}

		//5-11,5-11
		for(k=5;k<=11;k++)
		{
			for(j=5;j<=11;j++)
			{
				sub05.u[j*21+k]=u[j*21+k];
				sub05.q[j*21+k]=q[j*21+k];
			}
		}	

		//10-16,5-11
		for(k=10;k<=16;k++)
		{
			for(j=5;j<=11;j++)
			{
				sub06.u[j*21+k]=u[j*21+k];
				sub06.q[j*21+k]=q[j*21+k];
			}
		}

		//15-21,5-11
		for(k=15;k<=21;k++)
		{
			for(j=5;j<=11;j++)
			{
				sub07.u[21*j+k]=u[j*21+k];
				sub07.q[j*21+k]=q[j*21+k];
			}
		}		
	
		//1-6,10-16
		for(k=1;k<=6;k++)
		{
			for(j=10;j<=16;j++)
			{
				sub08.u[j*21+k]=u[j*21+k];
				sub08.q[j*21+k]=q[j*21+k];
			}
		}
		//5-11,10-16
		for(k=5;k<=11;k++)
		{
			for(j=10;j<=16;j++)
			{
				sub09.u[j*21+k]=u[j*21+k];
				sub09.q[j*21+k]=q[j*21+k];
			}
		}
		//10-16,10-16
		for(k=10;k<=16;k++)
		{
			for(j=10;j<=16;j++)
			{
				sub10.u[j*21+k]=u[j*21+k];
				sub10.q[j*21+k]=q[j*21+k];
			}
		}
		//15-21,10-16
		for(k=15;k<=21;k++)
		{
			for(j=10;j<=16;j++)
			{
				sub11.u[j*21+k]=u[j*21+k];
				sub11.q[j*21+k]=q[j*21+k];
			}
		}
		//15-21,1-6
		for(k=15;k<=my;k++)
		{
			for(j=1;j<=6;j++)
			{
				sub12.u[j*21+k]=u[j*21+k];
				sub12.q[j*21+k]=q[j*21+k];
			}
		}

		//15-21,5-11
		for(k=15;k<=mx;k++)
		{
			for(j=5;j<=11;j++)
			{	
				sub13.u[j*21+k]=u[j*21+k];
				sub13.q[j*21+k]=q[j*21+k];
			}
		}

		//15-21,10-16
		for(k=15;k<=mx;k++)
		{
			for(j=10;j<=16;j++)
			{
				sub14.u[j*21+k]=u[j*21+k];
				sub14.q[j*21+k]=q[j*21+k];
			}
		}	

		//15-21,15-21
		for(k=15;k<=mx;k++)
		{
			for(j=15;j<=my;j++)
			{
				sub15.u[j*21+k]=u[j*21+k];
				sub15.q[j*21+k]=q[j*21+k];
			}
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
			for(j=2;j<=5;j++)
			{
				u[j*21+k]=sub00.result[j*21+k];
			}
		}
		//6-10,2-5
		for(k=6;k<=10;k++)
		{
			for(j=2;j<=5;j++)
			{
				u[j*21+k]=sub01.result[j*21+k];
			}
		}
		//11-15,2-5
		for(k=11;k<=15;k++)
		{
			for(j=2;j<=5;j++)
			{
				u[j*21+k]=sub02.result[j*21+k];
			}
		}
		//16-20,2-5
		for(k=16;k<=20;k++)
		{
			for(j=2;j<=5;j++)
			{
				u[j*21+k]=sub03.result[j*21+k];
			}
		}
		//2-5,6-10
		for(k=2;k<=5;k++)
		{
			for(j=6;j<=10;j++)
			{
				u[j*21+k]=sub04.result[j*21+k];
			}
		}
		//6-10,6-10
		for(k=6;k<=10;k++)
		{
			for(j=6;j<=10;j++)
			{
				u[j*21+k]=sub05.result[j*21+k];
			}
		}
		//11-15,6-10
		for(k=11;k<=15;k++)
		{
			for(j=6;j<=10;j++)
			{
				u[j*21+k]=sub06.result[j*21+k];
			}
		}
		//16-20,6-10
		for(k=16;k<=20;k++)
		{
			for(j=6;j<=10;j++)
			{
				u[j*21+k]=sub07.result[j*21+k];
			}
		}
		//2-5,11-15
		for(k=2;k<=5;k++)
		{
			for(j=11;j<=15;j++)
			{
				u[j*21+k]=sub08.result[j*21+k];
			}
		}
		//6-10,11-15
		for(k=6;k<=10;k++)
		{
			for(j=11;j<=15;j++)
			{
				u[j*21+k]=sub09.result[j*21+k];
			}
		}
		//11-15,11-15
		for(k=11;k<=15;k++)
		{
			for(j=11;j<=15;j++)
			{
				u[j*21+k]=sub10.result[j*21+k];
			}
		}
		//16-20,11-15
		for(k=16;k<=20;k++)
		{
			for(j=11;j<=15;j++)
			{
				u[j*21+k]=sub11.result[j*21+k];
			}
		}
		//2-5,16-20
		for(k=2;k<=5;k++)
		{
			for(j=16;j<=20;j++)
			{
				u[j*21+k]=sub12.result[j*21+k];
			}
		}
		//6-10,16-20
		for(k=6;k<=10;k++)
		{
			for(j=16;j<=20;j++)
			{
				u[j*21+k]=sub13.result[j*21+k];
			}
		}
		//11-15,16-20
		for(k=11;k<=20;k++)
		{
			for(j=16;j<=20;j++)
			{
				u[j*21+k]=sub14.result[j*21+k];
			}
		}
		//16-20,16-20
		for(k=16;k<=20;k++)
		{
			for(j=16;j<=20;j++)
			{
				u[j*21+k]=sub15.result[j*21+k];
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
