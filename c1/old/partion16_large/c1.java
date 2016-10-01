import net.njlab.sample.annotation.*;
//分割数16

public class c1{
	private static final float[] u = new float[1024];
	private static final float[] uu= new float[1024];
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

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		//float dx,dy;
		mx=31;
		my=31;
		//dx = 0.05f;
		//dy = 0.05f;
		nlast=1;
		
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
			u[31*mx+j]= 0f;
			u[j*31+1] = 1.f;
			u[j*31+my]= 0f;
		}
		
		for(k=1;k<=9;k++){
			sub00.u[31+k]=u[31+k];
			sub00.u[62+k]=u[62+k];
			sub00.u[93+k]=u[93+k];
			sub00.u[124+k]=u[124+k];
			sub00.u[155+k]=u[155+k];
			sub00.u[186+k]=u[186+k];
			sub00.u[217+k]=u[217+k];
			sub00.u[248+k]=u[248+k];
			sub00.u[279+k]=u[279+k];

			sub01.u[248+k]=u[248+k];
			sub01.u[279+k]=u[279+k];
			sub01.u[310+k]=u[310+k];
			sub01.u[341+k]=u[341+k];
			sub01.u[372+k]=u[372+k];
			sub01.u[403+k]=u[403+k];
			sub01.u[434+k]=u[434+k];
			sub01.u[465+k]=u[465+k];
			sub01.u[496+k]=u[496+k];

			sub02.u[465+k]=u[465+k];
			sub02.u[496+k]=u[496+k];
			sub02.u[527+k]=u[527+k];
			sub02.u[558+k]=u[558+k];
			sub02.u[589+k]=u[589+k];
			sub02.u[620+k]=u[620+k];
			sub02.u[651+k]=u[651+k];
			sub02.u[682+k]=u[682+k];
			sub02.u[713+k]=u[713+k];

			sub03.u[682+k]=u[682+k];
			sub03.u[713+k]=u[713+k];
			sub03.u[744+k]=u[744+k];
			sub03.u[775+k]=u[775+k];
			sub03.u[806+k]=u[806+k];
			sub03.u[837+k]=u[837+k];
			sub03.u[868+k]=u[868+k];
			sub03.u[899+k]=u[899+k];
			sub03.u[930+k]=u[930+k];
			sub03.u[961+k]=u[961+k];

			sub04.u[31+k+7]=u[31+k+7];
			sub04.u[62+k+7]=u[62+k+7];
			sub04.u[93+k+7]=u[93+k+7];
			sub04.u[124+k+7]=u[124+k+7];
			sub04.u[155+k+7]=u[155+k+7];
			sub04.u[186+k+7]=u[186+k+7];
			sub04.u[217+k+7]=u[217+k+7];
			sub04.u[248+k+7]=u[248+k+7];
			sub04.u[279+k+7]=u[279+k+7];

			sub05.u[248+k+7]=u[248+k+7];
			sub05.u[279+k+7]=u[279+k+7];
			sub05.u[310+k+7]=u[310+k+7];
			sub05.u[341+k+7]=u[341+k+7];
			sub05.u[372+k+7]=u[372+k+7];
			sub05.u[403+k+7]=u[403+k+7];
			sub05.u[434+k+7]=u[434+k+7];
			sub05.u[465+k+7]=u[465+k+7];
			sub05.u[496+k+7]=u[496+k+7];

			sub06.u[465+k+7]=u[465+k+7];
			sub06.u[496+k+7]=u[496+k+7];
			sub06.u[527+k+7]=u[527+k+7];
			sub06.u[558+k+7]=u[558+k+7];
			sub06.u[589+k+7]=u[589+k+7];
			sub06.u[620+k+7]=u[620+k+7];
			sub06.u[651+k+7]=u[651+k+7];
			sub06.u[682+k+7]=u[682+k+7];
			sub06.u[713+k+7]=u[713+k+7];

			sub07.u[682+k+7]=u[682+k+7];
			sub07.u[713+k+7]=u[713+k+7];
			sub07.u[744+k+7]=u[744+k+7];
			sub07.u[775+k+7]=u[775+k+7];
			sub07.u[806+k+7]=u[806+k+7];
			sub07.u[837+k+7]=u[837+k+7];
			sub07.u[868+k+7]=u[868+k+7];
			sub07.u[899+k+7]=u[899+k+7];
			sub07.u[930+k+7]=u[930+k+7];
			sub07.u[961+k+7]=u[961+k+7];

			sub08.u[31+k+14]=u[31+k+14];
			sub08.u[62+k+14]=u[62+k+14];
			sub08.u[93+k+14]=u[93+k+14];
			sub08.u[124+k+14]=u[124+k+14];
			sub08.u[155+k+14]=u[155+k+14];
			sub08.u[186+k+14]=u[186+k+14];
			sub08.u[217+k+14]=u[217+k+14];
			sub08.u[248+k+14]=u[248+k+14];
			sub08.u[279+k+14]=u[279+k+14];

			sub09.u[248+k+14]=u[248+k+14];
			sub09.u[279+k+14]=u[279+k+14];
			sub09.u[310+k+14]=u[310+k+14];
			sub09.u[341+k+14]=u[341+k+14];
			sub09.u[372+k+14]=u[372+k+14];
			sub09.u[403+k+14]=u[403+k+14];
			sub09.u[434+k+14]=u[434+k+14];
			sub09.u[465+k+14]=u[465+k+14];
			sub09.u[496+k+14]=u[496+k+14];

			sub10.u[465+k+14]=u[465+k+14];
			sub10.u[496+k+14]=u[496+k+14];
			sub10.u[527+k+14]=u[527+k+14];
			sub10.u[558+k+14]=u[558+k+14];
			sub10.u[589+k+14]=u[589+k+14];
			sub10.u[620+k+14]=u[620+k+14];
			sub10.u[651+k+14]=u[651+k+14];
			sub10.u[682+k+14]=u[682+k+14];
			sub10.u[713+k+14]=u[713+k+14];

			sub11.u[682+k+14]=u[682+k+14];
			sub11.u[713+k+14]=u[713+k+14];
			sub11.u[744+k+14]=u[744+k+14];
			sub11.u[775+k+14]=u[775+k+14];
			sub11.u[806+k+14]=u[806+k+14];
			sub11.u[837+k+14]=u[837+k+14];
			sub11.u[868+k+14]=u[868+k+14];
			sub11.u[899+k+14]=u[899+k+14];
			sub11.u[930+k+14]=u[930+k+14];
			sub11.u[961+k+14]=u[961+k+14];
		}

		for(j=22;j<=31;j++){
			sub12.u[31+k]=u[31+k];
			sub12.u[62+k]=u[62+k];
			sub12.u[93+k]=u[93+k];
			sub12.u[124+k]=u[124+k];
			sub12.u[155+k]=u[155+k];
			sub12.u[186+k]=u[186+k];
			sub12.u[217+k]=u[217+k];
			sub12.u[248+k]=u[248+k];
			sub12.u[279+k]=u[279+k];

			sub13.u[248+k]=u[248+k];
			sub13.u[279+k]=u[279+k];
			sub13.u[310+k]=u[310+k];
			sub13.u[341+k]=u[341+k];
			sub13.u[372+k]=u[372+k];
			sub13.u[403+k]=u[403+k];
			sub13.u[434+k]=u[434+k];
			sub13.u[465+k]=u[465+k];
			sub13.u[496+k]=u[496+k];

			sub14.u[465+k]=u[465+k];
			sub14.u[496+k]=u[496+k];
			sub14.u[527+k]=u[527+k];
			sub14.u[558+k]=u[558+k];
			sub14.u[589+k]=u[589+k];
			sub14.u[620+k]=u[620+k];
			sub14.u[651+k]=u[651+k];
			sub14.u[682+k]=u[682+k];
			sub14.u[713+k]=u[713+k];

			sub15.u[682+k]=u[682+k];
			sub15.u[713+k]=u[713+k];
			sub15.u[744+k]=u[744+k];
			sub15.u[775+k]=u[775+k];
			sub15.u[806+k]=u[806+k];
			sub15.u[837+k]=u[837+k];
			sub15.u[868+k]=u[868+k];
			sub15.u[899+k]=u[899+k];
			sub15.u[930+k]=u[930+k];
			sub15.u[961+k]=u[961+k];
		}
		sub00.start();
		sub04.start();
		sub08.start();
		sub12.start();
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

		for(k=2;k<=8;k++){
			u[62+k]=sub00.result[62+k];
			u[93+k]=sub00.result[93+k];
			u[124+k]=sub00.result[124+k];
			u[155+k]=sub00.result[155+k];
			u[186+k]=sub00.result[186+k];
			u[217+k]=sub00.result[217+k];
			u[248+k]=sub00.result[248+k];

			u[279+k]=sub01.result[279+k];
			u[310+k]=sub01.result[310+k];
			u[341+k]=sub01.result[341+k];
			u[372+k]=sub01.result[372+k];
			u[403+k]=sub01.result[403+k];
			u[434+k]=sub01.result[434+k];
			u[465+k]=sub01.result[465+k];

			u[496+k]=sub02.result[496+k];
			u[527+k]=sub02.result[527+k];
			u[558+k]=sub02.result[558+k];
			u[589+k]=sub02.result[589+k];
			u[620+k]=sub02.result[620+k];
			u[651+k]=sub02.result[651+k];
			u[682+k]=sub02.result[682+k];

			u[713+k]=sub03.result[713+k];
			u[744+k]=sub03.result[744+k];
			u[775+k]=sub03.result[775+k];
			u[806+k]=sub03.result[806+k];
			u[837+k]=sub03.result[837+k];
			u[868+k]=sub03.result[868+k];
			u[899+k]=sub03.result[899+k];
			u[930+k]=sub03.result[930+k];

			u[62+k+7]=sub04.result[62+k+7];
			u[93+k+7]=sub04.result[93+k+7];
			u[124+k+7]=sub04.result[124+k+7];
			u[155+k+7]=sub04.result[155+k+7];
			u[186+k+7]=sub04.result[186+k+7];
			u[217+k+7]=sub04.result[217+k+7];
			u[248+k+7]=sub04.result[248+k+7];

			u[279+k+7]=sub05.result[279+k+7];
			u[310+k+7]=sub05.result[310+k+7];
			u[341+k+7]=sub05.result[341+k+7];
			u[372+k+7]=sub05.result[372+k+7];
			u[403+k+7]=sub05.result[403+k+7];
			u[434+k+7]=sub05.result[434+k+7];
			u[465+k+7]=sub05.result[465+k+7];

			u[496+k+7]=sub06.result[496+k+7];
			u[527+k+7]=sub06.result[527+k+7];
			u[558+k+7]=sub06.result[558+k+7];
			u[589+k+7]=sub06.result[589+k+7];
			u[620+k+7]=sub06.result[620+k+7];
			u[651+k+7]=sub06.result[651+k+7];
			u[682+k+7]=sub06.result[682+k+7];

			u[713+k+7]=sub07.result[713+k+7];
			u[744+k+7]=sub07.result[744+k+7];
			u[775+k+7]=sub07.result[775+k+7];
			u[806+k+7]=sub07.result[806+k+7];
			u[837+k+7]=sub07.result[837+k+7];
			u[868+k+7]=sub07.result[868+k+7];
			u[899+k+7]=sub07.result[899+k+7];
			u[930+k+7]=sub07.result[930+k+7];

			u[62+k+14]=sub08.result[62+k+14];
			u[93+k+14]=sub08.result[93+k+14];
			u[124+k+14]=sub08.result[124+k+14];
			u[155+k+14]=sub08.result[155+k+14];
			u[186+k+14]=sub08.result[186+k+14];
			u[217+k+14]=sub08.result[217+k+14];
			u[248+k+14]=sub08.result[248+k+14];

			u[279+k+14]=sub09.result[279+k+14];
			u[310+k+14]=sub09.result[310+k+14];
			u[341+k+14]=sub09.result[341+k+14];
			u[372+k+14]=sub09.result[372+k+14];
			u[403+k+14]=sub09.result[403+k+14];
			u[434+k+14]=sub09.result[434+k+14];
			u[465+k+14]=sub09.result[465+k+14];

			u[496+k+14]=sub10.result[496+k+14];
			u[527+k+14]=sub10.result[527+k+14];
			u[558+k+14]=sub10.result[558+k+14];
			u[589+k+14]=sub10.result[589+k+14];
			u[620+k+14]=sub10.result[620+k+14];
			u[651+k+14]=sub10.result[651+k+14];
			u[682+k+14]=sub10.result[682+k+14];

			u[713+k+14]=sub11.result[713+k+14];
			u[744+k+14]=sub11.result[744+k+14];
			u[775+k+14]=sub11.result[775+k+14];
			u[806+k+14]=sub11.result[806+k+14];
			u[837+k+14]=sub11.result[837+k+14];
			u[868+k+14]=sub11.result[868+k+14];
			u[899+k+14]=sub11.result[899+k+14];
			u[930+k+14]=sub11.result[930+k+14];
		}

		for(k=23;k<=30;k++){
			u[62+k]=sub12.result[62+k];
			u[93+k]=sub12.result[93+k];
			u[124+k]=sub12.result[124+k];
			u[155+k]=sub12.result[155+k];
			u[186+k]=sub12.result[186+k];
			u[217+k]=sub12.result[217+k];
			u[248+k]=sub12.result[248+k];

			u[279+k]=sub13.result[279+k];
			u[310+k]=sub13.result[310+k];
			u[341+k]=sub13.result[341+k];
			u[372+k]=sub13.result[372+k];
			u[403+k]=sub13.result[403+k];
			u[434+k]=sub13.result[434+k];
			u[465+k]=sub13.result[465+k];

			u[496+k]=sub14.result[496+k];
			u[527+k]=sub14.result[527+k];
			u[558+k]=sub14.result[558+k];
			u[589+k]=sub14.result[589+k];
			u[620+k]=sub14.result[620+k];
			u[651+k]=sub14.result[651+k];
			u[682+k]=sub14.result[682+k];

			u[713+k]=sub15.result[713+k];
			u[744+k]=sub15.result[744+k];
			u[775+k]=sub15.result[775+k];
			u[806+k]=sub15.result[806+k];
			u[837+k]=sub15.result[837+k];
			u[868+k]=sub15.result[868+k];
			u[899+k]=sub15.result[899+k];
			u[930+k]=sub15.result[930+k];

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