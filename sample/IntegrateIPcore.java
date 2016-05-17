package net.njlab.sample;

import net.njlab.sample.annotation.JRThrashConvertedIntoIPcore;
import net.njlab.sample.annotation.JRThrashPortBitWidthSpecify;

public class IntegrateIPcore {

	int main(){
		return SumOfProduct((short)10, (short)20, 30) + SumOfProduct((short)40, (short)50, 60);
	}

	@JRThrashConvertedIntoIPcore(availableNum = 45, latency = 0, throughput = 1,
			 outputPName = "p", clockPName = "clk", clockEnablePName = "ce", resetPName = "rst", newDataPName = "operation_nd",
			 haveClock = true, haveReset = false, haveNewData = false)
	@JRThrashPortBitWidthSpecify(inputBitWidth = "16, 16, 32", outputBitWidth = 33)	// <- このアノテーションは無くても問題ない
	private int SumOfProduct(short a, short b, int c){	//private で宣言

		return (int)(a*b+c);	//IPcore の動作をソフトウェアで自由に記述可能
	}
}
