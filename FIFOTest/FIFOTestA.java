public class FIFOTestA{
	final public fifoa2b obj = new fifoa2b();
	private final int [] arrayA = new int [10];	

	public void run(){
		int i;
		int result=0;

		for(i=0;i<10;i++){
			arrayA[i] = i;
		}
		for(i=0;i<10;i++){
			obj.enque(arrayA[i]);
		}
		obj.is_finished(true);

/*
		for(i=0;i<10;i++){
			arrayA[i]=obj.deque();
		}	

	
		for(i=0;i<10;i++){
			result  = result+arrayA[i];
		}
		return result;	
*/
	}
	
/*
	@JRThrashConvertedIntoIPcore(availableNum=1,latency=0,throughput=1,outputPName="p",
					clockPName="clk",clockEnablePName="ce",resetPName="rst",
					newDataPName="operation_nd",haveClock=true,haveReset=false,haveNewData=false)
	
	private int FIFORead(){
		int a=10;
		return a;
	}
*/

}
