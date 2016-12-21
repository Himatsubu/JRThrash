#include <stdio.h>
#include <math.h>

void Jacobi(){
    int i,j,k;
    int n = 3;
    double a[3][3] = {{1.0,2.0,3.0},{2.0,2.0,-2.0},{3.0,-2.0,4.0}};
    //double a[2][2] = {{8,1},{4,5}};
    double x[n][n];
    double abserr = 0.000000001;
    double b2,bar;
    double beta, coeff, c, s, cs, sc;

    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            x[i][j] = 0.0;
        }
    }
    for(i=0;i<n;i++){
        x[i][i] = 1.0;
    }

    //このループ終了時にb2=34になる
    //固有値の算出かな？
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            if(i != j) b2 = b2 + a[i][j]*a[i][j];
	    	//printf("%f\n",b2);
        }
    }

    if(b2 <= abserr) return;
    //bar = 17/9
    bar = 0.5*b2/((float)n*n);

    while(b2>abserr){
	//printf("loop\n");
        for(i=0;i<n-1;i++){
            for(j=i+1;j<n;j++){
		if(a[i][j]*a[i][j] <= bar) continue;  //小さい値には変更を加えないため

                b2 = b2 - 2.0*a[i][j]*a[i][j];
                bar = 0.5*b2/((float)n*n);
                //calculate coefficient c and s for Givens matrix
                beta = (a[j][j]-a[i][i])/(2.0*a[i][j]);
                printf("beta:%f\n",beta);
		coeff = 0.5*beta/sqrt(1.0+beta*beta);
		printf("coeff:%f\n",coeff);
                s = (0.5+coeff > 0.0) ? sqrt(0.5+coeff) : 0.0;
                c = (0.5-coeff > 0.0) ? sqrt(0.5-coeff) : 0.0;
		//printf("s:%f\n",s);
		//printf("c:%f\n",c);


		//固有値の計算
                for(k=0;k<n;k++){
                    printf("i:%d,k:%d,j:%d\n",i,k,j);
		    cs = c*a[i][k] + s*a[j][k];
                    //printf("%f\n",cs);
		    sc = -1*s*a[i][k] + c*a[j][k];
		    //printf("%f\n",sc);
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
    printf("Eigenvalues\n");
    for(i=0;i<n;i++){
        printf("%f ",a[i][i]);
    }
    printf("\n");
    printf("Eigenvector\n");
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            printf("%f ",x[i][j]);
        }
        printf("\n");
    }

}
int main(void){
    Jacobi();
    return 0;
}
