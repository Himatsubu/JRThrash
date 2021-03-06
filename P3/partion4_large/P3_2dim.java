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

        @JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
//	public static void main(String[] args){
		int k,j,n;
		int mx,my;
		float dt,dx,dy,r1,r2,r3,r4,YY;

		int kx,ky,nlast;

		kx=20;
		ky=20;
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
			T[j*21+k]=0.0f;
			TT[j*21+k]=0.0f;
			U[j*21+k]=40.0f*YY*(1.0f-YY);
			V[j*21+k]=0.0f;
			}
		}

		for(k=1;k<=16;k++){
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
			sub00.U[403+k]=U[403+k];
			sub00.V[403+k]=V[403+k];
			sub00.U[434+k]=U[434+k];
			sub00.V[434+k]=V[434+k];
			sub00.U[465+k]=U[465+k];
			sub00.V[465+k]=V[465+k];
			sub00.U[496+k]=U[496+k];
			sub00.V[496+k]=V[496+k];
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
			sub01.U[713+k]=U[713+k];
			sub01.V[713+k]=V[713+k];
			sub01.U[744+k]=U[744+k];
			sub01.V[744+k]=V[744+k];
			sub01.U[775+k]=U[775+k];
			sub01.V[775+k]=V[775+k];
			sub01.U[806+k]=U[806+k];
			sub01.V[806+k]=V[806+k];
			sub01.U[837+k]=U[837+k];
			sub01.V[837+k]=V[837+k];
			sub01.U[868+k]=U[868+k];
			sub01.V[868+k]=V[868+k];
			sub01.U[899+k]=U[899+k];
			sub01.V[899+k]=V[899+k];
			sub01.U[930+k]=U[930+k];
			sub01.V[930+k]=V[930+k];
			sub01.U[961+k]=U[961+k];
			sub01.V[961+k]=V[961+k];
		}
		for(k=15;k<=31;k++){
			sub02.U[31+k]=U[31+k];
			sub02.V[31+k]=V[31+k];
			sub02.U[62+k]=U[62+k];
			sub02.V[62+k]=V[62+k];
			sub02.U[93+k]=U[93+k];
			sub02.V[93+k]=V[93+k];
			sub02.U[124+k]=U[124+k];
			sub02.V[124+k]=V[124+k];
			sub02.U[155+k]=U[155+k];
			sub02.V[155+k]=V[155+k];
			sub02.U[186+k]=U[186+k];
			sub02.V[186+k]=V[186+k];
			sub02.U[217+k]=U[217+k];
			sub02.V[217+k]=V[217+k];
			sub02.U[248+k]=U[248+k];
			sub02.V[248+k]=V[248+k];
			sub02.U[279+k]=U[279+k];
			sub02.V[279+k]=V[279+k];
			sub02.U[310+k]=U[310+k];
			sub02.V[310+k]=V[310+k];
			sub02.U[341+k]=U[341+k];
			sub02.V[341+k]=V[341+k];
			sub02.U[372+k]=U[372+k];
			sub02.V[372+k]=V[372+k];
			sub02.U[403+k]=U[403+k];
			sub02.V[403+k]=V[403+k];
			sub02.U[434+k]=U[434+k];
			sub02.V[434+k]=V[434+k];
			sub02.U[465+k]=U[465+k];
			sub02.V[465+k]=V[465+k];
			sub02.U[496+k]=U[496+k];
			sub02.V[496+k]=V[496+k];
			sub03.U[465+k]=U[465+k];
			sub03.V[465+k]=V[465+k];
			sub03.U[496+k]=U[496+k];
			sub03.V[496+k]=V[496+k];
			sub03.U[527+k]=U[527+k];
			sub03.V[527+k]=V[527+k];
			sub03.U[558+k]=U[558+k];
			sub03.V[558+k]=V[558+k];
			sub03.U[589+k]=U[589+k];
			sub03.V[589+k]=V[589+k];
			sub03.U[620+k]=U[620+k];
			sub03.V[620+k]=V[620+k];
			sub03.U[651+k]=U[651+k];
			sub03.V[651+k]=V[651+k];
			sub03.U[682+k]=U[682+k];
			sub03.V[682+k]=V[682+k];
			sub03.U[713+k]=U[713+k];
			sub03.V[713+k]=V[713+k];
			sub03.U[744+k]=U[744+k];
			sub03.V[744+k]=V[744+k];
			sub03.U[775+k]=U[775+k];
			sub03.V[775+k]=V[775+k];
			sub03.U[806+k]=U[806+k];
			sub03.V[806+k]=V[806+k];
			sub03.U[837+k]=U[837+k];
			sub03.V[837+k]=V[837+k];
			sub03.U[868+k]=U[868+k];
			sub03.V[868+k]=V[868+k];
			sub03.U[899+k]=U[899+k];
			sub03.V[899+k]=V[899+k];
			sub03.U[930+k]=U[930+k];
			sub03.V[930+k]=V[930+k];
			sub03.U[961+k]=U[961+k];
			sub03.V[961+k]=V[961+k];
		}




		for (n = 1; n <= nlast; n++){

//	境界条件
			for (k = 1; k <= my; k++){
				T[1*21+k] = 0.0f;
				T[mx*21+k]= T[(mx-1)*21+k];
			}
		
			for (j = 1; j <= mx; j++){
				T[j*21+1] = 0.0f;
				T[j*21+my]= 0.0f;
			}
			for(j=mx/4;j<=mx/2;j++){
				T[j*21+1]=1.0f;
			}
		
		//クラスに配列をこぴー
			for(k=1;k<=16;k++){
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
				sub00.T[403+k]=T[403+k];
				sub00.T[434+k]=T[434+k];
				sub00.T[465+k]=T[465+k];
				sub00.T[496+k]=T[496+k];
				sub01.T[465+k]=T[465+k];
				sub01.T[496+k]=T[496+k];
				sub01.T[527+k]=T[527+k];
				sub01.T[558+k]=T[558+k];
				sub01.T[589+k]=T[589+k];
				sub01.T[620+k]=T[620+k];
				sub01.T[651+k]=T[651+k];
				sub01.T[682+k]=T[682+k];
				sub01.T[713+k]=T[713+k];
				sub01.T[744+k]=T[744+k];
				sub01.T[775+k]=T[775+k];
				sub01.T[806+k]=T[806+k];
				sub01.T[837+k]=T[837+k];
				sub01.T[868+k]=T[868+k];
				sub01.T[899+k]=T[899+k];
				sub01.T[930+k]=T[930+k];
				sub01.T[961+k]=T[961+k];
			}
			for(k=15;k<=31;k++){
				sub02.T[31+k]=T[31+k];
				sub02.T[62+k]=T[62+k];
				sub02.T[93+k]=T[93+k];
				sub02.T[124+k]=T[124+k];
				sub02.T[155+k]=T[155+k];
				sub02.T[186+k]=T[186+k];
				sub02.T[217+k]=T[217+k];
				sub02.T[248+k]=T[248+k];
				sub02.T[279+k]=T[279+k];
				sub02.T[310+k]=T[310+k];
				sub02.T[341+k]=T[341+k];
				sub02.T[372+k]=T[372+k];
				sub02.T[403+k]=T[403+k];
				sub02.T[434+k]=T[434+k];
				sub02.T[465+k]=T[465+k];
				sub02.T[496+k]=T[496+k];
				sub03.T[465+k]=T[465+k];
				sub03.T[496+k]=T[496+k];
				sub03.T[527+k]=T[527+k];
				sub03.T[558+k]=T[558+k];
				sub03.T[589+k]=T[589+k];
				sub03.T[620+k]=T[620+k];
				sub03.T[651+k]=T[651+k];
				sub03.T[682+k]=T[682+k];
				sub03.T[713+k]=T[713+k];
				sub03.T[744+k]=T[744+k];
				sub03.T[775+k]=T[775+k];
				sub03.T[806+k]=T[806+k];
				sub03.T[837+k]=T[837+k];
				sub03.T[868+k]=T[868+k];
				sub03.T[899+k]=T[899+k];
				sub03.T[930+k]=T[930+k];
				sub03.T[961+k]=T[961+k];
			}


		sub00.start();
		sub01.start();
		sub02.start();
		sub03.start();
		try{
			sub00.join();
			sub01.join();
			sub02.join();
			sub03.join();
		}catch(Exception e){}

		for(k=2;k<=15;k++){
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
			T[372+k]=sub00.result[372+k];
			T[403+k]=sub00.result[403+k];
			T[434+k]=sub00.result[434+k];
			T[465+k]=sub00.result[465+k];
			T[496+k]=sub01.result[496+k];
			T[527+k]=sub01.result[527+k];
			T[558+k]=sub01.result[558+k];
			T[589+k]=sub01.result[589+k];
			T[620+k]=sub01.result[620+k];
			T[651+k]=sub01.result[651+k];
			T[682+k]=sub01.result[682+k];
			T[713+k]=sub01.result[713+k];
			T[744+k]=sub01.result[744+k];
			T[775+k]=sub01.result[775+k];
			T[806+k]=sub01.result[806+k];
			T[837+k]=sub01.result[837+k];
			T[868+k]=sub01.result[868+k];
			T[899+k]=sub01.result[899+k];
			T[930+k]=sub01.result[930+k];
		}
		for(k=16;k<=30;k++){
			T[62+k]=sub02.result[62+k];
			T[93+k]=sub02.result[93+k];
			T[124+k]=sub02.result[124+k];
			T[155+k]=sub02.result[155+k];
			T[186+k]=sub02.result[186+k];
			T[217+k]=sub02.result[217+k];
			T[248+k]=sub02.result[248+k];
			T[279+k]=sub02.result[279+k];
			T[310+k]=sub02.result[310+k];
			T[341+k]=sub02.result[341+k];
			T[372+k]=sub02.result[372+k];
			T[403+k]=sub02.result[403+k];
			T[434+k]=sub02.result[434+k];
			T[465+k]=sub02.result[465+k];
			T[496+k]=sub03.result[496+k];
			T[527+k]=sub03.result[527+k];
			T[558+k]=sub03.result[558+k];
			T[589+k]=sub03.result[589+k];
			T[620+k]=sub03.result[620+k];
			T[651+k]=sub03.result[651+k];
			T[682+k]=sub03.result[682+k];
			T[713+k]=sub03.result[713+k];
			T[744+k]=sub03.result[744+k];
			T[775+k]=sub03.result[775+k];
			T[806+k]=sub03.result[806+k];
			T[837+k]=sub03.result[837+k];
			T[868+k]=sub03.result[868+k];
			T[899+k]=sub03.result[899+k];
			T[930+k]=sub03.result[930+k];
		}

		}
		//System.out.println(T[10*21+10]);
}
}

