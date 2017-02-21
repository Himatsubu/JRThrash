import net.njlab.sample.annotation.*;

public class PE{

	//@JRThrashUnroll(unrollNum=10,loopVariableName="i",unrollType=JRThrashUnroll.copyLoopVar)
        int average(int dataNum,int[] matX){
                int i;
                int average = 0;
                for(i=0;i<dataNum;i++){
                        average = matX[i] + average;
                }
                return average;
        }
}
