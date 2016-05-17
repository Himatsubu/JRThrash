package net.njlab.model;

/**
 * @author koike
 * */
public class ConvertedIPinfo {

	int latency;
	int throughput;
	int availableNum;
	String outputPortName;
	String newDataPortName;
	String clockPortName;
	String clockEnablePortName;
	String resetPortName;
	boolean haveClockPort;
	boolean haveNewDataPort;
	boolean haveResetPort;
	int[] inputBitWidth;
	int outputBitWidth;

	public ConvertedIPinfo(int latency, int throughput, int availableNum,
						   String outputPortName, String clockPortName, String clockEnablePortName, String resetPortName, String newDataPortName,
						   boolean haveClockPort, boolean haveResetPort, boolean haveNewDataPort){

		this.latency = latency < 0 ? 0 : latency;
		this.throughput = throughput < 1 ? 1 : throughput;
		this.availableNum = availableNum < 1 ? 1 : availableNum;
		this.outputPortName = outputPortName.compareTo("")==0 ? "result" : outputPortName;
		this.newDataPortName = newDataPortName.compareTo("")==0 ? "operation_nd" : newDataPortName;
		this.clockPortName = clockPortName.compareTo("")==0 ? "clk" : clockPortName;
		this.resetPortName = resetPortName.compareTo("")==0 ? "rst" : resetPortName;
		this.clockEnablePortName = clockEnablePortName.compareTo("")==0 ? "ce" : clockEnablePortName;
		this.haveClockPort = haveClockPort;
		this.haveResetPort = haveResetPort;
		this.haveNewDataPort = haveNewDataPort;
	}

	public void setPortBitWidth(int[] inputBitWidth, int outputBitWidth){

		this.inputBitWidth = inputBitWidth;
		this.outputBitWidth = outputBitWidth;
	}

	public int getLatency(){
		return latency;
	}

	public int getThrouput(){
		return throughput;
	}

	public int getAvairableNum(){
		return availableNum;
	}

	public String getOutputPortName(){
		return outputPortName;
	}

	public String getNewDataPortName(){
		return newDataPortName;
	}

	public String getClockPortName(){
		return clockPortName;
	}

	public String getClockEnablePortName(){
		return clockEnablePortName;
	}

	public String getResetPortName(){
		return resetPortName;
	}

	public int[] getInputBitWidth(){
		return inputBitWidth;
	}

	public int getOutputBitWidth(){
		return outputBitWidth;
	}

	public boolean getHaveClockPort(){
		return haveClockPort;
	}

	public boolean getHaveNewDataPort(){
		return haveNewDataPort;
	}

	public boolean getHaveResetPort(){
		return haveResetPort;
	}
}






