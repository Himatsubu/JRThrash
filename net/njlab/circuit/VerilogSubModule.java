package net.njlab.circuit;

import java.io.PrintWriter;
import java.util.*;

import net.njlab.dump.Dump;
import net.njlab.model.*;


/**
 *  @author Keisuke Koike
 */
public class VerilogSubModule {

	Map<VerilogPort, VerilogSignal> port_assignedSig = new HashMap<VerilogPort, VerilogSignal>();
	VerilogClass parentClass;	//このサブモジュールを内包するクラス
	String instanceName;	//サブモジュールをインスタンス化したときの名前
	VerilogClass objClass;	//サブモジュールのもととなるクラス
	String objName;	//サブモジュール化されるオブジェクト

	public VerilogSubModule(VerilogClass parentClass, Map.Entry<String, VerilogClass> objName_ClassName){

		this.parentClass = parentClass;
		objName = objName_ClassName.getKey();
		objClass = objName_ClassName.getValue();
		instanceName = objName+KeyWord.K_inst;
	}

	public VerilogClass getObjClass(){
		return objClass;
	}

	public void addPort(VerilogPort port, VerilogSignal assignedSignal){

		port_assignedSig.put(port, assignedSignal);
	}

	public void dumpInstance(PrintWriter wout, int offset){

		ArrayList<Map.Entry<VerilogPort, VerilogSignal>> portList = new ArrayList<Map.Entry<VerilogPort, VerilogSignal>>(port_assignedSig.entrySet());

		Collections.sort(portList, new Comparator(){
		    public int compare(Object obj1, Object obj2){
		        Map.Entry ent1 =(Map.Entry)obj1;
		        Map.Entry ent2 =(Map.Entry)obj2;
		        String val1 = ((VerilogPort)ent1.getKey()).getSigName().substring(1);
		        String val2 = ((VerilogPort)ent2.getKey()).getSigName().substring(1);
		        return val1.compareTo(val2);
		    }
		});

		Dump.tprintln(wout, offset, objClass.className);
		Dump.tprintln(wout, offset+1, instanceName+"(");

		int portNumCount = 0;
		for(Map.Entry<VerilogPort, VerilogSignal> port : portList){

			String assignedSignalName;
			if(port.getValue()!=null)
				assignedSignalName = port.getValue().getSigName();
			else
				assignedSignalName = "";

			++portNumCount;
			if(port_assignedSig.size()!=portNumCount){
				Dump.tprintln(wout, offset+2, "."+port.getKey().getSigName()+" ("+assignedSignalName+"),");
			}
			else{
				Dump.tprintln(wout, offset+2, "."+port.getKey().getSigName()+" ("+assignedSignalName+")");
			}
		}
		Dump.tprintln(wout, offset+1, ");");
	}

	public String getObjName(){
		return objName;
	}

	public VerilogSignal getAssignedSignal(VerilogPort port){
		return port_assignedSig.get(port);
	}
}
