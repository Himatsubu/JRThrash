import net.njlab.sample.annotation.*;

public class P3_2dim{
		private static final float T[] = new float [1024];
		private static final float TT[]= new float [1024];
		private static final float U[] = new float [1024];
		private static final float V[]= new float  [1024];

	static final subup sub00    = new subup();
	static final subunder sub01 = new subunder();

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
		nlast=2;

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
		for(k=1;k<=16;k++);{
			sub00.U[31+k]=U[31+k];
			sub00.U[62+k]=U[62+k];
			sub00.U[93+k]=U[93+k];
			sub00.U[124+k]=U[124+k];
			sub00.U[155+k]=U[155+k];
			sub00.U[186+k]=U[186+k];
			sub00.U[217+k]=U[217+k];
			sub00.U[248+k]=U[248+k];
			sub00.U[279+k]=U[279+k];
			sub00.U[310+k]=U[310+k];
			sub00.U[341+k]=U[341+k];
			sub00.U[372+k]=U[372+k];
			sub00.U[403+k]=U[403+k];
			sub00.U[434+k]=U[434+k];
			sub00.U[465+k]=U[465+k];
			sub00.U[496+k]=U[496+k];
			sub00.U[527+k]=U[527+k];
			sub00.U[558+k]=U[558+k];
			sub00.U[589+k]=U[589+k];
			sub00.U[620+k]=U[620+k];
			sub00.U[651+k]=U[651+k];
			sub00.U[682+k]=U[682+k];
			sub00.U[713+k]=U[713+k];
			sub00.U[744+k]=U[744+k];
			sub00.U[775+k]=U[775+k];
			sub00.U[806+k]=U[806+k];
			sub00.U[837+k]=U[837+k];
			sub00.U[868+k]=U[868+k];
			sub00.U[899+k]=U[899+k];
			sub00.U[930+k]=U[930+k];
			sub00.U[961+k]=U[961+k];

			sub00.V[31+k]=U[31+k];
			sub00.V[62+k]=U[62+k];
			sub00.V[93+k]=U[93+k];
			sub00.V[124+k]=U[124+k];
			sub00.V[155+k]=U[155+k];
			sub00.V[186+k]=U[186+k];
			sub00.V[217+k]=U[217+k];
			sub00.V[248+k]=U[248+k];
			sub00.V[279+k]=U[279+k];
			sub00.V[310+k]=U[310+k];
			sub00.V[341+k]=U[341+k];
			sub00.V[372+k]=U[372+k];
			sub00.V[403+k]=U[403+k];
			sub00.V[434+k]=U[434+k];
			sub00.V[465+k]=U[465+k];
			sub00.V[496+k]=U[496+k];
			sub00.V[527+k]=U[527+k];
			sub00.V[558+k]=U[558+k];
			sub00.V[589+k]=U[589+k];
			sub00.V[620+k]=U[620+k];
			sub00.V[651+k]=U[651+k];
			sub00.V[682+k]=U[682+k];
			sub00.V[713+k]=U[713+k];
			sub00.V[744+k]=U[744+k];
			sub00.V[775+k]=U[775+k];
			sub00.V[806+k]=U[806+k];
			sub00.V[837+k]=U[837+k];
			sub00.V[868+k]=U[868+k];
			sub00.V[899+k]=U[899+k];
			sub00.V[930+k]=U[930+k];
			sub00.V[961+k]=U[961+k];
		}
		for(k=15;k<=31;k++){
			sub01.U[31+k]=U[31+k];
			sub01.U[62+k]=U[62+k];
			sub01.U[93+k]=U[93+k];
			sub01.U[124+k]=U[124+k];
			sub01.U[155+k]=U[155+k];
			sub01.U[186+k]=U[186+k];
			sub01.U[217+k]=U[217+k];
			sub01.U[248+k]=U[248+k];
			sub01.U[279+k]=U[279+k];
			sub01.U[310+k]=U[310+k];
			sub01.U[341+k]=U[341+k];
			sub01.U[372+k]=U[372+k];
			sub01.U[403+k]=U[403+k];
			sub01.U[434+k]=U[434+k];
			sub01.U[465+k]=U[465+k];
			sub01.U[496+k]=U[496+k];
			sub01.U[527+k]=U[527+k];
			sub01.U[558+k]=U[558+k];
			sub01.U[589+k]=U[589+k];
			sub01.U[620+k]=U[620+k];
			sub01.U[651+k]=U[651+k];
			sub01.U[682+k]=U[682+k];
			sub01.U[713+k]=U[713+k];
			sub01.U[744+k]=U[744+k];
			sub01.U[775+k]=U[775+k];
			sub01.U[806+k]=U[806+k];
			sub01.U[837+k]=U[837+k];
			sub01.U[868+k]=U[868+k];
			sub01.U[899+k]=U[899+k];
			sub01.U[930+k]=U[930+k];
			sub01.U[961+k]=U[961+k];
			sub01.V[31+k]=U[31+k];
			sub01.V[62+k]=U[62+k];
			sub01.V[93+k]=U[93+k];
			sub01.V[124+k]=U[124+k];
			sub01.V[155+k]=U[155+k];
			sub01.V[186+k]=U[186+k];
			sub01.V[217+k]=U[217+k];
			sub01.V[248+k]=U[248+k];
			sub01.V[279+k]=U[279+k];
			sub01.V[310+k]=U[310+k];
			sub01.V[341+k]=U[341+k];
			sub01.V[372+k]=U[372+k];
			sub01.V[403+k]=U[403+k];
			sub01.V[434+k]=U[434+k];
			sub01.V[465+k]=U[465+k];
			sub01.V[496+k]=U[496+k];
			sub01.V[527+k]=U[527+k];
			sub01.V[558+k]=U[558+k];
			sub01.V[589+k]=U[589+k];
			sub01.V[620+k]=U[620+k];
			sub01.V[651+k]=U[651+k];
			sub01.V[682+k]=U[682+k];
			sub01.V[713+k]=U[713+k];
			sub01.V[744+k]=U[744+k];
			sub01.V[775+k]=U[775+k];
			sub01.V[806+k]=U[806+k];
			sub01.V[837+k]=U[837+k];
			sub01.V[868+k]=U[868+k];
			sub01.V[899+k]=U[899+k];
			sub01.V[930+k]=U[930+k];
			sub01.V[961+k]=U[961+k];
		}

//	計算ループ
		for (n = 1; n <= nlast; n++){

//	境界条件
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
				sub00.T[527+k]=T[527+k];
				sub00.T[558+k]=T[558+k];
				sub00.T[589+k]=T[589+k];
				sub00.T[620+k]=T[620+k];
				sub00.T[651+k]=T[651+k];
				sub00.T[682+k]=T[682+k];
				sub00.T[713+k]=T[713+k];
				sub00.T[744+k]=T[744+k];
				sub00.T[775+k]=T[775+k];
				sub00.T[806+k]=T[806+k];
				sub00.T[837+k]=T[837+k];
				sub00.T[868+k]=T[868+k];
				sub00.T[899+k]=T[899+k];
				sub00.T[930+k]=T[930+k];
				sub00.T[961+k]=T[961+k];

		}
		for(k=15;k<=31;k++){
				sub01.T[31+k]=T[31+k];
				sub01.T[62+k]=T[62+k];
				sub01.T[93+k]=T[93+k];
				sub01.T[124+k]=T[124+k];
				sub01.T[155+k]=T[155+k];
				sub01.T[186+k]=T[186+k];
				sub01.T[217+k]=T[217+k];
				sub01.T[248+k]=T[248+k];
				sub01.T[279+k]=T[279+k];
				sub01.T[310+k]=T[310+k];
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


		sub00.start();
		sub01.start();
	
		try{
			sub00.join();
			sub01.join();
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
			T[496+k]=sub00.result[496+k];
			T[527+k]=sub00.result[527+k];
			T[558+k]=sub00.result[558+k];
			T[589+k]=sub00.result[589+k];
			T[620+k]=sub00.result[620+k];
			T[651+k]=sub00.result[651+k];
			T[682+k]=sub00.result[682+k];
			T[713+k]=sub00.result[713+k];
			T[744+k]=sub00.result[744+k];
			T[775+k]=sub00.result[775+k];
			T[806+k]=sub00.result[806+k];
			T[837+k]=sub00.result[837+k];
			T[868+k]=sub00.result[868+k];
			T[899+k]=sub00.result[899+k];
			T[930+k]=sub00.result[930+k];
		}
		for(k=16;k<=30;k++){
			T[62+k]=sub01.result[62+k];
			T[93+k]=sub01.result[93+k];
			T[124+k]=sub01.result[124+k];
			T[155+k]=sub01.result[155+k];
			T[186+k]=sub01.result[186+k];
			T[217+k]=sub01.result[217+k];
			T[248+k]=sub01.result[248+k];
			T[279+k]=sub01.result[279+k];
			T[310+k]=sub01.result[310+k];
			T[341+k]=sub01.result[341+k];
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

		}
		//System.out.println(T[10*21+10]);
}
}

