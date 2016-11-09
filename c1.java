import net.njlab.sample.annotation.*;

public class c1{
	//
	//実際は20*20の領域の計算
	private static final float u[] = new float [16900];
	private static final float uu[]= new float [16900];
	//private static final float q[] = new float [16900];

        @JRThrashUnroll(unrollNum=12, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public float run(){
//	public static void main(String[] args){
		int k,j,n;
		int mx,my;
		float dt,dx,dy,r1,r2;
		int kx,ky,nlast;

		kx=128;
		ky=128;
		mx=129;
		my=129;
		dt=0.0005f;
		nlast=1;

		dx = 1f/(mx-1);
		dy = 1f/(my-1);
		r1 = dt/(dx*dx);
		r2 = dt/(dy*dy);

/*
		dx=0.05f;
		dy=0.05f;
		r1=0.2f;
		r2=0.2f;
*/

//	熱源項の定義と初期条件
	for (k = 1; k <= my; k++)
	{
		for (j = 1; j<= mx; j++)
		{
			 //q[j*129+k] = 100f*dx*(j-1)*dy*(k-1);
			 u[j*129+k] = 0f;
			uu[j*129+k] = 0f;
		}
	}
		
//	境界条件
		for (k = 1; k <= my; k++)
		{
			u[1*129+k] = 0.5f;
			u[mx*129+k]= 0f;
		}
		
		for (j = 1; j <= mx; j++)
		{
			u[j*129+1] = 1.f;
			u[j*129+my]= 0f;
		}

//	次の時間での温度の計算
//	計算ループ
	for (n = 1; n <= nlast; n++)
	{

		for (k = 2; k <= my-1; k++)
		{
			for (j = 2; j <= mx-1; j++)
			{
				//q=100f*dx*(j-1)*dy*(k-1);
				uu[j*129+k]= u[j*129+k]+r1*(u[(j+1)*129+k]-2.0f*u[j*129+k]+u[(j-1)*129+k])
					+r2*(u[j*129+k+1]-2.0f*u[j*129+k]+u[j*129+k-1])+dt*100f*dx*(j-1)*dy*(k-1);;
				//System.out.println(k+" "+j+" "+uu[j*21+k]);
			}
		}

		for (k = 2; k <= my-1; k++)
		{
			for (j = 2; j <= mx-1; j++)
			{
				u[j*129+k] = uu[j*129+k];
			}
		}
		//System.out.println(n);
		//System.out.println(uu[10*21+10]);

	}
	return uu[10*21+10];


	}
}

