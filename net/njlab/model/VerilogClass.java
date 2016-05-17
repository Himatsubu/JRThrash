package net.njlab.model;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import net.njlab.circuit.KeyWord;
import net.njlab.circuit.TmpSignals;
import net.njlab.circuit.VerilogAlways;
import net.njlab.circuit.VerilogCaseChild;
import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogExpr;
import net.njlab.circuit.VerilogIfStatement;
import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogModule;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogPort;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.circuit.VerilogSubModule;
import net.njlab.circuit.VerilogUnaryExpression;
import net.njlab.circuit.VerilogWire;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import net.njlab.scheduling.SchedulingListSet;
import net.njlab.tool.Manager;
import openjdk.com.sun.tools.javac.tree.JCTree;
import openjdk.com.sun.tools.javac.tree.JCTree.JCClassDecl;
import openjdk.com.sun.tools.javac.tree.JCTree.JCMethodDecl;
import openjdk.com.sun.tools.javac.tree.JCTree.JCVariableDecl;

/**
 *  @author Keisuke Koike
 */
public class VerilogClass  extends VerilogStatementsPhase {

	public JCClassDecl cdecl;
	public List<JCTree> defs;
	public ArrayList<VerilogVariableDecl> classVariables = new ArrayList<VerilogVariableDecl>();//クラス内部の全変数
	private ArrayList<VerilogMethod> methods = new ArrayList<VerilogMethod>();//クラス内部の全メソッド
	private ArrayList<VerilogMethod> methodsConvertedIPcore = new ArrayList<VerilogMethod>();//クラス内部のIPコア化される全メソッド
	public String className;
	public Config config;
	VerilogModule module;
	VerilogPort clock = new VerilogPort(KeyWord.K_clock, VerilogPort.input, 1, VerilogSignal.unsigned, null, VerilogPort.isNotBramControl);
	VerilogPort reset;
	VerilogPort clockEnablePort;
	public VerilogWire boolTrue = new VerilogWire(KeyWord.K_sys_+KeyWord.K_boolTrue, 1,
												  new VerilogLiteralNumber(1, VerilogLiteralNumber.typeBinary, "1"), VerilogSignal.unsigned);
	public VerilogWire boolFalse = new VerilogWire(KeyWord.K_sys_+KeyWord.K_boolFalse, 1,
			   									   new VerilogLiteralNumber(1, VerilogLiteralNumber.typeBinary, "0"), VerilogSignal.unsigned);
	public VerilogWire wireClockEnable = new VerilogWire(KeyWord.K_sys_+KeyWord.K_ce, 1, VerilogSignal.unsigned);
	public VerilogWire intOne;
	public VerilogWire intZero;
	VerilogReg processingMethodID;
	TmpSignals tmpSiganls = new TmpSignals(this);
	VerilogAlways allProcess;
	VerilogIfStatement resetPart;
	//VerilogIfStatement processPart;
	//VerilogIfStatement methodStart;
	VerilogIfStatement methodProcess;
	VerilogCaseStatement methodCase;
	SchedulingListSet listSet;
	public static String zeroString = "0";
	private int maxIntRegNum   = 0;
	private int maxLongRegNum  = 0;
	private int maxFloatRegNum = 0;
	private int maxBoolRegNum  = 0;
	boolean isTopModuleTreeNode = true;		//モジュールの階層木のトップノードである -> true
	VerilogStatAssemblage fieldInitialPart;
	public Map<String, String> objName_ClassName = new HashMap<String, String>();	//例: SubClass  sub = new SubA()   ->   <sub,  SubClass>
	Map<String, VerilogClass> objName_vClass = new HashMap<String, VerilogClass>();
	Map<String, ArrayList<VerilogVariableDecl>> objName_objField = new HashMap<String, ArrayList<VerilogVariableDecl> >();
	boolean subModuleIsMaked = false;
	boolean extendsThread = false;	//Thread クラスを継承している
	ArrayList<VerilogReg> arbiterRegs = new ArrayList<VerilogReg>();	//リセットパートでアービタを0にする
	private ArrayList<VerilogReg> bramRorWRegsForSubmod = new ArrayList<VerilogReg>();	//オブジェクトのフィールドが持つ配列の read wire ポート  リセットパートで0にする
	private ArrayList<VerilogReg> bramAddrRegsForSubmod = new ArrayList<VerilogReg>();	//オブジェクトのフィールドが持つ配列の addr ポート  リセットパートで0にする
	private ArrayList<VerilogReg> methodReq_RegsOfObject = new ArrayList<VerilogReg>();	//オブジェクトのメソッドを呼び出すためのリクエストレジスタ  リセットパートで0にする

	public VerilogClass(JCClassDecl cdecl){

		System.out.println("\n-----------class "+cdecl.name.toString()+" analyzing syntax tree----------------");
		this.cdecl = cdecl;
		defs = cdecl.defs;
		this.parent = null;
		className = cdecl.name.toString();
		threadCheck();
		config = new Config(className);		//コンフィグクラス作成
		module = new VerilogModule(this);	//モジュール作成
		VerilogVariableDecl.setClassVariables(classVariables); //変数クラスにクラス内部の全変数リストの格納先を渡す
		VerilogVariableDecl.resetVariableID(0);				   //変数IDリセット
		VerilogMethodInv.resetCalledTimes(0);	//メソッド呼び出しのあった回数をリセット
		makeField();
		makeMethod();
		setMethodID();
		VerilogVariableDecl.setClassVariables(null);
	}

