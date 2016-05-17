package net.njlab.sample;
/**
 *  @author Keisuke Koike
 */
public class Average {


	public int average(int[] data, int dataNum){

		int ret = 0;
		for(int i=0; i<dataNum; i++){	//テスト用にデータをセット
			data[i] = i+i+i;
		}

		for(int i=0; i<dataNum; i++)
			ret += data[i];

		return ret/dataNum;
	}
}

