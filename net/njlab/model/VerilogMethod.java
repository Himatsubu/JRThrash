package net.njlab.model;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import net.njlab.circuit.KeyWord;
import net.njlab.circuit.VerilogBinaryExpression;
import net.njlab.circuit.VerilogCaseChild;
import net.njlab.circuit.VerilogCaseStatement;
import net.njlab.circuit.VerilogCondExpression;
import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogModule;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogPort;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.circuit.VerilogWire;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import net.njlab.sample.annotation.JRThrashUnroll;
import net.njlab.tool.Manager;
import openjdk.com.sun.tools.javac.tree.JCTree.JCAssign;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpression;
import openjdk.com.sun.tools.javac.tree.JCTree.JCMethodDecl;
import openjdk.com.sun.tools.javac.tree.JCTree.JCVariableDecl;

/**
 *  @author Keisuke Koike
 */
public class VerilogMethod  extends VerilogStatementsPhase {

	JCMethodDecl method;
	String methodName;
	String retType;
	VerilogBlock body;
	ArrayList<VerilogStatementsPhase> statements = new ArrayList<VerilogStatementsPhase>();//メソッド内の全フェイズ
	//ArrayList<Integer> returnStat = new ArrayList<Integer>();	フェイズ遷移最適化による変更
	ArrayList<VerilogReturn> returnStat = new ArrayList<VerilogReturn>();
	int methodID;
	VerilogCaseStatement phaseControl;
	boolean isThreadRun = false;	//スレッドの run メソッドである -> true
	boolean convertedIntoIP = false;	//ユーザ定義のIPコアに変換されるメソッドである -> true
	String methodModType = VerilogVariableDecl.defaultModif;//public, private , protected, default
	StateTransGraphNode StgRootNode;
	StateTransGraphNode StgMethodEndNode;
	VerilogLiteralNumber endPhaseLiteral;
	VerilogSignalString  endPhaseSignal;

	VerilogReg  regBusy;
	VerilogReg  regCaller; //このメソッドの呼び出し元
	VerilogReg  regReq; //このメソッドの呼び出し命令信号
	VerilogReg  regRet;
	VerilogReg  regPhase;
	VerilogReg  regPrePhase;
	VerilogReg  regStage;
	VerilogReg  regStep;

	VerilogPort portReq;
	VerilogPort portBusy;
	VerilogPort portRet;
	//VerilogWire wireStartSignal; //メソッド開始シグナル -> (portReq | regReq)
	VerilogWire wireStageP1;// regStage+1
	VerilogWire wireStepP1; //regStep+1

	ConvertedIPinfo convertedIpInfo;

	int totalStageNum=0;
	int totalStepNum=0;
	int maxPhaseNum = 1023;
	int maxStageNum = 1023;
	int maxStepNum  = 1023;

	static int calcPhaseBit(int maxPhaseNum){
		int bitWidth = 0;
		while(maxPhaseNum>1){
			maxPhaseNum /= 2;
			++bitWidth;
		}
		return ++bitWidth;
	}

	public String getRetType(){
		return retType;
	}

	public VerilogReg getRetRegister(){
		return regRet;
	}

	public VerilogReg getReqReg(){
		return regReq;
	}

	public VerilogReg getRegCaller(){
		return regCaller;
	}

	public int getMethodID(){
		return methodID;
	}

	public ConvertedIPinfo getConvertedInfo(){
		return convertedIpInfo;
	}

	public boolean isConvertedIntoIP(){
		return convertedIntoIP;
	}

	public String getMethodName(){
		return methodName;
	}

	public String getMethodModify(){
		return methodModType;
	}

	public VerilogReg getPhaseReg(){
		return regPhase;
	}

	public VerilogReg getStageReg(){
		return regStage;
	}

	VerilogMethod(JCMethodDecl method, VerilogStatementsPhase parent){

		this.method = method;
		this.parent = parent;
		methodName = method.getName().toString();
		checkConvertedIPAnnotation();
		checkMethodModif();
	}

	private void checkMethodModif(){

		if(method.getModifiers().toString().indexOf(VerilogVariableDecl.privateModif)!=-1)
			methodModType = VerilogVariableDecl.privateModif;

		else if(method.getModifiers().toString().indexOf(VerilogVariableDecl.protectedModif)!=-1)
			methodModType = VerilogVariableDecl.protectedModif;

		else if(method.getModifiers().toString().indexOf(VerilogVariableDecl.publicModif)!=-1)
			methodModType = VerilogVariableDecl.publicModif;

		if(method.getModifiers().toString().indexOf("synchronized")!=-1){
			CompileMsgs.edumpUnusable("synchronized methods");
			System.out.println(method.getModifiers().toString()+" "+method.getName());
			buildSucceed = false;
		}

		if(method.getModifiers().toString().indexOf("static")!=-1){
			CompileMsgs.edumpUnusable("static methods");
			System.out.println(method.getModifiers().toString()+" "+method.getName());
			buildSucceed = false;
		}

		if(method.thrown.size()!=0){
			CompileMsgs.edumpUnusable("throws");
			System.out.println(method.getModifiers().toString()+" "+method.getName()+" "+method.thrown);
			buildSucceed = false;
		}
	}