	private void threadCheck(){

		if(cdecl.extending!=null){
			extendsThread = (cdecl.extending.toString().compareTo("Thread")==0) ? true : false;
		}
	}

	public VerilogPort getClock(){
		return clock;
	}

	public VerilogPort getReset(){
		return reset;
	}

	public VerilogReg getProcessingMethodIDreg(){
		return processingMethodID;
	}

	public VerilogModule getModule(){
		return module;
	}

	public ArrayList<VerilogVariableDecl> getClassVariables(){
		return classVariables;
	}

	public ArrayList<VerilogMethod> getMethods(){
		return methods;
	}

	public ArrayList<VerilogMethod> getMethodsConvertedIPcore(){
		return methodsConvertedIPcore;
	}

	public ArrayList<VerilogReg> getBramRorWRegsForSubmod(){
		return bramRorWRegsForSubmod;
	}

	/**
	 *フィールド情報作成
	 */
	private void makeField(){

		ArrayList<VerilogVariableDecl> primitiveVariableDecl = new ArrayList<VerilogVariableDecl>();
		for (JCTree def : cdecl.defs) {
			if(def == null){}
			else if(def instanceof JCVariableDecl){
				VerilogVariableDecl tmp = new VerilogVariableDecl((JCVariableDecl)def, className, VerilogVariableDecl.defTypeField);
				tmp.setPhaseParent(this);
				tmp.buildExpression();
				pushFieldObject(tmp);
				this.variableStack.add(tmp);

				if(!tmp.isArray)
					primitiveVariableDecl.add(tmp);
			}
		}
		if(variableStack.size()>=1)
			fieldInitialPart = new VerilogStatAssemblage(primitiveVariableDecl, this, 1);
	}

	/**
	 * オブジェクトの持つフィールドを作る用
	 * */
	private ArrayList<VerilogVariableDecl> reproductField(){

		ArrayList<VerilogVariableDecl> fields = new ArrayList<VerilogVariableDecl>();
		/*for (JCTree def : defs) {
			if(def == null){}
			else if(def instanceof JCVariableDecl){
				VerilogVariableDecl tmp = new VerilogVariableDecl((JCVariableDecl)def, VerilogVariableDecl.defTypeField);
				tmp.setPhaseParent(this);
				fields.add(tmp);
			}
		}*/

		for(VerilogVariableDecl verilogVdecl :  variableStack){

			VerilogExpression init = (verilogVdecl.isArray) ? verilogVdecl.init : null;	// 配列型フィールドには init 情報が必要
			VerilogVariableDecl tmp = new VerilogVariableDecl((JCVariableDecl)verilogVdecl.vdecl, VerilogVariableDecl.defTypeField, init);
			tmp.setPhaseParent(this);
			fields.add(tmp);
		}

		return fields;
	}

	//フィールドに宣言されたオブジェクトの名前を fieldObjectName に格納
	private void pushFieldObject(VerilogVariableDecl fieldVariable){

		if(fieldVariable.isPrimitive==false){
			if(fieldVariable.init instanceof VerilogNewClass){
				objName_ClassName.put(fieldVariable.name, fieldVariable.type);
			}
		}
	}

	/**
	 * メソッド情報作成
	 * */
	public void makeMethod(){

		for (JCTree def : cdecl.defs) {
			if(def == null) continue;
			else if(def instanceof JCMethodDecl){
				if("<init>".compareTo(((JCMethodDecl)def).name.toString())==0) continue;	//コンストラクタは処理しない
				VerilogStatementsPhase.resetStateId();				   //フェイズIDリセット
				VerilogMethod tmp = new VerilogMethod((JCMethodDecl)def, this);

				if(tmp.convertedIntoIP==false)
					methods.add(tmp);
				else
					methodsConvertedIPcore.add(tmp);
			}
		}

		for(VerilogMethod method : methods)
			method.buildSubstance();

		for(VerilogMethod method : methodsConvertedIPcore)
			method.buildSubstance();

		ArrayList<VerilogMethod> allMethod = new ArrayList<VerilogMethod>();
		allMethod.addAll(methods);
		allMethod.addAll(methodsConvertedIPcore);

		//オーバーロードしていないかチェック
		for(int i=0; i<allMethod.size()-1; i++){
			for(int j=i+1; j<allMethod.size(); j++){
				if(allMethod.get(i).methodName.compareTo(allMethod.get(j).methodName)==0){
					CompileMsgs.edumpOverload(allMethod.get(j).methodName);
					this.buildSucceed = false;
				}
			}
		}
	}

	public VerilogMethod getMethod(String methodName){

		for(VerilogMethod method : methods){
			if(method.methodName.compareTo(methodName)==0)
				return method;
		}
		for(VerilogMethod method : methodsConvertedIPcore){
			if(method.methodName.compareTo(methodName)==0)
				return method;
		}
		return null;
	}

	public VerilogMethod getMethod(int methodID){

		for(VerilogMethod method : methods){
			if(method.getMethodID()==methodID)
				return method;
		}
		for(VerilogMethod method : methodsConvertedIPcore){
			if(method.getMethodID()==methodID)
				return method;
		}
		return null;
	}

	private void setMethodID(){
		for(int i=0; i<methods.size(); i++)
			methods.get(i).methodID = i+1;
	}

