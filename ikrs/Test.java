package net.njlab.fluid;

import net.njlab.sample.annotation.*;

public class Test{
        final float[] a = new float[100];
        final float[] x = new float[100];
        int  N = 100;
        int end = 1;

        //@JRThrashUnroll(unrollNum=3, loopVariableName="i",
unrollType=JRThrashUnroll.copyLoopVar)
        public int test(){
                //double dt=0.001, dx=1;double r = dt/(dx*dx);
                float r = 0.001f;

                for(int j=0; j<N; j++){
                        a[j] = j*j;}

                for(int t=0; t<end; t++){
                        for(int i=1; i<N-1; i++){
                                x[i] = a[i-1]*r + a[i]*(1-2*r) + a[i+1]*r;
			}
                        for(int j=0; j<N; j++){
                                a[j] = x[j];
			}
                }

                //System.out.println(a[10]);
                //return (int)a[10];
        }
}
