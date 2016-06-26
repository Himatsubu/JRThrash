import net.njlab.sample.annotation.*;

public class P3_2dim{
	private static final float T[] = new float [484];
	private static final float TT[]= new float [484];
	private static final float U[] = new float [484];
	private static final float V[]= new float  [484];

	static final sub00 sub00 = new sub00();
	static final sub01 sub01 = new sub01();
	static final sub02 sub02 = new sub02();
	static final sub03 sub03 = new sub03();
	static final sub04 sub04 = new sub04();
	static final sub05 sub05 = new sub05();
	static final sub06 sub06 = new sub06();
	static final sub07 sub07 = new sub07();
	static final sub08 sub08 = new sub08();


        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
//	public static void main(String[] args){
		int k,j,n;
		int mx,my;
		float dt,dx,dy,r1,r2,r3,r4,YY;

		int kx,ky,nlast;

		kx=30;
		ky=30;
		mx=kx+1;
		my=ky+1;
		dt=0.0005f;
		nlast=400;

		dx=4f/(mx-1);
		dy=1f/(my-1);
		r1=0.5f*dt/dx;
		r2=0.5f*dt/dy;
		r3=dt/(dx*dx);
		r4=dt/(dy*dy);
/*

		dx=0.2f;
		dy=0.05f;
		r1=0.00125f;
		r2=0.005f;
		r3=0.0125f;
		r4=0.2f;	
*/

		for (k = 1; k <= my; k++){
			for (j = 1; j<= mx; j++){
			YY=dy*(k-1);
			T[j*31+k]=0.0f;
			TT[j*31+k]=0.0f;
			U[j*31+k]=40.0f*YY*(1.0f-YY);
			V[j*31+k]=0.0f;
			}
		}