	@Override
	public boolean existERR(){

		System.out.println("\n-----------class "+cdecl.name.toString()+" check error----------------\n");
		boolean ret = !buildSucceed;

		for(int i=0; i<classVariables.size(); i++){
			ret |= classVariables.get(i).existERR();
		}

		for(int i=0; i<methods.size(); i++){
			ret |= methods.get(i).existERR();
		}

		for(int i=0; i<methodsConvertedIPcore.size(); i++){
			ret |= methodsConvertedIPcore.get(i).existERR();
		}

		if(!ret)
			System.out.println(cdecl.name.toString()+" has no error\n");
		return ret;
	}

	/**
	 * VerilogTree 出力
	 * */
	public void dump(PrintWriter out, int offset){

		String resultDirName = Manager.getCurrentPass()+"/tmp";

		File dir = new File(resultDirName);
		if(dir.isDirectory()==false)
			dir.mkdir();

		File file = new File(resultDirName+"/"+className+"_verilog_tree.xml");
		PrintWriter wout = null;
	    try{
	    	wout = new PrintWriter(new BufferedWriter(new FileWriter(file)));
	    }
	    catch(IOException e){
	    	System.out.println(e);
	    }
	    Dump.tprintln(wout, offset, "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n");
	    //Dump.tprintln(wout, offset, "<Class>	<Phase>  "+ this.stateID +"  </Phase>\n");
	    Dump.tprintln(wout, offset, "<Class>\n");
	    Dump.tprintln(wout, offset+1, "<ClassName>	"+className+"	</ClassName>\n");
	    Dump.tprintln(wout, offset+1, "<AllVariables>");
	    for(int i=0; i<classVariables.size(); i++)
	    	classVariables.get(i).dump(wout, offset+2);
	    Dump.tprintln(wout, offset+1, "</AllVariables>\n");
	    for(int i=0; i<methods.size(); i++){
		    methods.get(i).dump(wout, offset+1);
	    }
	    Dump.tprintln(wout, offset, "</Class>");
	    wout.close();
	}

	/**
	 * DFG出力
	 * */
	public void dumpDFG(){

		String resultDirName = Manager.getCurrentPass()+"/dfg";

		File dir = new File(resultDirName);
		if(dir.isDirectory()==false)
			dir.mkdir();

		File file = new File(resultDirName+"/"+className+"_dfg.xml");
		PrintWriter wout = null;
		try{
	    	wout = new PrintWriter(new BufferedWriter(new FileWriter(file)));
	    }
	    catch(IOException e){
	    	System.out.println(e);
	    }
		Dump.tprintln(wout, 0, "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n");
		Dump.tprintln(wout, 0,"<CLASS>");
		Dump.tprintln(wout, 0,"<className>	"+className+"	</className>");
		for(int i=0; i<methods.size(); i++){
			methods.get(i).dumpDFG(wout);
		}
		Dump.tprintln(wout, 1,"</CLASS>");
		wout.close();
	}

	/**
	 * レジスタやワイヤ, IPコアの作成
	 * */
	public void makeSignal(){

		processingMethodID = new VerilogReg(KeyWord.K_sys_+KeyWord.K_processing+KeyWord.K_methodID, VerilogMethod.calcPhaseBit(methods.size()+1), VerilogSignal.unsigned);
		intOne = new VerilogWire(KeyWord.K_sys_+KeyWord.K_intOne, config.intBitWidth,
								 new VerilogLiteralNumber(config.intBitWidth, VerilogLiteralNumber.typeSignedHexadecimal, "1"), VerilogSignal.signed);
		intZero = new VerilogWire(KeyWord.K_sys_+KeyWord.K_intZero, config.intBitWidth,
								  new VerilogLiteralNumber(config.intBitWidth, VerilogLiteralNumber.typeSignedHexadecimal, "0"), VerilogSignal.signed);

		reset = new VerilogPort(config.isNegativeReset ? KeyWord.K_reset_n : KeyWord.K_reset, VerilogPort.input, 1, VerilogSignal.unsigned, null, VerilogPort.isNotBramControl);


		if(config.clockEnable)
			clockEnablePort = new VerilogPort(KeyWord.K_ce, VerilogPort.input,1, VerilogSignal.unsigned, null, VerilogPort.isNotBramControl);

		module.addPort(clock);
		module.addPort(reset);
		if(clockEnablePort!=null)	module.addPort(clockEnablePort);
		module.addRegister(processingMethodID);
		module.addWire(boolTrue);
		module.addWire(boolFalse);
		module.addWire(intOne);
		module.addWire(intZero);
		module.addWire(wireClockEnable);
		module.makeSignal();
		makeClockEnableSignal();
	}

	/**
	 * ClockEnable の作成
	 * */
	private void makeClockEnableSignal(){

		wireClockEnable.setAssignExpression(boolTrue);

		String clockEnableExprStr = boolTrue.getExprString(1, boolTrue.isSigned);
		if(clockEnablePort!=null)
			clockEnableExprStr += " & "+clockEnablePort.getExprString(clockEnablePort.bitWidth, clockEnablePort.isSigned);

		for(VerilogVariableDecl vdecl : classVariables){

			if(vdecl.getParamListSignal()!=null && vdecl.isArray){	//配列のパラメータ引数
				VerilogWire cacheHit = vdecl.getParamListSignal().getPrmLstArrayCacheHitWire();
				clockEnableExprStr += " & "+cacheHit.getExprString(cacheHit.bitWidth, cacheHit.isSigned);
			}
		}
		VerilogSignalString clockEnableExpr = new VerilogSignalString(clockEnableExprStr , wireClockEnable.bitWidth, wireClockEnable.isSigned);
		wireClockEnable.setAssignExpression(clockEnableExpr);
	}


