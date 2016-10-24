import net.njlab.sample.annotation.*;
//分割数16

public class c1{
	private static final float[] u = new float[16900];
	//private static final float[] uu= new float[16900];
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
	static final sub16 sub16    = new sub16(); //1-6,1-6
	static final sub17 sub17    = new sub17(); //5-11,1-6
	static final sub18 sub18    = new sub18(); //10-16,1-6
	static final sub19 sub19    = new sub19(); //15-21,1-6
	static final sub20 sub20    = new sub20(); //1-6,5-11
	static final sub21 sub21    = new sub21(); //5-11,5-11
	static final sub22 sub22    = new sub22(); //10-16,5-11
	static final sub23 sub23    = new sub23(); //15-21,5-11
	static final sub24 sub24    = new sub24(); //1-6,10-16
	static final sub25 sub25    = new sub25(); //5-11,10-16
	static final sub26 sub26    = new sub26(); //10-16,10-16
	static final sub27 sub27    = new sub27(); //15-21,10-16
	static final sub28 sub28    = new sub28(); //1-6,15-21
	static final sub29 sub29    = new sub29(); //5-11,15-21
	static final sub30 sub30    = new sub30(); //10-16,15-21
	static final sub31 sub31    = new sub31(); //15-21,15-21

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		int tmpj;
		//float dx,dy;
		mx=129;
		my=129;
		//dx = 0.05f;
		//dy = 0.05f;
		nlast=400;
		
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

	for(k=1;k<=33;k++)
	{
		for(j=1;  j<=17; j++){           sub00.u[j*129+k]=u[j*129+k];}
		for(j=16 ;j<=33; j++){tmpj=j-15 ;sub01.u[tmpj*129+k]=u[j*129+k];}
		for(j=32 ;j<=49; j++){tmpj=j-31 ;sub02.u[tmpj*129+k]=u[j*129+k];}
		for(j=48 ;j<=65; j++){tmpj=j-47 ;sub03.u[tmpj*129+k]=u[j*129+k];}
		for(j=64 ;j<=81; j++){tmpj=j-63 ;sub04.u[tmpj*129+k]=u[j*129+k];}
		for(j=80 ;j<=97; j++){tmpj=j-79 ;sub05.u[tmpj*129+k]=u[j*129+k];}
		for(j=96 ;j<=113;j++){tmpj=j-95 ;sub06.u[tmpj*129+k]=u[j*129+k];}
		for(j=112;j<=129;j++){tmpj=j-111;sub07.u[tmpj*129+k]=u[j*129+k];}
	}


