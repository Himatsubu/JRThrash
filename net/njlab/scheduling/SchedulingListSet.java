package net.njlab.scheduling;

import net.njlab.circuit.*;
import net.njlab.ipcore.*;
import net.njlab.model.*;
import net.njlab.dfg.*;
import net.njlab.config.*;

import java.util.*;

/**
 *  @author Keisuke Koike
 */
public class SchedulingListSet {

	public SchedulingList addFloatList;
	public SchedulingList addIntList;
	public SchedulingList compareFloatList;
	public SchedulingList compareIntList;
	public SchedulingList DivFloatList;
	public SchedulingList DivIntList;
	public SchedulingList FixedToFloatList;
	public SchedulingList FloatToFixedList;
	public SchedulingList multFloatList;
	public SchedulingList multIntList;
	public Map<VerilogMethod, SchedulingList> userDefined;

	/*
	public boolean  allListIsEmpty(){
		boolean ret = addFloatList.getList().isEmpty() && addIntList.getList().isEmpty() &&
					  compareFloatList.getList().isEmpty() && compareIntList.getList().isEmpty() &&
					  DivFloatList.getList().isEmpty() && DivIntList.getList().isEmpty() &&
					  FixedToFloatList.getList().isEmpty() && FloatToFixedList.getList().isEmpty() &&
					  multFloatList.getList().isEmpty() && multIntList.getList().isEmpty();
		return ret;
	}*/

	public boolean assignIPcore(int controlStep){

		boolean IPcoreIsAssigned = false;
		IPcoreIsAssigned |= addFloatList.assignIPcore(controlStep);
		IPcoreIsAssigned |= addIntList.assignIPcore(controlStep);
		IPcoreIsAssigned |= compareFloatList.assignIPcore(controlStep);
		IPcoreIsAssigned |= compareIntList.assignIPcore(controlStep);
		IPcoreIsAssigned |= DivFloatList.assignIPcore(controlStep);
		IPcoreIsAssigned |= DivIntList.assignIPcore(controlStep);
		IPcoreIsAssigned |= FixedToFloatList.assignIPcore(controlStep);
		IPcoreIsAssigned |= FloatToFixedList.assignIPcore(controlStep);
		IPcoreIsAssigned |= multFloatList.assignIPcore(controlStep);
		IPcoreIsAssigned |= multIntList.assignIPcore(controlStep);

		for(SchedulingList userDef : userDefined.values())
			IPcoreIsAssigned |= userDef.assignIPcore(controlStep);
		return IPcoreIsAssigned;
	}

	public void UpdateReUseTime(){

		addFloatList.UpdateReUseTime();
		addIntList.UpdateReUseTime();
		compareFloatList.UpdateReUseTime();
		compareIntList.UpdateReUseTime();
		DivFloatList.UpdateReUseTime();
		DivIntList.UpdateReUseTime();
		FixedToFloatList.UpdateReUseTime();
		FloatToFixedList.UpdateReUseTime();
		multFloatList.UpdateReUseTime();
		multIntList.UpdateReUseTime();

		for(SchedulingList userDef : userDefined.values())
			userDef.UpdateReUseTime();
	}

	public SchedulingListSet(VerilogClass claz, Config config){

		makeAddFloat(claz, config);
		makeAddInt(claz, config);
		makeCompareFloat(claz, config);
		makeCompareInt(claz, config);
		makeDivFloat(claz, config);
		makeDivInt(claz, config);
		makeFixedToFloat(claz, config);
		makeFloatToFixed(claz, config);
		makeMultFloat(claz, config);
		makeMultInt(claz, config);

		this.userDefined = new HashMap<VerilogMethod, SchedulingList>();
		for(VerilogMethod method : claz.getMethodsConvertedIPcore())
			if(method.isConvertedIntoIP())
				makeUserDefinedIP(claz, config, method);
	}

	private void makeUserDefinedIP(VerilogClass claz, Config config, VerilogMethod convertedMethod){

		UserDefined[] userDefined;
		int makeNum = convertedMethod.getConvertedInfo().getAvairableNum();
		userDefined = new UserDefined[makeNum];
		for(int i=0; i<makeNum; i++){
			userDefined[i] = UserDefined.makeUserDefinedIP(i, convertedMethod, claz, config);
		}
		SchedulingList userDefinedIP = new SchedulingList(userDefined);
		this.userDefined.put(convertedMethod, userDefinedIP);
	}