	/**
	 * Data Flow Graph 作成
	 * */
	public void makeDFG(){
		System.out.println("=================="+className+" makeDFG==================\n");

		if(fieldInitialPart!=null)
			fieldInitialPart.makeDFG();

		for(int i=0; i<methods.size(); i++){
			methods.get(i).makeDFG();
		}
	}

	/**
	 * DFGのスケジューリング
	 * */
	public void scheduling(){

		listSet = new SchedulingListSet(this, config);

		if(fieldInitialPart!=null)
			fieldInitialPart.scheduling();

		for(int i=0; i<methods.size(); i++)
			methods.get(i).scheduling();

		module.addUsedIPcoreSignal();
	}

	/**
	 * 一時レジスタの確保と割り当て
	 * */
	public void allocateTmpSignal(){

		//if(config.registerSharing){
		for(int i=0; i<methods.size(); i++)
			methods.get(i).getMaxRegisterNumWithSharing();
		/*}
		else{
			for(int i=0; i<methods.size(); i++)
				methods.get(i).getMaxRegisterNum();
		}*/

		dumpUsedRegNum();

		for(int i=0; i<methods.size(); i++)
			methods.get(i).bindTmpReg();	//バインディング

		if(fieldInitialPart!=null)
			fieldInitialPart.bindTmpReg(this);

		dumpRegisterSharingInfo();
	}

	private void dumpRegisterSharingInfo(){

		//レジスタがシェアリングされたステート数

		System.out.println("\n======== sharing Info on [floating] tmp register ========");
		for(int i=0; i<tmpSiganls.getFloatRegArray().size(); i++)
			System.out.println("registerID = "+i+"		sharing states = "+tmpSiganls.getFloatRegArray().get(i).usedTime);


		System.out.println("\n======== sharing Info on [int] tmp register ========");
		for(int i=0; i<tmpSiganls.getIntRegArray().size(); i++)
			System.out.println("registerID = "+i+"		sharing states = "+tmpSiganls.getIntRegArray().get(i).usedTime);


		System.out.println("\n======== sharing Info on [long] tmp register ========");
		for(int i=0; i<tmpSiganls.getLongRegArray().size(); i++)
			System.out.println("registerID = "+i+"		sharing states = "+tmpSiganls.getLongRegArray().get(i).usedTime);


		System.out.println("\n======== sharing Info on [boolean] tmp register ========\n");
		for(int i=0; i<tmpSiganls.getBooleanRegArray().size(); i++)
			System.out.println("registerID = "+i+"		sharing states = "+tmpSiganls.getBooleanRegArray().get(i).usedTime);
	}

	public void dumpUsedRegNum(){

		int byteRegNum = 0;
		int shortRegNum = 0;
		int intRegNum = maxIntRegNum;
		int longRegNum = maxLongRegNum;
		int floatRegNum = maxFloatRegNum;
		int boolRegNum = maxBoolRegNum;

		for(VerilogVariableDecl vdecl: classVariables){
			if(vdecl.getType().compareTo(VerilogVariableDecl.booleanType)==0 && (!vdecl.isReadOnlyPort))
				++boolRegNum;
			else if((vdecl.getType().compareTo(VerilogVariableDecl.floatType)==0 || vdecl.getType().compareTo(VerilogVariableDecl.doubleType)==0)
					&& (!vdecl.isReadOnlyPort))
				++floatRegNum;
			else if(vdecl.getType().compareTo(VerilogVariableDecl.longType)==0 && (!vdecl.isReadOnlyPort))
				++longRegNum;
			else if(vdecl.getType().compareTo(VerilogVariableDecl.intType)==0 && (!vdecl.isReadOnlyPort))
				++intRegNum;
			else if(vdecl.getType().compareTo(VerilogVariableDecl.shortType)==0 && (!vdecl.isReadOnlyPort))
				++shortRegNum;
			else if(vdecl.getType().compareTo(VerilogVariableDecl.byteType)==0 && (!vdecl.isReadOnlyPort))
				++byteRegNum;
		}

		System.out.println("\n\n\n------  "+this.className+"	used register num ( temporary register num )"+"  ------");
		System.out.println("	byte: "+byteRegNum+"	short: "+shortRegNum);
		System.out.println("	int: "+intRegNum+" ("+maxIntRegNum+") "+"	long: "+longRegNum+" ("+maxLongRegNum+")");
		System.out.println("	float: "+floatRegNum+" ("+maxFloatRegNum+") "+"	bool: "+boolRegNum+" ("+maxBoolRegNum+")");
	}

	public void setUsedRegNum(int intRegNum, int longRegNum, int floatRegNum, int boolRegNum){

		maxIntRegNum   = Math.max(intRegNum,   maxIntRegNum);
		maxLongRegNum  = Math.max(longRegNum,  maxLongRegNum);
		maxFloatRegNum = Math.max(floatRegNum, maxFloatRegNum);
		maxBoolRegNum  = Math.max(boolRegNum,  maxBoolRegNum);
	}

