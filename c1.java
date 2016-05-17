public class c1{
	private static final float[] u = new float[484];
	private static final float[] uu= new float[484];
	private static final float[] q = new float[484];
	private static int nlast =400;

	static final sub   sub00 = new sub();
	static final sub   sub01 = new sub();
	static final sub   sub02 = new sub();
	static final sub   sub03 = new sub();
	static final sub   sub04 = new sub();
	static final sub   sub05 = new sub();
	static final sub   sub06 = new sub();
	static final sub   sub07 = new sub();
	static final sub   sub08 = new sub();
	static final sub   sub09 = new sub();
	static final sub   sub10 = new sub();
	static final sub   sub11 = new sub();
	static final sub   sub12 = new sub();
	static final sub   sub13 = new sub();
	static final sub   sub14 = new sub();
	static final sub   sub15 = new sub();
	static final sub   sub16 = new sub();
	static final sub   sub17 = new sub();
	static final sub   sub18 = new sub();
	//final run   run19 = new runundar();

	//public void run(){
	public static void main(String[] args){
		int k,j,n,mx,my;
		float dx,dy;

		mx=21;
		my=21;
		dx = 0.05f;
		dy = 0.05f;
			
		for(k=1;k<=my;k++)
		{
			for(j=1;j<=mx;j++)
			{
				q[j*21+k]=100f*dx*dy*j*k;
				u[j*21+k]=0f;
			       uu[j*21+k]=0f;
			}
		}
		
		for(n=0;n<nlast;n++){
			for(k=1;k<=my;k++)
			{
				u[21+k]=0.05f;
				u[mx*21+k]=0f;
			}
			for(j=1;j<=mx;j++)
			{
				u[j*21+1]=0.05f;
				u[j*21+my]=0f;
			}
			for(k=1;k<=63;k++){
				sub00.u[k]=u[21+k];
				sub00.arrayq[k]=q[21+k];
				sub01.u[k]=u[42+k];
				sub01.arrayq[k]=q[42+k];
				sub02.u[k]=u[63+k];
				sub02.arrayq[k]=q[63+k];
				sub03.u[k]=u[84+k];
				sub03.arrayq[k]=q[84+k];
				sub04.u[k]=u[105+k];
				sub04.arrayq[k]=q[105+k];
				sub05.u[k]=u[126+k];
				sub05.arrayq[k]=q[126+k];
				sub06.u[k]=u[147+k];
				sub06.arrayq[k]=q[147+k];
				sub07.u[k]=u[168+k];
				sub07.arrayq[k]=q[168+k];
				sub08.u[k]=u[189+k];
				sub08.arrayq[k]=q[189+k];
				sub09.u[k]=u[210+k];
				sub09.arrayq[k]=q[210+k];
				sub10.u[k]=u[231+k];
				sub10.arrayq[k]=q[231+k];
				sub11.u[k]=u[252+k];
				sub11.arrayq[k]=q[252+k];
				sub12.u[k]=u[273+k];
				sub12.arrayq[k]=q[273+k];
				sub13.u[k]=u[294+k];
				sub13.arrayq[k]=q[294+k];
				sub14.u[k]=u[315+k];
				sub14.arrayq[k]=q[315+k];
				sub15.u[k]=u[336+k];
				sub15.arrayq[k]=q[336+k];
				sub16.u[k]=u[357+k];
				sub16.arrayq[k]=q[357+k];
				sub17.u[k]=u[378+k];
				sub17.arrayq[k]=q[378+k];
				sub18.u[k]=u[399+k];
				sub18.arrayq[k]=q[399+k];
			}
			System.out.println(u[10*21+10]);			
			sub00.run();
			sub01.run();
			sub02.run();
			sub03.run();
			sub04.run();
			sub05.run();
			sub06.run();
			sub07.run();
			sub08.run();
			sub09.run();
			sub10.run();
			sub11.run();
			sub12.run();
			sub13.run();
			sub14.run();
			sub15.run();
			sub16.run();
			sub17.run();
			sub18.run();

/*
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
				//sub18.join();
				//sub19.join();
			}catch(Exception e){}
*/
			for(int i=1;i<=21;i++){
				u[21+i]=sub00.arrayX[i];
				u[42+i]=sub01.arrayX[i];
				u[63+i]=sub02.arrayX[i];
				u[84+i]=sub03.arrayX[i];
				u[105+i]=sub04.arrayX[i];
				u[126+i]=sub05.arrayX[i];
				u[147+i]=sub06.arrayX[i];
				u[168+i]=sub07.arrayX[i];
				u[189+i]=sub08.arrayX[i];
				u[210+i]=sub09.arrayX[i];
				u[231+i]=sub10.arrayX[i];
				u[252+i]=sub11.arrayX[i];
				u[273+i]=sub12.arrayX[i];
				u[294+i]=sub13.arrayX[i];
				u[315+i]=sub14.arrayX[i];
				u[336+i]=sub15.arrayX[i];
				u[357+i]=sub16.arrayX[i];
				u[378+i]=sub17.arrayX[i];
				u[399+i]=sub18.arrayX[i];
				//u[420+i]=sub19.arrayX[i];
			}
		

		}
		System.out.println(u[10*21+10]);
		//return 0;
	}
}
