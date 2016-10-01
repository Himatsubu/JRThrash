import net.njlab.sample.annotation.*;
//分割数２

public class c1_test{
	private static final float[] u = new float[1024];
	private static final float[] uu= new float[1024];
	private static final float[] q = new float[1024];

	static final subup sub00    = new subup();
	static final subunder sub01 = new subunder();

        @JRThrashUnroll(unrollNum=20, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
	//public static void main(String[] args){
		int k,j,n,mx,my,nlast;
		float dx,dy;

		mx=21;
		my=21;
		dx = 0.05f;
		dy = 0.05f;
		nlast=2;

//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 q[j*21+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*21+k] = 0f;
			uu[j*21+k] = 0f;
		}
	}

//	計算ループ
	for(n=1;n<=nlast;n++){
//	境界条件
		for (j = 1; j <= my; j++)
		{
			u[21+j] = 0.5f;
			u[mx*21+j]= 0f;
			u[j*21+1] = 1.f;
			u[j*21+my]= 0f;
		}

		//クラスに配列をこぴー
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
		      sub00.u[527+k]=u[527+k];
		      sub00.u[558+k]=u[558+k];
		      sub00.u[589+k]=u[589+k];
		      sub00.u[620+k]=u[620+k];
		      sub00.u[651+k]=u[651+k];
		      sub00.u[682+k]=u[682+k];
		      sub00.u[713+k]=u[713+k];
		      sub00.u[744+k]=u[744+k];
		      sub00.u[775+k]=u[775+k];
		      sub00.u[806+k]=u[806+k];
		      sub00.u[837+k]=u[837+k];
		      sub00.u[868+k]=u[868+k];
		      sub00.u[899+k]=u[899+k];
		      sub00.u[930+k]=u[930+k];
		      sub00.u[961+k]=u[961+k];
		}
		sub00.start();

		for(k=15;k<=my;k++)
		{
		      sub01.u[31+k]=u[31+k];
		      sub01.u[62+k]=u[62+k];
		      sub01.u[93+k]=u[93+k];
		      sub01.u[124+k]=u[124+k];
		      sub01.u[155+k]=u[155+k];
		      sub01.u[186+k]=u[186+k];
		      sub01.u[217+k]=u[217+k];
		      sub01.u[248+k]=u[248+k];
		      sub01.u[279+k]=u[279+k];
		      sub01.u[310+k]=u[310+k];
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

		sub01.start();

		try{
			sub00.join();
			sub01.join();
		}catch(Exception e){}


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
		      u[496+k]=sub00.result[496+k];
		      u[527+k]=sub00.result[527+k];
		      u[558+k]=sub00.result[558+k];
		      u[589+k]=sub00.result[589+k];
		      u[620+k]=sub00.result[620+k];
		      u[651+k]=sub00.result[651+k];
		      u[682+k]=sub00.result[682+k];
		      u[713+k]=sub00.result[713+k];
		      u[744+k]=sub00.result[744+k];
		      u[775+k]=sub00.result[775+k];
		      u[806+k]=sub00.result[806+k];
		      u[837+k]=sub00.result[837+k];
		      u[868+k]=sub00.result[868+k];
		      u[899+k]=sub00.result[899+k];
		      u[930+k]=sub00.result[930+k];
		}
		for(k=16;k<=30;k++)
		{
		      u[62+k]=sub01.result[62+k];
		      u[93+k]=sub01.result[93+k];
		      u[124+k]=sub01.result[124+k];
		      u[155+k]=sub01.result[155+k];
		      u[186+k]=sub01.result[186+k];
		      u[217+k]=sub01.result[217+k];
		      u[248+k]=sub01.result[248+k];
		      u[279+k]=sub01.result[279+k];
		      u[310+k]=sub01.result[310+k];
		      u[341+k]=sub01.result[341+k];
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
		//System.out.println(u[210+10]);
	}
}
