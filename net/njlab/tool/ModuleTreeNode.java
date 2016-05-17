package net.njlab.tool;

import java.util.*;
import java.io.*;
import net.njlab.model.*;
import net.njlab.dump.*;
/**
 *  @author Keisuke Koike
 */
public class ModuleTreeNode {

	VerilogClass claz;
	String objName;
	private ModuleTreeNode parent;
	ArrayList<ModuleTreeNode> children = new ArrayList<ModuleTreeNode>();

	ModuleTreeNode(ModuleTreeNode parent, VerilogClass claz, String objName){
		this.parent = parent;
		this.claz = claz;
		this.objName = objName;
		if(this.objName==null)
			this.objName = "*thisIsTopModule";
	}

	String getClassName(){
		return claz.className;
	}

	public boolean makeChild(){

		boolean ret = true;
		if(checkRecurrence()){
			for(Map.Entry<String, VerilogClass> objName_vClass  :  claz.getObjName_vClass().entrySet()){
				if(ret){
					ModuleTreeNode child = new ModuleTreeNode(this, objName_vClass.getValue(), objName_vClass.getKey());
					ret &= child.makeChild();
					children.add(child);
				}
			}
		}
		else{
			ret = false;
		}
		return ret;
	}

	/**
	 * 再帰的にオブジェクトが宣言されていないかチェック
	 * */
	private boolean checkRecurrence(){

		ModuleTreeNode tmpParent = parent;

		while(tmpParent!=null){
			for(Map.Entry<String, VerilogClass> objName_vClass  :  claz.getObjName_vClass().entrySet()){

				if(tmpParent.claz.className.compareTo(objName_vClass.getValue().className)==0){	//これから作る子モジュールのクラス名が親ノードのクラス名と一致した
					CompileMsgs.edumpRecursiveDecl(claz.className, objName_vClass.getKey());
					return false;
				}
			}
			tmpParent = tmpParent.parent;
		}
		return true;
	}

	public void dumpNode(PrintWriter wout, int offset){

		Dump.tprintln(wout, offset, "<module>");
		Dump.tprintln(wout, offset+1, "<name objName = "+"\""+objName+"\"    "+"className = "+"\""+claz.className+"\" />");
		for(ModuleTreeNode child : children){
			Dump.tprintln(wout, offset+1, "<subModule>");
			child.dumpNode(wout, offset+2);
			Dump.tprintln(wout, offset+1, "</subModule>");
		}
		Dump.tprintln(wout, offset, "</module>");
	}

	public void makeSubModules(){

		for(ModuleTreeNode child : children){//下の階層のクラスからサブモジュールを作り，トップまで伸びる信号を伝播させる
			child.makeSubModules();
		}
		claz.makeSubModules();
	}
}
