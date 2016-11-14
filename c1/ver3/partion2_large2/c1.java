import net.njlab.sample.annotation.*;
//分割数２

public class c1{
	
	private static final float[] u = new float[16900];
	//private static final float[] uu= new float[16900];
	//private static final float[] q = new float[16900];

	static final subup sub00    = new subup();
	static final subunder sub01 = new subunder();

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
//	public float run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		float dx,dy,r1,r2,dt;

		mx=129;
		my=129;
		dx = 1f/(mx-1);
		dy = 1f/(my-1);
		dt = 0.005f;
		r1 = dt/(dx*dx);
		r2 = dt/(dy*dy);
		nlast=1;
			
//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 //q[j*21+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*129+k] = 0f;
			 //uu[j*129+k] = 0f;
		}
	}
	
	for(k=1;k<=129;k++){	
		u[1*129+k]=0.5f;
		u[129*129+k]=0.0f;
	}
	for(j=1;j<=129;j++){
		u[j*129+1]=1.f;
		u[j*129+129]=0.0f;
	}

	//クラスに配列をこぴー
	for(k=1;k<=129;k++)
	{
		for(j=1;j<=65;j++){
			sub00.u[j*129+k]=u[j*129+k];
		}
		for(j=64;j<=129;j++){
			sub01.u[(j-63)*129+k]=u[j*129+k];
		}
	}


//	計算ループ	
	for(n=1;n<=nlast;n++){
//	境界条件
/*
		for (j = 1; j <= my; j++)
		{
			u[129+j] = 0.5f;
			u[mx*129+j]= 0f;
			u[j*129+1] = 1.f;
			u[j*129+my]= 0f;
		}
*/		


		sub00.start();
		sub01.start();
	
		try{
			sub00.join();
			sub01.join();
		}catch(Exception e){}

//		sub00.run();
//		sub01.run();
		
		for(k=1;k<=129;k++){
			sub00.u[65*129+k]=sub01.result[(65-63)*129+k];
			sub01.u[(64-63)*129+k]=sub00.result[64*129+k];
	
		}

			
	}
		for(k=2;k<=128;k++){
			for(j=2;j<=64;j++){
				u[j*129+k]=sub00.result[j*129+k];
			}		
			for(j=65;j<=128;j++){
				u[j*129+k]=sub01.result[(j-63)*129+k];
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
		//System.out.println(u[210+10]);
		//return u[2*129+2];
	}
}
