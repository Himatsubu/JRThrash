import net.njlab.sample.annotation.*;

public class c1_2dim{
	//484=21*21
	//実際は20*20の領域の計算
	private static final float u[] = new float [484];
	private static final float uu[]= new float [484];
	private static final float q[] = new float [484];

        @JRThrashUnroll(unrollNum=10, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public void run(){
//	public static void main(String[] args){
		int k,j,n;
		int mx,my;
		float dt,dx,dy,r1,r2;
		int kx,ky,nlast;

		kx=20;
		ky=20;
		mx=21;
		my=21;
		dt=0.0005f;
		nlast=2;
/*
		dx = 1f/(mx-1);
		dy = 1f/(my-1);
		r1 = dt/(dx*dx);
		r2 = dt/(dy*dy);
*/

		dx=0.05f;
		dy=0.05f;
		r1=0.2f;
		r2=0.2f;

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
	for (n = 1; n <= nlast; n++)
	{

//	境界条件
		for (k = 1; k <= my; k++)
		{
			u[1*21+k] = 0.5f;
			u[mx*21+k]= 0f;
		}
		
		for (j = 1; j <= mx; j++)
		{
			u[j*21+1] = 1.f;
			u[j*21+my]= 0f;
		}

//	次の時間での温度の計算
		for (k = 2; k <= my-1; k++)
		{
			for (j = 2; j <= mx-1; j++)
			{
				//q=100f*dx*(j-1)*dy*(k-1);
				uu[j*21+k]= u[j*21+k]+r1*(u[(j+1)*21+k]-2.0f*u[j*21+k]+u[(j-1)*21+k])
					+r2*(u[j*21+k+1]-2.0f*u[j*21+k]+u[j*21+k-1])+dt*q[j*21+k];
				//System.out.println(k+" "+j+" "+uu[j*21+k]);
			}
		}

		for (k = 2; k <= my-1; k++)
		{
			for (j = 2; j <= mx-1; j++)
			{
				u[j*21+k] = uu[j*21+k];
			}
		}
		//System.out.println(n);
		//System.out.println(uu[10*21+10]);

	}
	//System.out.println(uu[10*21+10]);


	}
}