	protected void buildSubstance(){

		VerilogStatementsPhase.resetStateId();				   //フェイズIDリセット
		VerilogStatementsPhase.setMethodStaetmentArray(statements);
		makeVariableStack();
		makeParamList();
		makeReturnType();
		checkThreadRun();

		if(convertedIntoIP){
			referToPortBitWidth();
			checkParamListType();	//引数の型チェック
		}

		if(convertedIntoIP==false)
			body = new VerilogBlock(method.getBody(), this);

		VerilogStatementsPhase.setMethodStaetmentArray(null);
	}

	public void makeParamList(){

		for(JCVariableDecl vdecl : method.getParameters()){
			VerilogVariableDecl tmp = new VerilogVariableDecl(vdecl, methodName, VerilogVariableDecl.defTypeParamList);
			tmp.setPhaseParent(this);
			tmp.buildExpression();
			vdecls.add( tmp );
		}
	}

	public void makeReturnType(){

		if(VerilogVariableDecl.isPrimitive(method.getReturnType().toString())){
			retType = method.getReturnType().toString();

			/*浮動小数点数の統一*/
			if(retType.compareTo("float")==0 && this.parent.getParentClass().config.floatingType==Config.doubleType){
				retType = VerilogVariableDecl.doubleType;
				CompileMsgs.wdumpChangeFloatIntoDouble(methodName);
			}
			else if(retType.compareTo("double")==0 && this.parent.getParentClass().config.floatingType==Config.singleType){
				retType = VerilogVariableDecl.floatType;
				CompileMsgs.wdumpChangeDoubleIntoFloat(methodName);
			}
		}
		else if(method.getReturnType().toString().compareTo("void")==0){
			retType = method.getReturnType().toString();
		}
		else{
			CompileMsgs.edumpRetTypeMustBePrimitive(methodName);
			buildSucceed = false;
		}
	}

	@Override
	public boolean existERR(){

		if(convertedIntoIP)
			return !buildSucceed;

		boolean ret = !buildSucceed;
		ret |= body.existERR();
		ret |= checkLoopVariableDuplicate();
		return ret;
	}

	/**
	 *JRThrashConvertedIntoIPcore アノテーションについて調べる
	 * */
	private void checkConvertedIPAnnotation(){

		for(int i=0; i<method.mods.annotations.size(); i++){
			if(method.mods.annotations.get(i).toString().indexOf("JRThrashConvertedIntoIPcore")!=-1){

				if(method.getModifiers().toString().lastIndexOf("private")==-1){
					CompileMsgs.edumpConvAnotMethodNotPrimitive(methodName);
					buildSucceed = false;
				}

				convertedIntoIP = true;
				List<JCExpression> annotationList = method.mods.annotations.get(i).getArguments();
				int latency = Integer.parseInt(Manager.extractAnnotationParam("latency", annotationList));
				int throughput = Integer.parseInt(Manager.extractAnnotationParam("throughput", annotationList));
				int availableNum = Integer.parseInt(Manager.extractAnnotationParam("availableNum", annotationList));
				String outputPortName = Manager.extractAnnotationParam("outputPName", annotationList);
				String clockPortName = Manager.extractAnnotationParam("clockPName", annotationList);
				String clockEnPortName = Manager.extractAnnotationParam("clockEnablePName", annotationList);
				String resetPortName = Manager.extractAnnotationParam("resetPName", annotationList);
				String newDataPortName = Manager.extractAnnotationParam("newDataPName", annotationList);
				boolean haveClockPort = Boolean.parseBoolean(Manager.extractAnnotationParam("haveClock", annotationList));
				boolean haveResetPort = Boolean.parseBoolean(Manager.extractAnnotationParam("haveReset", annotationList));
				boolean haveNewDataPort = Boolean.parseBoolean(Manager.extractAnnotationParam("haveNewData", annotationList));
				convertedIpInfo = new ConvertedIPinfo(latency, throughput, availableNum,
													  outputPortName, clockPortName, clockEnPortName, resetPortName, newDataPortName,
													  haveClockPort, haveResetPort, haveNewDataPort);
			}
		}
	}