	private void makeAddFloat(VerilogClass claz, Config config){

		AddFloat[] addFloat;
		int num = config.availableAddFloatNum;
		addFloat = new AddFloat[num];
		for(int i=0; i<num; i++){
			addFloat[i] = AddFloat.makeAddFloatIP(i, claz, config);
		}
		addFloatList = new SchedulingList(addFloat);
	}

	private void makeAddInt(VerilogClass claz, Config config){

		AddInt[] addInt;
		int num = config.availableAddIntNum;
		addInt = new AddInt[num];
		for(int i=0; i<num; i++){
			addInt[i] = AddInt.makeAddIntIP(i, claz, config);
		}
		addIntList = new SchedulingList(addInt);
	}

	private void makeCompareFloat(VerilogClass claz, Config config){

		CompareFloatLT[] compareFloat;
		int num = config.availableFloatLessThanNum;
		compareFloat = new CompareFloatLT[num];
		for(int i=0; i<num; i++){
			compareFloat[i] = CompareFloatLT.makeCompareFloatLtIP(i, claz, config);
		}
		compareFloatList = new SchedulingList(compareFloat);
	}

	private void makeCompareInt(VerilogClass claz, Config config){

		CompareIntLT[] compareInt;
		int num = config.availableIntLessThanNum;
		compareInt = new CompareIntLT[num];
		for(int i=0; i<num; i++){
			compareInt[i] = CompareIntLT.makeCompareIntLtIP(i, claz, config);
		}
		compareIntList = new SchedulingList(compareInt);
	}

	private void makeDivFloat(VerilogClass claz, Config config){

		DivFloat[] divFloat;
		int num = config.availableDivFloatNum;
		divFloat = new DivFloat[num];
		for(int i=0; i<num; i++){
			divFloat[i] = DivFloat.makeDivFloatIP(i, claz, config);
		}
		DivFloatList = new SchedulingList(divFloat);
	}

	private void makeDivInt(VerilogClass claz, Config config){

		DivInt[] divInt;
		int num = config.availableDivIntNum;
		divInt = new DivInt[num];
		for(int i=0; i<num; i++){
			divInt[i] = DivInt.makeDivIntIP(i, claz, config);
		}
		DivIntList = new SchedulingList(divInt);
	}

	private void makeFixedToFloat(VerilogClass claz, Config config){

		FixedToFloat[] fixedToFloat;
		int num = config.availableFixedToFloatNum;
		fixedToFloat = new FixedToFloat[num];
		for(int i=0; i<num; i++){
			fixedToFloat[i] = FixedToFloat.makeFixedToFloatIP(i, claz, config);
		}
		FixedToFloatList = new SchedulingList(fixedToFloat);
	}

	private void makeFloatToFixed(VerilogClass claz, Config config){

		FloatToFixed[] floatToFixed;
		int num = config.availableFloatToFixedNum;
		floatToFixed = new FloatToFixed[num];
		for(int i=0; i<num; i++){
			floatToFixed[i] = FloatToFixed.makeFloatToFixedIP(i, claz, config);
		}
		FloatToFixedList = new SchedulingList(floatToFixed);
	}

	private void makeMultFloat(VerilogClass claz, Config config){

		MultFloat[] multFloat;
		int num = config.availableMultFloatNum;
		multFloat = new MultFloat[num];
		for(int i=0; i<num; i++){
			multFloat[i] = MultFloat.makeMultFloatIP(i, claz, config);
		}
		multFloatList = new SchedulingList(multFloat);
	}

	private void makeMultInt(VerilogClass claz, Config config){

		MultInt[] multInt;
		int num = config.availableMultIntNum;
		multInt = new MultInt[num];
		for(int i=0; i<num; i++){
			multInt[i] = MultInt.makeMultIntIP(i, claz, config);
		}
		multIntList = new SchedulingList(multInt);
	}
}


















