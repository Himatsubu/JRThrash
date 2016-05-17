import net.njlab.sample.annotation.*;
//分割数16

public class c1_test03{
	private static final float[] u = new float[1024];
	private static final float[] uu= new float[1024];
	//private static final float[] q = new float[484];

	static final sub00 sub00    = new sub00(); //1-6,1-4
	static final sub01 sub01    = new sub01(); //1-6,3-6
	static final sub02 sub02    = new sub02(); //5-11,1-4
	static final sub03 sub03    = new sub03(); //5-11,3-6
	static final sub04 sub04    = new sub04(); //10-16,1-4
	static final sub05 sub05    = new sub05(); //10-16,3-6
	static final sub06 sub06    = new sub06(); //15-21,1-4
	static final sub07 sub07    = new sub07(); //15-21,3-6
	static final sub08 sub08    = new sub08(); //1-6,5-8
	static final sub09 sub09    = new sub09(); //1-6,7-11
	static final sub10 sub10    = new sub10(); //5-11,5-8
	static final sub11 sub11    = new sub11(); //5-11,7-11
	static final sub12 sub12    = new sub12(); //10-16,5-8
	static final sub13 sub13    = new sub13(); //10-16,7-11
	static final sub14 sub14    = new sub14(); //15-21,5-8
	static final sub15 sub15    = new sub15(); //15-21,7-11
	static final sub16 sub16    = new sub16(); //1-6,10-13
	static final sub17 sub17    = new sub17(); //1-6,12-16
	static final sub18 sub18    = new sub18(); //5-11,10-13
	static final sub19 sub19    = new sub19(); //5-11,12-16
	static final sub20 sub20    = new sub20(); //10-16,10-13
	static final sub21 sub21    = new sub21(); //10-16,12-16
	static final sub22 sub22    = new sub22(); //15-21,10-13
	static final sub23 sub23    = new sub23(); //15-21,12-16
	static final sub24 sub24    = new sub24(); //1-6,15-18

        @JRThrashUnroll(unrollNum=10, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		float dx,dy;

		mx=31;
		my=31;
		dx = 0.05f;
		dy = 0.05f;
		nlast=1;
			
//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 //q[j*21+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*31+k] = 0f;
			uu[j*31+k] = 0f;
		}
	}
	