	/**
	 * IPコア化するメソッドのポートビット幅を調べる
	 * */
	private void referToPortBitWidth(){

		if(checkPortBitWidthAnnotation())
			return;

		int[] inputPortBitWidth = new int[vdecls.size()];
		for(int i=0; i<vdecls.size(); ++i)
			inputPortBitWidth[i] = VerilogVariableDecl.getBitWidth(getParentClass().module, vdecls.get(i).getType());

		int outputBitWidth = VerilogVariableDecl.getBitWidth(getParentClass().module, retType);
		convertedIpInfo.setPortBitWidth(inputPortBitWidth, outputBitWidth);
	}

	/**
	 * JRThrashPortBitWidthSpecify アノテーションについて調べる<br>
	 * */
	private boolean checkPortBitWidthAnnotation() {

		for(int i=0; i<method.mods.annotations.size(); ++i){
			if(method.mods.annotations.get(i).toString().indexOf("JRThrashPortBitWidthSpecify")!=-1){

				List<JCExpression> annotationList = method.mods.annotations.get(i).getArguments();
				String inputBitWidth = Manager.extractAnnotationParam("inputBitWidth", annotationList);
				String[] inputPortBitWidthStrings = inputBitWidth.split("[,_\\.]");

				if(inputPortBitWidthStrings.length!=vdecls.size()){
					CompileMsgs.wdumpBitWidthSpecInput(methodName);
					break;
				}

				int[] inputPortBitWidth = new int[vdecls.size()];
				try{
					for(int j=0; j<vdecls.size(); ++j){
						inputPortBitWidthStrings[j] = inputPortBitWidthStrings[j].replace(" ", "");
						inputPortBitWidthStrings[j] = inputPortBitWidthStrings[j].replace("	", "");
						inputPortBitWidth[j] = Integer.parseInt(inputPortBitWidthStrings[j]);
					}
				}
				catch(NumberFormatException e){
					CompileMsgs.wdumpBitWidthSpecInvalid(methodName);
					break;
				}
				int outputBitWidth = Integer.parseInt(Manager.extractAnnotationParam("outputBitWidth", annotationList));
				convertedIpInfo.setPortBitWidth(inputPortBitWidth, outputBitWidth);
				return true;
			}
		}
		return false;
	}

	private void checkParamListType(){

		for(VerilogVariableDecl vdecl : vdecls){

			if(vdecl.isArray || (!vdecl.isPrimitive)){
				CompileMsgs.edumpBitWidthSpecInputArray(methodName);
				buildSucceed = false;
			}
		}
	}

	/**
	 * ループ展開変数と同名の変数がフィールド上に存在しないか確認
	 * 変数名が null でないかチェック
	 * */
	private boolean checkLoopVariableDuplicate(){

		boolean ret = false;
		for(int i=0; i<method.mods.annotations.size(); i++){
			if(method.mods.annotations.get(i).toString().indexOf("JRThrashUnroll")!=-1){

				List<JCExpression> annotationList = method.mods.annotations.get(i).getArguments();
				String loopVariableName = Manager.extractAnnotationParam("loopVariableName", annotationList);	//ループ変数名セット

				for(int j=0; j<getParentClass().classVariables.size(); j++){
					if(getParentClass().classVariables.get(j).getName().compareTo(loopVariableName)==0 &&
					   getParentClass().classVariables.get(j).defType.compareTo(VerilogVariableDecl.defTypeField)==0){

						CompileMsgs.edumpLoopVarMustBeLocal(loopVariableName);
						ret = true;
					}
				}
			}
		}
		return ret;
	}

	/**
	 * スレッド化するメソッドかどうかチェック
	 * */
	private void checkThreadRun(){

		if(getParentClass().extendsThread){

			if(methodName.compareTo("run")==0 && method.getParameters().size()==0)
				isThreadRun = true;
		}
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<METHOD>	<Phase>  "+ this.stateID +"  </Phase>\n");
		Dump.tprintln(out, offset+1, "<methodName>	"+methodName+"	</methodName>");
		Dump.tprintln(out, offset+1, "<returnType>	"+retType+"	</returnType>");
		Dump.tprintln(out, offset+1, "<ParamList>\n");
		for(int i=0; i<vdecls.size(); i++){
			vdecls.get(i).dumpSimple(out, offset+2);
		}
		Dump.tprintln(out, offset+1, "</ParamList>\n");
		Dump.tprintln(out, offset+1, "<MethodBody>");
		body.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</MethodBody>\n");
		Dump.tprintln(out, offset, "</METHOD>\n\n");
	}

	private int getBitWidth(VerilogModule module){
		return VerilogVariableDecl.getBitWidth(module, retType);
	}