	/**
	 * always 文の作成
	 * */
	public void makeAlways(){

		allProcess = new VerilogAlways(clock, this);
		resetPart = new VerilogIfStatement();
		//processPart = new VerilogIfStatement();
		//processPart.setCond(wireClockEnable);

		if(config.isNegativeReset){
			VerilogUnaryExpression resetExpr = new VerilogUnaryExpression(reset, VerilogUnary.NOT);
			resetPart.setCond(resetExpr);
		}
		else{
			resetPart.setCond(reset);
		}
		allProcess.setIfStat(resetPart);
		//resetPart.setElsePart(processPart);

		module.setAlways(allProcess);
		makeResetPart();
		makeWaitMethodReqPart();
		makeMethodBody();
		//if(methodStart!=null)
		//	processPart.addChildBlock(methodStart);

		if(config.genCodeForCompressedState)	//複数の always文に分けた記述を行う場合
			module.makeAlways();
	}

	/*private void makeWaitMethodReqPart(){

		if(methods.size()!=0){
			methodCase = new VerilogCaseStatement();
			methodCase.setBranchSignal(processingMethodID);

			VerilogCaseChild waitingPart = new VerilogCaseChild();
			VerilogLiteralNumber zero = new VerilogLiteralNumber(processingMethodID.bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(0));
			waitingPart.setCond(zero);

			int i=0;
			VerilogIfStatement firstMethod = null;	//最初に定義されたIPコア化しないメソッド

			do{
				VerilogIfStatement tmp = methods.get(i++).makeMethodInitial();
				if(firstMethod==null){
					if(tmp!=null)
						firstMethod = tmp;
				}
				else if(tmp!=null){
					firstMethod.setLastElsePart(tmp);
				}

			}while(methods.size()!=i);
			if(firstMethod!=null)
				waitingPart.addChildBlock(firstMethod);
			methodCase.addChildStat(waitingPart);
		}
	}*/

	private void makeWaitMethodReqPart(){

		if(methods.size()!=0){
			methodCase = new VerilogCaseStatement();
			methodCase.setBranchSignal(processingMethodID);

			VerilogCaseChild waitingPart = new VerilogCaseChild();
			VerilogLiteralNumber zero = new VerilogLiteralNumber(processingMethodID.bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(0));
			waitingPart.setCond(zero);
			StateIdentifier methodReqWaitState = new StateIdentifier(waitingPart.getCondNumber(), StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, false);

			VerilogSignal methodIdChange = null;
			for(int i=0; i<methods.size(); ++i)
				methodIdChange = methods.get(i).makeMethodInitial(waitingPart, methodIdChange);

			if(methodIdChange!=null){
				VerilogNoneBlockAssign methodIDCharngeAssign = new VerilogNoneBlockAssign(processingMethodID, methodIdChange, methodReqWaitState);
				waitingPart.addNoneBlockStat(methodIDCharngeAssign);
			}
			methodCase.addChildStat(waitingPart);
		}
	}

	private void makeMethodBody(){

		if(methods.size()!=0){
			methodProcess = new VerilogIfStatement();
			methodProcess.addChildBlock(methodCase);
			methodProcess.setCond(wireClockEnable);
			resetPart.setElsePart(methodProcess);
		}

		for(int i=0; i<methods.size(); i++){
			VerilogCaseChild tmp = new VerilogCaseChild();
			methods.get(i).makeMethodProcess(tmp);
			methodCase.addChildStat(tmp);
		}
	}

	private void makeResetPart(){

		ArrayList<VerilogNoneBlockAssign> resetAssign = new ArrayList<VerilogNoneBlockAssign>();
		for(int i=0; i<methods.size(); i++){
			methods.get(i).makeResetPart(resetAssign);
		}
		if(fieldInitialPart!=null)
			fieldInitialPart.makeResetPart(resetAssign);

		StateIdentifier resetState = new StateIdentifier(StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, true);

		for(int i=0; i<arbiterRegs.size(); i++){
			VerilogNoneBlockAssign arbiterReset = new VerilogNoneBlockAssign(arbiterRegs.get(i), boolFalse, resetState);
			resetAssign.add(arbiterReset);
		}

		//メソッド選択信号のリセット
		VerilogSignalString prcsMethodIDzero = new VerilogSignalString(processingMethodID.bitWidth+"'h0", processingMethodID.bitWidth, processingMethodID.isSigned);
		VerilogNoneBlockAssign prcsMethodIDreset = new VerilogNoneBlockAssign(processingMethodID, prcsMethodIDzero, resetState);
		resetAssign.add(prcsMethodIDreset);

		for(int i=0; i<resetAssign.size(); i++)
			resetPart.addThenChildAssign(resetAssign.get(i));

		methodReqRegOfObjectReset(resetPart);
		bramReadOrWriteReset(resetPart);
		bramAddrReset(resetPart);
		module.newDataReset(resetPart);	//IPコアのnewdataポートのリセット
	}

