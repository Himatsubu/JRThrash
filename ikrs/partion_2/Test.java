//package net.njlab.fluid;

//import net.njlab.sample.annotation.*;

public class Test{
        private static final float[] U = new float[1000];
        private static final float[] UU = new float[1000];

        //@JRThrashUnroll(unrollNum=3, loopVariableName="i",unrollType=JRThrashUnroll.copyLoopVar)
        //public void test(){
	public static void main(String[] args){
	
		int kx,km,mx,ih,i,t;
		float dx,r,x,dt;		


                kx=20;
		km=400;
		dt=0.001f;
		mx=kx+1;

		dx=1/mx-1;
		r=dt/dx*dx;
		ih=102/2;
		
		for(i=1;i<=mx;i++){
			x=(i-1)/(mx-1);		
			if(i<=ih){U[i]=x;}
			else {U[i]=1-x;}
	       		System.out.println(U[i]);
		}

                for(t=1; t<=km; t++){
			U[1]=0;
			U[mx]=0;

                        for(i=2; i<=mx-1; i++){
                                UU[i] = U[i-1]*r + U[i]*(1-2*r) + U[i+1]*r;
			}
                        for(i=2; i<=mx-1; i++){
                                UU[i] = U[i];
                		//System.out.println(U[i]);
			}
                }

                System.out.println(U[10]);
                //return (int)a[10];
        }
}