	public void makeSignal(VerilogModule module){

		int retBitWidth = getBitWidth(module);
		regCaller = new VerilogReg(KeyWord.K_sys_+methodName+KeyWord.K_caller, VerilogMethod.calcPhaseBit(getParentClass().getMethods().size()+1), VerilogSignal.unsigned);
		regReq = new VerilogReg(KeyWord.K_sys_+methodName+KeyWord.K_req, 1, VerilogSignal.unsigned); //このメソッドの呼び出し命令信号
		regPhase = new VerilogReg(KeyWord.K_sys_+methodName+KeyWord.K_phase, calcPhaseBit(maxPhaseNum), VerilogSignal.unsigned);
		regStage =  new VerilogReg(KeyWord.K_sys_+methodName+KeyWord.K_stage, calcPhaseBit(maxStageNum), VerilogSignal.unsigned);
		regStep =  new VerilogReg(KeyWord.K_sys_+methodName+KeyWord.K_step, calcPhaseBit(maxStepNum), VerilogSignal.unsigned);
		regBusy = new VerilogReg(KeyWord.K_sys_+methodName+KeyWord.K_busy, 1, VerilogSignal.unsigned);

		if(retBitWidth!=0){
			regRet = new VerilogReg("sys_"+methodName+KeyWord.K_return, retBitWidth, VerilogVariableDecl.isSigned(retType));
			module.addRegister(regRet);
		}
		module.addRegister(regCaller);
		module.addRegister(regReq);
		module.addRegister(regPhase);
		module.addRegister(regStage);
		module.addRegister(regStep);
		module.addRegister(regBusy);

		if(methodModType.compareTo(VerilogVariableDecl.privateModif)!=0){
			portReq = new VerilogPort(methodName+KeyWord.K_req, VerilogPort.input, 1, VerilogSignal.unsigned, null, VerilogPort.isNotBramControl);
			portBusy = new VerilogPort(methodName+KeyWord.K_busy, VerilogPort.output, 1, regBusy, VerilogSignal.unsigned, null, VerilogPort.isNotBramControl);
			module.addPort(portReq);
			module.addPort(portBusy);
		}

		portRet = null;
		if(retBitWidth!=0 && methodModType.compareTo(VerilogVariableDecl.privateModif)!=0){
			boolean isSigned = (retType.compareTo(VerilogVariableDecl.booleanType)==0) ? false : true;
			portRet = new VerilogPort(methodName+KeyWord.K_return, VerilogPort.output, retBitWidth, regRet, isSigned, null, VerilogPort.isNotBramControl);
			module.addPort(portRet);
		}

		makePhaseLiteral();
		makeP1Signal(module);
	}

	private void makePhaseLiteral(){

		phaseLiteral = new VerilogLiteralNumber(regPhase.bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(0/*stateID*/));
		phaseSignal = new VerilogSignalString(phaseLiteral.getExprString(0, false), phaseLiteral.bitWidth, VerilogSignal.unsigned);

		for(int i=0; i<statements.size(); i++){
			statements.get(i).phaseLiteral = new VerilogLiteralNumber(regPhase.bitWidth, VerilogLiteralNumber.typeHexadecimal,
																	  Integer.toHexString(statements.get(i).stateID));
			statements.get(i).phaseSignal = new VerilogSignalString(statements.get(i).phaseLiteral.getExprString(0, false), statements.get(i).phaseLiteral.bitWidth, VerilogSignal.unsigned);
		}
		endPhaseLiteral = new VerilogLiteralNumber(regPhase.bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(maxPhaseNum));
		endPhaseSignal = new VerilogSignalString(endPhaseLiteral.getExprString(0, false), endPhaseLiteral.bitWidth, VerilogSignal.unsigned);
	}

	private void makeP1Signal(VerilogModule module){

		VerilogSignalString stageOne = new VerilogSignalString(regStage.bitWidth+"'h1", regStage.bitWidth, VerilogSignal.unsigned);
		VerilogSignalString stepOne = new VerilogSignalString(regStep.bitWidth+"'h1", regStep.bitWidth, VerilogSignal.unsigned);
		VerilogBinaryExpression stageP1 = new VerilogBinaryExpression(regStage, stageOne, VerilogBinary.PLUS);
		VerilogBinaryExpression stepP1 = new VerilogBinaryExpression(regStep, stepOne, VerilogBinary.PLUS);
		wireStageP1 = new VerilogWire(KeyWord.K_sys_+methodName+KeyWord.K_stage+KeyWord.K_p1, regStage.bitWidth, stageP1, regStage.isSigned);
		wireStepP1 = new VerilogWire(KeyWord.K_sys_+methodName+KeyWord.K_step+KeyWord.K_p1, regStep.bitWidth, stepP1, regStep.isSigned);
		module.addWire(wireStageP1);
		module.addWire(wireStepP1);
	}

