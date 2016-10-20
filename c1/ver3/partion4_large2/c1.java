import net.njlab.sample.annotation.*;
//分割数４,１重ループでのパイプライン実行

public class c1{
	private static final float[] u = new float[16900];
	//private static final float[] uu= new float[8643];
	//private static final float[] q = new float[8643];

	static final sub00 sub00    = new sub00();
	static final sub01 sub01    = new sub01();
	static final sub02 sub02    = new sub02();
	static final sub03 sub03    = new sub03();

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		float dx,dy,r1,r2,dt;
		int tmpj;

		mx=129;
		my=129;
		dt=0.0005f;
		
		dx = 1f/(mx-1);
		dy = 1f/(my-1);
		r1=dt/(dx*dx);
		r2=dt/(dy*dy);

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

	for(k=1;k<=65;k++){
		for(j=1;j<=65;j++){
			sub00.u[j*129+k]=u[j*129+k];
		}
		for(j=64;j<=65;j++){
			tmpj=j-63;
			sub01.u[tmpj*129+k]=u[j*129+k];
		}
	}

	for(k=64;k<=129;k++){
		for(j=1;j<=65;j++){
			sub02.u[j*129+k]=u[j*129+k];
		}
		for(j=64;j<=129;j++){
			tmpj=j-63;
			sub03.u[tmpj*129+k]=u[j*129];
		}
	}
	
//	計算ループ	
	for(n=1;n<=nlast;n++){

		sub03.start();
		sub02.start();
		sub01.start();
		sub00.start();

		try{
			sub00.join();
			sub01.join();
			sub02.join();
			sub03.join();
		}catch(Exception e){}

		for(k=2;k<=64;k++){
			sub00.result[65*129+k]=sub01.result[(65-63)*129+k];
			sub01.result[(64-63)*129+k]=sub00.result[64*129+k];
		}
		for(j=2;j<=64;j++){

			sub00.result[j*129+65]=sub02.result[j*129+65];
			sub02.result[j*129+64]=sub00.result[j*129+64];
		}
		for(k=65;k<=128;k++){
			sub02.result[65*129+k]=sub03.result[65*129+k];
			sub03.result[(64-63)*129+k]=sub02.result[64*129+k];
			
		}
	
		//for(j=65;j<=128;j++){
		for(tmpj=2;tmpj<=65;tmpj++){	//tmpj=j-63
			sub01.result[tmpj*129+65]=sub03.result[tmpj*129+k];
			sub03.result[tmpj*129+64]=sub01.result[tmpj*129+k];
		}
	}



	//2-10,2-10
	for(k=2;k<=64;k++)
	{
		for(j=2;j<=64;j++){u[j*129+k]=sub00.result[j*129+k];}
		for(j=65;j<=128;j++){u[j*129+k]=sub01.result[(j-63)*129+k];}
	}	
	//11-20,2-10
	for(k=65;k<=128;k++)
	{
		for(j=2;j<=64;j++){u[j*129+k]=sub02.result[j*129+k];}
		for(j=65;j<=128;j++){u[j*129+k]=sub03.result[(j-63)*129+k];}
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
		//return u[10*21+10];
}

