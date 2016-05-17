package net.njlab.fluid;

import net.njlab.sample.annotation.*;

public class Test{
        private final float[] a = new float[100];
        private final float[] x = new float[100];
        private int  N = 100;
        private int end = 1;

        final SubUp sub00 = new SubUp();
        final Sub sub01 = new Sub();
        final Sub sub02 = new Sub();
        final Sub sub03 = new Sub();
        final Sub sub04 = new Sub();
        final Sub sub05 = new Sub();
        final Sub sub06 = new Sub();
        final Sub sub07 = new Sub();
        final Sub sub08 = new Sub();
        final Sub sub09 = new Sub();
        final Sub sub10 = new Sub();
        final Sub sub11 = new Sub();
        final Sub sub12 = new Sub();
        final Sub sub13 = new Sub();
        final Sub sub14 = new Sub();
        final Sub sub15 = new Sub();
        final Sub sub16 = new Sub();
        final Sub sub17 = new Sub();
        final Sub sub18 = new Sub();
        final SubUnder sub19 = new SubUnder();

        @JRThrashUnroll(unrollNum=3, loopVariableName="i",unrollType=JRThrashUnroll.copyLoopVar)
        public void run(){
                //double dt=0.001, dx=1;double r = dt/(dx*dx);
                float r = 0.001f;

                for(int j=0; j<N; j++)
                        a[j] = j*j;

                for(int t=0; t<end; t++){
                        for(int i= 0; i<7; i++){
                                sub00.arrayA[i] = a[i];
                                sub01.arrayA[i] = a[i+4];
                                sub02.arrayA[i] = a[i+9];
                                sub03.arrayA[i] = a[i+14];
                                sub04.arrayA[i] = a[i+19];
                                sub05.arrayA[i] = a[i+24];
                                sub06.arrayA[i] = a[i+29];
                                sub07.arrayA[i] = a[i+34];
                                sub08.arrayA[i] = a[i+39];
                                sub09.arrayA[i] = a[i+44];
                                sub10.arrayA[i] = a[i+49];
                                sub11.arrayA[i] = a[i+54];
                                sub12.arrayA[i] = a[i+59];
                                sub13.arrayA[i] = a[i+64];
                                sub14.arrayA[i] = a[i+69];
                                sub15.arrayA[i] = a[i+74];
                                sub16.arrayA[i] = a[i+79];
                                sub17.arrayA[i] = a[i+84];
                                sub18.arrayA[i] = a[i+89];
                                sub19.arrayA[i] = a[i+93];
                        }

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
                        sub19.start();

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
                                sub18.join();
                                sub19.join();

                        }catch(Exception e){}

                        for(int i=0, k=1, l=2; i<5; i++, k++, l++){
                                x[i]    = sub00.arrayX[i];
                                x[i+5] =         sub01.arrayX[k];
                                x[i+10] =         sub02.arrayX[k];
                                x[i+15] =        sub03.arrayX[k];
                                x[i+20] =        sub04.arrayX[k];
                                x[i+25] =        sub05.arrayX[k];
                                x[i+30] =        sub06.arrayX[k];
                                x[i+35] =        sub07.arrayX[k];
                                x[i+40] =        sub08.arrayX[k];
                                x[i+45] =        sub09.arrayX[k];
                                x[i+50] =        sub10.arrayX[k];
                                x[i+55] =        sub11.arrayX[k];
                                x[i+60] =        sub12.arrayX[k];
                                x[i+65] =        sub13.arrayX[k];
                                x[i+70] =        sub14.arrayX[k];
                                x[i+75] =        sub15.arrayX[k];
                                x[i+80] =        sub16.arrayX[k];
                                x[i+85] =        sub17.arrayX[k];
                                x[i+90] =        sub18.arrayX[k];
                                x[i+95] =        sub19.arrayX[l];

                        }

                        for(int j=0; j<N; j++)
                                a[j] = x[j];
                }

                //System.out.println(a[10]);
                
        }
}