	public void makeDFG(){

		System.out.println("-------------"+methodName+" makeDFG-------------\n");
		setUnrollAnnotation();	//ループ展開アノテーションセット
		mergeForLoopUpdate();

		for(int i=0; i<statements.size(); i++)
			if(statements.get(i) instanceof VerilogStatAssemblage)
				((VerilogStatAssemblage)statements.get(i)).makeDFG();

		System.out.println("\n");
	}

	private void setUnrollAnnotation(){

		for(int i=0; i<method.mods.annotations.size(); ++i){
			if(method.mods.annotations.get(i).toString().indexOf("JRThrashUnroll")!=-1){

				try{
					List<JCExpression> annotationList = method.mods.annotations.get(i).getArguments();
					String loopVariableName = Manager.extractAnnotationParam("loopVariableName", annotationList);	//ループ変数名セット
					int unrollNum = Integer.parseInt(Manager.extractAnnotationParam("unrollNum", annotationList));	//展開数セット
					unrollNum = (unrollNum<=0) ? 1 : unrollNum;
					int unrollType = discriminateUnrollType(Manager.extractAnnotationParam("unrollType", annotationList));	//展開数セット


					for(VerilogStatementsPhase phase : statements){
						if(phase instanceof VerilogForLoop){
							((VerilogForLoop)phase).unrollLoop(loopVariableName, unrollNum, unrollType);
						}
					}
				}
				catch(NumberFormatException e){
					CompileMsgs.edumpLoopUnrollNum(methodName);
					break;
				}
			}
		}
	}

	private int discriminateUnrollType(String type){

		int ret = -1;

		if(type.compareTo(JRThrashUnroll.simple+"")==0)
			ret = JRThrashUnroll.simple;

		if(type.compareTo(JRThrashUnroll.copyLoopVar+"")==0)
			ret = JRThrashUnroll.copyLoopVar;

		else if(type.compareTo(JRThrashUnroll.modifyLoopVar+"")==0)
			ret = JRThrashUnroll.modifyLoopVar;

		else if(type.compareTo(JRThrashUnroll.modifyLoopVar_IndependentIterator+"")==0)
			ret = JRThrashUnroll.modifyLoopVar_IndependentIterator;

		else if(type.compareTo("JRThrashUnroll.simple")==0)
			ret = JRThrashUnroll.simple;

		else if(type.compareTo("JRThrashUnroll.copyLoopVar")==0)
			ret = JRThrashUnroll.copyLoopVar;

		else if(type.compareTo("JRThrashUnroll.modifyLoopVar")==0)
			ret = JRThrashUnroll.modifyLoopVar;

		else if(type.compareTo("JRThrashUnroll.modifyLoopVar_IndependentIterator")==0)
			ret = JRThrashUnroll.modifyLoopVar_IndependentIterator;

		return ret;
	}

	/**
	 * for文の update部を本体に組み込む
	 * */
	private void mergeForLoopUpdate(){
		for(int i=0; i<statements.size(); i++)
			if(statements.get(i) instanceof VerilogForLoop)
				((VerilogForLoop)statements.get(i)).mergeForLoopUpdate();
	}

	private void dumpStageInfo(){

		System.out.println("-----------------------"+methodName+" stage info-----------------------\n");

		for(int i=0; i<statements.size(); i++){
			if(statements.get(i) instanceof VerilogStatAssemblage){
				VerilogStatAssemblage tmp = (VerilogStatAssemblage)statements.get(i);
				tmp.dumpStageInfo();
			}
		}
	}

	public void scheduling(){

		int stage;
		maxStageNum = 0;
		maxStepNum  = 0;
		maxPhaseNum = statements.size() + 2;	//メソッド終了時のステートが一つ増える + ステートNoは1から始まる  -> +2
		for(int i=0; i<statements.size(); i++){
			if(statements.get(i) instanceof VerilogStatAssemblage){
				VerilogStatAssemblage tmp = (VerilogStatAssemblage)statements.get(i);
				tmp.scheduling();
				stage = tmp.stages.size();
				totalStageNum += stage;
				totalStepNum += tmp.totalStepNum;
				maxStageNum = Math.max(maxStageNum, stage);
				maxStepNum = Math.max(tmp.maxStepNum, maxStepNum);
			}
		}
		maxStageNum++;
		maxStepNum++;
		dumpStageInfo();
	}

