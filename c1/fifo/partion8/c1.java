import net.njlab.sample.annotation.*;
//分割数16

public class c1{
	private static final float[] u = new float[16900];
	//private static final float[] uu= new float[4514];
	//private static final float[] q = new float[4514];

	static final sub00 sub00    = new sub00(); //1-6,1-6
	static final sub01 sub01    = new sub01(); //5-11,1-6
	static final sub02 sub02    = new sub02(); //10-16,1-6
	static final sub03 sub03    = new sub03(); //15-21,1-6
	static final sub04 sub04    = new sub04(); //1-6,5-11
	static final sub05 sub05    = new sub05(); //5-11,5-11
	static final sub06 sub06    = new sub06(); //10-16,5-11
	static final sub07 sub07    = new sub07(); //15-21,5-11

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public float run(){
		int k,j,n,mx,my,nlast;
		int tmpj;
		float dx,dy,dt,r1,r2;
		mx=129;
		my=129;
		dx = 1f/(mx-1);
		dy = 1f/(mx-1);
		dt = 0.0005f;
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

	for(k=1;k<=129;k++){
		u[1*129+k]=0.5f;
		u[129*129+k]=0.0f;
	}
	for(j=1;j<=129;j++){
		u[j*129+1]=1.f;
		u[j*129+129]=0.0f;
	}

	for(k=1;k<=65;k++){
		for(j=1;j<=33;j++)  {sub00.u[j*129+k]=u[j*129+k];}
		for(j=32;j<=65;j++) {sub01.u[(j-31)*129+k]=u[j*129+k];}
		for(j=64;j<=97;j++) {sub02.u[(j-63)*129+k]=u[j*129+k];}
		for(j=96;j<=129;j++){sub03.u[(j-95)*129+k]=u[j*129+k];}
	}
	for(k=64;k<=129;k++){
		for(j=1;j<=33;j++)  {sub04.u[129*j+k]=u[j*129+k];}
		for(j=32;j<=65;j++) {sub05.u[129*(j-31)+k]=u[j*129+k];}
		for(j=64;j<=97;j++) {sub06.u[129*(j-63)+k]=u[j*129+k];}
		for(j=96;j<=129;j++){sub07.u[129*(j-95)+k]=u[j*129+k];}	
	}

	
//	計算ループ	
	for(n=1;n<=nlast;n++){
		sub01.start();
		sub02.start();
		sub03.start();
		sub05.start();
		sub06.start();
		sub07.start();
		sub00.start();
		sub04.start();

		try{
			sub00.join();
			sub01.join();
			sub02.join();
			sub03.join();
			sub04.join();
			sub05.join();
			sub06.join();
			sub07.join();
		}catch(Exception e){}

		for(k=2;k<=64;k++){sub00.result[33*129+k]=sub01.result[(33-31)*129+k];sub02.result[(64-63)*129+k]=sub01.result[(64-31)*129+k];
				   sub01.result[(32-31)*129+k]=sub00.result[32*129+k];sub02.result[(97-63)*129+k]=sub03.result[(97-95)*129+k];
	 			   sub01.result[(65-31)*129+k]=sub02.result[(65-63)*129+k];sub03.result[(96-95)*129+k]=sub02.result[(96-63)*129+k];}
		for(j=2;j<=32;j++){sub00.result[j*129+65]=sub04.result[j*129+65];sub04.result[j*129+64]=sub00.result[j*129+64];}
		for(j=33;j<=64;j++){tmpj=j-31;sub01.result[tmpj*129+65]=sub05.result[tmpj*129+65];sub05.result[tmpj*129+64]=sub01.result[tmpj*129+64];}
		for(j=65;j<=96;j++){tmpj=j-63;sub02.result[tmpj*129+65]=sub06.result[tmpj*129+65];sub06.result[tmpj*129+64]=sub02.result[tmpj*129+64];}
		for(j=97;j<=128;j++){tmpj=j-65;sub03.result[tmpj*129+65]=sub07.result[tmpj*129+65];sub07.result[tmpj*129+65]=sub03.result[tmpj*129+65];}
		for(k=65;k<=128;k++){sub04.result[33*129+k]=sub05.result[(33-31)*129+k];sub05.result[(32-31)*129+k]=sub04.result[32*129+k];
				     sub05.result[(65-31)*129+k]=sub06.result[(65-63)*129+k];sub07.result[(96-95)*129+k]=sub06.result[(96-63)*129+k];
				     sub06.result[(64-63)*129+k]=sub05.result[(64-31)*129+k];sub06.result[(97-63)*129+k]=sub07.result[(97-95)*129+k];}
	}

	for(k=2;k<=64;k++){
		for(j=2;j<=32;j++)  {u[j*129+k]=sub00.result[j*129+k];}
		for(j=33;j<=64;j++) {tmpj=j-31;u[j*129+k]=sub01.result[tmpj*129+k];}
		for(j=65;j<=96;j++) {tmpj=j-63;u[j*129+k]=sub02.result[tmpj*129+k];}
		for(j=97;j<=128;j++){tmpj=j-95;u[j*129+k]=sub03.result[tmpj*129+k];}
	}		
	for(k=65;k<=128;k++){
		for(j=2;j<=32;j++)  {u[j*129+k]=sub04.result[j*129+k];}
		for(j=33;j<=64;j++) {tmpj=j-31;u[j*129+k]=sub05.result[tmpj*129+k];}
		for(j=65;j<=96;j++) {tmpj=j-63;u[j*129+k]=sub06.result[tmpj*129+k];}
		for(j=97;j<=128;j++){tmpj=j-95;u[j*129+k]=sub07.result[tmpj*129+k];}				
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
		return u[10*129+10];	
	}
		//return u[10*21+10];
}
