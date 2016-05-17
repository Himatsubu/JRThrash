package net.njlab.sample;

import net.njlab.sample.annotation.JRThrashReadOnlyPort;
import net.njlab.sample.annotation.JRThrashUnroll;

/**
 *  @author Keisuke Koike
 */
public class FirFilter {

	final double[] dataRe0 = new double[2048];
	final double[] dataReFiltered0= new double[2048];
	short filterFactorNum = 53;

	@JRThrashReadOnlyPort
	double ff0,  ff1,  ff2,  ff3,  ff4,  ff5,  ff6,  ff7,  ff8,  ff9,  ff10, ff11, ff12, ff13, ff14, ff15,
		   ff16, ff17, ff18, ff19, ff20, ff21, ff22, ff23, ff24, ff25, ff26, ff27, ff28, ff29, ff30, ff31,
		   ff32, ff33, ff34, ff35, ff36, ff37, ff38, ff39, ff40, ff41, ff42, ff43, ff44, ff45, ff46, ff47,
		   ff48, ff49, ff50, ff51, ff52;

	@JRThrashUnroll(loopVariableName = "n", unrollNum = 4, unrollType = JRThrashUnroll.modifyLoopVar_IndependentIterator)
	//@JRThrashUnroll(loopVariableName = "n", unrollNum = 2, dependence = false)
	void firFilter(){
		//for (short n  = (short)(filterFactorNum-1); n<2048; n++){	//ソフトウェア検証時
		for (short n = 0; n<2048; n++){

			 dataReFiltered0[n] = (((((ff0 *dataRe0[n]    + ff1 *dataRe0[n-1])  + (ff2*dataRe0[n-2]   + ff3*dataRe0[n-3]))+((ff4 *dataRe0[n-4]  + ff5 *dataRe0[n-5])  + (ff6*dataRe0[n-6]   + ff7*dataRe0[n-7])))+
					 			  (((ff8 *dataRe0[n-8]  + ff9 *dataRe0[n-9])  + (ff10*dataRe0[n-10] + ff11*dataRe0[n-11]))+((ff12*dataRe0[n-12] + ff13*dataRe0[n-13]) + (ff14*dataRe0[n-14] + ff15*dataRe0[n-15]))))+
					 			  ((((ff16*dataRe0[n-16] + ff17*dataRe0[n-17]) + (ff18*dataRe0[n-18] + ff19*dataRe0[n-19]))+((ff20*dataRe0[n-20] + ff21*dataRe0[n-21]) + (ff22*dataRe0[n-22] + ff23*dataRe0[n-23])))+
					 			  (((ff24*dataRe0[n-24] + ff25*dataRe0[n-25]) + (ff26*dataRe0[n-26] + ff27*dataRe0[n-27]))+((ff28*dataRe0[n-28] + ff29*dataRe0[n-29]) + (ff30*dataRe0[n-30] + ff31*dataRe0[n-31])))))+
					 			  (((((ff32*dataRe0[n-32] + ff33*dataRe0[n-33]) + (ff34*dataRe0[n-34] + ff35*dataRe0[n-35]))+((ff36*dataRe0[n-36] + ff37*dataRe0[n-37]) + (ff38*dataRe0[n-38] + ff39*dataRe0[n-39]))))+
					 			  ((((ff40*dataRe0[n-40] + ff41*dataRe0[n-41]) + (ff42*dataRe0[n-42] + ff43*dataRe0[n-43]))+((ff44*dataRe0[n-44] + ff45*dataRe0[n-45]) + (ff46*dataRe0[n-46] + ff47*dataRe0[n-47])))+
					 			  ((ff48*dataRe0[n-48] + ff49*dataRe0[n-49]) + (ff50*dataRe0[n-50] + ff51*dataRe0[n-51] + ff52*dataRe0[n-52]))));
		}
	}
}
