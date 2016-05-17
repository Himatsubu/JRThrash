package net.njlab.tool;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import openjdk.com.sun.tools.javac.tree.JCTree.JCAssign;
import openjdk.com.sun.tools.javac.tree.JCTree.JCClassDecl;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpression;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;
import java.io.*;

/**
 *  @author Keisuke Koike
 */
public enum Manager {
	INSTANCE;

	private ArrayList<VerilogClass> classes = new ArrayList<VerilogClass>();
	private ArrayList<ModuleTreeNode> rootNodes = new ArrayList<ModuleTreeNode>();

	public void genNewEntry(JCClassDecl cdef, String lang){

		CompileMsgs.setLang(lang);

		VerilogClass tmp = new VerilogClass(cdef);
		classes.add(tmp);
	}

	public boolean checkERR(){

		System.out.println("");
		boolean ret = false;
		for(int i=0; i<classes.size(); i++){
			if(classes.get(i).existERR()){
				ret |= true;
				System.out.println(classes.get(i).className+" has error");
			}
		}
		return ret;
	}

	//同じ名前のクラスがないかチェック
	public boolean checkDuplicateClass(String className){

		for(int i=0; i<classes.size(); i++){
			className = classes.get(i).className;

			for(int j=i+1; j<classes.size(); j++){
				if(className.compareTo(classes.get(j).className)==0){
					return false;
				}
			}
		}
		return true;
	}

	public boolean findTopModuleTreeNode(){

		if(!checkAllClassesAreAligned())
			return false;

		for(VerilogClass claz : classes){
			for(Map.Entry<String, String> objName_ClassName : claz.objName_ClassName.entrySet()){//各クラスの持つオブジェクト

				for(int i=0; i<classes.size(); i++){
					if(classes.get(i).className.compareTo(objName_ClassName.getValue())==0){//claz の持つオブジェクトの型名と他のコンパイル対象のクラス名が一致した
						classes.get(i).setChildTreeNode();
						claz.addObjName_vClass(objName_ClassName.getKey(), classes.get(i));
					}
				}
			}
		}
		return true;
		/*for(VerilogClass claz : classes){
			for(Map.Entry<String, VerilogClass> objName_vClass : claz.getObjName_vClass().entrySet()){//各クラスの持つオブジェクト
				System.out.println("llpa	"+claz.className+"	"+objName_vClass.getKey()+"  :  "+objName_vClass.getValue().className+"	"+claz.isTopTreeNode());
			}
		}*/
	}

	private boolean checkAllClassesAreAligned(){

		ArrayList<String> classNames = new ArrayList<String>();

		for(VerilogClass claz : classes){
			for(Map.Entry<String, String> objName_ClassName : claz.objName_ClassName.entrySet()){
				classNames.add(objName_ClassName.getValue());
			}
		}

		for(String className : classNames){

			boolean classExist = false;
			for(VerilogClass claz : classes){
				if(className.compareTo(claz.className) == 0){
					classExist = true;
					break;
				}
			}
			if(classExist==false){
				CompileMsgs.edumpClassDefNotFound(className);
				return false;
			}

		}
		return true;
	}

	/**
	 * クラスの階層構造を作成
	 * */
	public boolean makeModuleTree(){

		ModuleTreeNode top = null;
		int topNodeNum = 0;
		boolean ret = true;

		for(VerilogClass claz : classes){
			if(claz.isTopTreeNode()){

				++topNodeNum;
				top = new ModuleTreeNode(null, claz, null);
				ret &= top.makeChild();
				if(ret){
					dumpModuleTree(top, topNodeNum);
					rootNodes.add(top);
				}
			}
		}

		if(topNodeNum==0){
			CompileMsgs.edumpNoTopModule();
			ret = false;
		}
		return ret;
	}

	private void dumpModuleTree(ModuleTreeNode top, int topNodeNum){

		String resultDirName = Manager.getCurrentPass()+"/tmp";

		File dir = new File(resultDirName);
		if(dir.isDirectory()==false)
			dir.mkdir();

		File file = new File(resultDirName+"/moduleTree"+topNodeNum+".xml");
		PrintWriter wout = null;
	    try{
	    	wout = new PrintWriter(new BufferedWriter(new FileWriter(file)));
	    }
	    catch(IOException e){
	    	System.out.println(e);
	    }
	    Dump.tprintln(wout, 0, "<?xml version=\"1.0\" encoding=\"shift_jis\" ?>\n");
	    top.dumpNode(wout, 0);
	    wout.close();
	}

	public void makeSubModules(){
		for(int i=0; i<rootNodes.size(); i++)
			rootNodes.get(i).makeSubModules();
	}

	public void makeDFG(){
		for(int i=0; i<classes.size(); i++)
			classes.get(i).makeDFG();
	}

	public void scheduling(){
		for(int i=0; i<classes.size(); i++)
			classes.get(i).scheduling();
	}

	public void makeSignal(){
		for(int i=0; i<classes.size(); i++)
			classes.get(i).makeSignal();
	}

	public void allocateTmpSignal(){
		for(int i=0; i<classes.size(); i++)
			classes.get(i).allocateTmpSignal();
	}

	public void makeAlways(){
		for(int i=0; i<classes.size(); i++)
			classes.get(i).makeAlways();
	}

	public void dumpModule(){
		System.out.println("\n==============make verilog file==============\n");
		for(int i=0; i<classes.size(); i++)
			classes.get(i).dumpModule();
	}

	public void dump(){
		for(int i=0; i<classes.size(); i++)
			classes.get(i).dump(null, 0);
	}

	public void dumpDFG(){
		for(int i=0; i<classes.size(); i++)
			classes.get(i).dumpDFG();
	}

	public void convert(){

		String className = null;
		if(!net.njlab.tool.Manager.INSTANCE.checkDuplicateClass(className)){
			CompileMsgs.edumpSamaNameClass(className);
			return;
		}

		if(!net.njlab.tool.Manager.INSTANCE.findTopModuleTreeNode()){
			return;
		}
		if(!net.njlab.tool.Manager.INSTANCE.makeModuleTree()){
			return;
		}

		net.njlab.tool.Manager.INSTANCE.makeDFG();
		if(checkERR()){
			return;
		}

    	net.njlab.tool.Manager.INSTANCE.scheduling();
       	net.njlab.tool.Manager.INSTANCE.makeSignal();	//ステップ数を知った後に コントロールシグナルを作成するため，scheduling()のあとに実行
       	net.njlab.tool.Manager.INSTANCE.makeSubModules();

    	net.njlab.tool.Manager.INSTANCE.allocateTmpSignal();
    	net.njlab.tool.Manager.INSTANCE.makeAlways();
    	net.njlab.tool.Manager.INSTANCE.dumpModule();
    	net.njlab.tool.Manager.INSTANCE.dump();
    	net.njlab.tool.Manager.INSTANCE.dumpDFG();
	}

	public static String getCurrentPass(){

		String classPath = System.getProperty("java.class.path");
		String separator = System.getProperty("file.separator");
		String classPathAbs = (new File(classPath)).getAbsolutePath();
		return classPathAbs.substring(0,classPathAbs.lastIndexOf(separator));
	}

	static public String extractAnnotationParam(String paramName, List<JCExpression> params){

		for(JCExpression param : params){
			if( ((JCAssign)param).lhs.toString().compareTo(paramName)==0 )
				return ((JCAssign)param).rhs.toString().replace("\"", "");
		}
		return null;
	}
}
