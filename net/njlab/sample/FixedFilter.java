package net.njlab.sample;

import net.njlab.sample.annotation.JRThrashReadOnlyPort;
import net.njlab.sample.annotation.JRThrashUnroll;

public class FixedFilter {

	@JRThrashReadOnlyPort
	short   filterCoef0,  filterCoef1,  filterCoef2,  filterCoef3, filterCoef4,
			filterCoef5,  filterCoef6,  filterCoef7,  filterCoef8, filterCoef9,
			filterCoef10, filterCoef11, filterCoef12, filterCoef13,
			filterCoef14, filterCoef15, filterCoef16, filterCoef17,
			filterCoef18, filterCoef19, filterCoef20, filterCoef21,
			filterCoef22, filterCoef23, filterCoef24, filterCoef25,
			filterCoef26, filterCoef27, filterCoef28, filterCoef29,
			filterCoef30, filterCoef31, filterCoef32, filterCoef33,
			filterCoef34, filterCoef35, filterCoef36, filterCoef37,
			filterCoef38, filterCoef39, filterCoef40, filterCoef41,
			filterCoef42, filterCoef43, filterCoef44;

	///*

	int     bufRegister0, bufRegister1, bufRegister2, bufRegister3, bufRegister4,
			bufRegister5, bufRegister6, bufRegister7, bufRegister8,
			bufRegister9, bufRegister10, bufRegister11, bufRegister12,
			bufRegister13, bufRegister14, bufRegister15, bufRegister16,
			bufRegister17, bufRegister18, bufRegister19, bufRegister20,
			bufRegister21, bufRegister22, bufRegister23, bufRegister24,
			bufRegister25, bufRegister26, bufRegister27, bufRegister28,
			bufRegister29, bufRegister30, bufRegister31, bufRegister32,
			bufRegister33, bufRegister34, bufRegister35, bufRegister36,
			bufRegister37, bufRegister38, bufRegister39, bufRegister40,
			bufRegister41, bufRegister42, bufRegister43, bufRegister44;
//*/
///*


	@JRThrashUnroll(unrollType = JRThrashUnroll.modifyLoopVar, unrollNum = 2, loopVariableName = "n")
	void fixedFilter(int pointNum, short[] dataRe, int[] dataReFiltered){

		short xn = dataRe[0];

		for (int n=0; n<pointNum; n++){
			dataReFiltered[n] = filterCoef0 * xn + bufRegister1;
			bufRegister1 = filterCoef1 * xn + bufRegister2;
			bufRegister2 = filterCoef2 * xn + bufRegister3;
			bufRegister3 = filterCoef3 * xn + bufRegister4;
			bufRegister4 = filterCoef4 * xn + bufRegister5;
			bufRegister5 = filterCoef5 * xn + bufRegister6;
			bufRegister6 = filterCoef6 * xn + bufRegister7;
			bufRegister7 = filterCoef7 * xn + bufRegister8;
			bufRegister8 = filterCoef8 * xn + bufRegister9;
			bufRegister9 = filterCoef9 * xn + bufRegister10;
			bufRegister10 = filterCoef10 * xn + bufRegister11;
			bufRegister11 = filterCoef11 * xn + bufRegister12;
			bufRegister12 = filterCoef12 * xn + bufRegister13;
			bufRegister13 = filterCoef13 * xn + bufRegister14;
			bufRegister14 = filterCoef14 * xn + bufRegister15;
			bufRegister15 = filterCoef15 * xn + bufRegister16;
			bufRegister16 = filterCoef16 * xn + bufRegister17;
			bufRegister17 = filterCoef17 * xn + bufRegister18;
			bufRegister18 = filterCoef18 * xn + bufRegister19;
			bufRegister19 = filterCoef19 * xn + bufRegister20;
			bufRegister20 = filterCoef20 * xn + bufRegister21;
			bufRegister21 = filterCoef21 * xn + bufRegister22;
			bufRegister22 = filterCoef22 * xn + bufRegister23;
			bufRegister23 = filterCoef23 * xn + bufRegister24;
			bufRegister24 = filterCoef24 * xn + bufRegister25;
			bufRegister25 = filterCoef25 * xn + bufRegister26;
			bufRegister26 = filterCoef26 * xn + bufRegister27;
			bufRegister27 = filterCoef27 * xn + bufRegister28;
			bufRegister28 = filterCoef28 * xn + bufRegister29;
			bufRegister29 = filterCoef29 * xn + bufRegister30;
			bufRegister30 = filterCoef30 * xn + bufRegister31;
			bufRegister31 = filterCoef31 * xn + bufRegister32;
			bufRegister32 = filterCoef32 * xn + bufRegister33;
			bufRegister33 = filterCoef33 * xn + bufRegister34;
			bufRegister34 = filterCoef34 * xn + bufRegister35;
			bufRegister35 = filterCoef35 * xn + bufRegister36;
			bufRegister36 = filterCoef36 * xn + bufRegister37;
			bufRegister37 = filterCoef37 * xn + bufRegister38;
			bufRegister38 = filterCoef38 * xn + bufRegister39;
			bufRegister39 = filterCoef39 * xn + bufRegister40;
			bufRegister40 = filterCoef40 * xn + bufRegister41;
			bufRegister41 = filterCoef41 * xn + bufRegister42;
			bufRegister42 = filterCoef42 * xn + bufRegister43;
			bufRegister43 = filterCoef43 * xn + bufRegister44;
			bufRegister44 = filterCoef44 * xn;
			xn = dataRe[n+1];
		}
	}


}
