//todo 袖領域のやりとりについて修正

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
	static final sub08 sub08 = new sub08();
	static final sub09 sub09 = new sub09();
	static final sub10 sub10 = new sub10();
	static final sub11 sub11 = new sub11();
	static final sub12 sub12 = new sub12();
	static final sub13 sub13 = new sub13();
	static final sub14 sub14 = new sub14();
	static final sub15 sub15 = new sub15();

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public float run(){
//	public static void main(String[] args){
		int k,j,n;
		int mx,my;
		float dt,dx,dy,r1,r2,r3,r4,YY;

		int kx,ky,nlast;
		int tmpj;

		kx=128;
		ky=128;
		mx=kx+1;
		my=ky+1;
		dt=0.0005f;
		nlast=1;

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
		
		for (j = 1; j <= 129; j++){
			T[j*129+1] = 0.0f;
			T[j*129+my]= 0.0f;
		}

		for(j=mx/4;j<=mx/2;j++){
			T[j*129+1]=1.0f;
		}

		for(k=1;k<=33;k++){
			for(j=1;j<=33;j++){
				sub00.U[j*129+k]=U[j*129+k];
				sub00.T[j*129+k]=T[j*129+k];
			}
			for(j=32;j<=65;j++){
				sub01.U[j*129+k]=U[j*129+k];
				sub01.T[j*129+k]=T[j*129+k];
			}
			for(j=64;j<=97;j++){
				sub02.U[j*129+k]=U[j*129+k];
				sub02.T[j*129+k]=T[j*129+k];
			}
			for(j=96;j<=129;j++){
				sub03.U[j*129+k]=U[j*129+k];
				sub03.T[j*129+k]=T[j*129+k];
			}
		}

		for(k=32;k<=65;k++){
			for(j=1;j<=33;j++){
				sub04.U[j*129+k]=U[j*129+k];
				sub04.T[j*129+k]=T[j*129+k];
			}
			for(j=32;j<=65;j++){
				sub05.U[j*129+k]=U[j*129+k];
				sub05.T[j*129+k]=T[j*129+k];
			}
			for(j=64;j<=97;j++){
				sub06.U[j*129+k]=U[j*129+k];
				sub06.T[j*129+k]=T[j*129+k];
			}
			for(j=96;j<=129;j++){
				sub07.U[j*129+k]=U[j*129+k];
				sub07.T[j*129+k]=T[j*129+k];
			}
		}
		for(k=64;k<=97;k++){
			for(j=1;j<=33;j++){
				sub08.U[j*129+k]=U[j*129+k];
				sub08.T[j*129+k]=T[j*129+k];
			}
			for(j=32;j<=65;j++){
				sub09.U[j*129+k]=U[j*129+k];
				sub09.T[j*129+k]=T[j*129+k];
			}
			for(j=64;j<=97;j++){
				sub10.U[j*129+k]=U[j*129+k];
				sub10.T[j*129+k]=T[j*129+k];
			}
			for(j=96;j<=129;j++){
				sub11.U[j*129+k]=U[j*129+k];
				sub11.T[j*129+k]=T[j*129+k];
			}
		}
		for(k=96;k<=129;k++){
			for(j=1;j<=33;j++){
				sub12.U[j*129+k]=U[j*129+k];
				sub12.T[j*129+k]=T[j*129+k];
			}
			for(j=32;j<=65;j++){
				sub13.U[j*129+k]=U[j*129+k];
				sub13.T[j*129+k]=T[j*129+k];
			}

			for(j=64;j<=97;j++){
				sub14.U[j*129+k]=U[j*129+k];
				sub14.T[j*129+k]=T[j*129+k];
			}
			for(j=96;j<=129;j++){
				sub15.U[j*129+k]=U[j*129+k];
				sub15.T[j*129+k]=T[j*129+k];
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

			for(k=2;k<=32;k++){
				sub00.result[33*129+k]=sub01.result[(33-31)*129+k];
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
			for(j=2; j<=32; j++){T[j*129+k]=sub00.result[j*129+k];}
			for(j=33;j<=64; j++){tmpj=j-31;T[j*129+k]=sub01.result[j*129+k];}
			for(j=65;j<=96; j++){tmpj=j-63;T[j*129+k]=sub02.result[j*129+k];}
			for(j=97;j<=128;j++){tmpj=j-95;T[j*129+k]=sub03.result[j*129+k];}
		}
		for(k=33;k<=64;k++){
			for(j=2; j<=32; j++){T[j*129+k]=sub04.result[j*129+k];}
			for(j=33;j<=64; j++){tmpj=j-31;T[j*129+k]=sub05.result[j*129+k];}
			for(j=65;j<=96; j++){tmpj=j-63;T[j*129+k]=sub06.result[j*129+k];}
			for(j=97;j<=128;j++){tmpj=j-95;T[j*129+k]=sub07.result[j*129+k];}
		}
		for(k=65;k<=96;k++){
			for(j=2; j<=32; j++){T[j*129+k]=sub08.result[j*129+k];}
			for(j=33;j<=64; j++){tmpj=j-31;T[j*129+k]=sub09.result[j*129+k];}
			for(j=65;j<=96; j++){tmpj=j-63;T[j*129+k]=sub10.result[j*129+k];}
			for(j=97;j<=128;j++){tmpj=j-95;T[j*129+k]=sub11.result[j*129+k];}
		}
		for(k=97;k<=128;k++){
			for(j=2; j<=32; j++){T[j*129+k]=sub12.result[j*129+k];}
			for(j=33;j<=64; j++){tmpj=j-31;T[j*129+k]=sub13.result[j*129+k];}
			for(j=65;j<=96; j++){tmpj=j-63;T[j*129+k]=sub14.result[j*129+k];}
			for(j=97;j<=128;j++){tmpj=j-95;T[j*129+k]=sub15.result[j*129+k];}
		}

		return T[10*129+10];
}
}