//	計算ループ	
	for(n=1;n<=nlast;n++){
//	境界条件
		for (j = 1; j <= my; j++)
		{
			u[31+j] = 0.5f;
			u[mx*31+j]= 0f;
		
			u[j*31+1] = 1.f;
			u[j*31+my]= 0f;
		}
	
		//クラスに配列をこぴー
		//1-6,1-6
		for(k=1;k<=8;k++)
		{
			sub00.u[31+k]=u[31+k];
			sub00.u[62+k]=u[62+k];
			sub00.u[93+k]=u[93+k];
			sub00.u[124+k]=u[124+k];
			sub00.u[155+k]=u[155+k];
			sub00.u[186+k]=u[186+k];
			sub00.u[217+k]=u[217+k];
			sub00.u[248+k]=u[248+k];

			sub01.u[217+k]=u[217+k];
			sub01.u[248+k]=u[248+k];
			sub01.u[279+k]=u[279+k];
			sub01.u[310+k]=u[310+k];
			sub01.u[341+k]=u[341+k];
			sub01.u[372+k]=u[372+k];
			sub01.u[403+k]=u[403+k];
			sub01.u[434+k]=u[434+k];

			sub02.u[403+k]=u[403+k];
			sub02.u[434+k]=u[434+k];
			sub02.u[465+k]=u[465+k];
			sub02.u[496+k]=u[496+k];
			sub02.u[527+k]=u[527+k];
			sub02.u[558+k]=u[558+k];
			sub02.u[589+k]=u[589+k];
			sub02.u[620+k]=u[620+k];

			sub03.u[589+k]=u[589+k];
			sub03.u[620+k]=u[620+k];
			sub03.u[651+k]=u[651+k];
			sub03.u[682+k]=u[682+k];
			sub03.u[713+k]=u[713+k];
			sub03.u[744+k]=u[744+k];
			sub03.u[775+k]=u[775+k];
			sub03.u[806+k]=u[806+k];

			sub04.u[775+k]=u[775+k];
			sub04.u[806+k]=u[806+k];
			sub04.u[837+k]=u[837+k];
			sub04.u[868+k]=u[868+k];
			sub04.u[899+k]=u[899+k];
			sub04.u[930+k]=u[930+k];
			sub04.u[961+k]=u[961+k];

			sub05.u[31+k+6]=u[31+k+6];
			sub05.u[62+k+6]=u[62+k+6];
			sub05.u[93+k+6]=u[93+k+6];
			sub05.u[124+k+6]=u[124+k+6];
			sub05.u[155+k+6]=u[155+k+6];
			sub05.u[186+k+6]=u[186+k+6];
			sub05.u[217+k+6]=u[217+k+6];
			sub05.u[248+k+6]=u[248+k+6];

			sub06.u[217+k+6]=u[217+k+6];
			sub06.u[248+k+6]=u[248+k+6];
			sub06.u[279+k+6]=u[279+k+6];
			sub06.u[310+k+6]=u[310+k+6];
			sub06.u[341+k+6]=u[341+k+6];
			sub06.u[372+k+6]=u[372+k+6];
			sub06.u[403+k+6]=u[403+k+6];
			sub06.u[434+k+6]=u[434+k+6];

			sub07.u[403+k+6]=u[403+k+6];
			sub07.u[434+k+6]=u[434+k+6];
			sub07.u[465+k+6]=u[465+k+6];
			sub07.u[496+k+6]=u[496+k+6];
			sub07.u[527+k+6]=u[527+k+6];
			sub07.u[558+k+6]=u[558+k+6];
			sub07.u[589+k+6]=u[589+k+6];
			sub07.u[620+k+6]=u[620+k+6];

			sub08.u[589+k+6]=u[589+k+6];
			sub08.u[620+k+6]=u[620+k+6];
			sub08.u[651+k+6]=u[651+k+6];
			sub08.u[682+k+6]=u[682+k+6];
			sub08.u[713+k+6]=u[713+k+6];
			sub08.u[744+k+6]=u[744+k+6];
			sub08.u[775+k+6]=u[775+k+6];
			sub08.u[806+k+6]=u[806+k+6];

			sub09.u[775+k+6]=u[775+k+6];
			sub09.u[806+k+6]=u[806+k+6];
			sub09.u[837+k+6]=u[837+k+6];
			sub09.u[868+k+6]=u[868+k+6];
			sub09.u[899+k+6]=u[899+k+6];
			sub09.u[930+k+6]=u[930+k+6];
			sub09.u[961+k+6]=u[961+k+6];

			sub10.u[31+k+12]=u[31+k+12];
			sub10.u[62+k+12]=u[62+k+12];
			sub10.u[93+k+12]=u[93+k+12];
			sub10.u[124+k+12]=u[124+k+12];
			sub10.u[155+k+12]=u[155+k+12];
			sub10.u[186+k+12]=u[186+k+12];
			sub10.u[217+k+12]=u[217+k+12];
			sub10.u[248+k+12]=u[248+k+12];

			sub11.u[217+k+12]=u[217+k+12];
			sub11.u[248+k+12]=u[248+k+12];
			sub11.u[279+k+12]=u[279+k+12];
			sub11.u[310+k+12]=u[310+k+12];
			sub11.u[341+k+12]=u[341+k+12];
			sub11.u[372+k+12]=u[372+k+12];
			sub11.u[403+k+12]=u[403+k+12];
			sub11.u[434+k+12]=u[434+k+12];

			sub12.u[403+k+12]=u[403+k+12];
			sub12.u[434+k+12]=u[434+k+12];
			sub12.u[465+k+12]=u[465+k+12];
			sub12.u[496+k+12]=u[496+k+12];
			sub12.u[527+k+12]=u[527+k+12];
			sub12.u[558+k+12]=u[558+k+12];
			sub12.u[589+k+12]=u[589+k+12];
			sub12.u[620+k+12]=u[620+k+12];

			sub13.u[589+k+12]=u[589+k+12];
			sub13.u[620+k+12]=u[620+k+12];
			sub13.u[651+k+12]=u[651+k+12];
			sub13.u[682+k+12]=u[682+k+12];
			sub13.u[713+k+12]=u[713+k+12];
			sub13.u[744+k+12]=u[744+k+12];
			sub13.u[775+k+12]=u[775+k+12];
			sub13.u[806+k+12]=u[806+k+12];

			sub14.u[775+k+12]=u[775+k+12];
			sub14.u[806+k+12]=u[806+k+12];
			sub14.u[837+k+12]=u[837+k+12];
			sub14.u[868+k+12]=u[868+k+12];
			sub14.u[899+k+12]=u[899+k+12];
			sub14.u[930+k+12]=u[930+k+12];
			sub14.u[961+k+12]=u[961+k+12];

			sub15.u[31+k+18]=u[31+k+18];
			sub15.u[62+k+18]=u[62+k+18];
			sub15.u[93+k+18]=u[93+k+18];
			sub15.u[124+k+18]=u[124+k+18];
			sub15.u[155+k+18]=u[155+k+18];
			sub15.u[186+k+18]=u[186+k+18];
			sub15.u[217+k+18]=u[217+k+18];
			sub15.u[248+k+18]=u[248+k+18];

			sub16.u[217+k+18]=u[217+k+18];
			sub16.u[248+k+18]=u[248+k+18];
			sub16.u[279+k+18]=u[279+k+18];
			sub16.u[310+k+18]=u[310+k+18];
			sub16.u[341+k+18]=u[341+k+18];
			sub16.u[372+k+18]=u[372+k+18];
			sub16.u[403+k+18]=u[403+k+18];
			sub16.u[434+k+18]=u[434+k+18];

			sub17.u[403+k+18]=u[403+k+18];
			sub17.u[434+k+18]=u[434+k+18];
			sub17.u[465+k+18]=u[465+k+18];
			sub17.u[496+k+18]=u[496+k+18];
			sub17.u[527+k+18]=u[527+k+18];
			sub17.u[558+k+18]=u[558+k+18];
			sub17.u[589+k+18]=u[589+k+18];
			sub17.u[620+k+18]=u[620+k+18];

			sub18.u[589+k+18]=u[589+k+18];
			sub18.u[620+k+18]=u[620+k+18];
			sub18.u[651+k+18]=u[651+k+18];
			sub18.u[682+k+18]=u[682+k+18];
			sub18.u[713+k+18]=u[713+k+18];
			sub18.u[744+k+18]=u[744+k+18];
			sub18.u[775+k+18]=u[775+k+18];
			sub18.u[806+k+18]=u[806+k+18];

			sub19.u[775+k+18]=u[775+k+18];
			sub19.u[806+k+18]=u[806+k+18];
			sub19.u[837+k+18]=u[837+k+18];
			sub19.u[868+k+18]=u[868+k+18];
			sub19.u[899+k+18]=u[899+k+18];
			sub19.u[930+k+18]=u[930+k+18];
			sub19.u[961+k+18]=u[961+k+18];
		}
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
		sub16.start();
		sub17.start();
		sub18.start();
		sub19.start();
		for(k=25;k<=31;k++)
		{
			sub20.u[31+k]=u[31+k];
			sub20.u[62+k]=u[62+k];
			sub20.u[93+k]=u[93+k];
			sub20.u[124+k]=u[124+k];
			sub20.u[155+k]=u[155+k];
			sub20.u[186+k]=u[186+k];
			sub20.u[217+k]=u[217+k];
			sub20.u[248+k]=u[248+k];

			sub21.u[217+k]=u[217+k];
			sub21.u[248+k]=u[248+k];
			sub21.u[279+k]=u[279+k];
			sub21.u[310+k]=u[310+k];
			sub21.u[341+k]=u[341+k];
			sub21.u[372+k]=u[372+k];
			sub21.u[403+k]=u[403+k];
			sub21.u[434+k]=u[434+k];

			sub22.u[403+k]=u[403+k];
			sub22.u[434+k]=u[434+k];
			sub22.u[465+k]=u[465+k];
			sub22.u[496+k]=u[496+k];
			sub22.u[527+k]=u[527+k];
			sub22.u[558+k]=u[558+k];
			sub22.u[589+k]=u[589+k];
			sub22.u[620+k]=u[620+k];

			sub23.u[589+k]=u[589+k];
			sub23.u[620+k]=u[620+k];
			sub23.u[651+k]=u[651+k];
			sub23.u[682+k]=u[682+k];
			sub23.u[713+k]=u[713+k];
			sub23.u[744+k]=u[744+k];
			sub23.u[775+k]=u[775+k];
			sub23.u[806+k]=u[806+k];

			sub24.u[775+k]=u[775+k];
			sub24.u[806+k]=u[806+k];
			sub24.u[837+k]=u[837+k];
			sub24.u[868+k]=u[868+k];
			sub24.u[899+k]=u[899+k];
			sub24.u[930+k]=u[930+k];
			sub24.u[961+k]=u[961+k];
		}	

		sub20.start();
		sub21.start();
		sub22.start();
		sub23.start();
		sub24.start();

		try{
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
			sub16.start();
			sub17.start();
			sub18.start();
			sub19.start();
			sub20.start();
			sub21.start();
			sub22.start();
			sub23.start();
			sub24.start();
		}catch(Exception e){}

		for(k=2;k<=7;k++){
			u[62+k]=sub00.result[62+k];
			u[93+k]=sub00.result[93+k];
			u[124+k]=sub00.result[124+k];
			u[155+k]=sub00.result[155+k];
			u[186+k]=sub00.result[186+k];
			u[217+k]=sub00.result[217+k];

			u[248+k]=sub01.result[248+k];
			u[279+k]=sub01.result[279+k];
			u[310+k]=sub01.result[310+k];
			u[341+k]=sub01.result[341+k];
			u[372+k]=sub01.result[372+k];
			u[403+k]=sub01.result[403+k];

			u[434+k]=sub02.result[434+k];
			u[465+k]=sub02.result[465+k];
			u[496+k]=sub02.result[496+k];
			u[527+k]=sub02.result[527+k];
			u[558+k]=sub02.result[558+k];
			u[589+k]=sub02.result[589+k];
			
			u[620+k]=sub03.result[620+k];
			u[651+k]=sub03.result[651+k];
			u[682+k]=sub03.result[682+k];
			u[713+k]=sub03.result[713+k];
			u[744+k]=sub03.result[744+k];
			u[775+k]=sub03.result[775+k];

			u[806+k]=sub04.result[806+k];
			u[837+k]=sub04.result[837+k];
			u[868+k]=sub04.result[868+k];
			u[899+k]=sub04.result[899+k];
			u[930+k]=sub04.result[930+k];

			u[62+k+6]=sub05.result[62+k+6];
			u[93+k+6]=sub05.result[93+k+6];
			u[124+k+6]=sub05.result[124+k+6];
			u[155+k+6]=sub05.result[155+k+6];
			u[186+k+6]=sub05.result[186+k+6];
			u[217+k+6]=sub05.result[217+k+6];

			u[248+k+6]=sub06.result[248+k+6];
			u[279+k+6]=sub06.result[279+k+6];
			u[310+k+6]=sub06.result[310+k+6];
			u[341+k+6]=sub06.result[341+k+6];
			u[372+k+6]=sub06.result[372+k+6];
			u[403+k+6]=sub06.result[403+k+6];

			u[434+k+6]=sub07.result[434+k+6];
			u[465+k+6]=sub07.result[465+k+6];
			u[496+k+6]=sub07.result[496+k+6];
			u[527+k+6]=sub07.result[527+k+6];
			u[558+k+6]=sub07.result[558+k+6];
			u[589+k+6]=sub07.result[589+k+6];
			
			u[620+k+6]=sub08.result[620+k+6];
			u[651+k+6]=sub08.result[651+k+6];
			u[682+k+6]=sub08.result[682+k+6];
			u[713+k+6]=sub08.result[713+k+6];
			u[744+k+6]=sub08.result[744+k+6];
			u[775+k+6]=sub08.result[775+k+6];

			u[806+k+6]=sub09.result[806+k+6];
			u[837+k+6]=sub09.result[837+k+6];
			u[868+k+6]=sub09.result[868+k+6];
			u[899+k+6]=sub09.result[899+k+6];
			u[930+k+6]=sub09.result[930+k+6];

			u[62+k+12]=sub10.result[62+k+12];
			u[93+k+12]=sub10.result[93+k+12];
			u[124+k+12]=sub10.result[124+k+12];
			u[155+k+12]=sub10.result[155+k+12];
			u[186+k+12]=sub10.result[186+k+12];
			u[217+k+12]=sub10.result[217+k+12];

			u[248+k+12]=sub11.result[248+k+12];
			u[279+k+12]=sub11.result[279+k+12];
			u[310+k+12]=sub11.result[310+k+12];
			u[341+k+12]=sub11.result[341+k+12];
			u[372+k+12]=sub11.result[372+k+12];
			u[403+k+12]=sub11.result[403+k+12];

			u[434+k+12]=sub12.result[434+k+12];
			u[465+k+12]=sub12.result[465+k+12];
			u[496+k+12]=sub12.result[496+k+12];
			u[527+k+12]=sub12.result[527+k+12];
			u[558+k+12]=sub12.result[558+k+12];
			u[589+k+12]=sub12.result[589+k+12];
			
			u[620+k+12]=sub13.result[620+k+12];
			u[651+k+12]=sub13.result[651+k+12];
			u[682+k+12]=sub13.result[682+k+12];
			u[713+k+12]=sub13.result[713+k+12];
			u[744+k+12]=sub13.result[744+k+12];
			u[775+k+12]=sub13.result[775+k+12];

			u[806+k+12]=sub14.result[806+k+12];
			u[837+k+12]=sub14.result[837+k+12];
			u[868+k+12]=sub14.result[868+k+12];
			u[899+k+12]=sub14.result[899+k+12];
			u[930+k+12]=sub14.result[930+k+12];

			u[62+k+18]=sub15.result[62+k+18];
			u[93+k+18]=sub15.result[93+k+18];
			u[124+k+18]=sub15.result[124+k+18];
			u[155+k+18]=sub15.result[155+k+18];
			u[186+k+18]=sub15.result[186+k+18];
			u[217+k+18]=sub15.result[217+k+18];

			u[248+k+18]=sub16.result[248+k+18];
			u[279+k+18]=sub16.result[279+k+18];
			u[310+k+18]=sub16.result[310+k+18];
			u[341+k+18]=sub16.result[341+k+18];
			u[372+k+18]=sub16.result[372+k+18];
			u[403+k+18]=sub16.result[403+k+18];

			u[434+k+18]=sub17.result[434+k+18];
			u[465+k+18]=sub17.result[465+k+18];
			u[496+k+18]=sub17.result[496+k+18];
			u[527+k+18]=sub17.result[527+k+18];
			u[558+k+18]=sub17.result[558+k+18];
			u[589+k+18]=sub17.result[589+k+18];
			
			u[620+k+18]=sub18.result[620+k+18];
			u[651+k+18]=sub18.result[651+k+18];
			u[682+k+18]=sub18.result[682+k+18];
			u[713+k+18]=sub18.result[713+k+18];
			u[744+k+18]=sub18.result[744+k+18];
			u[775+k+18]=sub18.result[775+k+18];

			u[806+k+18]=sub19.result[806+k+18];
			u[837+k+18]=sub19.result[837+k+18];
			u[868+k+18]=sub19.result[868+k+18];
			u[899+k+18]=sub19.result[899+k+18];
			u[930+k+18]=sub19.result[930+k+18];
		}

		for(k=26;k<=30;k++){
			u[62+k]=sub20.result[62+k];
			u[93+k]=sub20.result[93+k];
			u[124+k]=sub20.result[124+k];
			u[155+k]=sub20.result[155+k];
			u[186+k]=sub20.result[186+k];
			u[217+k]=sub20.result[217+k];

			u[248+k]=sub21.result[248+k];
			u[279+k]=sub21.result[279+k];
			u[310+k]=sub21.result[310+k];
			u[341+k]=sub21.result[341+k];
			u[372+k]=sub21.result[372+k];
			u[403+k]=sub21.result[403+k];

			u[434+k]=sub22.result[434+k];
			u[465+k]=sub22.result[465+k];
			u[496+k]=sub22.result[496+k];
			u[527+k]=sub22.result[527+k];
			u[558+k]=sub22.result[558+k];
			u[589+k]=sub22.result[589+k];
			
			u[620+k]=sub23.result[620+k];
			u[651+k]=sub23.result[651+k];
			u[682+k]=sub23.result[682+k];
			u[713+k]=sub23.result[713+k];
			u[744+k]=sub23.result[744+k];
			u[775+k]=sub23.result[775+k];

			u[806+k]=sub24.result[806+k];
			u[837+k]=sub24.result[837+k];
			u[868+k]=sub24.result[868+k];
			u[899+k]=sub24.result[899+k];
			u[930+k]=sub24.result[930+k];
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
		//System.out.println(u[210]);
	}
}
