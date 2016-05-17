package net.njlab.fluid;

import net.njlab.sample.annotation.*;


public class SubUnder extends Thread{
        final float[] arrayA = new float[7];
        final float[] arrayX = new float[7];
        int N = 6;

        @JRThrashUnroll(unrollNum=64, loopVariableName="i",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
                float r = 0.001f;

                for(int i=2; i<N; i++)
                        arrayX[i] = arrayA[i-1]*r + arrayA[i]*(1-2*r) + arrayA[i+1]*r;
        }

}

