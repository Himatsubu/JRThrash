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
	static final sub16 sub16 = new sub16(); //1-6,1-6
	static final sub17 sub17 = new sub17(); //5-11,1-6
	static final sub18 sub18 = new sub18(); //10-16,1-6
	static final sub19 sub19 = new sub19(); //15-21,1-6
	static final sub20 sub20 = new sub20(); //1-6,5-11
	static final sub21 sub21 = new sub21(); //5-11,5-11
	static final sub22 sub22 = new sub22(); //10-16,5-11
	static final sub23 sub23 = new sub23(); //15-21,5-11
	static final sub24 sub24 = new sub24(); //1-6,10-16
	static final sub25 sub25 = new sub25(); //5-11,10-16
	static final sub26 sub26 = new sub26(); //10-16,10-16
	static final sub27 sub27 = new sub27(); //15-21,10-16
	static final sub28 sub28 = new sub28(); //1-6,15-21
	static final sub29 sub29 = new sub29(); //5-11,15-21
	static final sub30 sub30 = new sub30(); //10-16,15-21
	static final sub31 sub31 = new sub31(); //15-21,15-21


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

		for (k = 1; k <= 129; k++){
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
			for(j=1;j<=17;j++){
				sub00.U[j*129+k]=U[j*129+k];
				sub00.T[j*129+k]=T[j*129+k];
			}
			for(j=16;j<=33;j++){
				sub01.U[j*129+k]=U[j*129+k];
				sub01.T[j*129+k]=T[j*129+k];
			}
			for(j=32;j<=49;j++){
				sub02.U[j*129+k]=U[j*129+k];
				sub02.T[j*129+k]=T[j*129+k];
			}
			for(j=48;j<=65;j++){
				sub03.U[j*129+k]=U[j*129+k];
				sub03.T[j*129+k]=T[j*129+k];
			}
			for(j=64;j<=81;j++){
				sub04.U[j*129+k]=U[j*129+k];
				sub04.T[j*129+k]=T[j*129+k];
			}
			for(j=80;j<=97;j++){
				sub05.U[j*129+k]=U[j*129+k];
				sub05.T[j*129+k]=T[j*129+k];
			}
			for(j=96;j<=113;j++){
				sub06.U[j*129+k]=U[j*129+k];
				sub06.T[j*129+k]=T[j*129+k];
			}
			for(j=112;j<=129;j++){
				sub07.U[j*129+k]=U[j*129+k];
				sub07.T[j*129+k]=T[j*129+k];
			}
		}
		for(k=1;k<=33;k++){
			for(j=1;j<=17;j++){
				sub08.U[j*129+k]=U[j*129+k];
				sub08.T[j*129+k]=T[j*129+k];
			}
			for(j=16;j<=33;j++){
				sub09.U[j*129+k]=U[j*129+k];
				sub09.T[j*129+k]=T[j*129+k];
			}
			for(j=32;j<=49;j++){
				sub10.U[j*129+k]=U[j*129+k];
				sub10.T[j*129+k]=T[j*129+k];
			}
			for(j=48;j<=65;j++){
				sub11.U[j*129+k]=U[j*129+k];
				sub11.T[j*129+k]=T[j*129+k];
			}
			for(j=64;j<=81;j++){
				sub12.U[j*129+k]=U[j*129+k];
				sub12.T[j*129+k]=T[j*129+k];
			}
			for(j=80;j<=97;j++){
				sub13.U[j*129+k]=U[j*129+k];
				sub13.T[j*129+k]=T[j*129+k];
			}
			for(j=96;j<=113;j++){
				sub14.U[j*129+k]=U[j*129+k];
				sub14.T[j*129+k]=T[j*129+k];
			}
			for(j=112;j<=129;j++){
				sub15.U[j*129+k]=U[j*129+k];
				sub15.T[j*129+k]=T[j*129+k];
			}
		}
	for(k=1;k<=33;k++){
			for(j=1;j<=17;j++){
				sub16.U[j*129+k]=U[j*129+k];
				sub16.T[j*129+k]=T[j*129+k];
			}
			for(j=16;j<=33;j++){
				sub17.U[j*129+k]=U[j*129+k];
				sub17.T[j*129+k]=T[j*129+k];
			}
			for(j=32;j<=49;j++){
				sub18.U[j*129+k]=U[j*129+k];
				sub18.T[j*129+k]=T[j*129+k];
			}
			for(j=48;j<=65;j++){
				sub19.U[j*129+k]=U[j*129+k];
				sub19.T[j*129+k]=T[j*129+k];
			}
			for(j=64;j<=81;j++){
				sub20.U[j*129+k]=U[j*129+k];
				sub20.T[j*129+k]=T[j*129+k];
			}
			for(j=80;j<=97;j++){
				sub21.U[j*129+k]=U[j*129+k];
				sub21.T[j*129+k]=T[j*129+k];
			}
			for(j=96;j<=113;j++){
				sub22.U[j*129+k]=U[j*129+k];
				sub22.T[j*129+k]=T[j*129+k];
			}
			for(j=112;j<=129;j++){
				sub23.U[j*129+k]=U[j*129+k];
				sub23.T[j*129+k]=T[j*129+k];
			}
		}
	for(k=1;k<=33;k++){
			for(j=1;j<=17;j++){
				sub24.U[j*129+k]=U[j*129+k];
				sub24.T[j*129+k]=T[j*129+k];
			}
			for(j=16;j<=33;j++){
				sub25.U[j*129+k]=U[j*129+k];
				sub25.T[j*129+k]=T[j*129+k];
			}
			for(j=32;j<=49;j++){
				sub26.U[j*129+k]=U[j*129+k];
				sub26.T[j*129+k]=T[j*129+k];
			}
			for(j=48;j<=65;j++){
				sub27.U[j*129+k]=U[j*129+k];
				sub27.T[j*129+k]=T[j*129+k];
			}
			for(j=64;j<=81;j++){
				sub28.U[j*129+k]=U[j*129+k];
				sub28.T[j*129+k]=T[j*129+k];
			}
			for(j=80;j<=97;j++){
				sub29.U[j*129+k]=U[j*129+k];
				sub29.T[j*129+k]=T[j*129+k];
			}
			for(j=96;j<=113;j++){
				sub30.U[j*129+k]=U[j*129+k];
				sub30.T[j*129+k]=T[j*129+k];
			}
			for(j=112;j<=129;j++){
				sub31.U[j*129+k]=U[j*129+k];
				sub31.T[j*129+k]=T[j*129+k];
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
		sub09.start();
		sub10.start();
		sub11.start();
		sub12.start();
		sub13.start();
		sub14.start();
		sub15.start();
		sub16.start();
		sub17.start();
		sub18.start();
		sub19.start();
		sub20.start();
		sub21.start();
		sub22.start();
		sub23.start();
		sub24.start();
		sub25.start();
		sub26.start();
		sub27.start();
		sub28.start();
		sub29.start();
		sub30.start();
		sub31.start();
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
			sub16.join();
			sub17.join();
			sub18.join();
			sub19.join();
			sub20.join();
			sub21.join();
			sub22.join();
			sub23.join();
			sub24.join();
			sub25.join();
			sub26.join();
			sub27.join();
			sub28.join();
			sub29.join();
			sub30.join();
			sub31.join();

		}catch(Exception e){}

	
		for(k=2;k<=32;k++){
			sub00.result[17*129+k]=sub01.result[(17-15)*129+k];
			sub01.result[(16-15)*129+k]=sub00.result[16*129+k];
			sub01.result[(33-15)*129+k]=sub02.result[(33-31)*129+k];
			sub02.result[(32-31)*129+k]=sub01.result[(32-15)*129+k];
			sub02.result[(49-31)*129+k]=sub03.result[(49-47)*129+k];
			sub03.result[(48-47)*129+k]=sub02.result[(48-31)*129+k];	
			sub03.result[(65-47)*129+k]=sub04.result[(65-63)*129+k];
			sub04.result[(64-63)*129+k]=sub03.result[(64-47)*129+k];
			sub04.result[(81-63)*129+k]=sub05.result[(81-79)*129+k];
			sub05.result[(80-79)*129+k]=sub04.result[(80-63)*129+k];
			sub05.result[(97-79)*129+k]=sub06.result[(97-95)*129+k];
			sub06.result[(96-95)*129+k]=sub05.result[(96-79)*129+k];	
			sub06.result[(113-95)*129+k]=sub07.result[(113-111)*129+k];
			sub07.result[(112-111)*129+k]=sub06.result[(112-95)*129+k];
		}
		for(k=32;k<=65;k++){
			sub08.result[17*129+k]=sub09.result[(17-15)*129+k];
			sub09.result[(16-15)*129+k]=sub08.result[16*129+k];
			sub09.result[(33-15)*129+k]=sub10.result[(33-31)*129+k];
			sub10.result[(32-31)*129+k]=sub09.result[(32-15)*129+k];
			sub10.result[(49-31)*129+k]=sub11.result[(49-47)*129+k];
			sub11.result[(48-47)*129+k]=sub10.result[(48-31)*129+k];	
			sub11.result[(65-47)*129+k]=sub12.result[(65-63)*129+k];
			sub12.result[(64-63)*129+k]=sub11.result[(64-47)*129+k];
			sub12.result[(81-63)*129+k]=sub13.result[(81-79)*129+k];
			sub13.result[(80-79)*129+k]=sub12.result[(80-63)*129+k];
			sub13.result[(97-79)*129+k]=sub14.result[(97-95)*129+k];
			sub14.result[(96-95)*129+k]=sub13.result[(96-79)*129+k];	
			sub14.result[(113-95)*129+k]=sub15.result[(113-111)*129+k];
			sub15.result[(112-111)*129+k]=sub14.result[(112-95)*129+k];
		}
		for(k=64;k<=97;k++){
			sub16.result[17*129+k]=sub17.result[(17-15)*129+k];
			sub17.result[(16-15)*129+k]=sub16.result[16*129+k];
			sub17.result[(33-15)*129+k]=sub19.result[(33-31)*129+k];
			sub18.result[(32-31)*129+k]=sub17.result[(32-15)*129+k];
			sub18.result[(49-31)*129+k]=sub19.result[(49-47)*129+k];
			sub19.result[(48-47)*129+k]=sub18.result[(48-31)*129+k];	
			sub19.result[(65-47)*129+k]=sub20.result[(65-63)*129+k];
			sub20.result[(64-63)*129+k]=sub19.result[(64-47)*129+k];
			sub20.result[(81-63)*129+k]=sub21.result[(81-79)*129+k];
			sub21.result[(80-79)*129+k]=sub20.result[(80-63)*129+k];
			sub21.result[(97-79)*129+k]=sub22.result[(97-95)*129+k];
			sub22.result[(96-95)*129+k]=sub21.result[(96-79)*129+k];	
			sub22.result[(113-95)*129+k]=sub23.result[(113-111)*129+k];
			sub23.result[(112-111)*129+k]=sub22.result[(112-95)*129+k];
		}
		for(k=96;k<=129;k++){
			sub24.result[17*129+k]=sub25.result[(17-15)*129+k];
			sub25.result[(16-15)*129+k]=sub24.result[16*129+k];
			sub25.result[(33-15)*129+k]=sub26.result[(33-31)*129+k];
			sub26.result[(32-31)*129+k]=sub25.result[(32-15)*129+k];
			sub26.result[(49-31)*129+k]=sub27.result[(49-47)*129+k];
			sub27.result[(48-47)*129+k]=sub26.result[(48-31)*129+k];	
			sub27.result[(65-47)*129+k]=sub28.result[(65-63)*129+k];
			sub28.result[(64-63)*129+k]=sub27.result[(64-47)*129+k];
			sub28.result[(81-63)*129+k]=sub29.result[(81-79)*129+k];
			sub29.result[(80-79)*129+k]=sub28.result[(80-63)*129+k];
			sub29.result[(97-79)*129+k]=sub30.result[(97-95)*129+k];
			sub30.result[(96-95)*129+k]=sub29.result[(96-79)*129+k];	
			sub30.result[(113-95)*129+k]=sub31.result[(113-111)*129+k];
			sub31.result[(112-111)*129+k]=sub30.result[(112-95)*129+k];
		}

		for(j=1;j<=17;j++){
			sub00.result[j*129+33]=sub08.result[j*129+33];
			sub08.result[j*129+32]=sub00.result[j*129+32];
			sub08.result[j*129+65]=sub16.result[j*129+65];
			sub16.result[j*129+64]=sub08.result[j*129+64];
			sub16.result[j*129+97]=sub24.result[j*129+97];
			sub24.result[j*129+96]=sub16.result[j*129+96];	
		}
		for(j=16;j<=33;j++){
			sub01.result[j*129+33]=sub09.result[j*129+33];
			sub09.result[j*129+32]=sub01.result[j*129+32];
			sub09.result[j*129+65]=sub17.result[j*129+65];
			sub17.result[j*129+64]=sub09.result[j*129+64];
			sub17.result[j*129+97]=sub25.result[j*129+97];
			sub25.result[j*129+96]=sub17.result[j*129+96];	
		}
		for(j=32;j<=49;j++){
			sub02.result[j*129+33]=sub10.result[j*129+33];
			sub10.result[j*129+32]=sub02.result[j*129+32];
			sub10.result[j*129+65]=sub18.result[j*129+65];
			sub18.result[j*129+64]=sub10.result[j*129+64];
			sub18.result[j*129+97]=sub26.result[j*129+97];
			sub26.result[j*129+96]=sub18.result[j*129+96];	
		}
		for(j=48;j<=65;j++){
			sub03.result[j*129+33]=sub11.result[j*129+33];
			sub11.result[j*129+32]=sub03.result[j*129+32];
			sub11.result[j*129+65]=sub19.result[j*129+65];
			sub19.result[j*129+64]=sub11.result[j*129+64];
			sub19.result[j*129+97]=sub27.result[j*129+97];
			sub27.result[j*129+96]=sub19.result[j*129+96];	
		}
		for(j=64;j<=81;j++){
			sub04.result[j*129+33]=sub12.result[j*129+33];
			sub12.result[j*129+32]=sub04.result[j*129+32];
			sub12.result[j*129+65]=sub20.result[j*129+65];
			sub20.result[j*129+64]=sub12.result[j*129+64];
			sub20.result[j*129+97]=sub28.result[j*129+97];
			sub28.result[j*129+96]=sub20.result[j*129+96];	
		}
		for(j=80;j<=97;j++){
			sub05.result[j*129+33]=sub13.result[j*129+33];
			sub13.result[j*129+32]=sub05.result[j*129+32];
			sub13.result[j*129+65]=sub21.result[j*129+65];
			sub21.result[j*129+64]=sub13.result[j*129+64];
			sub21.result[j*129+97]=sub29.result[j*129+97];
			sub29.result[j*129+96]=sub21.result[j*129+96];	
		}
		for(j=96;j<=113;j++){
			sub06.result[j*129+33]=sub14.result[j*129+33];
			sub14.result[j*129+32]=sub06.result[j*129+32];
			sub14.result[j*129+65]=sub22.result[j*129+65];
			sub22.result[j*129+64]=sub14.result[j*129+64];
			sub22.result[j*129+97]=sub30.result[j*129+97];
			sub30.result[j*129+96]=sub22.result[j*129+96];	
		}
		for(j=112;j<=129;j++){
			sub07.result[j*129+33]=sub15.result[j*129+33];
			sub15.result[j*129+32]=sub07.result[j*129+32];
			sub15.result[j*129+65]=sub23.result[j*129+65];
			sub23.result[j*129+64]=sub15.result[j*129+64];
			sub23.result[j*129+97]=sub31.result[j*129+97];
			sub31.result[j*129+96]=sub16.result[j*129+96];	
		}


		}


		
	for(k=2;k<=32;k++){
		for(j=2; j<=16;  j++){		 T[j*129+k]=sub00.result[j*129+k];}
		for(j=17;j<=32;  j++){tmpj=j-15; T[j*129+k]=sub01.result[j*129+k];}
		for(j=33;j<=48;  j++){tmpj=j-31; T[j*129+k]=sub02.result[j*129+k];}
		for(j=49;j<=64;  j++){tmpj=j-47; T[j*129+k]=sub03.result[j*129+k];}
		for(j=65;j<=80;  j++){tmpj=j-63; T[j*129+k]=sub04.result[j*129+k];}
		for(j=81;j<=96;  j++){tmpj=j-79; T[j*129+k]=sub05.result[j*129+k];}
		for(j=97;j<=112; j++){tmpj=j-95; T[j*129+k]=sub06.result[j*129+k];}
		for(j=113;j<=128;j++){tmpj=j-111;T[j*129+k]=sub07.result[j*129+k];}

	}

	for(k=33;k<=64;k++){
		for(j=2; j<=16;  j++){		 T[j*129+k]=sub08.result[j*129+k];}
		for(j=17;j<=32;  j++){tmpj=j-15; T[j*129+k]=sub09.result[j*129+k];}
		for(j=33;j<=48;  j++){tmpj=j-31; T[j*129+k]=sub10.result[j*129+k];}
		for(j=49;j<=64;  j++){tmpj=j-47; T[j*129+k]=sub11.result[j*129+k];}
		for(j=65;j<=80;  j++){tmpj=j-63; T[j*129+k]=sub12.result[j*129+k];}
		for(j=81;j<=96;  j++){tmpj=j-79; T[j*129+k]=sub13.result[j*129+k];}
		for(j=97;j<=112; j++){tmpj=j-95; T[j*129+k]=sub14.result[j*129+k];}
		for(j=113;j<=128;j++){tmpj=j-111;T[j*129+k]=sub15.result[j*129+k];}

	}

	for(k=65;k<=96;k++){
		for(j=2; j<=16;  j++){		 T[j*129+k]=sub16.result[j*129+k];}
		for(j=17;j<=32;  j++){tmpj=j-15; T[j*129+k]=sub17.result[j*129+k];}
		for(j=33;j<=48;  j++){tmpj=j-31; T[j*129+k]=sub18.result[j*129+k];}
		for(j=49;j<=64;  j++){tmpj=j-47; T[j*129+k]=sub19.result[j*129+k];}
		for(j=65;j<=80;  j++){tmpj=j-63; T[j*129+k]=sub20.result[j*129+k];}
		for(j=81;j<=96;  j++){tmpj=j-79; T[j*129+k]=sub21.result[j*129+k];}
		for(j=97;j<=112; j++){tmpj=j-95; T[j*129+k]=sub22.result[j*129+k];}
		for(j=113;j<=128;j++){tmpj=j-111;T[j*129+k]=sub23.result[j*129+k];}

	}

	for(k=97;k<=128;k++){
		for(j=2; j<=16;  j++){		 T[j*129+k]=sub24.result[j*129+k];}
		for(j=17;j<=32;  j++){tmpj=j-15; T[j*129+k]=sub25.result[j*129+k];}
		for(j=33;j<=48;  j++){tmpj=j-31; T[j*129+k]=sub26.result[j*129+k];}
		for(j=49;j<=64;  j++){tmpj=j-47; T[j*129+k]=sub27.result[j*129+k];}
		for(j=65;j<=80;  j++){tmpj=j-63; T[j*129+k]=sub28.result[j*129+k];}
		for(j=81;j<=96;  j++){tmpj=j-79; T[j*129+k]=sub29.result[j*129+k];}
		for(j=97;j<=112; j++){tmpj=j-95; T[j*129+k]=sub30.result[j*129+k];}
		for(j=113;j<=128;j++){tmpj=j-111;T[j*129+k]=sub31.result[j*129+k];}

	}

		return T[10*129+10];
}
}

