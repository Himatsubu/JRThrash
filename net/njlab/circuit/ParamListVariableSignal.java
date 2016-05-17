package net.njlab.circuit;

/**
 *  @author Keisuke Koike
 */

public class ParamListVariableSignal {

	public ParamListVariableSignal(	VerilogPort portExternalBramAddr,    VerilogPort portExternalBramDataIn,  VerilogPort portExternalBramDataOut,
									VerilogPort portExternalBramRorW,    VerilogPort portExternalBramClockEn, VerilogPort portCacheHit,
									VerilogWire wireExternalBramAddr,    VerilogWire wireExternalBramDataIn,  VerilogWire wireExternalBramRorW,
									VerilogWire wireExternalBramClockEn, VerilogWire wireCacheHit,
									VerilogReg  regExternalBramAddr,     VerilogReg  regExternalBramDataIn,
									VerilogWire wireExternalBramDataOut, VerilogReg  regExternalBramRorW){

		this.portExternalBramAddr = portExternalBramAddr;
		this.portExternalBramDataIn = portExternalBramDataIn;
		this.portExternalBramDataOut = portExternalBramDataOut;
		this.portExternalBramRorW = portExternalBramRorW;
		this.portExternalBramClockEn = portExternalBramClockEn;
		this.portCacheHit = portCacheHit;
		this.regExternalBramAddr = regExternalBramAddr;
		this.regExternalBramDataIn = regExternalBramDataIn;
		this.wireExternalBramDataOut = wireExternalBramDataOut;
		this.regExternalBramRorW = regExternalBramRorW;
		this.wireExternalBramAddr = wireExternalBramAddr;
		this.wireExternalBramDataIn = wireExternalBramDataIn;
		this.wireExternalBramRorW = wireExternalBramRorW;
		this.wireExternalBramClockEn = wireExternalBramClockEn;
		this.wireCacheHit = wireCacheHit;
	}

	public ParamListVariableSignal(	VerilogPort portParamList, VerilogReg  regParamList){
		this.portParamList = portParamList;
		this.regParamList = regParamList;
	}

	public VerilogPort getPrmLstArrayAddrPort(){
		return portExternalBramAddr;
	}

	public VerilogPort getPrmLstArrayRorW_Port(){
		return portExternalBramRorW;
	}

	public VerilogPort getPrmLstArrayDataInPort(){
		return portExternalBramDataIn;
	}

	public VerilogPort getPrmLstArrayDataOutPort(){
		return portExternalBramDataOut;
	}

	public VerilogPort getPrmLstArrayClockEnPort(){
		return 	portExternalBramClockEn;
	}

	public VerilogPort getPrmLstArrayCacheHitPort(){
		return portCacheHit;
	}

	public VerilogPort getPrmLstScalaPort(){
		return portParamList;
	}

	public VerilogReg getPrmLstScalaReg(){
		return regParamList;
	}

	public VerilogReg getPrmLstArrayAddrReg(){
		return regExternalBramAddr;
	}

	public VerilogReg getPrmLstArrayDataInReg(){
		return regExternalBramDataIn;
	}

	public VerilogWire getPrmLstArrayDataOutWire(){
		return wireExternalBramDataOut;
	}

	public VerilogReg getPrmLstArrayRorW_Reg(){
		return regExternalBramRorW;
	}

	public VerilogWire getPrmLstArrayAddrWire(){
		return wireExternalBramAddr;
	}

	public VerilogWire getPrmLstArrayDataInWire(){
		return wireExternalBramDataIn;
	}

	public VerilogWire getPrmLstArrayRorW_Wire(){
		return wireExternalBramRorW;
	}

	public VerilogWire getPrmLstArrayClockEnWire(){
		return wireExternalBramClockEn;
	}

	public VerilogWire getPrmLstArrayCacheHitWire(){
		return wireCacheHit;
	}

	//パラメータリストの配列変数
	VerilogPort portExternalBramAddr;
	VerilogPort portExternalBramDataIn;
	VerilogPort portExternalBramDataOut;
	VerilogPort portExternalBramRorW;
	VerilogPort portExternalBramClockEn;
	VerilogPort portCacheHit;
	VerilogReg  regExternalBramAddr;
	VerilogReg  regExternalBramDataIn;
	VerilogWire wireExternalBramDataOut;//arbiter
	VerilogReg  regExternalBramRorW;
	VerilogWire wireExternalBramAddr;
	VerilogWire wireExternalBramDataIn;
	VerilogWire wireExternalBramRorW;
	VerilogWire wireExternalBramClockEn;
	VerilogWire wireCacheHit;

	//パラメータリストのスカラ変数
	VerilogPort portParamList;
	VerilogReg  regParamList;

}
