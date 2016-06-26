import net.njlab.sample.annotation.*;
//分割数16

public class c1{
	private static final float[] u = new float[484];
	private static final float[] uu= new float[484];
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
        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		//float dx,dy;
		mx=31;
		my=31;
		//dx = 0.05f;
		//dy = 0.05f;
		nlast=400;
		
//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 //q[j*31+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*31+k] = 0f;
			uu[j*31+k] = 0f;
		}
	}
	
//	計算ループ	
	for(n=1;n<=nlast;n++){
//	境界条件
		for (j = 1; j <= my; j++)
		{
			u[1*31+j] = 0.5f;
			u[441+j]= 0f;
			u[j*31+1] = 1.f;
			u[j*31+my]= 0f;
		}
		
		//クラスに配列をこぴー
		//5-11,5-11 49
		for(k=1;k<=12;k++){
			sub00.u[31+k]=u[31+k];
			sub00.u[62+k]=u[62+k];
			sub00.u[93+k]=u[93+k];
			sub00.u[124+k]=u[124+k];
			sub00.u[155+k]=u[155+k];
			sub00.u[186+k]=u[186+k];
			sub00.u[217+k]=u[217+k];
			sub00.u[248+k]=u[248+k];
			sub00.u[279+k]=u[279+k];
			sub00.u[310+k]=u[310+k];
			sub00.u[341+k]=u[341+k];
			sub00.u[372+k]=u[372+k];
			sub01.u[341+k]=u[341+k];
			sub01.u[372+k]=u[372+k];
			sub01.u[403+k]=u[403+k];
			sub01.u[434+k]=u[434+k];
			sub01.u[465+k]=u[465+k];
			sub01.u[496+k]=u[496+k];
			sub01.u[527+k]=u[527+k];
			sub01.u[558+k]=u[558+k];
			sub01.u[589+k]=u[589+k];
			sub01.u[620+k]=u[620+k];
			sub01.u[651+k]=u[651+k];
			sub01.u[682+k]=u[682+k];
			sub02.u[651+k]=u[651+k];
			sub02.u[682+k]=u[682+k];
			sub02.u[713+k]=u[713+k];
			sub02.u[744+k]=u[744+k];
			sub02.u[775+k]=u[775+k];
			sub02.u[806+k]=u[806+k];
			sub02.u[837+k]=u[837+k];
			sub02.u[868+k]=u[868+k];
			sub02.u[899+k]=u[899+k];
			sub02.u[930+k]=u[930+k];
			sub02.u[961+k]=u[961+k];
			sub03.u[31+k+10]=u[31+k+10];
			sub03.u[62+k+10]=u[62+k+10];
			sub03.u[93+k+10]=u[93+k+10];
			sub03.u[124+k+10]=u[124+k+10];
			sub03.u[155+k+10]=u[155+k+10];
			sub03.u[186+k+10]=u[186+k+10];
			sub03.u[217+k+10]=u[217+k+10];
			sub03.u[248+k+10]=u[248+k+10];
			sub03.u[279+k+10]=u[279+k+10];
			sub03.u[310+k+10]=u[310+k+10];
			sub03.u[341+k+10]=u[341+k+10];
			sub03.u[372+k+10]=u[372+k+10];
			sub04.u[341+k+10]=u[341+k+10];
			sub04.u[372+k+10]=u[372+k+10];
			sub04.u[403+k+10]=u[403+k+10];
			sub04.u[434+k+10]=u[434+k+10];
			sub04.u[465+k+10]=u[465+k+10];
			sub04.u[496+k+10]=u[496+k+10];
			sub04.u[527+k+10]=u[527+k+10];
			sub04.u[558+k+10]=u[558+k+10];
			sub04.u[589+k+10]=u[589+k+10];
			sub04.u[620+k+10]=u[620+k+10];
			sub04.u[651+k+10]=u[651+k+10];
			sub04.u[682+k+10]=u[682+k+10];
			sub05.u[651+k+10]=u[651+k+10];
			sub05.u[682+k+10]=u[682+k+10];
			sub05.u[713+k+10]=u[713+k+10];
			sub05.u[744+k+10]=u[744+k+10];
			sub05.u[775+k+10]=u[775+k+10];
			sub05.u[806+k+10]=u[806+k+10];
			sub05.u[837+k+10]=u[837+k+10];
			sub05.u[868+k+10]=u[868+k+10];
			sub05.u[899+k+10]=u[899+k+10];
			sub05.u[930+k+10]=u[930+k+10];
			sub05.u[961+k+10]=u[961+k+10];
		}
		for(k=21;k<=31;k++){
			sub06.u[31+k]=u[31+k];
			sub06.u[62+k]=u[62+k];
			sub06.u[93+k]=u[93+k];
			sub06.u[124+k]=u[124+k];
			sub06.u[155+k]=u[155+k];
			sub06.u[186+k]=u[186+k];
			sub06.u[217+k]=u[217+k];
			sub06.u[248+k]=u[248+k];
			sub06.u[279+k]=u[279+k];
			sub06.u[310+k]=u[310+k];
			sub06.u[341+k]=u[341+k];
			sub06.u[372+k]=u[372+k];
			sub07.u[341+k]=u[341+k];
			sub07.u[372+k]=u[372+k];
			sub07.u[403+k]=u[403+k];
			sub07.u[434+k]=u[434+k];
			sub07.u[465+k]=u[465+k];
			sub07.u[496+k]=u[496+k];
			sub07.u[527+k]=u[527+k];
			sub07.u[558+k]=u[558+k];
			sub07.u[589+k]=u[589+k];
			sub07.u[620+k]=u[620+k];
			sub07.u[651+k]=u[651+k];
			sub08.u[651+k]=u[651+k];
			sub08.u[682+k]=u[682+k];
			sub08.u[713+k]=u[713+k];
			sub08.u[744+k]=u[744+k];
			sub08.u[775+k]=u[775+k];
			sub08.u[806+k]=u[806+k];
			sub08.u[837+k]=u[837+k];
			sub08.u[868+k]=u[868+k];
			sub08.u[899+k]=u[899+k];
			sub08.u[930+k]=u[930+k];
		}
		sub01.start();
		sub02.start();
		sub03.start();
		sub05.start();
		sub06.start();
		sub07.start();
		sub00.start();
		sub04.start();
		sub08.start();

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
		}catch(Exception e){}
		for(k=2;k<=11;k++){
			u[62+k]=sub00.result[62+k];
			u[93+k]=sub00.result[93+k];
			u[124+k]=sub00.result[124+k];
			u[155+k]=sub00.result[155+k];
			u[186+k]=sub00.result[186+k];
			u[217+k]=sub00.result[217+k];
			u[248+k]=sub00.result[248+k];
			u[279+k]=sub00.result[279+k];
			u[310+k]=sub00.result[310+k];
			u[341+k]=sub00.result[341+k];
			u[372+k]=sub01.result[372+k];
			u[403+k]=sub01.result[403+k];
			u[434+k]=sub01.result[434+k];
			u[465+k]=sub01.result[465+k];
			u[496+k]=sub01.result[496+k];
			u[527+k]=sub01.result[527+k];
			u[558+k]=sub01.result[558+k];
			u[589+k]=sub01.result[589+k];
			u[620+k]=sub01.result[620+k];
			u[651+k]=sub01.result[651+k];
			u[682+k]=sub02.result[682+k];
			u[713+k]=sub02.result[713+k];
			u[744+k]=sub02.result[744+k];
			u[775+k]=sub02.result[775+k];
			u[806+k]=sub02.result[806+k];
			u[837+k]=sub02.result[837+k];
			u[868+k]=sub02.result[868+k];
			u[899+k]=sub02.result[899+k];
			u[930+k]=sub02.result[930+k];
			u[62+k+10]=sub03.result[62+k+10];
			u[93+k+10]=sub03.result[93+k+10];
			u[124+k+10]=sub03.result[124+k+10];
			u[155+k+10]=sub03.result[155+k+10];
			u[186+k+10]=sub03.result[186+k+10];
			u[217+k+10]=sub03.result[217+k+10];
			u[248+k+10]=sub03.result[248+k+10];
			u[279+k+10]=sub03.result[279+k+10];
			u[310+k+10]=sub03.result[310+k+10];
			u[341+k+10]=sub03.result[341+k+10];
			u[372+k+10]=sub04.result[372+k+10];
			u[403+k+10]=sub04.result[403+k+10];
			u[434+k+10]=sub04.result[434+k+10];
			u[465+k+10]=sub04.result[465+k+10];
			u[496+k+10]=sub04.result[496+k+10];
			u[527+k+10]=sub04.result[527+k+10];
			u[558+k+10]=sub04.result[558+k+10];
			u[589+k+10]=sub04.result[589+k+10];
			u[620+k+10]=sub04.result[620+k+10];
			u[651+k+10]=sub04.result[651+k+10];
			u[682+k+10]=sub05.result[682+k+10];
			u[713+k+10]=sub05.result[713+k+10];
			u[744+k+10]=sub05.result[744+k+10];
			u[775+k+10]=sub05.result[775+k+10];
			u[806+k+10]=sub05.result[806+k+10];
			u[837+k+10]=sub05.result[837+k+10];
			u[868+k+10]=sub05.result[868+k+10];
			u[899+k+10]=sub05.result[899+k+10];
			u[930+k+10]=sub05.result[930+k+10];
		}
		for(k=22;k<=30;k++){
			u[62+k]=sub06.result[62+k];
			u[93+k]=sub06.result[93+k];
			u[124+k]=sub06.result[124+k];
			u[155+k]=sub06.result[155+k];
			u[186+k]=sub06.result[186+k];
			u[217+k]=sub06.result[217+k];
			u[248+k]=sub06.result[248+k];
			u[279+k]=sub06.result[279+k];
			u[310+k]=sub06.result[310+k];
			u[341+k]=sub06.result[341+k];
			u[372+k]=sub07.result[372+k];
			u[403+k]=sub07.result[403+k];
			u[434+k]=sub07.result[434+k];
			u[465+k]=sub07.result[465+k];
			u[496+k]=sub07.result[496+k];
			u[527+k]=sub07.result[527+k];
			u[558+k]=sub07.result[558+k];
			u[589+k]=sub07.result[589+k];
			u[620+k]=sub07.result[620+k];
			u[651+k]=sub07.result[651+k];
			u[682+k]=sub07.result[682+k];
			u[682+k]=sub08.result[682+k];
			u[713+k]=sub08.result[713+k];
			u[744+k]=sub08.result[744+k];
			u[775+k]=sub08.result[775+k];
			u[806+k]=sub08.result[806+k];
			u[837+k]=sub08.result[837+k];
			u[868+k]=sub08.result[868+k];
			u[899+k]=sub08.result[899+k];
			u[930+k]=sub08.result[930+k];
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