		for(k=1;k<=12;k++){
			sub00.U[31+k]=U[31+k];
			sub00.V[31+k]=V[31+k];
			sub00.U[62+k]=U[62+k];
			sub00.V[62+k]=V[62+k];
			sub00.U[93+k]=U[93+k];
			sub00.V[93+k]=V[93+k];
			sub00.U[124+k]=U[124+k];
			sub00.V[124+k]=V[124+k];
			sub00.U[155+k]=U[155+k];
			sub00.V[155+k]=V[155+k];
			sub00.U[186+k]=U[186+k];
			sub00.V[186+k]=V[186+k];
			sub00.U[217+k]=U[217+k];
			sub00.V[217+k]=V[217+k];
			sub00.U[248+k]=U[248+k];
			sub00.V[248+k]=V[248+k];
			sub00.U[279+k]=U[279+k];
			sub00.V[279+k]=V[279+k];
			sub00.U[310+k]=U[310+k];
			sub00.V[310+k]=V[310+k];
			sub00.U[341+k]=U[341+k];
			sub00.V[341+k]=V[341+k];
			sub00.U[372+k]=U[372+k];
			sub00.V[372+k]=V[372+k];
			sub01.U[341+k]=U[341+k];
			sub01.V[341+k]=V[341+k];
			sub01.U[372+k]=U[372+k];
			sub01.V[372+k]=V[372+k];
			sub01.U[403+k]=U[403+k];
			sub01.V[403+k]=V[403+k];
			sub01.U[434+k]=U[434+k];
			sub01.V[434+k]=V[434+k];
			sub01.U[465+k]=U[465+k];
			sub01.V[465+k]=V[465+k];
			sub01.U[496+k]=U[496+k];
			sub01.V[496+k]=V[496+k];
			sub01.U[527+k]=U[527+k];
			sub01.V[527+k]=V[527+k];
			sub01.U[558+k]=U[558+k];
			sub01.V[558+k]=V[558+k];
			sub01.U[589+k]=U[589+k];
			sub01.V[589+k]=V[589+k];
			sub01.U[620+k]=U[620+k];
			sub01.V[620+k]=V[620+k];
			sub01.U[651+k]=U[651+k];
			sub01.V[651+k]=V[651+k];
			sub01.U[682+k]=U[682+k];
			sub01.V[682+k]=V[682+k];
			sub02.U[651+k]=U[651+k];
			sub02.V[651+k]=V[651+k];
			sub02.U[682+k]=U[682+k];
			sub02.V[682+k]=V[682+k];
			sub02.U[713+k]=U[713+k];
			sub02.V[713+k]=V[713+k];
			sub02.U[744+k]=U[744+k];
			sub02.V[744+k]=V[744+k];
			sub02.U[775+k]=U[775+k];
			sub02.V[775+k]=V[775+k];
			sub02.U[806+k]=U[806+k];
			sub02.V[806+k]=V[806+k];
			sub02.U[837+k]=U[837+k];
			sub02.V[837+k]=V[837+k];
			sub02.U[868+k]=U[868+k];
			sub02.V[868+k]=V[868+k];
			sub02.U[899+k]=U[899+k];
			sub02.V[899+k]=V[899+k];
			sub02.U[930+k]=U[930+k];
			sub02.V[930+k]=V[930+k];
			sub02.U[961+k]=U[961+k];
			sub02.V[961+k]=V[961+k];
			sub03.U[31+k+10]=U[31+k+10];
			sub03.V[31+k+10]=V[31+k+10];
			sub03.U[62+k+10]=U[62+k+10];
			sub03.V[62+k+10]=V[62+k+10];
			sub03.U[93+k+10]=U[93+k+10];
			sub03.V[93+k+10]=V[93+k+10];
			sub03.U[124+k+10]=U[124+k+10];
			sub03.V[124+k+10]=V[124+k+10];
			sub03.U[155+k+10]=U[155+k+10];
			sub03.V[155+k+10]=V[155+k+10];
			sub03.U[186+k+10]=U[186+k+10];
			sub03.V[186+k+10]=V[186+k+10];
			sub03.U[217+k+10]=U[217+k+10];
			sub03.V[217+k+10]=V[217+k+10];
			sub03.U[248+k+10]=U[248+k+10];
			sub03.V[248+k+10]=V[248+k+10];
			sub03.U[279+k+10]=U[279+k+10];
			sub03.V[279+k+10]=V[279+k+10];
			sub03.U[310+k+10]=U[310+k+10];
			sub03.V[310+k+10]=V[310+k+10];
			sub03.U[341+k+10]=U[341+k+10];
			sub03.V[341+k+10]=V[341+k+10];
			sub03.U[372+k+10]=U[372+k+10];
			sub03.V[372+k+10]=V[372+k+10];
			sub04.U[341+k+10]=U[341+k+10];
			sub04.V[341+k+10]=V[341+k+10];
			sub04.U[372+k+10]=U[372+k+10];
			sub04.V[372+k+10]=V[372+k+10];
			sub04.U[403+k+10]=U[403+k+10];
			sub04.V[403+k+10]=V[403+k+10];
			sub04.U[434+k+10]=U[434+k+10];
			sub04.V[434+k+10]=V[434+k+10];
			sub04.U[465+k+10]=U[465+k+10];
			sub04.V[465+k+10]=V[465+k+10];
			sub04.U[496+k+10]=U[496+k+10];
			sub04.V[496+k+10]=V[496+k+10];
			sub04.U[527+k+10]=U[527+k+10];
			sub04.V[527+k+10]=V[527+k+10];
			sub04.U[558+k+10]=U[558+k+10];
			sub04.V[558+k+10]=V[558+k+10];
			sub04.U[589+k+10]=U[589+k+10];
			sub04.V[589+k+10]=V[589+k+10];
			sub04.U[620+k+10]=U[620+k+10];
			sub04.V[620+k+10]=V[620+k+10];
			sub04.U[651+k+10]=U[651+k+10];
			sub04.V[651+k+10]=V[651+k+10];
			sub04.U[682+k+10]=U[682+k+10];
			sub04.V[682+k+10]=V[682+k+10];
			sub05.U[651+k+10]=U[651+k+10];
			sub05.V[651+k+10]=V[651+k+10];
			sub05.U[682+k+10]=U[682+k+10];
			sub05.V[682+k+10]=V[682+k+10];
			sub05.U[713+k+10]=U[713+k+10];
			sub05.V[713+k+10]=V[713+k+10];
			sub05.U[744+k+10]=U[744+k+10];
			sub05.V[744+k+10]=V[744+k+10];
			sub05.U[775+k+10]=U[775+k+10];
			sub05.V[775+k+10]=V[775+k+10];
			sub05.U[806+k+10]=U[806+k+10];
			sub05.V[806+k+10]=V[806+k+10];
			sub05.U[837+k+10]=U[837+k+10];
			sub05.V[837+k+10]=V[837+k+10];
			sub05.U[868+k+10]=U[868+k+10];
			sub05.V[868+k+10]=V[868+k+10];
			sub05.U[899+k+10]=U[899+k+10];
			sub05.V[899+k+10]=V[899+k+10];
			sub05.U[930+k+10]=U[930+k+10];
			sub05.V[930+k+10]=V[930+k+10];
			sub05.U[961+k+10]=U[961+k+10];
			sub05.V[961+k+10]=V[961+k+10];
		}
		for(k=21;k<=31;k++){
			sub06.U[31+k]=U[31+k];
			sub06.V[31+k]=V[31+k];
			sub06.U[62+k]=U[62+k];
			sub06.V[62+k]=V[62+k];
			sub06.U[93+k]=U[93+k];
			sub06.V[93+k]=V[93+k];
			sub06.U[124+k]=U[124+k];
			sub06.V[124+k]=V[124+k];
			sub06.U[155+k]=U[155+k];
			sub06.V[155+k]=V[155+k];
			sub06.U[186+k]=U[186+k];
			sub06.V[186+k]=V[186+k];
			sub06.U[217+k]=U[217+k];
			sub06.V[217+k]=V[217+k];
			sub06.U[248+k]=U[248+k];
			sub06.V[248+k]=V[248+k];
			sub06.U[279+k]=U[279+k];
			sub06.V[279+k]=V[279+k];
			sub06.U[310+k]=U[310+k];
			sub06.V[310+k]=V[310+k];
			sub06.U[341+k]=U[341+k];
			sub06.V[341+k]=V[341+k];
			sub06.U[372+k]=U[372+k];
			sub06.V[372+k]=V[372+k];
			sub07.U[341+k]=U[341+k];
			sub07.V[341+k]=V[341+k];
			sub07.U[372+k]=U[372+k];
			sub07.V[372+k]=V[372+k];
			sub07.U[403+k]=U[403+k];
			sub07.V[403+k]=V[403+k];
			sub07.U[434+k]=U[434+k];
			sub07.V[434+k]=V[434+k];
			sub07.U[465+k]=U[465+k];
			sub07.V[465+k]=V[465+k];
			sub07.U[496+k]=U[496+k];
			sub07.V[496+k]=V[496+k];
			sub07.U[527+k]=U[527+k];
			sub07.V[527+k]=V[527+k];
			sub07.U[558+k]=U[558+k];
			sub07.V[558+k]=V[558+k];
			sub07.U[589+k]=U[589+k];
			sub07.V[589+k]=V[589+k];
			sub07.U[620+k]=U[620+k];
			sub07.V[620+k]=V[620+k];
			sub07.U[651+k]=U[651+k];
			sub07.V[651+k]=V[651+k];
			sub08.U[651+k]=U[651+k];
			sub08.V[651+k]=V[651+k];
			sub08.U[682+k]=U[682+k];
			sub08.V[682+k]=V[682+k];
			sub08.U[713+k]=U[713+k];
			sub08.V[713+k]=V[713+k];
			sub08.U[744+k]=U[744+k];
			sub08.V[744+k]=V[744+k];
			sub08.U[775+k]=U[775+k];
			sub08.V[775+k]=V[775+k];
			sub08.U[806+k]=U[806+k];
			sub08.V[806+k]=V[806+k];
			sub08.U[837+k]=U[837+k];
			sub08.V[837+k]=V[837+k];
			sub08.U[868+k]=U[868+k];
			sub08.V[868+k]=V[868+k];
			sub08.U[899+k]=U[899+k];
			sub08.V[899+k]=V[899+k];
			sub08.U[930+k]=U[930+k];
			sub08.V[930+k]=V[930+k];
		}