	private void bramReadOrWriteReset(VerilogIfStatement resetPart){

		StateIdentifier resetState = new StateIdentifier(StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, true);
		for( VerilogVariableDecl vdecl : classVariables){

			if(vdecl.isArray){
				if( vdecl.prmLstSignals!=null ){
					VerilogNoneBlockAssign readOrWriteReset = new VerilogNoneBlockAssign(vdecl.prmLstSignals.getPrmLstArrayRorW_Reg(), boolFalse, resetState);
					resetPart.addThenChildAssign(readOrWriteReset);
				}
				else if(vdecl.fieldSignals!=null){
					VerilogNoneBlockAssign readOrWriteReset = new VerilogNoneBlockAssign(vdecl.fieldSignals.getFieldArrayRorW_Reg1(), boolFalse, resetState);
					resetPart.addThenChildAssign(readOrWriteReset);
				}
			}
		}

		//オブジェクトの持つフィールド配列を操作する用の read_write 信号をリセット
		for(VerilogReg r_or_w : bramRorWRegsForSubmod){
			VerilogNoneBlockAssign r_or_w_deAssert = new VerilogNoneBlockAssign(r_or_w, boolFalse, resetState);
			resetPart.addThenChildAssign(r_or_w_deAssert);
		}
	}

	private void bramAddrReset(VerilogIfStatement resetPart){

		StateIdentifier resetState = new StateIdentifier(StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, true);
		for( VerilogVariableDecl vdecl : classVariables){

			if(vdecl.isArray){
				if( vdecl.prmLstSignals!=null ){
					VerilogReg addrReg = vdecl.prmLstSignals.getPrmLstArrayAddrReg();
					VerilogNoneBlockAssign addrReset = new VerilogNoneBlockAssign(addrReg, VerilogSignalString.getZero(addrReg.bitWidth, addrReg.isSigned), resetState);
					resetPart.addThenChildAssign(addrReset);
				}
				else if(vdecl.fieldSignals!=null){
					VerilogReg addrReg = vdecl.fieldSignals.getFieldArrayAddrReg1();
					VerilogNoneBlockAssign addrReset = new VerilogNoneBlockAssign(addrReg, VerilogSignalString.getZero(addrReg.bitWidth, addrReg.isSigned), resetState);
					resetPart.addThenChildAssign(addrReset);
				}
			}
		}

		//オブジェクトの持つフィールド配列を操作する用の addr 信号をリセット
		for(VerilogReg addrReg : bramAddrRegsForSubmod){
			VerilogNoneBlockAssign addrReset = new VerilogNoneBlockAssign(addrReg, VerilogSignalString.getZero(addrReg.bitWidth, addrReg.isSigned), resetState);
			resetPart.addThenChildAssign(addrReset);
		}
	}

	/**
	 * オブジェクトのメソッド呼び出しを行う リクエスト信号をリセット
	 * */
	private void methodReqRegOfObjectReset(VerilogIfStatement resetPart){

		StateIdentifier resetState = new StateIdentifier(StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, true);
		for(VerilogReg methodReq : methodReq_RegsOfObject){
			VerilogNoneBlockAssign methodReq_deAssert = new VerilogNoneBlockAssign(methodReq, boolFalse, resetState);
			resetPart.addThenChildAssign(methodReq_deAssert);
		}
	}

	/**
	 * Verilog ファイル出力
	 * */
	public void dumpModule(){
		module.dumpModule();
	}

	public TmpSignals getTmpSignals(){
		return tmpSiganls;
	}

	public VerilogCaseChild makeCaseChild(){ return null; }

	public void setChildTreeNode(){
		isTopModuleTreeNode = false;
	}

	public boolean isTopTreeNode(){
		return isTopModuleTreeNode;
	}

	public void addObjName_vClass(String objName, VerilogClass claz){

		objName_vClass.put(objName, claz);
		objName_objField.put(objName, claz.reproductField());
	}

	public Map<String, VerilogClass> getObjName_vClass(){
		return objName_vClass;
	}


	/**
	 * サブモジュールの作成
	 * */
	public void makeSubModules(){

		if(subModuleIsMaked)
			return;

		subModuleIsMaked = true;
		for(Map.Entry<String, VerilogClass> objName_vClass : this.objName_vClass.entrySet()){

			VerilogSubModule subModule = new VerilogSubModule(this, objName_vClass);
			makeSubModule(objName_vClass.getKey(), objName_vClass.getValue(), subModule);
			module.addSubModule(subModule);
		}
	}

	private void makeSubModule(String objName, VerilogClass vClass, VerilogSubModule subModule){


		makeSystemSignal(objName,  vClass, subModule);	//clock, reset, req, busy, return のポートを作る

		for(VerilogPort childModulePort : vClass.getModule().getModuleIF()){

			VerilogVariableDecl portVariable = childModulePort.getOriginalvariable();

			if(portVariable!=null){//clock, reset, req, busy, return などを除く

				if(portVariable.defType.compareTo(VerilogVariableDecl.defTypeField)==0){
					if(portVariable.isPrimitive && !portVariable.isArray){	//フィールドのスカラ変数
						makeFieldScalaPort(childModulePort, objName, subModule);
					}
					else if(portVariable.isPrimitive && portVariable.isArray){	//フィールドの配列変数
						makeFieldArrayPort(childModulePort, objName, subModule);
					}
					else{
						System.out.println("DEBUG:	makeSubModule");
					}
				}
				else if(portVariable.defType.compareTo(VerilogVariableDecl.defTypeParamList)==0){
					if(portVariable.isPrimitive && !portVariable.isArray){	//パラメータリストのスカラ変数
						makePrmLstScalaReg(childModulePort, objName, subModule);
					}
					else if(portVariable.isPrimitive && portVariable.isArray){	//パラメータリストの配列変数
						makePrmLstArrayWire(childModulePort, objName, subModule);
					}
					else{
						System.out.println("DEBUG:	makeSubModule..");
					}
				}
			}
		}
	}


