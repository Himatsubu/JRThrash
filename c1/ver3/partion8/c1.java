import net.njlab.sample.annotation.*;
//分割数16

public class c1{
	private static final float[] u = new float[16900];
	//private static final float[] uu= new float[16900];
	//private static final float[] q = new float[16900];

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
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		float dx,dy,dt,r1,r2;
		mx=129;
		my=129;
		dx = 1f/(mx-1);
		dy = 1f/(mx-1);
		dt = 0.0005f;
		r1=dt/(dx*dx);
		r2=dt/(dy*dy);
		nlast=2;
		
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
	
//	計算ループ	
	for(n=1;n<=nlast;n++){
//	境界条件
		for (j = 1; j <= my; j++)
		{
			u[1*129+j] = 0.5f;
			u[mx*129+j]= 0f;
			u[j*129+1] = 1.f;
			u[j*21+my]= 0f;
		}
/*		
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
*/

for(k=1;k<=65;k++){
	sub00.u[129+k]=u[129+k];
	sub00.u[258+k]=u[258+k];
	sub00.u[387+k]=u[387+k];
	sub00.u[516+k]=u[516+k];
	sub00.u[645+k]=u[645+k];
	sub00.u[774+k]=u[774+k];
	sub00.u[903+k]=u[903+k];
	sub00.u[1032+k]=u[1032+k];
	sub00.u[1161+k]=u[1161+k];
	sub00.u[1290+k]=u[1290+k];
	sub00.u[1419+k]=u[1419+k];
	sub00.u[1548+k]=u[1548+k];
	sub00.u[1677+k]=u[1677+k];
	sub00.u[1806+k]=u[1806+k];
	sub00.u[1935+k]=u[1935+k];
	sub00.u[2064+k]=u[2064+k];
	sub00.u[2193+k]=u[2193+k];
	sub00.u[2322+k]=u[2322+k];
	sub00.u[2451+k]=u[2451+k];
	sub00.u[2580+k]=u[2580+k];
	sub00.u[2709+k]=u[2709+k];
	sub00.u[2838+k]=u[2838+k];
	sub00.u[2967+k]=u[2967+k];
	sub00.u[3096+k]=u[3096+k];
	sub00.u[3225+k]=u[3225+k];
	sub00.u[3354+k]=u[3354+k];
	sub00.u[3483+k]=u[3483+k];
	sub00.u[3612+k]=u[3612+k];
	sub00.u[3741+k]=u[3741+k];
	sub00.u[3870+k]=u[3870+k];
	sub00.u[3999+k]=u[3999+k];
	sub00.u[4128+k]=u[4128+k];
	sub00.u[4257+k]=u[4257+k];
	sub01.u[129+k]=u[4128+k];
	sub01.u[258+k]=u[4257+k];
	sub01.u[387+k]=u[4386+k];
	sub01.u[516+k]=u[4515+k];
	sub01.u[645+k]=u[4644+k];
	sub01.u[774+k]=u[4773+k];
	sub01.u[903+k]=u[4902+k];
	sub01.u[1032+k]=u[5031+k];
	sub01.u[1161+k]=u[5160+k];
	sub01.u[1290+k]=u[5289+k];
	sub01.u[1419+k]=u[5418+k];
	sub01.u[1548+k]=u[5547+k];
	sub01.u[1677+k]=u[5676+k];
	sub01.u[1806+k]=u[5805+k];
	sub01.u[1935+k]=u[5934+k];
	sub01.u[2064+k]=u[6063+k];
	sub01.u[2193+k]=u[6192+k];
	sub01.u[2322+k]=u[6321+k];
	sub01.u[2451+k]=u[6450+k];
	sub01.u[2580+k]=u[6579+k];
	sub01.u[2709+k]=u[6708+k];
	sub01.u[2838+k]=u[6837+k];
	sub01.u[2967+k]=u[6966+k];
	sub01.u[3096+k]=u[7095+k];
	sub01.u[3225+k]=u[7224+k];
	sub01.u[3354+k]=u[7353+k];
	sub01.u[3483+k]=u[7482+k];
	sub01.u[3612+k]=u[7611+k];
	sub01.u[3741+k]=u[7740+k];
	sub01.u[3870+k]=u[7869+k];
	sub01.u[3999+k]=u[7998+k];
	sub01.u[4128+k]=u[8127+k];
	sub01.u[4257+k]=u[8256+k];
	sub01.u[4386+k]=u[8385+k];
	sub02.u[129+k]=u[8256+k];
	sub02.u[258+k]=u[8385+k];
	sub02.u[387+k]=u[8514+k];
	sub02.u[516+k]=u[8643+k];
	sub02.u[645+k]=u[8772+k];
	sub02.u[774+k]=u[8901+k];
	sub02.u[903+k]=u[9030+k];
	sub02.u[1032+k]=u[9159+k];
	sub02.u[1161+k]=u[9288+k];
	sub02.u[1290+k]=u[9417+k];
	sub02.u[1419+k]=u[9546+k];
	sub02.u[1548+k]=u[9675+k];
	sub02.u[1677+k]=u[9804+k];
	sub02.u[1806+k]=u[9933+k];
	sub02.u[1935+k]=u[10062+k];
	sub02.u[2064+k]=u[10191+k];
	sub02.u[2193+k]=u[10320+k];
	sub02.u[2322+k]=u[10449+k];
	sub02.u[2451+k]=u[10578+k];
	sub02.u[2580+k]=u[10707+k];
	sub02.u[2709+k]=u[10836+k];
	sub02.u[2838+k]=u[10965+k];
	sub02.u[2967+k]=u[11094+k];
	sub02.u[3096+k]=u[11223+k];
	sub02.u[3225+k]=u[11352+k];
	sub02.u[3354+k]=u[11481+k];
	sub02.u[3483+k]=u[11610+k];
	sub02.u[3612+k]=u[11739+k];
	sub02.u[3741+k]=u[11868+k];
	sub02.u[3870+k]=u[11997+k];
	sub02.u[3999+k]=u[12126+k];
	sub02.u[4128+k]=u[12255+k];
	sub02.u[4257+k]=u[12384+k];
	sub02.u[4386+k]=u[12513+k];
	sub03.u[129+k]=u[12384+k];
	sub03.u[258+k]=u[12513+k];
	sub03.u[387+k]=u[12642+k];
	sub03.u[516+k]=u[12771+k];
	sub03.u[645+k]=u[12900+k];
	sub03.u[774+k]=u[13029+k];
	sub03.u[903+k]=u[13158+k];
	sub03.u[1032+k]=u[13287+k];
	sub03.u[1161+k]=u[13416+k];
	sub03.u[1290+k]=u[13545+k];
	sub03.u[1419+k]=u[13674+k];
	sub03.u[1548+k]=u[13803+k];
	sub03.u[1677+k]=u[13932+k];
	sub03.u[1806+k]=u[14061+k];
	sub03.u[1935+k]=u[14190+k];
	sub03.u[2064+k]=u[14319+k];
	sub03.u[2193+k]=u[14448+k];
	sub03.u[2322+k]=u[14577+k];
	sub03.u[2451+k]=u[14706+k];
	sub03.u[2580+k]=u[14835+k];
	sub03.u[2709+k]=u[14964+k];
	sub03.u[2838+k]=u[15093+k];
	sub03.u[2967+k]=u[15222+k];
	sub03.u[3096+k]=u[15351+k];
	sub03.u[3225+k]=u[15480+k];
	sub03.u[3354+k]=u[15609+k];
	sub03.u[3483+k]=u[15738+k];
	sub03.u[3612+k]=u[15867+k];
	sub03.u[3741+k]=u[15996+k];
	sub03.u[3870+k]=u[16125+k];
	sub03.u[3999+k]=u[16254+k];
	sub03.u[4128+k]=u[16383+k];
	sub03.u[4257+k]=u[16512+k];
}
for(k=64;k<=129;k++){
	sub04.u[129+k]=u[129+k];
	sub04.u[258+k]=u[258+k];
	sub04.u[387+k]=u[387+k];
	sub04.u[516+k]=u[516+k];
	sub04.u[645+k]=u[645+k];
	sub04.u[774+k]=u[774+k];
	sub04.u[903+k]=u[903+k];
	sub04.u[1032+k]=u[1032+k];
	sub04.u[1161+k]=u[1161+k];
	sub04.u[1290+k]=u[1290+k];
	sub04.u[1419+k]=u[1419+k];
	sub04.u[1548+k]=u[1548+k];
	sub04.u[1677+k]=u[1677+k];
	sub04.u[1806+k]=u[1806+k];
	sub04.u[1935+k]=u[1935+k];
	sub04.u[2064+k]=u[2064+k];
	sub04.u[2193+k]=u[2193+k];
	sub04.u[2322+k]=u[2322+k];
	sub04.u[2451+k]=u[2451+k];
	sub04.u[2580+k]=u[2580+k];
	sub04.u[2709+k]=u[2709+k];
	sub04.u[2838+k]=u[2838+k];
	sub04.u[2967+k]=u[2967+k];
	sub04.u[3096+k]=u[3096+k];
	sub04.u[3225+k]=u[3225+k];
	sub04.u[3354+k]=u[3354+k];
	sub04.u[3483+k]=u[3483+k];
	sub04.u[3612+k]=u[3612+k];
	sub04.u[3741+k]=u[3741+k];
	sub04.u[3870+k]=u[3870+k];
	sub04.u[3999+k]=u[3999+k];
	sub04.u[4128+k]=u[4128+k];
	sub04.u[4257+k]=u[4257+k];
	sub05.u[129+k]=u[4128+k];
	sub05.u[258+k]=u[4257+k];
	sub05.u[387+k]=u[4386+k];
	sub05.u[516+k]=u[4515+k];
	sub05.u[645+k]=u[4644+k];
	sub05.u[774+k]=u[4773+k];
	sub05.u[903+k]=u[4902+k];
	sub05.u[1032+k]=u[5031+k];
	sub05.u[1161+k]=u[5160+k];
	sub05.u[1290+k]=u[5289+k];
	sub05.u[1419+k]=u[5418+k];
	sub05.u[1548+k]=u[5547+k];
	sub05.u[1677+k]=u[5676+k];
	sub05.u[1806+k]=u[5805+k];
	sub05.u[1935+k]=u[5934+k];
	sub05.u[2064+k]=u[6063+k];
	sub05.u[2193+k]=u[6192+k];
	sub05.u[2322+k]=u[6321+k];
	sub05.u[2451+k]=u[6450+k];
	sub05.u[2580+k]=u[6579+k];
	sub05.u[2709+k]=u[6708+k];
	sub05.u[2838+k]=u[6837+k];
	sub05.u[2967+k]=u[6966+k];
	sub05.u[3096+k]=u[7095+k];
	sub05.u[3225+k]=u[7224+k];
	sub05.u[3354+k]=u[7353+k];
	sub05.u[3483+k]=u[7482+k];
	sub05.u[3612+k]=u[7611+k];
	sub05.u[3741+k]=u[7740+k];
	sub05.u[3870+k]=u[7869+k];
	sub05.u[3999+k]=u[7998+k];
	sub05.u[4128+k]=u[8127+k];
	sub05.u[4257+k]=u[8256+k];
	sub05.u[4386+k]=u[8385+k];
	sub06.u[129+k]=u[8256+k];
	sub06.u[258+k]=u[8385+k];
	sub06.u[387+k]=u[8514+k];
	sub06.u[516+k]=u[8643+k];
	sub06.u[645+k]=u[8772+k];
	sub06.u[774+k]=u[8901+k];
	sub06.u[903+k]=u[9030+k];
	sub06.u[1032+k]=u[9159+k];
	sub06.u[1161+k]=u[9288+k];
	sub06.u[1290+k]=u[9417+k];
	sub06.u[1419+k]=u[9546+k];
	sub06.u[1548+k]=u[9675+k];
	sub06.u[1677+k]=u[9804+k];
	sub06.u[1806+k]=u[9933+k];
	sub06.u[1935+k]=u[10062+k];
	sub06.u[2064+k]=u[10191+k];
	sub06.u[2193+k]=u[10320+k];
	sub06.u[2322+k]=u[10449+k];
	sub06.u[2451+k]=u[10578+k];
	sub06.u[2580+k]=u[10707+k];
	sub06.u[2709+k]=u[10836+k];
	sub06.u[2838+k]=u[10965+k];
	sub06.u[2967+k]=u[11094+k];
	sub06.u[3096+k]=u[11223+k];
	sub06.u[3225+k]=u[11352+k];
	sub06.u[3354+k]=u[11481+k];
	sub06.u[3483+k]=u[11610+k];
	sub06.u[3612+k]=u[11739+k];
	sub06.u[3741+k]=u[11868+k];
	sub06.u[3870+k]=u[11997+k];
	sub06.u[3999+k]=u[12126+k];
	sub06.u[4128+k]=u[12255+k];
	sub06.u[4257+k]=u[12384+k];
	sub07.u[129+k]=u[12384+k];
	sub07.u[258+k]=u[12513+k];
	sub07.u[387+k]=u[12642+k];
	sub07.u[516+k]=u[12771+k];
	sub07.u[645+k]=u[12900+k];
	sub07.u[774+k]=u[13029+k];
	sub07.u[903+k]=u[13158+k];
	sub07.u[1032+k]=u[13287+k];
	sub07.u[1161+k]=u[13416+k];
	sub07.u[1290+k]=u[13545+k];
	sub07.u[1419+k]=u[13674+k];
	sub07.u[1548+k]=u[13803+k];
	sub07.u[1677+k]=u[13932+k];
	sub07.u[1806+k]=u[14061+k];
	sub07.u[1935+k]=u[14190+k];
	sub07.u[2064+k]=u[14319+k];
	sub07.u[2193+k]=u[14448+k];
	sub07.u[2322+k]=u[14577+k];
	sub07.u[2451+k]=u[14706+k];
	sub07.u[2580+k]=u[14835+k];
	sub07.u[2709+k]=u[14964+k];
	sub07.u[2838+k]=u[15093+k];
	sub07.u[2967+k]=u[15222+k];
	sub07.u[3096+k]=u[15351+k];
	sub07.u[3225+k]=u[15480+k];
	sub07.u[3354+k]=u[15609+k];
	sub07.u[3483+k]=u[15738+k];
	sub07.u[3612+k]=u[15867+k];
	sub07.u[3741+k]=u[15996+k];
	sub07.u[3870+k]=u[16125+k];
	sub07.u[3999+k]=u[16254+k];
	sub07.u[4128+k]=u[16383+k];
	sub07.u[4257+k]=u[16512+k];
}



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
/*
		for(k=2;k<=64;k++){
			for(j=2;j<=32;j++)  {u[j*129+k]=sub00.result[j*129+k];}
			for(j=33;j<=64;j++) {u[j*129+k]=sub01.result[(j-31)*129+k];}
			for(j=65;j<=96;j++) {u[j*129+k]=sub02.result[(j-63)*129+k];}
			for(j=97;j<=128;j++){u[j*129+k]=sub03.result[(j-95)*129+k];}
		}		
		for(k=65;k<=128;k++){
			for(j=2;j<=32;j++)  {u[j*129+k]=sub04.result[j*129+k];}
			for(j=33;j<=64;j++) {u[j*129+k]=sub05.result[(j-31)*129+k];}
			for(j=65;j<=96;j++) {u[j*129+k]=sub06.result[(j-63)*129+k];}
			for(j=97;j<=128;j++){u[j*129+k]=sub07.result[(j-95)*129+k];}				
		}
*/	

for(k=2;k<=64;k++){
	u[258+k]=sub00.result[258+k];
	u[387+k]=sub00.result[387+k];
	u[516+k]=sub00.result[516+k];
	u[645+k]=sub00.result[645+k];
	u[774+k]=sub00.result[774+k];
	u[903+k]=sub00.result[903+k];
	u[1032+k]=sub00.result[1032+k];
	u[1161+k]=sub00.result[1161+k];
	u[1290+k]=sub00.result[1290+k];
	u[1419+k]=sub00.result[1419+k];
	u[1548+k]=sub00.result[1548+k];
	u[1677+k]=sub00.result[1677+k];
	u[1806+k]=sub00.result[1806+k];
	u[1935+k]=sub00.result[1935+k];
	u[2064+k]=sub00.result[2064+k];
	u[2193+k]=sub00.result[2193+k];
	u[2322+k]=sub00.result[2322+k];
	u[2451+k]=sub00.result[2451+k];
	u[2580+k]=sub00.result[2580+k];
	u[2709+k]=sub00.result[2709+k];
	u[2838+k]=sub00.result[2838+k];
	u[2967+k]=sub00.result[2967+k];
	u[3096+k]=sub00.result[3096+k];
	u[3225+k]=sub00.result[3225+k];
	u[3354+k]=sub00.result[3354+k];
	u[3483+k]=sub00.result[3483+k];
	u[3612+k]=sub00.result[3612+k];
	u[3741+k]=sub00.result[3741+k];
	u[3870+k]=sub00.result[3870+k];
	u[3999+k]=sub00.result[3999+k];
	u[4128+k]=sub00.result[4128+k];
	u[4257+k]=sub01.result[258+k];
	u[4386+k]=sub01.result[387+k];
	u[4515+k]=sub01.result[516+k];
	u[4644+k]=sub01.result[645+k];
	u[4773+k]=sub01.result[774+k];
	u[4902+k]=sub01.result[903+k];
	u[5031+k]=sub01.result[1032+k];
	u[5160+k]=sub01.result[1161+k];
	u[5289+k]=sub01.result[1290+k];
	u[5418+k]=sub01.result[1419+k];
	u[5547+k]=sub01.result[1548+k];
	u[5676+k]=sub01.result[1677+k];
	u[5805+k]=sub01.result[1806+k];
	u[5934+k]=sub01.result[1935+k];
	u[6063+k]=sub01.result[2064+k];
	u[6192+k]=sub01.result[2193+k];
	u[6321+k]=sub01.result[2322+k];
	u[6450+k]=sub01.result[2451+k];
	u[6579+k]=sub01.result[2580+k];
	u[6708+k]=sub01.result[2709+k];
	u[6837+k]=sub01.result[2838+k];
	u[6966+k]=sub01.result[2967+k];
	u[7095+k]=sub01.result[3096+k];
	u[7224+k]=sub01.result[3225+k];
	u[7353+k]=sub01.result[3354+k];
	u[7482+k]=sub01.result[3483+k];
	u[7611+k]=sub01.result[3612+k];
	u[7740+k]=sub01.result[3741+k];
	u[7869+k]=sub01.result[3870+k];
	u[7998+k]=sub01.result[3999+k];
	u[8127+k]=sub01.result[4128+k];
	u[8256+k]=sub01.result[4257+k];
	u[8385+k]=sub02.result[258+k];
	u[8514+k]=sub02.result[387+k];
	u[8643+k]=sub02.result[516+k];
	u[8772+k]=sub02.result[645+k];
	u[8901+k]=sub02.result[774+k];
	u[9030+k]=sub02.result[903+k];
	u[9159+k]=sub02.result[1032+k];
	u[9288+k]=sub02.result[1161+k];
	u[9417+k]=sub02.result[1290+k];
	u[9546+k]=sub02.result[1419+k];
	u[9675+k]=sub02.result[1548+k];
	u[9804+k]=sub02.result[1677+k];
	u[9933+k]=sub02.result[1806+k];
	u[10062+k]=sub02.result[1935+k];
	u[10191+k]=sub02.result[2064+k];
	u[10320+k]=sub02.result[2193+k];
	u[10449+k]=sub02.result[2322+k];
	u[10578+k]=sub02.result[2451+k];
	u[10707+k]=sub02.result[2580+k];
	u[10836+k]=sub02.result[2709+k];
	u[10965+k]=sub02.result[2838+k];
	u[11094+k]=sub02.result[2967+k];
	u[11223+k]=sub02.result[3096+k];
	u[11352+k]=sub02.result[3225+k];
	u[11481+k]=sub02.result[3354+k];
	u[11610+k]=sub02.result[3483+k];
	u[11739+k]=sub02.result[3612+k];
	u[11868+k]=sub02.result[3741+k];
	u[11997+k]=sub02.result[3870+k];
	u[12126+k]=sub02.result[3999+k];
	u[12255+k]=sub02.result[4128+k];
	u[12384+k]=sub02.result[4257+k];
	u[12513+k]=sub03.result[258+k];
	u[12642+k]=sub03.result[387+k];
	u[12771+k]=sub03.result[516+k];
	u[12900+k]=sub03.result[645+k];
	u[13029+k]=sub03.result[774+k];
	u[13158+k]=sub03.result[903+k];
	u[13287+k]=sub03.result[1032+k];
	u[13416+k]=sub03.result[1161+k];
	u[13545+k]=sub03.result[1290+k];
	u[13674+k]=sub03.result[1419+k];
	u[13803+k]=sub03.result[1548+k];
	u[13932+k]=sub03.result[1677+k];
	u[14061+k]=sub03.result[1806+k];
	u[14190+k]=sub03.result[1935+k];
	u[14319+k]=sub03.result[2064+k];
	u[14448+k]=sub03.result[2193+k];
	u[14577+k]=sub03.result[2322+k];
	u[14706+k]=sub03.result[2451+k];
	u[14835+k]=sub03.result[2580+k];
	u[14964+k]=sub03.result[2709+k];
	u[15093+k]=sub03.result[2838+k];
	u[15222+k]=sub03.result[2967+k];
	u[15351+k]=sub03.result[3096+k];
	u[15480+k]=sub03.result[3225+k];
	u[15609+k]=sub03.result[3354+k];
	u[15738+k]=sub03.result[3483+k];
	u[15867+k]=sub03.result[3612+k];
	u[15996+k]=sub03.result[3741+k];
	u[16125+k]=sub03.result[3870+k];
	u[16254+k]=sub03.result[3999+k];
	u[16383+k]=sub03.result[4128+k];
	u[16512+k]=sub03.result[4257+k];
}
for(k=65;k<=128;k++){
	u[258+k]=sub04.result[258+k];
	u[387+k]=sub04.result[387+k];
	u[516+k]=sub04.result[516+k];
	u[645+k]=sub04.result[645+k];
	u[774+k]=sub04.result[774+k];
	u[903+k]=sub04.result[903+k];
	u[1032+k]=sub04.result[1032+k];
	u[1161+k]=sub04.result[1161+k];
	u[1290+k]=sub04.result[1290+k];
	u[1419+k]=sub04.result[1419+k];
	u[1548+k]=sub04.result[1548+k];
	u[1677+k]=sub04.result[1677+k];
	u[1806+k]=sub04.result[1806+k];
	u[1935+k]=sub04.result[1935+k];
	u[2064+k]=sub04.result[2064+k];
	u[2193+k]=sub04.result[2193+k];
	u[2322+k]=sub04.result[2322+k];
	u[2451+k]=sub04.result[2451+k];
	u[2580+k]=sub04.result[2580+k];
	u[2709+k]=sub04.result[2709+k];
	u[2838+k]=sub04.result[2838+k];
	u[2967+k]=sub04.result[2967+k];
	u[3096+k]=sub04.result[3096+k];
	u[3225+k]=sub04.result[3225+k];
	u[3354+k]=sub04.result[3354+k];
	u[3483+k]=sub04.result[3483+k];
	u[3612+k]=sub04.result[3612+k];
	u[3741+k]=sub04.result[3741+k];
	u[3870+k]=sub04.result[3870+k];
	u[3999+k]=sub04.result[3999+k];
	u[4128+k]=sub04.result[4128+k];
	u[4257+k]=sub05.result[258+k];
	u[4386+k]=sub05.result[387+k];
	u[4515+k]=sub05.result[516+k];
	u[4644+k]=sub05.result[645+k];
	u[4773+k]=sub05.result[774+k];
	u[4902+k]=sub05.result[903+k];
	u[5031+k]=sub05.result[1032+k];
	u[5160+k]=sub05.result[1161+k];
	u[5289+k]=sub05.result[1290+k];
	u[5418+k]=sub05.result[1419+k];
	u[5547+k]=sub05.result[1548+k];
	u[5676+k]=sub05.result[1677+k];
	u[5805+k]=sub05.result[1806+k];
	u[5934+k]=sub05.result[1935+k];
	u[6063+k]=sub05.result[2064+k];
	u[6192+k]=sub05.result[2193+k];
	u[6321+k]=sub05.result[2322+k];
	u[6450+k]=sub05.result[2451+k];
	u[6579+k]=sub05.result[2580+k];
	u[6708+k]=sub05.result[2709+k];
	u[6837+k]=sub05.result[2838+k];
	u[6966+k]=sub05.result[2967+k];
	u[7095+k]=sub05.result[3096+k];
	u[7224+k]=sub05.result[3225+k];
	u[7353+k]=sub05.result[3354+k];
	u[7482+k]=sub05.result[3483+k];
	u[7611+k]=sub05.result[3612+k];
	u[7740+k]=sub05.result[3741+k];
	u[7869+k]=sub05.result[3870+k];
	u[7998+k]=sub05.result[3999+k];
	u[8127+k]=sub05.result[4128+k];
	u[8256+k]=sub05.result[4257+k];
	u[8385+k]=sub06.result[258+k];
	u[8514+k]=sub06.result[387+k];
	u[8643+k]=sub06.result[516+k];
	u[8772+k]=sub06.result[645+k];
	u[8901+k]=sub06.result[774+k];
	u[9030+k]=sub06.result[903+k];
	u[9159+k]=sub06.result[1032+k];
	u[9288+k]=sub06.result[1161+k];
	u[9417+k]=sub06.result[1290+k];
	u[9546+k]=sub06.result[1419+k];
	u[9675+k]=sub06.result[1548+k];
	u[9804+k]=sub06.result[1677+k];
	u[9933+k]=sub06.result[1806+k];
	u[10062+k]=sub06.result[1935+k];
	u[10191+k]=sub06.result[2064+k];
	u[10320+k]=sub06.result[2193+k];
	u[10449+k]=sub06.result[2322+k];
	u[10578+k]=sub06.result[2451+k];
	u[10707+k]=sub06.result[2580+k];
	u[10836+k]=sub06.result[2709+k];
	u[10965+k]=sub06.result[2838+k];
	u[11094+k]=sub06.result[2967+k];
	u[11223+k]=sub06.result[3096+k];
	u[11352+k]=sub06.result[3225+k];
	u[11481+k]=sub06.result[3354+k];
	u[11610+k]=sub06.result[3483+k];
	u[11739+k]=sub06.result[3612+k];
	u[11868+k]=sub06.result[3741+k];
	u[11997+k]=sub06.result[3870+k];
	u[12126+k]=sub06.result[3999+k];
	u[12255+k]=sub06.result[4128+k];
	u[12384+k]=sub06.result[4257+k];
	u[12513+k]=sub07.result[258+k];
	u[12642+k]=sub07.result[387+k];
	u[12771+k]=sub07.result[516+k];
	u[12900+k]=sub07.result[645+k];
	u[13029+k]=sub07.result[774+k];
	u[13158+k]=sub07.result[903+k];
	u[13287+k]=sub07.result[1032+k];
	u[13416+k]=sub07.result[1161+k];
	u[13545+k]=sub07.result[1290+k];
	u[13674+k]=sub07.result[1419+k];
	u[13803+k]=sub07.result[1548+k];
	u[13932+k]=sub07.result[1677+k];
	u[14061+k]=sub07.result[1806+k];
	u[14190+k]=sub07.result[1935+k];
	u[14319+k]=sub07.result[2064+k];
	u[14448+k]=sub07.result[2193+k];
	u[14577+k]=sub07.result[2322+k];
	u[14706+k]=sub07.result[2451+k];
	u[14835+k]=sub07.result[2580+k];
	u[14964+k]=sub07.result[2709+k];
	u[15093+k]=sub07.result[2838+k];
	u[15222+k]=sub07.result[2967+k];
	u[15351+k]=sub07.result[3096+k];
	u[15480+k]=sub07.result[3225+k];
	u[15609+k]=sub07.result[3354+k];
	u[15738+k]=sub07.result[3483+k];
	u[15867+k]=sub07.result[3612+k];
	u[15996+k]=sub07.result[3741+k];
	u[16125+k]=sub07.result[3870+k];
	u[16254+k]=sub07.result[3999+k];
	u[16383+k]=sub07.result[4128+k];
	u[16512+k]=sub07.result[4257+k];
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
		return u[10*21+10];
	}
}