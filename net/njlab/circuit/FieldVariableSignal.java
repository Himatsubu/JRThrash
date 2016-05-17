package net.njlab.circuit;

/**
 *  @author Keisuke Koike
 */

//フィールド変数から作成される信号
public class FieldVariableSignal {

	public FieldVariableSignal(	VerilogPort portFieldBramAddr0,    VerilogPort portFieldBramDataIn0,
								VerilogPort portFieldBramDataOut0, VerilogPort portFieldBramRorW0,
								VerilogWire wireFieldBramAddr0,    VerilogWire wireFieldBramDataIn0,
								VerilogWire wireFieldBramDataOut0, VerilogWire wireFieldBramRorW0,
								VerilogWire wireFieldBramClockEn0, VerilogWire wireFieldBramClockEn1,
								VerilogReg  regFieldBramAddr1,     VerilogReg  regFieldBramDataIn1,
								VerilogWire wireFieldBramDataOut1, VerilogReg  regFieldBramRorW1){

		this.portFieldBramAddr0 = portFieldBramAddr0;
		this.portFieldBramDataIn0 = portFieldBramDataIn0;
		this.portFieldBramDataOut0 = portFieldBramDataOut0;
		this.portFieldBramRorW0 = portFieldBramRorW0;
		this.wireFieldBramAddr0 = wireFieldBramAddr0;
		this.wireFieldBramDataIn0 = wireFieldBramDataIn0;
		this.wireFieldBramDataOut0 = wireFieldBramDataOut0;
		this.wireFieldBramRorW0 = wireFieldBramRorW0;
		this.wireFieldBramClockEn0 = wireFieldBramClockEn0;
		this.regFieldBramAddr1 = regFieldBramAddr1;
		this.regFieldBramDataIn1 = regFieldBramDataIn1;
		this.wireFieldBramDataOut1 = wireFieldBramDataOut1 ;
		this.regFieldBramRorW1 = regFieldBramRorW1;
		this.wireFieldBramClockEn1 = wireFieldBramClockEn1;
	}

	public FieldVariableSignal(VerilogSignal sigFieldPrimitive){
		this.sigFieldPrimitive = sigFieldPrimitive;
	}

	public VerilogSignal getFieldPrimitiveSignal(){
		return sigFieldPrimitive;
	}

	public VerilogWire getFieldArrayAddrWire0(){
		return wireFieldBramAddr0;
	}

	public VerilogWire getFieldArrayRorW_wire0(){
		return wireFieldBramRorW0;
	}

	public VerilogWire getFieldArrayDataIn0Wire(){
		return wireFieldBramDataIn0;
	}

	public VerilogWire getFieldArrayDataOut0Wire(){
		return wireFieldBramDataOut0;
	}

	public VerilogWire getFieldBramClockEn0Wire(){
		return wireFieldBramClockEn0;
	}

	public VerilogReg getFieldArrayRorW_Reg1(){
		return regFieldBramRorW1;
	}

	public VerilogReg getFieldArrayAddrReg1(){
		return regFieldBramAddr1;
	}

	public VerilogReg getFieldArrayDataInReg1(){
		return regFieldBramDataIn1;
	}

	public VerilogWire getFieldArrayDataOut1(){
		return wireFieldBramDataOut1;
	}

	public void setRegFieldBramAddr1(VerilogReg addrReg){
		regFieldBramAddr1 = addrReg;
	}

	public void setRegFieldBramDataIn1(VerilogReg dataInReg){
		regFieldBramDataIn1 = dataInReg;
	}

	public void setRegFieldBramRorW1(VerilogReg RorW_Reg){
		regFieldBramRorW1 = RorW_Reg;
	}

	public void setWireFieldBramDataOut1(VerilogWire dataOutWire){
		wireFieldBramDataOut1 = dataOutWire;
	}

	//フィールドの配列変数
	VerilogPort portFieldBramAddr0;
	VerilogPort portFieldBramDataIn0;
	VerilogPort portFieldBramDataOut0;
	VerilogPort portFieldBramRorW0;

	VerilogWire wireFieldBramAddr0;//arbiter
	VerilogWire wireFieldBramDataIn0;//arbiter
	VerilogWire wireFieldBramDataOut0;
	VerilogWire wireFieldBramRorW0;//arbiter
	VerilogWire wireFieldBramClockEn0;

	VerilogReg  regFieldBramAddr1;
	VerilogReg  regFieldBramDataIn1;
	VerilogWire wireFieldBramDataOut1;
	VerilogReg  regFieldBramRorW1;
	VerilogWire wireFieldBramClockEn1;

	//フィールドのスカラ変数
	VerilogSignal sigFieldPrimitive;
}