	for(k=32;k<=65;k++)
	{
		for(j=1;  j<=17; j++){           sub08.u[j*129+k]=u[j*129+k];}
		for(j=16 ;j<=33; j++){tmpj=j-15 ;sub09.u[tmpj*129+k]=u[j*129+k];}
		for(j=32 ;j<=49; j++){tmpj=j-31 ;sub10.u[tmpj*129+k]=u[j*129+k];}
		for(j=48 ;j<=65; j++){tmpj=j-47 ;sub11.u[tmpj*129+k]=u[j*129+k];}
		for(j=64 ;j<=81; j++){tmpj=j-63 ;sub12.u[tmpj*129+k]=u[j*129+k];}
		for(j=80 ;j<=97; j++){tmpj=j-79 ;sub13.u[tmpj*129+k]=u[j*129+k];}
		for(j=96 ;j<=113;j++){tmpj=j-95 ;sub14.u[tmpj*129+k]=u[j*129+k];}
		for(j=112;j<=129;j++){tmpj=j-111;sub15.u[tmpj*129+k]=u[j*129+k];}
	}
	for(k=64;k<=97;k++)
	{
		for(j=1;  j<=17; j++){           sub16.u[j*129+k]=u[j*129+k];}
		for(j=16 ;j<=33; j++){tmpj=j-15 ;sub17.u[tmpj*129+k]=u[j*129+k];}
		for(j=32 ;j<=49; j++){tmpj=j-31 ;sub18.u[tmpj*129+k]=u[j*129+k];}
		for(j=48 ;j<=65; j++){tmpj=j-47 ;sub19.u[tmpj*129+k]=u[j*129+k];}
		for(j=64 ;j<=81; j++){tmpj=j-63 ;sub20.u[tmpj*129+k]=u[j*129+k];}
		for(j=80 ;j<=97; j++){tmpj=j-79 ;sub21.u[tmpj*129+k]=u[j*129+k];}
		for(j=96 ;j<=113;j++){tmpj=j-95 ;sub22.u[tmpj*129+k]=u[j*129+k];}
		for(j=112;j<=129;j++){tmpj=j-111;sub23.u[tmpj*129+k]=u[j*129+k];}
	}
	for(k=96;k<=129;k++)
	{
		for(j=1;  j<=17; j++){           sub24.u[j*129+k]=u[j*129+k];}
		for(j=16 ;j<=33; j++){tmpj=j-15 ;sub25.u[tmpj*129+k]=u[j*129+k];}
		for(j=32 ;j<=49; j++){tmpj=j-31 ;sub26.u[tmpj*129+k]=u[j*129+k];}
		for(j=48 ;j<=65; j++){tmpj=j-47 ;sub27.u[tmpj*129+k]=u[j*129+k];}
		for(j=64 ;j<=81; j++){tmpj=j-63 ;sub28.u[tmpj*129+k]=u[j*129+k];}
		for(j=80 ;j<=97; j++){tmpj=j-79 ;sub29.u[tmpj*129+k]=u[j*129+k];}
		for(j=96 ;j<=113;j++){tmpj=j-95 ;sub30.u[tmpj*129+k]=u[j*129+k];}
		for(j=112;j<=129;j++){tmpj=j-111;sub31.u[tmpj*129+k]=u[j*129+k];}
	}

	
//	計算ループ	
	for(n=1;n<=nlast;n++){
		sub00.start();
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

	//ここまでやった
	for(k=2;k<=32;k++){
		sub00.result[17*129+k]=sub01.result[(33-31)*129+k];
		sub01.result[(16-31)*129+k]=sub00.result[32*129+k];
		sub01.result[(33-31)*129+k]=sub02.result[(65-63)*129+k];
		sub02.result[(32-63)*129+k]=sub01.result[(64-31)*129+k];
		sub02.result[(49-63)*129+k]=sub03.result[(97-95)*129+k];
		sub03.result[(48-95)*129+k]=sub02.result[(96-63)*129+k];i	
		sub00.result[(65-)*129+k]=sub01.result[(33-31)*129+k];
		sub01.result[(32-31)*129+k]=sub00.result[32*129+k];
		sub01.result[(65-31)*129+k]=sub02.result[(65-63)*129+k];
		sub02.result[(64-63)*129+k]=sub01.result[(64-31)*129+k];
		sub02.result[(97-63)*129+k]=sub03.result[(97-95)*129+k];
		sub03.result[(96-95)*129+k]=sub02.result[(96-63)*129+k];	

	}
	for(k=33;k<=64;k++){
		sub04.result[33*129+k]=sub05.result[(33-31)*129+k];
		sub05.result[(32-31)*129+k]=sub04.result[32*129+k];
		sub05.result[(65-31)*129+k]=sub06.result[(65-63)*129+k];
		sub06.result[(64-63)*129+k]=sub05.result[(64-31)*129+k];
		sub06.result[(97-63)*129+k]=sub07.result[(97-95)*129+k];
		sub07.result[(96-95)*129+k]=sub06.result[(96-63)*129+k];	
	}
	for(k=65;k<=96;k++){
		sub08.result[33*129+k]=sub09.result[(33-31)*129+k];
		sub09.result[(32-31)*129+k]=sub08.result[32*129+k];
		sub09.result[(65-31)*129+k]=sub10.result[(65-63)*129+k];
		sub10.result[(64-63)*129+k]=sub09.result[(64-31)*129+k];
		sub10.result[(97-63)*129+k]=sub11.result[(97-95)*129+k];
		sub11.result[(96-95)*129+k]=sub10.result[(96-63)*129+k];	
	}
	for(k=97;k<=128;k++){
		sub12.result[33*129+k]=sub13.result[(33-31)*129+k];
		sub13.result[(32-31)*129+k]=sub12.result[32*129+k];
		sub13.result[(65-31)*129+k]=sub14.result[(65-63)*129+k];
		sub14.result[(64-63)*129+k]=sub13.result[(64-31)*129+k];
		sub14.result[(97-63)*129+k]=sub15.result[(97-95)*129+k];
		sub15.result[(96-95)*129+k]=sub14.result[(96-93)*129+k];	
	}

	for(j=2;j<=32;j++){
		sub00.result[j*129+33]=sub04.result[j*129+33];
		sub04.result[j*129+32]=sub00.result[j*129+32];
		sub04.result[j*129+65]=sub08.result[j*129+65];
		sub08.result[j*129+64]=sub04.result[j*129+64];
		sub08.result[j*129+97]=sub12.result[j*129+97];
		sub12.result[j*129+96]=sub08.result[j*129+96];	
	}
	for(j=33;j<=64;j++){
		tmpj=j-31;
		sub01.result[tmpj*129+33]=sub05.result[tmpj*129+33];
		sub05.result[tmpj*129+32]=sub01.result[tmpj*129+32];
		sub05.result[tmpj*129+65]=sub09.result[tmpj*129+65];
		sub09.result[tmpj*129+64]=sub05.result[tmpj*129+64];
		sub09.result[tmpj*129+97]=sub13.result[tmpj*129+97];
		sub13.result[tmpj*129+96]=sub09.result[tmpj*129+96];	
	}
	for(j=65;j<=96;j++){
		tmpj=j-63;
		sub02.result[tmpj*129+33]=sub06.result[tmpj*129+33];
		sub06.result[tmpj*129+32]=sub02.result[tmpj*129+32];
		sub06.result[tmpj*129+65]=sub10.result[tmpj*129+65];
		sub10.result[tmpj*129+64]=sub06.result[tmpj*129+64];
		sub10.result[tmpj*129+97]=sub14.result[tmpj*129+97];
		sub14.result[tmpj*129+96]=sub10.result[tmpj*129+96];	
	}
	for(j=97;j<=128;j++){
		tmpj=j-95;
		sub03.result[tmpj*129+33]=sub07.result[tmpj*129+33];
		sub07.result[tmpj*129+32]=sub03.result[tmpj*129+32];
		sub07.result[tmpj*129+65]=sub11.result[tmpj*129+65];
		sub11.result[tmpj*129+64]=sub07.result[tmpj*129+64];
		sub11.result[tmpj*129+97]=sub15.result[tmpj*129+97];
		sub15.result[tmpj*129+96]=sub11.result[tmpj*129+96];	
	}


}

