public class FIFOTestB{
	final int [] arrayA = new int [10];	
	private final fifoa2b obj = new fifoa2b();

	public void run(){
		int i;
		boolean check_finished;
		int result;
/*
		for(i=0;i<10;i++){
			arrayA[i] = i;
		}

		for(i=0;i<10;i++){
			FIFOWrite(arrayA[i]);
		}
*/


		while(true){
			check_finished=obj.check_finished();
			if(check_finished==true) break;
		}	

		for(i=0;i<10;i++){
			arrayA[i]=obj.deque();
		}

		for(i=0;i<10;i++){
			result  = result+arrayA[i];
		}
		return result;	
			
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