	public void dumpDFG(PrintWriter wout){

		Dump.tprintln(wout, 0, "<METHOD>");
		Dump.tprintln(wout, 1, "<methodName>	"+methodName+"	</methodName>");
		Dump.tprintln(wout, 1, "<totalPhaseNum>"+maxPhaseNum+"	</totalPhaseNum>");
		Dump.tprintln(wout, 1, "<totalStageNum>"+totalStageNum+"	</totalStageNum>");
		Dump.tprintln(wout, 1, "<totalStepNum>"+totalStepNum+"	</totalStepNum>");
		for(int i=0; i<statements.size(); i++)
			if(statements.get(i) instanceof VerilogStatAssemblage)
				((VerilogStatAssemblage)statements.get(i)).dumpDFG(wout, 2);
		Dump.tprintln(wout,1, "<exprInMethod><!--"+Dump.translateHTML(method.toString())+"--></exprInMethod>");
		Dump.tprintln(wout, 0, "</METHOD>\n");
	}

	public void getMaxRegisterNum(){

		for(int i=0; i<statements.size(); i++){
			if(statements.get(i) instanceof VerilogStatAssemblage){
				((VerilogStatAssemblage)statements.get(i)).getMaxRegisterNum();
			}
		}
	}

	public void getMaxRegisterNumWithSharing(){
		for(int i=0; i<statements.size(); i++){
			if(statements.get(i) instanceof VerilogStatAssemblage){
				((VerilogStatAssemblage)statements.get(i)).getMaxRegisterNumWithSharing();
			}
		}
	}

	public void bindTmpReg(){
		for(int i=0; i<statements.size(); i++){
			if(statements.get(i) instanceof VerilogStatAssemblage){
				((VerilogStatAssemblage)statements.get(i)).bindTmpReg(getParentClass());
			}
		}
	}

	/*
	 * モジュール外部から呼び出されときの, パラメータリスト代入部分を作成    if version
	 *
	public VerilogIfStatement makeMethodInitial(){

		if(methodModType.compareTo(VerilogVariableDecl.privateModif)==0)
			return null;

		VerilogIfStatement argAssign = new VerilogIfStatement();	//モジュール外部から呼び出されときの, パラメータリスト代入
		argAssign.setCond(portReq);

		for(int i=0; i<vdecls.size(); i++){	//メソッド開始時のパラメータリストのレジスタ代入
			VerilogNoneBlockAssign portAssign;
			if(!vdecls.get(i).isArray){
				portAssign = new VerilogNoneBlockAssign(vdecls.get(i).getParamListSignal().getPrmLstScalaReg(), vdecls.get(i).getParamListSignal().getPrmLstScalaPort());
				argAssign.addThenChildAssign(portAssign);
			}
		}

		int bitWidth = getParentClass().getProcessingMethodIDreg().bitWidth;
		VerilogSignalString methodIDLiteral = new VerilogSignalString(bitWidth+VerilogLiteralNumber.typeHexadecimal+methodID , bitWidth, VerilogSignal.unsigned);
		VerilogNoneBlockAssign methodIDchange = new VerilogNoneBlockAssign(getParentClass().getProcessingMethodIDreg(), methodIDLiteral);
		argAssign.addThenChildAssign(methodIDchange);

		VerilogNoneBlockAssign busyAssert = new VerilogNoneBlockAssign(regBusy, getParentClass().boolTrue);
		argAssign.addThenChildAssign(busyAssert);
		return argAssign;
	}*/

	/**
	 * モジュール外部から呼び出されときの, パラメータリスト代入部分を作成
	 * */
	public VerilogSignal makeMethodInitial(VerilogCaseChild methodInvWaiting, VerilogSignal MethodInvFromOutOfModule){

		if(methodModType.compareTo(VerilogVariableDecl.privateModif)==0)
			return MethodInvFromOutOfModule;

		StateIdentifier methodReqWaitState = new StateIdentifier(methodInvWaiting.getCondNumber(), StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, false);

		for(int i=0; i<vdecls.size(); i++){	//メソッド開始時のパラメータリストのレジスタ代入
			VerilogCondExpression  portAssignCond;
			VerilogSignalString    portAssignStr;
			VerilogNoneBlockAssign portAssign;
			if(!vdecls.get(i).isArray){

				VerilogSignal externalPort = vdecls.get(i).getParamListSignal().getPrmLstScalaPort();
				VerilogReg internalReg = vdecls.get(i).getParamListSignal().getPrmLstScalaReg();
				portAssignCond = new VerilogCondExpression(portReq, externalPort, internalReg);
				portAssignStr = new VerilogSignalString(portAssignCond.getExprString(internalReg.bitWidth, internalReg.isSigned), internalReg.bitWidth, internalReg.isSigned);
				portAssign = new VerilogNoneBlockAssign(internalReg, portAssignStr, methodReqWaitState);
				methodInvWaiting.addNoneBlockStat(portAssign);
			}
		}

		if(MethodInvFromOutOfModule==null)
			MethodInvFromOutOfModule = getParentClass().getProcessingMethodIDreg();

		VerilogReg processingMethodID = getParentClass().getProcessingMethodIDreg();
		int bitWidth = processingMethodID.bitWidth;
		VerilogSignalString methodIDLiteral = new VerilogSignalString(bitWidth+VerilogLiteralNumber.typeHexadecimal+methodID , bitWidth, VerilogSignal.unsigned);
		VerilogCondExpression  methodIDChangeCond = new VerilogCondExpression(portReq, methodIDLiteral, MethodInvFromOutOfModule);
		VerilogSignalString    methodIDChangeStr = new VerilogSignalString(methodIDChangeCond.getExprString(bitWidth, processingMethodID.isSigned), bitWidth, processingMethodID.isSigned);


		VerilogCondExpression  busyAssertCond = new VerilogCondExpression(portReq, getParentClass().boolTrue, getParentClass().boolFalse);
		VerilogSignalString    busyAssertStr = new VerilogSignalString(busyAssertCond.getExprString(regBusy.bitWidth, regBusy.isSigned), regBusy.bitWidth, regBusy.isSigned);
		VerilogNoneBlockAssign busyAssert = new VerilogNoneBlockAssign(regBusy, busyAssertStr, methodReqWaitState);
		methodInvWaiting.addNoneBlockStat(busyAssert);
		return methodIDChangeStr;
	}