	for(k=2;k<=32;k++){
		for(j=2; j<=32; j++){u[j*129+k]=sub00.result[j*129+k];}
		for(j=33;j<=64; j++){tmpj=j-31;u[j*129+k]=sub01.result[j*129+k];}
		for(j=65;j<=96; j++){tmpj=j-63;u[j*129+k]=sub02.result[j*129+k];}
		for(j=97;j<=128;j++){tmpj=j-95;u[j*129+k]=sub03.result[j*129+k];}
	}
	for(k=33;k<=64;k++){
		for(j=2; j<=32; j++){u[j*129+k]=sub04.result[j*129+k];}
		for(j=33;j<=64; j++){tmpj=j-31;u[j*129+k]=sub05.result[j*129+k];}
		for(j=65;j<=96; j++){tmpj=j-63;u[j*129+k]=sub06.result[j*129+k];}
		for(j=97;j<=128;j++){tmpj=j-95;u[j*129+k]=sub07.result[j*129+k];}
	}
	for(k=65;k<=96;k++){
		for(j=2; j<=32; j++){u[j*129+k]=sub08.result[j*129+k];}
		for(j=33;j<=64; j++){tmpj=j-31;u[j*129+k]=sub09.result[j*129+k];}
		for(j=65;j<=96; j++){tmpj=j-63;u[j*129+k]=sub10.result[j*129+k];}
		for(j=97;j<=128;j++){tmpj=j-95;u[j*129+k]=sub11.result[j*129+k];}
	}
	for(k=97;k<=128;k++){
		for(j=2; j<=32; j++){u[j*129+k]=sub12.result[j*129+k];}
		for(j=33;j<=64; j++){tmpj=j-31;u[j*129+k]=sub13.result[j*129+k];}
		for(j=65;j<=96; j++){tmpj=j-63;u[j*129+k]=sub14.result[j*129+k];}
		for(j=97;j<=128;j++){tmpj=j-95;u[j*129+k]=sub15.result[j*129+k];}
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