		for (n = 1; n <= nlast; n++){

			//境界条件
			for (k = 1; k <= my; k++){
				T[1*31+k] = 0.0f;
				T[mx*31+k]= T[(mx-1)*31+k];
			}
		
			for (j = 1; j <= mx; j++){
				T[j*31+1] = 0.0f;
				T[j*31+my]= 0.0f;
			}
			for(j=mx/4;j<=mx/2;j++){
				T[j*31+1]=1.0f;
			}
		
		//クラスに配列をこぴー
			for(k=1;k<=12;k++){
				sub00.T[31+k]=T[31+k];
				sub00.T[62+k]=T[62+k];
				sub00.T[93+k]=T[93+k];
				sub00.T[124+k]=T[124+k];
				sub00.T[155+k]=T[155+k];
				sub00.T[186+k]=T[186+k];
				sub00.T[217+k]=T[217+k];
				sub00.T[248+k]=T[248+k];
				sub00.T[279+k]=T[279+k];
				sub00.T[310+k]=T[310+k];
				sub00.T[341+k]=T[341+k];
				sub00.T[372+k]=T[372+k];
				sub01.T[341+k]=T[341+k];
				sub01.T[372+k]=T[372+k];
				sub01.T[403+k]=T[403+k];
				sub01.T[434+k]=T[434+k];
				sub01.T[465+k]=T[465+k];
				sub01.T[496+k]=T[496+k];
				sub01.T[527+k]=T[527+k];
				sub01.T[558+k]=T[558+k];
				sub01.T[589+k]=T[589+k];
				sub01.T[620+k]=T[620+k];
				sub01.T[651+k]=T[651+k];
				sub01.T[682+k]=T[682+k];
				sub02.T[651+k]=T[651+k];
				sub02.T[682+k]=T[682+k];
				sub02.T[713+k]=T[713+k];
				sub02.T[744+k]=T[744+k];
				sub02.T[775+k]=T[775+k];
				sub02.T[806+k]=T[806+k];
				sub02.T[837+k]=T[837+k];
				sub02.T[868+k]=T[868+k];
				sub02.T[899+k]=T[899+k];
				sub02.T[930+k]=T[930+k];
				sub02.T[961+k]=T[961+k];
				sub03.T[31+k+10]=T[31+k+10];
				sub03.T[62+k+10]=T[62+k+10];
				sub03.T[93+k+10]=T[93+k+10];
				sub03.T[124+k+10]=T[124+k+10];
				sub03.T[155+k+10]=T[155+k+10];
				sub03.T[186+k+10]=T[186+k+10];
				sub03.T[217+k+10]=T[217+k+10];
				sub03.T[248+k+10]=T[248+k+10];
				sub03.T[279+k+10]=T[279+k+10];
				sub03.T[310+k+10]=T[310+k+10];
				sub03.T[341+k+10]=T[341+k+10];
				sub03.T[372+k+10]=T[372+k+10];
				sub04.T[341+k+10]=T[341+k+10];
				sub04.T[372+k+10]=T[372+k+10];
				sub04.T[403+k+10]=T[403+k+10];
				sub04.T[434+k+10]=T[434+k+10];
				sub04.T[465+k+10]=T[465+k+10];
				sub04.T[496+k+10]=T[496+k+10];
				sub04.T[527+k+10]=T[527+k+10];
				sub04.T[558+k+10]=T[558+k+10];
				sub04.T[589+k+10]=T[589+k+10];
				sub04.T[620+k+10]=T[620+k+10];
				sub04.T[651+k+10]=T[651+k+10];
				sub04.T[682+k+10]=T[682+k+10];
				sub05.T[651+k+10]=T[651+k+10];
				sub05.T[682+k+10]=T[682+k+10];
				sub05.T[713+k+10]=T[713+k+10];
				sub05.T[744+k+10]=T[744+k+10];
				sub05.T[775+k+10]=T[775+k+10];
				sub05.T[806+k+10]=T[806+k+10];
				sub05.T[837+k+10]=T[837+k+10];
				sub05.T[868+k+10]=T[868+k+10];
				sub05.T[899+k+10]=T[899+k+10];
				sub05.T[930+k+10]=T[930+k+10];
				sub05.T[961+k+10]=T[961+k+10];
			}
			for(k=21;k<=31;k++){
				sub06.T[31+k]=T[31+k];
				sub06.T[62+k]=T[62+k];
				sub06.T[93+k]=T[93+k];
				sub06.T[124+k]=T[124+k];
				sub06.T[155+k]=T[155+k];
				sub06.T[186+k]=T[186+k];
				sub06.T[217+k]=T[217+k];
				sub06.T[248+k]=T[248+k];
				sub06.T[279+k]=T[279+k];
				sub06.T[310+k]=T[310+k];
				sub06.T[341+k]=T[341+k];
				sub06.T[372+k]=T[372+k];
				sub07.T[341+k]=T[341+k];
				sub07.T[372+k]=T[372+k];
				sub07.T[403+k]=T[403+k];
				sub07.T[434+k]=T[434+k];
				sub07.T[465+k]=T[465+k];
				sub07.T[496+k]=T[496+k];
				sub07.T[527+k]=T[527+k];
				sub07.T[558+k]=T[558+k];
				sub07.T[589+k]=T[589+k];
				sub07.T[620+k]=T[620+k];
				sub07.T[651+k]=T[651+k];
				sub07.T[682+k]=T[682+k];
				sub08.T[651+k]=T[651+k];
				sub08.T[682+k]=T[682+k];
				sub08.T[713+k]=T[713+k];
				sub08.T[744+k]=T[744+k];
				sub08.T[775+k]=T[775+k];
				sub08.T[837+k]=T[837+k];
				sub08.T[868+k]=T[868+k];
				sub08.T[899+k]=T[899+k];
				sub08.T[930+k]=T[930+k];
				sub08.T[961+k]=T[961+k];
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
				T[62+k]=sub00.result[62+k];
				T[93+k]=sub00.result[93+k];
				T[124+k]=sub00.result[124+k];
				T[155+k]=sub00.result[155+k];
				T[186+k]=sub00.result[186+k];
				T[217+k]=sub00.result[217+k];
				T[248+k]=sub00.result[248+k];
				T[279+k]=sub00.result[279+k];
				T[310+k]=sub00.result[310+k];
				T[341+k]=sub00.result[341+k];
				T[372+k]=sub01.result[372+k];
				T[403+k]=sub01.result[403+k];
				T[434+k]=sub01.result[434+k];
				T[465+k]=sub01.result[465+k];
				T[496+k]=sub01.result[496+k];
				T[527+k]=sub01.result[527+k];
				T[558+k]=sub01.result[558+k];
				T[589+k]=sub01.result[589+k];
				T[620+k]=sub01.result[620+k];
				T[651+k]=sub01.result[651+k];
				T[682+k]=sub02.result[682+k];
				T[713+k]=sub02.result[713+k];
				T[744+k]=sub02.result[744+k];
				T[775+k]=sub02.result[775+k];
				T[806+k]=sub02.result[806+k];
				T[837+k]=sub02.result[837+k];
				T[868+k]=sub02.result[868+k];
				T[899+k]=sub02.result[899+k];
				T[930+k]=sub02.result[930+k];
				T[62+k+10]=sub03.result[62+k+10];
				T[93+k+10]=sub03.result[93+k+10];
				T[124+k+10]=sub03.result[124+k+10];
				T[155+k+10]=sub03.result[155+k+10];
				T[186+k+10]=sub03.result[186+k+10];
				T[217+k+10]=sub03.result[217+k+10];
				T[248+k+10]=sub03.result[248+k+10];
				T[279+k+10]=sub03.result[279+k+10];
				T[310+k+10]=sub03.result[310+k+10];
				T[341+k+10]=sub03.result[341+k+10];
				T[372+k+10]=sub04.result[372+k+10];
				T[403+k+10]=sub04.result[403+k+10];
				T[434+k+10]=sub04.result[434+k+10];
				T[465+k+10]=sub04.result[465+k+10];
				T[496+k+10]=sub04.result[496+k+10];
				T[527+k+10]=sub04.result[527+k+10];
				T[558+k+10]=sub04.result[558+k+10];
				T[589+k+10]=sub04.result[589+k+10];
				T[620+k+10]=sub04.result[620+k+10];
				T[651+k+10]=sub04.result[651+k+10];
				T[682+k+10]=sub05.result[682+k+10];
				T[713+k+10]=sub05.result[713+k+10];
				T[744+k+10]=sub05.result[744+k+10];
				T[775+k+10]=sub05.result[775+k+10];
				T[806+k+10]=sub05.result[806+k+10];
				T[837+k+10]=sub05.result[837+k+10];
				T[868+k+10]=sub05.result[868+k+10];
				T[899+k+10]=sub05.result[899+k+10];
				T[930+k+10]=sub05.result[930+k+10];
			}
			for(k=22;k<=30;k++){
				T[62+k]=sub06.result[62+k];
				T[93+k]=sub06.result[93+k];
				T[124+k]=sub06.result[124+k];
				T[155+k]=sub06.result[155+k];
				T[186+k]=sub06.result[186+k];
				T[217+k]=sub06.result[217+k];
				T[248+k]=sub06.result[248+k];
				T[279+k]=sub06.result[279+k];
				T[310+k]=sub06.result[310+k];
				T[341+k]=sub06.result[341+k];
				T[372+k]=sub07.result[372+k];
				T[403+k]=sub07.result[403+k];
				T[434+k]=sub07.result[434+k];
				T[465+k]=sub07.result[465+k];
				T[496+k]=sub07.result[496+k];
				T[527+k]=sub07.result[527+k];
				T[558+k]=sub07.result[558+k];
				T[589+k]=sub07.result[589+k];
				T[620+k]=sub07.result[620+k];
				T[651+k]=sub07.result[651+k];
				T[682+k]=sub08.result[682+k];
				T[713+k]=sub08.result[713+k];
				T[744+k]=sub08.result[744+k];
				T[775+k]=sub08.result[775+k];
				T[806+k]=sub08.result[806+k];
				T[837+k]=sub08.result[837+k];
				T[868+k]=sub08.result[868+k];
				T[899+k]=sub08.result[899+k];
				T[930+k]=sub08.result[930+k];
			}

		}
		//System.out.println(T[10*21+10]);
}
}