	private void makeFieldScalaPort(VerilogPort childModulePort, String objName, VerilogSubModule subModule){

		if(childModulePort.getOriginalvariable().isReadOnlyPort){

			VerilogPort port = new VerilogPort(objName+"_"+childModulePort.getModulePath()+childModulePort.getOriginalvariable().name, childModulePort.getDirection(),
											   childModulePort.bitWidth, childModulePort.isSigned, childModulePort.getOriginalvariable(), childModulePort.bramControllSignalType);
			port.setModulePath(objName+"_"+childModulePort.getModulePath());
			module.addPort(port);
			subModule.addPort(childModulePort, port);
		}
		else if(childModulePort.getOriginalvariable().isExtendedPort){

			VerilogPort port = new VerilogPort(objName+"_"+childModulePort.getModulePath()+childModulePort.getOriginalvariable().name, childModulePort.getDirection(),
											   childModulePort.bitWidth, childModulePort.isSigned, childModulePort.getOriginalvariable(), childModulePort.bramControllSignalType);
			port.setModulePath(objName+"_"+childModulePort.getModulePath());
			module.addPort(port);
			subModule.addPort(childModulePort, port);
		}
	}

	private void makeFieldArrayPort(VerilogPort childModulePort, String objName, VerilogSubModule subModule){

		String portName = defineName(childModulePort, objName);
		VerilogWire arrayControlWire = new VerilogWire(portName, childModulePort.bitWidth, childModulePort.isSigned);
		module.addWire(arrayControlWire);
		subModule.addPort(childModulePort, arrayControlWire);

		if(childModulePort.getOriginalvariable().isExtendedPort){

			VerilogPort arrayControlPort = new VerilogPort(portName, childModulePort.getDirection(), childModulePort.bitWidth, childModulePort.isSigned,
															 childModulePort.getOriginalvariable(), childModulePort.bramControllSignalType);

			if(arrayControlPort.getDirection()==VerilogPort.input)	//input port の場合, サブモジュールに接続される wire にinputPort を assign
				arrayControlWire.setAssignExpression(arrayControlPort);
			else
				arrayControlPort.setAssignExpression(arrayControlWire);

			arrayControlPort.setModulePath(objName+"_"+childModulePort.getModulePath());
			module.addPort(arrayControlPort);
		}
		else{
			if(childModulePort.getDirection()==VerilogPort.input)
				arrayControlWire.setAssignExpression(VerilogSignalString.getZero(arrayControlWire.bitWidth, arrayControlWire.isSigned));
		}

		VerilogSignalString arbiter = new VerilogSignalString("(|"+processingMethodID.getSigName()+")", 1, VerilogSignal.unsigned);
		VerilogVariableDecl arrayVariableOfObjectField = searchFieldInObject(objName, childModulePort.getOriginalvariable().name);	//オブジェクトのフィールドがもつ配列に対応する VerilogVariableDecl を探す

		if(childModulePort.getDirection() == VerilogPort.input){
			VerilogReg controlReg = new VerilogReg(portName, childModulePort.bitWidth, childModulePort.isSigned);
			arrayControlWire.addAssignSignal(arbiter, controlReg);
			arrayVariableOfObjectField.setArraySignalOfObject(controlReg, childModulePort.bramControllSignalType);
			module.addRegister(controlReg);

			if(childModulePort.bramControllSignalType==VerilogPort.isBramRorW)	//オブジェクトのフィールドがもつ配列の read write ポートを集めておく
				bramRorWRegsForSubmod.add(controlReg);

			else if(childModulePort.bramControllSignalType==VerilogPort.isBramAddr)	//オブジェクトのフィールドがもつ配列の addr ポートを集めておく
				bramAddrRegsForSubmod.add(controlReg);
		}
		else{
			arrayVariableOfObjectField.setArraySignalOfObject(arrayControlWire, childModulePort.bramControllSignalType);
		}
	}

	private String defineName(VerilogPort childModulePort, String objName){

		String portName = null;

		if(childModulePort.bramControllSignalType==VerilogPort.isBramAddr){
			portName = objName+"_"+childModulePort.getModulePath()+childModulePort.getOriginalvariable().name+KeyWord.K_addr;
		}
		else if(childModulePort.bramControllSignalType==VerilogPort.isBramRorW){
			portName = objName+"_"+childModulePort.getModulePath()+childModulePort.getOriginalvariable().name+KeyWord.K_r_w;
		}
		else if(childModulePort.bramControllSignalType==VerilogPort.isBramDataIn){
			portName = objName+"_"+childModulePort.getModulePath()+childModulePort.getOriginalvariable().name+KeyWord.K_datain;
		}
		else if(childModulePort.bramControllSignalType==VerilogPort.isBramDataOut){
			portName = objName+"_"+childModulePort.getModulePath()+childModulePort.getOriginalvariable().name+KeyWord.K_dataout;
		}
		else if(childModulePort.bramControllSignalType==VerilogPort.isBramClockEnable){
			portName = objName+"_"+childModulePort.getModulePath()+childModulePort.getOriginalvariable().name+KeyWord.K__ce;
		}
		else if(childModulePort.bramControllSignalType==VerilogPort.isBramCacheHit){
			portName = objName+"_"+childModulePort.getModulePath()+childModulePort.getOriginalvariable().name+KeyWord.K_cacheHit;
		}
		else{
			System.out.println("DEBUG:	VerilogClass  defineName");
		}
		return portName;
	}

