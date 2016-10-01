import net.njlab.sample.annotation.*;
//分割数４,１重ループでのパイプライン実行
//分割方法　1-16,15-13

public class c1_test02{
	private static final float[] u = new float[1024];
	//private static final float[] uu= new float[1024];
	//private static final float[] q = new float[484];

	static final sub00 sub00    = new sub00();
	static final sub01 sub01    = new sub01();
	static final sub02 sub02    = new sub02();
	static final sub03 sub03    = new sub03();

        @JRThrashUnroll(unrollNum=20, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		float dx,dy;

		mx=31;
		my=31;
		dx = 0.05f;
		dy = 0.05f;
		nlast=2;
			
//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 //q[j*31+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*31+k] = 0f;
			//uu[j*31+k] = 0f;
		}
	}
	
//	計算ループ	
	for(n=1;n<=nlast;n++){
//	境界条件
		for (j = 1; j <= my; j++)
		{
			u[1*31+j] = 0.5f;
			u[mx*31+j]= 0f;
			u[j*31+1] = 1.f;
			u[j*31+my]= 0f;
		}
		
		//1-11,10-21
		for(k=1;k<=16;k++)
		{
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
			sub00.u[403+k]=u[403+k];
			sub00.u[434+k]=u[434+k];
			sub00.u[465+k]=u[465+k];
			sub00.u[496+k]=u[496+k];

			sub01.u[465+k]=u[465+k];
			sub01.u[496+k]=u[496+k];
			sub01.u[527+k]=u[527+k];
			sub01.u[558+k]=u[558+k];
			sub01.u[589+k]=u[589+k];
			sub01.u[620+k]=u[620+k];
			sub01.u[651+k]=u[651+k];
			sub01.u[682+k]=u[682+k];
			sub01.u[713+k]=u[713+k];
			sub01.u[744+k]=u[744+k];
			sub01.u[775+k]=u[775+k];
			sub01.u[806+k]=u[806+k];
			sub01.u[837+k]=u[837+k];
			sub01.u[868+k]=u[868+k];
			sub01.u[899+k]=u[899+k];
			sub01.u[930+k]=u[930+k];
			sub01.u[961+k]=u[961+k];
		}

		//10-21,10-21
		for(k=15;k<=31;k++)
		{
			sub02.u[31+k]=u[31+k];
			sub02.u[62+k]=u[62+k];
			sub02.u[93+k]=u[93+k];
			sub02.u[124+k]=u[124+k];
			sub02.u[155+k]=u[155+k];
			sub02.u[186+k]=u[186+k];
			sub02.u[217+k]=u[217+k];
			sub02.u[248+k]=u[248+k];
			sub02.u[279+k]=u[279+k];
			sub02.u[310+k]=u[310+k];
			sub02.u[341+k]=u[341+k];
			sub02.u[372+k]=u[372+k];
			sub02.u[403+k]=u[403+k];
			sub02.u[434+k]=u[434+k];
			sub02.u[465+k]=u[465+k];
			sub02.u[496+k]=u[496+k];

			sub03.u[465+k]=u[465+k];
			sub03.u[496+k]=u[496+k];
			sub03.u[527+k]=u[527+k];
			sub03.u[558+k]=u[558+k];
			sub03.u[589+k]=u[589+k];
			sub03.u[620+k]=u[620+k];
			sub03.u[651+k]=u[651+k];
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
		}
		sub01.start();
		sub00.start();
		sub02.start();
		sub03.start();


		try{
			sub00.join();
			sub01.join();
			sub02.join();
			sub03.join();
		}catch(Exception e){}

		//2-10,2-10
		for(k=2;k<=15;k++)
		{
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
			u[372+k]=sub00.result[372+k];
			u[403+k]=sub00.result[403+k];
			u[434+k]=sub00.result[434+k];
			u[465+k]=sub00.result[465+k];

			u[496+k]=sub01.result[496+k];
			u[527+k]=sub01.result[527+k];
			u[558+k]=sub01.result[558+k];
			u[589+k]=sub01.result[589+k];
			u[620+k]=sub01.result[620+k];
			u[651+k]=sub01.result[651+k];
			u[682+k]=sub01.result[682+k];
			u[713+k]=sub01.result[713+k];
			u[744+k]=sub01.result[744+k];
			u[775+k]=sub01.result[775+k];
			u[806+k]=sub01.result[806+k];
			u[837+k]=sub01.result[837+k];
			u[868+k]=sub01.result[868+k];
			u[899+k]=sub01.result[899+k];
			u[930+k]=sub01.result[930+k];
		}

		//2-10,2-10
		for(k=16;k<=30;k++)
		{
			u[62+k]=sub02.result[62+k];
			u[93+k]=sub02.result[93+k];
			u[124+k]=sub02.result[124+k];
			u[155+k]=sub02.result[155+k];
			u[186+k]=sub02.result[186+k];
			u[217+k]=sub02.result[217+k];
			u[248+k]=sub02.result[248+k];
			u[279+k]=sub02.result[279+k];
			u[310+k]=sub02.result[310+k];
			u[341+k]=sub02.result[341+k];
			u[372+k]=sub02.result[372+k];
			u[403+k]=sub02.result[403+k];
			u[434+k]=sub02.result[434+k];
			u[465+k]=sub02.result[465+k];

			u[496+k]=sub03.result[496+k];
			u[527+k]=sub03.result[527+k];
			u[558+k]=sub03.result[558+k];
			u[589+k]=sub03.result[589+k];
			u[620+k]=sub03.result[620+k];
			u[651+k]=sub03.result[651+k];
			u[682+k]=sub03.result[682+k];
			u[713+k]=sub03.result[713+k];
			u[744+k]=sub03.result[744+k];
			u[775+k]=sub03.result[775+k];
			u[806+k]=sub03.result[806+k];
			u[837+k]=sub03.result[837+k];
			u[868+k]=sub03.result[868+k];
			u[899+k]=sub03.result[899+k];
			u[930+k]=sub03.result[930+k];

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