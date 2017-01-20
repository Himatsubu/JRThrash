import net.njlab.sample.annotation.*;


public class subunder extends Thread{
        final float[] u     = new float[8643];
	//final float[] q     = new float[16900];
	final float[] result =new float[8643];
	float r1,r2,dx,dy,dt;

        @JRThrashUnroll(unrollNum=32, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
		int k,j;

		int s_under2up_re = 0;
		int s_under2up_we = 0;
		int s_up2under_re = 0;
		int s_up2under_we = 0;

/*
                float r1 = 0.2f;
		float r2 = 0.2f;
		float dx = 0.05f;
		float dy = 0.05f;
		float dt = 0.0005f;
*/
		dx=1f/(129-1);
		dy=1f/(129-1);
		dt=0.005f;
		r1=dt/(dx*dx);
		r2=dt/(dy*dy);

		for(k=2;k<=128;k++){
			for(j=2;j<=65;j++){
			result[j*129+k]= u[j*129+k]+r1*(u[(j+1)*129+k]-2.0f*u[j*129+k]+u[(j-1)*129+k])
			+r2*(u[j*129+k+1]-2.0f*u[j*129+k]+u[j*129+k-1])+dt*100f*dx*(j+63-1)*dy*(k-1);			
			
			}
		}
		for(k=2;k<=128;k++){
			for(j=2;j<=65;j++){
				u[j*129+k]=result[j*129+k];
			}
		}

		//袖領域の書き込み
		for(k=1;k<129;k++){
			s_under2up_we = 1;
			fifo_under2up(u[64*129+k],s_under2up_we,s_under2up_re);
			s_under2up_re = 0;
		}
		//袖領域の読み込み
		for(k=1;k<129;k++){
			s_up2under_re = 1;
			u[65*129+k]=fifo_up2under(0,s_up2under_we,s_up2under_we);
			s_up2under_re = 0;	
	        }
	}

	@JRThrashConvertedIntoIPcore(availableNum=1,latency=5,throughput=5,outputPName="p",
					clockPName="clk",clockEnablePName="ce",resetPName="rst",
					newDataPName="operation_nd",haveClock=true,haveReset=true,haveNewData=true)
	private float fifo_under2up(float in,int s_we,int s_re){
		return in;
	}

	@JRThrashConvertedIntoIPcore(availableNum=1,latency=7,throughput=7,outputPName="p",
					clockPName="clk",clockEnablePName="ce",resetPName="rst",
					newDataPName="operation_nd",haveClock=true,haveReset=true,haveNewData=true)
	private float fifo_up2under(float in,int s_we,int s_re){
		return in;
	}

}