	private void makePrmLstScalaReg(VerilogPort childModulePort, String objName, VerilogSubModule subModule){

		String methodName = ((VerilogMethod)childModulePort.getOriginalvariable().getPhaseParent()).methodName;
		VerilogReg prmLstScalaReg = new VerilogReg(objName+"_"+methodName+"_"+childModulePort.getOriginalvariable().name, childModulePort.bitWidth, childModulePort.isSigned);
		module.addRegister(prmLstScalaReg);
		subModule.addPort(childModulePort, prmLstScalaReg);
	}

	private void makePrmLstArrayWire(VerilogPort childModulePort, String objName, VerilogSubModule subModule){

		String methodName = ((VerilogMethod)childModulePort.getOriginalvariable().getPhaseParent()).methodName;
		String wireName = null;
		VerilogSignalString defaultSigOfInput = null;

		if(childModulePort.bramControllSignalType==VerilogPort.isBramAddr){
			wireName = objName+"_"+methodName+"_"+childModulePort.getOriginalvariable().name+KeyWord.K_addr;
		}
		else if(childModulePort.bramControllSignalType==VerilogPort.isBramRorW){
			wireName = objName+"_"+methodName+"_"+childModulePort.getOriginalvariable().name+KeyWord.K_r_w;
		}
		else if(childModulePort.bramControllSignalType==VerilogPort.isBramDataIn){
			wireName = objName+"_"+methodName+"_"+childModulePort.getOriginalvariable().name+KeyWord.K_datain;
		}
		else if(childModulePort.bramControllSignalType==VerilogPort.isBramDataOut){
			wireName = objName+"_"+methodName+"_"+childModulePort.getOriginalvariable().name+KeyWord.K_dataout;
			defaultSigOfInput = VerilogSignalString.getZero(childModulePort.bitWidth, childModulePort.isSigned);
		}
		else if(childModulePort.bramControllSignalType==VerilogPort.isBramClockEnable){
			wireName = objName+"_"+methodName+"_"+childModulePort.getOriginalvariable().name+KeyWord.K__ce;
		}
		else if(childModulePort.bramControllSignalType==VerilogPort.isBramCacheHit){
			wireName = objName+"_"+methodName+"_"+childModulePort.getOriginalvariable().name+KeyWord.K_cacheHit;
			defaultSigOfInput = new VerilogSignalString("1'b1", 1, VerilogSignal.unsigned);
		}
		else{
			System.out.println("DEBUG:	VerilogClass  makePrmLstArrayWire");
		}

		VerilogWire prmLstScalaWire = (defaultSigOfInput!=null) ? new VerilogWire(wireName, childModulePort.bitWidth, defaultSigOfInput, childModulePort.isSigned) :
													 new VerilogWire(wireName, childModulePort.bitWidth, childModulePort.isSigned);
		module.addWire(prmLstScalaWire);
		subModule.addPort(childModulePort, prmLstScalaWire);
	}

	private void makeSystemSignal(String objName, VerilogClass vClass, VerilogSubModule subModule){

		subModule.addPort(vClass.clock, clock);
		subModule.addPort(vClass.reset, reset);

		if(clockEnablePort!=null && vClass.clockEnablePort!=null)
			subModule.addPort(vClass.clockEnablePort, clockEnablePort);

		else if( (clockEnablePort==null && vClass.clockEnablePort!=null) || (clockEnablePort!=null && vClass.clockEnablePort==null))
			CompileMsgs.wdumpConsistentClockEnable();

		for(VerilogMethod method: vClass.methods){

			if(method.methodModType.compareTo(VerilogVariableDecl.privateModif)!=0){//private メソッドは, req busy を持たない

				VerilogReg requestReg = new VerilogReg(objName+"_"+method.methodName+KeyWord.K_req, method.portReq.bitWidth, method.portReq.isSigned);
				module.addRegister(requestReg);
				subModule.addPort(method.portReq, requestReg);
				methodReq_RegsOfObject.add(requestReg);

				VerilogWire busyWire = new VerilogWire(objName+"_"+method.methodName+KeyWord.K_busy, method.portBusy.bitWidth, method.portBusy.isSigned);
				module.addWire(busyWire);
				subModule.addPort(method.portBusy, busyWire);

				if(method.portRet!=null){
					VerilogWire returnWire = new VerilogWire(objName+"_"+method.methodName+KeyWord.K_return, method.portRet.bitWidth, method.portRet.isSigned);
					module.addWire(returnWire);
					subModule.addPort(method.portRet, returnWire);
				}
			}
		}
	}

	public void addArbiterRegister(VerilogReg arbiter){
		arbiterRegs.add(arbiter);
	}

	/**
	 * オブジェクト名とそのオブジェクトのフィールド名から, 対応する VerilogVariableDecl を探す
	 * */
	public VerilogVariableDecl searchFieldInObject(String objName, String fieldName){

		VerilogVariableDecl retField = null;
		ArrayList<VerilogVariableDecl> fields = objName_objField.get(objName);
		if(fields!=null){
			for(VerilogVariableDecl field : fields){
				if( field.getName().compareTo(fieldName)==0 ){
					retField = field;
					break;
				}
			}
		}
		return retField;
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){} //dont call

	@Override
	protected StateTransGraphNode getFirstPhase(){return null;} //dont call
}