	/**
	 * メソッドの終わりにbram の書き込み信号を read にする
	 * */
	private void makeArrayControlAssign(VerilogCaseChild fromReturn){

		StateIdentifier endState = new StateIdentifier(methodID, fromReturn.getCondNumber(), StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, false);

		for(int i=0; i<getParentClass().classVariables.size(); i++){

			VerilogVariableDecl tmp = getParentClass().classVariables.get(i);
			if(tmp.isArray){
				VerilogNoneBlockAssign phaseAssign = null;
				if(tmp.defType.compareTo(VerilogVariableDecl.defTypeField)==0){
					phaseAssign = new VerilogNoneBlockAssign(tmp.getFieldSiganls().getFieldArrayRorW_Reg1(), getParentClass().boolFalse, endState);
				}
				else if(tmp.defType.compareTo(VerilogVariableDecl.defTypeParamList)==0){
					phaseAssign = new VerilogNoneBlockAssign(tmp.getParamListSignal().getPrmLstArrayRorW_Reg(), getParentClass().boolFalse, endState);
				}
				fromReturn.addNoneBlockStat(phaseAssign);
			}
		}

		VerilogClass parentClass = getParentClass();
		for(VerilogReg r_or_w : parentClass.getBramRorWRegsForSubmod()){
			VerilogNoneBlockAssign r_or_w_deAssert = new VerilogNoneBlockAssign(r_or_w, parentClass.boolFalse, endState);
			fromReturn.addNoneBlockStat(r_or_w_deAssert);
		}
	}

	public void makeResetPart(ArrayList<VerilogNoneBlockAssign> resetAssign){

		StateIdentifier stateIdentifier = new StateIdentifier(StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, true);
		VerilogSignalString callerZero = new VerilogSignalString(regCaller.bitWidth+"'h0", regCaller.bitWidth, VerilogSignal.unsigned);
		VerilogSignalString phaseZero = new VerilogSignalString(regPhase.bitWidth+"'h0", regPhase.bitWidth, VerilogSignal.unsigned);
		VerilogSignalString stageZero = new VerilogSignalString(regStage.bitWidth+"'h0", regStage.bitWidth, VerilogSignal.unsigned);
		VerilogSignalString stepZero = new VerilogSignalString(regStep.bitWidth+"'h0", regStep.bitWidth, VerilogSignal.unsigned);

		VerilogNoneBlockAssign callerAssign = new VerilogNoneBlockAssign(regCaller, callerZero, stateIdentifier);
		VerilogNoneBlockAssign phaseAssign = new VerilogNoneBlockAssign(regPhase, phaseZero, stateIdentifier);
		VerilogNoneBlockAssign stageAssign = new VerilogNoneBlockAssign(regStage, stageZero, stateIdentifier);
		VerilogNoneBlockAssign stepAssign = new VerilogNoneBlockAssign(regStep, stepZero, stateIdentifier);
		VerilogNoneBlockAssign busyAssign = new VerilogNoneBlockAssign(regBusy, getParentClass().boolFalse, stateIdentifier);
		VerilogNoneBlockAssign reqAssign = new VerilogNoneBlockAssign(regReq, getParentClass().boolFalse, stateIdentifier);

		if(regRet!=null){
			String tmp = (regRet.isSigned==VerilogSignal.signed) ? "'sh0" : "'h0";
			boolean isSigned = (regRet.isSigned==VerilogSignal.signed) ? VerilogSignal.signed : VerilogSignal.unsigned;
			VerilogSignalString retZero = new VerilogSignalString(regRet.bitWidth+tmp, regRet.bitWidth, isSigned);
			VerilogNoneBlockAssign retAssign = new VerilogNoneBlockAssign(regRet, retZero, stateIdentifier);
			resetAssign.add(retAssign);
		}
		resetAssign.add(callerAssign);
		resetAssign.add(phaseAssign);
		resetAssign.add(stageAssign);
		resetAssign.add(stepAssign);
		resetAssign.add(busyAssign);
		resetAssign.add(reqAssign);
	}

