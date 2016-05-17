package net.njlab.circuit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

import net.njlab.config.Config;
import net.njlab.model.VerilogClass;

/**
 *  @author Keisuke Koike
 */

public class TmpSignals {

	ArrayList<VerilogWire> tmpWires = new ArrayList<VerilogWire>();
	Map<Integer,VerilogReg> tmpIntRegs = new HashMap<Integer,VerilogReg>();		//int型の演算結果格納
	Map<Integer,VerilogReg> tmpLongRegs = new HashMap<Integer,VerilogReg>();	//long型の演算結果格納
	Map<Integer,VerilogReg> tmpFloatRegs = new HashMap<Integer,VerilogReg>();   //浮動小数型の演算結果格納
	Map<Integer,VerilogReg> tmpBooleanRegs = new HashMap<Integer,VerilogReg>(); //boolean型の演算結果格納

	int usedIntRegNum = 0;
	int usedLongRegNum = 0;
	int usedFloatRegNum = 0;
	int usedBooleanRegNum = 0;
	long usedTmpWireNum = 0;

	public static final int intType = 0;
	public static final int longType = intType+1;
	public static final int floatingType = longType+1;
	public static final int boolType = floatingType+1;

	VerilogClass parentClass;

	public ArrayList<VerilogReg> getIntRegArray(){

		ArrayList<VerilogReg> intRegs = new ArrayList<VerilogReg>(tmpIntRegs.values());
		sortInRegID(intRegs);
		return intRegs;
	}

	public ArrayList<VerilogReg> getLongRegArray(){

		ArrayList<VerilogReg> longRegs = new ArrayList<VerilogReg>(tmpLongRegs.values());
		sortInRegID(longRegs);
		return longRegs;
	}

	public ArrayList<VerilogReg> getFloatRegArray(){

		ArrayList<VerilogReg> floatRegs = new ArrayList<VerilogReg>(tmpFloatRegs.values());
		sortInRegID(floatRegs);
		return floatRegs;
	}

	public ArrayList<VerilogReg> getBooleanRegArray(){

		ArrayList<VerilogReg> boolRegs = new ArrayList<VerilogReg>(tmpBooleanRegs.values());
		sortInRegID(boolRegs);
		return boolRegs;
	}

	public TmpSignals(VerilogClass parentClass){
		this.parentClass = parentClass;
	}

	public ArrayList<VerilogReg> buildTmpRegArray(int regType){

		ArrayList<VerilogReg> retArray = null;

		if(regType==intType)
			retArray = new ArrayList<VerilogReg>(tmpIntRegs.values());

		else if(regType==floatingType)
			retArray = new ArrayList<VerilogReg>(tmpFloatRegs.values());

		else if(regType==longType)
			retArray = new ArrayList<VerilogReg>(tmpLongRegs.values());

		else if(regType==boolType)
			retArray = new ArrayList<VerilogReg>(tmpBooleanRegs.values());

		Collections.sort(retArray);
		return retArray;
	}

	public VerilogReg allocateReg(int regType){

		if(regType==intType)
			return allocateIntReg();
		if(regType==floatingType)
			return allocateFloatReg();
		if(regType==longType)
			return allocateLongReg();
		if(regType==boolType)
			return allocateBoolReg();
		return null;
	}

	public VerilogReg allocateIntReg(){

		int tmpRegID = usedIntRegNum++;
		VerilogReg newReg = new VerilogReg(KeyWord.K_sys_+KeyWord.K_tmp+(tmpRegID)+KeyWord.K_int, parentClass.config.intBitWidth, VerilogSignal.signed);
		tmpIntRegs.put(tmpRegID, newReg);
		parentClass.getModule().addRegister(newReg);
		newReg.setTmpRegID(tmpRegID);
		return newReg;
	}

	public VerilogReg getIntReg(int regID){
		return tmpIntRegs.get(regID);
	}

	public VerilogReg allocateLongReg(){

		int tmpRegID = usedLongRegNum++;
		VerilogReg newReg = new VerilogReg(KeyWord.K_sys_+KeyWord.K_tmp+(tmpRegID)+KeyWord.K_long, parentClass.config.longBitWidth, VerilogSignal.signed);
		tmpLongRegs.put(tmpRegID, newReg);
		parentClass.getModule().addRegister(newReg);
		newReg.setTmpRegID(tmpRegID);
		return newReg;
	}

	public VerilogReg getLongReg(int regID){
		return tmpLongRegs.get(regID);
	}

	public VerilogReg allocateFloatReg(){

		int bitWidth=0;
		if(parentClass.config.floatingType==Config.doubleType)
			bitWidth = parentClass.config.doubleBitWidth;
		else if(parentClass.config.floatingType==Config.singleType)
			bitWidth = parentClass.config.floatBitWidth;

		int tmpRegID = usedFloatRegNum++;
		VerilogReg newReg = new VerilogReg(KeyWord.K_sys_+KeyWord.K_tmp+(tmpRegID)+KeyWord.K_float, bitWidth, VerilogSignal.unsigned);
		tmpFloatRegs.put(tmpRegID, newReg);
		parentClass.getModule().addRegister(newReg);
		newReg.setTmpRegID(tmpRegID);
		return newReg;
	}

	public VerilogReg getFloatReg(int regID){
		return tmpFloatRegs.get(regID);
	}

	public VerilogReg allocateBoolReg(){

		int tmpRegID = usedBooleanRegNum++;
		VerilogReg newReg = new VerilogReg(KeyWord.K_sys_+KeyWord.K_tmp+(tmpRegID)+KeyWord.K_bool, 1, VerilogSignal.unsigned);
		tmpBooleanRegs.put(tmpRegID, newReg);
		parentClass.getModule().addRegister(newReg);
		newReg.setTmpRegID(tmpRegID);
		return newReg;
	}

	public VerilogReg getBoolReg(int regID){
		return tmpBooleanRegs.get(regID);
	}

	public VerilogWire getWire(int wireBitWidth, boolean isSigned){
		++usedTmpWireNum;
		VerilogWire newWire = new VerilogWire(KeyWord.K_sys_+KeyWord.K_tmp+(usedTmpWireNum), wireBitWidth, isSigned);
		tmpWires.add(newWire);
		parentClass.getModule().addWire(newWire);
		newWire.isTmpWire = true;
		return newWire;
	}

	private void sortInRegID(ArrayList<VerilogReg> tmpRegs){

		Collections.sort(tmpRegs, new Comparator(){
			public int compare(Object obj1, Object obj2){
		    	VerilogReg ent1 =(VerilogReg)obj1;
		    	VerilogReg ent2 =(VerilogReg)obj2;
		        int usedTime1 = ent1.getTmpRegID();
		        int usedTime2 = ent2.getTmpRegID();
		        return usedTime1 - usedTime2;
			}
		});
	}

	public void deleteWire(VerilogWire deletedWire){

		deletedWire.deleted();
		boolean existWire = tmpWires.remove(deletedWire);
		if(existWire)	// tmpWire 以外が消されるのを防ぐ , ワイヤ消去処理の高速化
			parentClass.getModule().deleteWire(deletedWire);
	}

	public int getTmpWireNum(){
		return tmpWires.size();
	}
}





