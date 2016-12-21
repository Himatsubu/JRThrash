import net.njlab.sample.annotation.*;

public class Jacobi{
	private static final float [][] a = new float [3][3];
	private static final float [][] x = new float [3][3];
/*
	static final sub00 sub00 = new sub();
	static final sub01 sub01 = new sub();
	static final sub02 sub02 = new sub();
*/

	private float max(float a,float b){
		if(a>b) return a;
		else return b;
	}

	private float sqrt(float s){
		//System.out.println("sqrt");
		//System.out.println(s);
		float x = s/2.0f;
		float last_x = 0.0f;

		while(x != last_x){
			last_x = x;
			x = (x+s/x)/2.0f;
		}
		//System.out.println(Math.sqrt(s));
		//System.out.println(x+"\nsqrtend");
		return x;
	}

/*
	@JRThrashConvertedIntoIPcore(avaiableNUM = 1, latency = 29, throughput = 1,outputPName = "out")
	float sqrt(float in){
		return (float)Math.sqrt(in);
	}
*/
	

	@JRThrashUnroll(unrollNum=7, loopVariableName="j",unrollType=JRThrashUnroll.copyLoopVar)
	public float run(){
		int i,j,k;
		int n = 3;
		float abserr=0.000000001f;
		float b2 = 0.0f;
		float bar;
		float beta,coeff,c,s,cs,sc;
		float tmp;

		a[0][0] = 1; a[0][1]=2; a[0][2]=3;
		a[1][0] = 2; a[1][1]=2; a[1][2]=-2;
		a[2][0] = 3; a[2][1]=-2;a[2][2]=4;
		
		for(i=0;i<n;i++){
			for(j=0;j<n;j++){
				x[i][j] = 0.0f;
			}
		}
	
		for(i=0;i<n;i++){
			x[i][i] = 1.0f;
		}

		//このループ終了時にb2=34になる
		//固有値の算出かな？
		for(i=0;i<n;i++){
			for(j=0;j<n;j++){
				if(i != j) b2 = b2 + a[i][j]*a[i][j];
				//printf("%f\n",b2);
			}
		}

		//System.out.println(b2);
		if(b2 <= abserr) return 0;
			bar = 0.5f*b2/((float)n*n);

		while(b2>abserr){
			//System.out.println("loop");
			for(i=0;i<n-1;i++){
				for(j=i+1;j<n;j++){
					if(a[i][j]*a[i][j] <= bar) continue;  //小さい値には変更を加えないため

					b2 = b2 - 2.0f*a[i][j]*a[i][j];
					bar = 0.5f*b2/((float)n*n);
					//calculate coefficient c and s for Givens matrix
					beta = (a[j][j]-a[i][i])/(2.0f*a[i][j]);
					//coeff = 0.5f*beta/(float)Math.sqrt(1.0f+beta*beta);
					//s = ((0.5f+coeff) > 0.0f) ? (float)Math.sqrt(0.5f+coeff) : 0.0f;
					//c = ((0.5f-coeff) > 0.0f) ? (float)Math.sqrt(0.5f-coeff) : 0.0f;
					//System.out.println("beta:"+beta);
					tmp  = sqrt(1.0f+beta*beta);
					coeff = 0.5f*beta/tmp;
					//System.out.println("coeff:"+coeff);		
			
					tmp = max(0.5f+coeff,0.0f);
					s = sqrt(tmp);
					//System.out.println("s:"+s);
					tmp = max(0.5f-coeff,0.0f);
					c = sqrt(tmp);
					//System.out.println("c"+c);					

					//固有値の計算
					for(k=0;k<n;k++){
						cs = c*a[i][k] + s*a[j][k];
						//System.out.println("cs:"+cs);
						sc = -1.0f*s*a[i][k] + c*a[j][k];
						//System.out.println("sc:"+sc);
						a[i][k] = cs;
						a[j][k] = sc;
					}

					//固有ベクトルの計算
					for(k=0;k<n;k++){
						cs = c*a[k][i]+s*a[k][j];
						sc = -1*s*a[k][i]+c*a[k][j];
						a[k][i] = cs;
						a[k][j] = sc;
						cs = c*x[k][i]+s*x[k][j];
						sc = -s*x[k][i]+c*x[k][j];
						x[k][i] = cs;
						x[k][j] = sc;
					}

				}
			}

		}
/*
		System.out.println("Eigenvalues");
		for(i=0;i<n;i++){
			System.out.print(a[i][i]+" ");
		}
		System.out.println("");
		System.out.println("Eigenvector");
		for(i=0;i<n;i++){
			for(j=0;j<n;j++){
				System.out.print(x[i][j]+" ");
			}
			System.out.println("");
		}
*/
		return a[0][0];
	}

}