	public VerilogPort getRequestPort(){
		return portReq;
	}

	public VerilogPort getBusyPort(){
		return portBusy;
	}

	public VerilogPort getReturnPort(){
		return portRet;
	}

	public VerilogReg getStepRegister(){
		return regStep;
	}

	public VerilogWire getStepPlusOne(){
		return wireStepP1;
	}

	public boolean isThreadRun(){
		return isThreadRun;
	}

	public void makeMethodProcess(VerilogCaseChild body){

		VerilogLiteralNumber methoId = new VerilogLiteralNumber(getParentClass().processingMethodID.bitWidth,
																VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(methodID));
		body.setCond(methoId);
		phaseControl = new VerilogCaseStatement();
		phaseControl.setBranchSignal(regPhase);
		body.addChildBlock(phaseControl);
		StgRootNode = new StateTransGraphNode(this, phaseSignal, phaseLiteral);

		Stack<StateTransGraphNode> source = new Stack<StateTransGraphNode>();
		Stack<StateTransGraphNode> elseSource = new Stack<StateTransGraphNode>();
		Stack<StateTransGraphNode> strayChild = new Stack<StateTransGraphNode>();
		Stack<StateTransGraphNode> strayElseChild = new Stack<StateTransGraphNode>();
		source.push(StgRootNode);
		this.body.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);

		StgMethodEndNode = new StateTransGraphNode(this, endPhaseSignal, endPhaseLiteral, strayChild, strayElseChild);

		for(VerilogReturn ret : returnStat)
			ret.stgNode.setNextPhase(StgMethodEndNode);

		generateVerilogCode(phaseControl);
		StgRootNode.generateVerilogCode(regPhase, phaseControl);
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){} //dontCall

	@Override
	protected StateTransGraphNode getFirstPhase(){
		return StgRootNode;
	}

	protected void generateVerilogCode(VerilogCaseStatement phaseControl){

		VerilogCaseChild nextPhaseControl = StgRootNode.currentPhaseCaseChild;

		VerilogLiteralNumber zero = new VerilogLiteralNumber(regPhase.bitWidth, VerilogLiteralNumber.typeHexadecimal, Integer.toHexString(0));
		nextPhaseControl.setCond(zero/*phaseLiteral*/);
		StateTransGraphNode.addGoToNextBlockAssign(regPhase, StgRootNode);
		phaseControl.addChildStat(nextPhaseControl);

		StateIdentifier startAssignState = new StateIdentifier(methodID, nextPhaseControl.getCondNumber(), StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, false);
		VerilogNoneBlockAssign busyAssert = new VerilogNoneBlockAssign(regBusy, getParentClass().boolTrue, startAssignState);
		nextPhaseControl.addNoneBlockStat(busyAssert);

		VerilogCaseChild endPhaseControl = StgMethodEndNode.currentPhaseCaseChild;
		endPhaseControl.setCond(endPhaseLiteral);
		phaseControl.addChildStat(endPhaseControl);
		StateIdentifier endAssignState = new StateIdentifier(methodID, endPhaseControl.getCondNumber(), StateIdentifier.stateNotExist, StateIdentifier.stateNotExist, false);
		VerilogSignalString phaseReset = new VerilogSignalString(phaseLiteral.bitWidth+"'h"+VerilogClass.zeroString, phaseLiteral.bitWidth, VerilogSignal.unsigned);
		VerilogNoneBlockAssign phaseAssign = new VerilogNoneBlockAssign(regPhase, phaseReset, endAssignState);
		VerilogNoneBlockAssign pMethodIDAssign = new VerilogNoneBlockAssign(getParentClass().processingMethodID, regCaller, endAssignState);
		VerilogNoneBlockAssign busyAssign = new VerilogNoneBlockAssign(regBusy, getParentClass().boolFalse, endAssignState);
		endPhaseControl.addNoneBlockStat(phaseAssign);
		endPhaseControl.addNoneBlockStat(pMethodIDAssign);
		endPhaseControl.addNoneBlockStat(busyAssign);
		makeArrayControlAssign(endPhaseControl);
	}
}











