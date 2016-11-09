import net.njlab.sample.annotation.*;

public class P3_2dim{
	private static final float T[] = new float [16900];
	private static final float TT[]= new float [16900];
	private static final float U[] = new float [16900];

	static final sub00 sub00 = new sub00();
	static final sub01 sub01 = new sub01();
	static final sub02 sub02 = new sub02();
	static final sub03 sub03 = new sub03();
	static final sub04 sub04 = new sub04();
	static final sub05 sub05 = new sub05();
	static final sub06 sub06 = new sub06();
	static final sub07 sub07 = new sub07();

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public float run(){
//	public static void main(String[] args){
		int k,j,n,tmpj;
		int mx,my;
		float dt,dx,dy,r1,r2,r3,r4,YY;

		int kx,ky,nlast;

		kx=128;
		ky=128;
		mx=kx+1;
		my=ky+1;
		dt=0.0005f;
		nlast=2;

		dx=4f/(mx-1);
		dy=1f/(my-1);
		r1=0.5f*dt/dx;
		r2=0.5f*dt/dy;
		r3=dt/(dx*dx);
		r4=dt/(dy*dy);
		
		for (k = 1; k <= my; k++){
			for (j = 1; j<= mx; j++){
			YY=dy*(k-1);
			T[j*129+k]=0.0f;
			TT[j*129+k]=0.0f;
			U[j*129+k]=40.0f*YY*(1.0f-YY);
			}
		}

		for (k = 1; k <= my; k++){
			T[1*129+k] = 0.0f;
			T[mx*129+k]= T[(mx-1)*129+k];
		}
		
		for (j = 1; j <= mx; j++){
			T[j*129+1] = 0.0f;
			T[j*129+my]= 0.0f;
		}
		for(j=mx/4;j<=mx/2;j++){
			T[j*129+1]=1.0f;
		}


		for(k=1;k<=65;k++){
			for(j=1;j<=33;j++){
				sub00.U[j*129+k]=U[j*129+k];
				sub00.T[j*129+k]=T[j*129+k];
			}
			for(j=32;j<=65;j++){
				sub01.U[(j-31)*129+k]=U[j*129+k];
				sub01.T[(j-31)*129+k]=T[j*129+k];
			}
			for(j=64;j<=97;j++){
				sub02.U[(j-63)*129+k]=U[j*129+k];
				sub02.T[(j-63)*129+k]=T[j*129+k];
			}
			for(j=96;j<=129;j++){
				sub03.U[(j-95)*129+k]=U[j*129+k];
				sub03.T[(j-95)*129+k]=T[j*129+k];
			}
		}
		for(k=64;k<=129;k++){
			for(j=1;j<=33;j++){
				sub04.U[j*129+k]=U[j*129+k];
				sub04.T[j*129+k]=T[j*129+k];
			}
			for(j=32;j<=65;j++){
				sub05.U[(j-31)*129+k]=U[j*129+k];
				sub05.T[(j-31)*129+k]=T[j*129+k];
			}
			for(j=64;j<=97;j++){
				sub06.U[(j-63)*129+k]=U[j*129+k];
				sub06.T[(j-63)*129+k]=T[j*129+k];
			}
			for(j=96;j<=129;j++){
				sub07.U[(j-95)*129+k]=U[j*129+k];
				sub07.T[(j-95)*129+k]=T[j*129+k];
			}
		}


		for (n = 1; n <= nlast; n++){

			sub00.start();
			sub01.start();
			sub02.start();
			sub03.start();
			sub04.start();
			sub05.start();
			sub06.start();
			sub07.start();
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
			for(j=2;j<=32;j++)  {U[j*129+k]=sub00.result[j*129+k];}
			for(j=33;j<=64;j++) {tmpj=j-31;U[j*129+k]=sub01.result[tmpj*129+k];}
			for(j=65;j<=96;j++) {tmpj=j-63;U[j*129+k]=sub02.result[tmpj*129+k];}
			for(j=97;j<=128;j++){tmpj=j-95;U[j*129+k]=sub03.result[tmpj*129+k];}
		}		
		for(k=65;k<=128;k++){
			for(j=2;j<=32;j++)  {U[j*129+k]=sub04.result[j*129+k];}
			for(j=33;j<=64;j++) {tmpj=j-31;U[j*129+k]=sub05.result[tmpj*129+k];}
			for(j=65;j<=96;j++) {tmpj=j-63;U[j*129+k]=sub06.result[tmpj*129+k];}
			for(j=97;j<=128;j++){tmpj=j-95;U[j*129+k]=sub07.result[tmpj*129+k];}				
		}
		
		return U[10*129+10];
}
}

