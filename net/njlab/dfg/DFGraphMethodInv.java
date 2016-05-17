package net.njlab.dfg;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.FieldVariableSignal;
import net.njlab.circuit.ParamListVariableSignal;
import net.njlab.circuit.VerilogCondExpression;
import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogPort;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.circuit.VerilogSubModule;
import net.njlab.circuit.VerilogWire;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;
import net.njlab.model.VerilogMethod;
import net.njlab.model.VerilogMethodInv;
import net.njlab.model.VerilogVariableDecl;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public class DFGraphMethodInv extends DFGraphNode{

	DFGraphNode[] args; //srcNode
	VerilogMethod method;
	VerilogMethodInv methodInv;

	public DFGraphMethodInv(VerilogMethod method, VerilogMethodInv methodInv, DFGraphNode[] args, int destType){

		for(int i=0; i<args.length; i++)
			args[i].addDestNode(this);

		this.methodInv = methodInv;
		this.method = method;
		this.args = args;
		this.destType = destType;
	}

	@Override
	public void replaceSrcNode(DFGraphNode popNode, DFGraphNode pushNode){

		for(int i=0; i<args.length; i++){
			if(args[i]==popNode){
				args[i] = pushNode;
				args[i].addDestNode(this);
			}
		}
	}

	@Override
	public void dumpNode(PrintWriter wout, int offset){

		if(this instanceof DFGraphUserDefinedOp){
			super.dumpNode(wout, offset);
			return;
		}

		Dump.tprintln(wout, offset, "<MethodInv>");
		super.dumpNode(wout, offset+1);
		Dump.tprintln(wout, offset+1, "<defClass>	"+methodInv.defClassName+"	</defClass>");
		Dump.tprintln(wout, offset+1, "<objName>	"+methodInv.objName+"	</objName>");
		Dump.tprintln(wout, offset+1, "<caleeName>	"+methodInv.methodName+"	</caleeName>");
		for(DFGraphNode arg : args){
			Dump.tprintln(wout, offset+1, "<arg>");
			arg.dumpNode(wout, offset+2);
			Dump.tprintln(wout, offset+1, "</arg>");
		}
		Dump.tprintln(wout, offset+1, "<component><!--"+Dump.translateHTML("		none	")+"--></component>");
		Dump.tprintln(wout, offset, "</MethodInv>");
	}

	@Override
	public void constantFolding(boolean[] optContinueFlag, Config config){
		for(DFGraphNode arg: args)
			arg.constantFolding(optContinueFlag, config);
	}

	@Override
	public void constantFoldingForBinarySequence(boolean[] foldingHappend){
		for(DFGraphNode arg: args)
			arg.constantFoldingForBinarySequence(foldingHappend);
	}

	@Override
	public DFGraphMethodInv clone(){

		DFGraphMethodInv tmp = (DFGraphMethodInv)super.clone();
		tmp.args = new DFGraphNode[args.length];

		for(int i=0; i<args.length; i++){
			tmp.args[i] = args[i].clone();
			tmp.args[i].addDestNode(tmp);
		}
		return tmp;
	}

	@Override
	public int countNodeNum(){
		int argNodeNum=0;
		for(int i=0; i<args.length; i++){
			argNodeNum += args[i].countNodeNum();
		}
		return 1+argNodeNum;
	}

	@Override
	public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag){
		boolean ret = false;
		for(int i=0; i<args.length; i++){
			ret |= args[i].propagate(propagationNode, optContinueFlag);
		}
		return ret;
	}

	@Override
	public void addStatementNode(DFGraphManager parentManager, ArrayList<DFGraphNode> statementNode){
		this.parentManager = parentManager;
		statementNode.add(this);
		for(int i=0; i<args.length; i++)
			args[i].addStatementNode(parentManager, statementNode);
	}

	@Override
	public void computePriority(int minCntlStp, Config config){

		minNodeOperatingStep = calcOperationStep() + 1;
		minCntlStpFromThisNode = minCntlStp + minNodeOperatingStep;

		for(int i=0; i<args.length; i++)
			args[i].computePriority(minCntlStpFromThisNode, config);
		destTypeIsReg = false;
		priority = minCntlStpFromThisNode;
	}

	@Override
	public void assignControlStep(int controlStep, SchedulingListSet listSet){

		boolean allSrcIsFinished = true;

		//すべてのソースノードのコントロ－ルステップ割り当てが終了しているかチェック
		for(int i=0; i<args.length; i++){
			if(args[i].assignState==notAssigned)
				args[i].assignControlStep(controlStep, listSet);
			allSrcIsFinished &= (args[i].assignState==finished);
		}

		if(allSrcIsFinished){

			int startEnableStep = -1;
			for(int i=0; i<args.length; i++)
				startEnableStep = Math.max(startEnableStep, getStartEnableStep(args[i], controlStep));

			if(startEnableStep <= controlStep){	//このステップ以前にソースノードの計算が終了している

				startStep = controlStep;
				assignState = finished;
				endStep = startStep + calcOperationStep();
			}
		}
	}

	private int calcOperationStep(){

		if(methodInv.objName.compareTo("this")==0)//自クラスのメソッド呼び出し
			return 1;

		else if(methodInv.isThreadRun)	//スレッドの run メソッド呼び出し
			return 1;

		else if(methodInv.isThreadJoin)	//スレッドの join メソッド呼び出し
			return 1;

		else	//オブジェクトのメソッド呼び出し
			return 3;
	}

	@Override
	public void assignDestSignal(VerilogClass parentClass){

		if(method==null)	//join() メソッドは null
			return;

		if(methodInv.objName.compareTo("this")==0){
			if(method.getRetType().compareTo("void")!=0){
				destSignal = method.getRetRegister();
			}
		}
		else{
			if(method.getRetType().compareTo("void")!=0){
				VerilogSubModule methodInvSubModule = getOriginalSubModule(parentClass);
				destSignal = methodInvSubModule.getAssignedSignal(method.getReturnPort());
			}
		}
	}

	/**
	 * メソッドを呼び出しているオブジェクト名から，サブモジュールを特定
	 * */
	private VerilogSubModule getOriginalSubModule(VerilogClass parentClass){

		for(VerilogSubModule submodule : parentClass.getModule().getSubModules()){
			if(submodule.getObjName().compareTo(methodInv.objName)==0){
				return submodule;
			}
		}
		return null;
	}

	@Override
	public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		if(methodInv.isThreadJoin){	//Thread の join メソッドの処理
			makeJoinProcess(controlStep, methodID, phaseID, stageID);
			return ;
		}

		if(methodInv.objName.compareTo("this")==0){
			genCodeForCommonClassMethod(controlStep, methodID, phaseID, stageID);	//自クラスのメソッド呼び出し
			deAssertArrayRorW_OfObject(controlStep, methodID, phaseID, stageID);
		}
		else{
			genCodeForInstanceMethod(controlStep, methodID, phaseID, stageID);	//インスタンスのメソッド呼び出し
			deAssertArrayRorW_OfObject(controlStep, methodID, phaseID, stageID);
		}
	}

	/**
	 * 自クラスのメソッド呼び出しの処理を記述
	 * */
	private void genCodeForCommonClassMethod( ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID) {

		VerilogClass parentClass = parentManager.parentClass;
		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier startP1State = new StateIdentifier(methodID, phaseID, stageID, startStep+1, false);

		VerilogNoneBlockAssign methodIDsave = new VerilogNoneBlockAssign(method.getRegCaller(), parentManager.parentClass.getProcessingMethodIDreg(), startState);
		registerNoneBlockAssign(controlStep, methodIDsave, startStep);

		VerilogSignalString changeID =  new VerilogSignalString(parentClass.getProcessingMethodIDreg().bitWidth+VerilogLiteralNumber.typeHexadecimal+Integer.toHexString(method.getMethodID()),
																parentClass.getProcessingMethodIDreg().bitWidth, VerilogSignal.unsigned);
		VerilogNoneBlockAssign methodIDchange = new VerilogNoneBlockAssign(parentClass.getProcessingMethodIDreg(), changeID, startState);
		registerNoneBlockAssign(controlStep, methodIDchange, startStep);

		if(methodInv.haveArrayArg){	//arbiter 制御
			VerilogNoneBlockAssign arbiterAssert = new VerilogNoneBlockAssign(methodInv.getArbiterReg(), parentManager.parentClass.boolTrue, startState);
			VerilogNoneBlockAssign arbiterDeAssert = new VerilogNoneBlockAssign(methodInv.getArbiterReg(), parentManager.parentClass.boolFalse, startP1State);
			registerNoneBlockAssign(controlStep, arbiterAssert, startStep);
			registerNoneBlockAssign(controlStep, arbiterDeAssert, startStep+1);
		}

		for(int i=0; i<args.length; i++){	//引数割り当て
			VerilogVariableDecl argVariable = method.vdecls.get(i);

			if(!argVariable.isArray){
				VerilogNoneBlockAssign arg = new VerilogNoneBlockAssign(argVariable.getParamListSignal().getPrmLstScalaReg(), args[i].destSignal, startState);
				registerNoneBlockAssign(controlStep, arg, startStep);
			}
			else{
				 genArrayArbiterCode(argVariable, ((DFGraphVariableAccess)args[i]).getVariableDecl(), methodInv.getArbiterReg());
			}
		}
	}

	/**
	 * オブジェクトのメソッド呼び出しの処理を記述
	 * */
	private void genCodeForInstanceMethod(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		VerilogSubModule methodInvSubModule = getOriginalSubModule(parentManager.parentClass);
		VerilogSignal trueSignal = parentManager.parentClass.boolTrue;
		VerilogSignal falseSignal = parentManager.parentClass.boolFalse;

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier startP1State = new StateIdentifier(methodID, phaseID, stageID, startStep+1, false);
		StateIdentifier startP2State = new StateIdentifier(methodID, phaseID, stageID, startStep+2, false);

		//リクエスト信号制御
		VerilogReg requestReg = (VerilogReg)methodInvSubModule.getAssignedSignal(method.getRequestPort());
		VerilogNoneBlockAssign requestAssert = new VerilogNoneBlockAssign(requestReg, trueSignal, startState);
		VerilogNoneBlockAssign requestDeAssert = new VerilogNoneBlockAssign(requestReg, falseSignal, startP1State);
		registerNoneBlockAssign(controlStep, requestAssert, startStep);
		registerNoneBlockAssign(controlStep, requestDeAssert, startStep+1);

		VerilogSignal busyWire = methodInvSubModule.getAssignedSignal(method.getBusyPort());

		if(!methodInv.isThreadRun)	//スレッドの run() メソッドは，ステップ信号制御がいらない
			stepControll(controlStep, busyWire, startStep+2, startStep+3, methodID, phaseID, stageID);//ステップ信号制御

		if(methodInv.haveArrayArg){
			//arbiter 制御
			VerilogNoneBlockAssign arbiterAssert = new VerilogNoneBlockAssign(methodInv.getArbiterReg(), parentManager.parentClass.boolTrue, startState);
			VerilogCondExpression arbiterDeAssertExpr = new VerilogCondExpression(busyWire, trueSignal, falseSignal);
			VerilogSignalString arbiterDeAssertString = new VerilogSignalString(arbiterDeAssertExpr.getExprString(trueSignal.bitWidth, trueSignal.isSigned),
																				trueSignal.bitWidth, trueSignal.isSigned);
			VerilogNoneBlockAssign arbiterDeAssert = new VerilogNoneBlockAssign(methodInv.getArbiterReg(), arbiterDeAssertString, startP2State);
			registerNoneBlockAssign(controlStep, arbiterAssert, startStep);
			registerNoneBlockAssign(controlStep, arbiterDeAssert, startStep+2);
		}
		argmentAssign(controlStep, methodInv.getArbiterReg(), methodInvSubModule, methodID, phaseID, stageID);
	}

	/**
	 * 自クラスのメソッド呼び出しのアービタ作成を行う
	 * */
	private void genArrayArbiterCode(VerilogVariableDecl dest, VerilogVariableDecl src, VerilogReg arbiter){

		VerilogSignal addrSig = dest.getParamListSignal().getPrmLstArrayAddrWire();
		VerilogSignal r_or_w_Sig = dest.getParamListSignal().getPrmLstArrayRorW_Wire();
		VerilogSignal dataInSig = dest.getParamListSignal().getPrmLstArrayDataInWire();
		VerilogSignal dataOutSig = dest.getParamListSignal().getPrmLstArrayDataOutWire();
		VerilogSignal cacheHit = dest.getParamListSignal().getPrmLstArrayCacheHitWire();
		//パラメータリスト配列の clock Enable は arbitionしない ( clockEnable は すべて 同一の clock enable( w_ce ) につながっているから)

		if(src.getDefType().compareTo(VerilogVariableDecl.defTypeParamList)==0){	//パラメータリストの配列が引数に代入された

			ParamListVariableSignal prmLstSignals = src.getParamListSignal();
			prmLstSignals.getPrmLstArrayAddrWire().addAssignSignal(arbiter, addrSig);
			prmLstSignals.getPrmLstArrayRorW_Wire().addAssignSignal(arbiter, r_or_w_Sig);
			prmLstSignals.getPrmLstArrayDataInWire().addAssignSignal(arbiter, dataInSig);
			((VerilogWire)dataOutSig).addAssignSignal(arbiter, prmLstSignals.getPrmLstArrayDataOutWire());
			((VerilogWire)cacheHit).addAssignSignal(arbiter, prmLstSignals.getPrmLstArrayCacheHitWire());
		}
		else if(src.getDefType().compareTo(VerilogVariableDecl.defTypeField)==0){	//フィールドの配列が引数に代入された

			FieldVariableSignal fieldSignals = src.getFieldSiganls();
			fieldSignals.getFieldArrayAddrWire0().addAssignSignal(arbiter, addrSig);
			fieldSignals.getFieldArrayRorW_wire0().addAssignSignal(arbiter, r_or_w_Sig);
			fieldSignals.getFieldArrayDataIn0Wire().addAssignSignal(arbiter, dataInSig);
			((VerilogWire)dataOutSig).addAssignSignal(arbiter, fieldSignals.getFieldArrayDataOut0Wire());
			((VerilogWire)cacheHit).addAssignSignal(arbiter, parentManager.parentClass.boolTrue);
		}

		if(method.getMethodModify().compareTo(VerilogVariableDecl.privateModif)!=0){

			VerilogPort addrPort = dest.getParamListSignal().getPrmLstArrayAddrPort();
			VerilogPort r_or_w_Port = dest.getParamListSignal().getPrmLstArrayRorW_Port();
			VerilogPort dataInPort = dest.getParamListSignal().getPrmLstArrayDataInPort();
			VerilogPort cePort = dest.getParamListSignal().getPrmLstArrayClockEnPort();

			VerilogSignalString addrPortIsZero = new VerilogSignalString(addrPort.bitWidth+VerilogLiteralNumber.typeSignedHexadecimal+"0", addrPort.bitWidth, VerilogSignal.signed);
			VerilogSignalString r_or_w_PortIsZero = new VerilogSignalString(r_or_w_Port.bitWidth+VerilogLiteralNumber.typeHexadecimal+"0", r_or_w_Port.bitWidth, VerilogSignal.unsigned);
			VerilogSignalString dataInPortIsZero = new VerilogSignalString(dataInPort.bitWidth+VerilogLiteralNumber.typeSignedHexadecimal+"0", dataInPort.bitWidth, VerilogSignal.signed);
			VerilogSignalString cePortIsZero = new VerilogSignalString(cePort.bitWidth+VerilogLiteralNumber.typeHexadecimal+"0", cePort.bitWidth, VerilogSignal.unsigned);

			addrPort.addAssignSignal(arbiter, addrPortIsZero);
			r_or_w_Port.addAssignSignal(arbiter, r_or_w_PortIsZero);
			dataInPort.addAssignSignal(arbiter, dataInPortIsZero);
			cePort.addAssignSignal(arbiter, cePortIsZero);
		}
	}

	/**
	 * オブジェクトのメソッドの引数への代入処理 :     スカラ変数 -> レジスタ代入,    配列引数 -> arbiter セット
	 * */
	private void argmentAssign(ArrayList<VerilogNoneBlockAssign>[] controlStep, VerilogReg arbiter, VerilogSubModule methodInvSubModule, int methodID, int phaseID, int stageID){

		for(int i=0; i<method.vdecls.size(); i++){

			VerilogVariableDecl subArgVariable = method.vdecls.get(i);
			ParamListVariableSignal subArgSignals = subArgVariable.getParamListSignal();	//サブモジュールのメソッドのパラメータリストから作成された信号

			if(!subArgVariable.isArray){
				StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
				VerilogReg assignedReg = (VerilogReg)methodInvSubModule.getAssignedSignal(subArgVariable.getParamListSignal().getPrmLstScalaPort());
				VerilogNoneBlockAssign argAssign = new VerilogNoneBlockAssign(assignedReg, args[i].destSignal, startState);
				registerNoneBlockAssign(controlStep, argAssign, startStep);
			}
			else{
				DFGraphVariableAccess argNode = (DFGraphVariableAccess)args[i];
				VerilogSignal addrSigToSub = methodInvSubModule.getAssignedSignal(subArgSignals.getPrmLstArrayAddrPort());	//サブモジュールに接続されたこのモジュールのアドレス制御信号
				VerilogSignal r_or_w_SigToSub = methodInvSubModule.getAssignedSignal(subArgSignals.getPrmLstArrayRorW_Port());
				VerilogSignal dataInSigToSub = methodInvSubModule.getAssignedSignal(subArgSignals.getPrmLstArrayDataInPort());
				VerilogSignal dataOutSigToSub = methodInvSubModule.getAssignedSignal(subArgSignals.getPrmLstArrayDataOutPort());
				VerilogSignal clockEnable = methodInvSubModule.getAssignedSignal(subArgSignals.getPrmLstArrayClockEnPort());
				VerilogSignal cacheHit = methodInvSubModule.getAssignedSignal(subArgSignals.getPrmLstArrayCacheHitPort());

				if(argNode.getVariableDecl().getDefType().compareTo(VerilogVariableDecl.defTypeParamList)==0){	//パラメータリストの配列が引数に代入された

					ParamListVariableSignal prmLstSignals = argNode.getVariableDecl().getParamListSignal();
					prmLstSignals.getPrmLstArrayAddrWire().addAssignSignal(arbiter, addrSigToSub);
					prmLstSignals.getPrmLstArrayRorW_Wire().addAssignSignal(arbiter, r_or_w_SigToSub);
					prmLstSignals.getPrmLstArrayDataInWire().addAssignSignal(arbiter, dataInSigToSub);
					prmLstSignals.getPrmLstArrayClockEnWire().addAssignSignal(arbiter, clockEnable);
					if(cacheHit!=null)
						((VerilogWire)cacheHit).addAssignSignal(arbiter, prmLstSignals.getPrmLstArrayCacheHitWire());
					((VerilogWire)dataOutSigToSub).addAssignSignal(arbiter, prmLstSignals.getPrmLstArrayDataOutWire());
				}
				else if(argNode.getVariableDecl().getDefType().compareTo(VerilogVariableDecl.defTypeField)==0){	//フィールドの配列が引数に代入された

					FieldVariableSignal fieldSignals = argNode.getVariableDecl().getFieldSiganls();
					fieldSignals.getFieldArrayAddrWire0().addAssignSignal(arbiter, addrSigToSub);
					fieldSignals.getFieldArrayRorW_wire0().addAssignSignal(arbiter, r_or_w_SigToSub);
					fieldSignals.getFieldArrayDataIn0Wire().addAssignSignal(arbiter, dataInSigToSub);
					fieldSignals.getFieldBramClockEn0Wire().addAssignSignal(arbiter, clockEnable);
					if(cacheHit!=null)
						((VerilogWire)cacheHit).addAssignSignal(arbiter, parentManager.parentClass.boolTrue);
					((VerilogWire)dataOutSigToSub).addAssignSignal(arbiter, fieldSignals.getFieldArrayDataOut0Wire());
				}
				else{
					System.out.println("DEBUG:	DFGraphMethodInv  argmentAssign");
				}
			}
		}
	}

	/**
	 * Thread の join メソッドの処理を行う
	 * */
	private void makeJoinProcess(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		VerilogSubModule methodInvSubModule = getOriginalSubModule(parentManager.parentClass);
		VerilogClass objClass = methodInvSubModule.getObjClass();
		VerilogMethod runMethod = null;

		for(VerilogMethod method: objClass.getMethods()){
			if(method.isThreadRun())
				runMethod = method;
		}

		if(runMethod!=null){
			VerilogSignal busyWire = methodInvSubModule.getAssignedSignal(runMethod.getBusyPort());
			stepControll(controlStep, busyWire, startStep, startStep+1, methodID, phaseID, stageID);
		}
	}

	/**
	 * 32'hXX:   step <= busy ? step : step + 1; <br>
	 * 32'hXX+1: step <= 0;
	 * */
	private void stepControll(ArrayList<VerilogNoneBlockAssign>[] controlStep, VerilogSignal busyWire, int stepPlusOneState, int stepIsZeroState, int methodID, int phaseID, int stageID){

		VerilogSignal trueSignal = parentManager.parentClass.boolTrue;

		//ステップ信号制御  step <= busy ? step : step + 1
		VerilogMethod parentMethod = parentManager.parentMethod;
		VerilogReg stepReg = parentMethod.getStepRegister();
		VerilogSignal nextStepSignal = parentMethod.getStepPlusOne();

		VerilogCondExpression stepControlExpr = new VerilogCondExpression(busyWire, stepReg, nextStepSignal);
		VerilogSignalString stepControlString = new VerilogSignalString(stepControlExpr.getExprString(stepReg.bitWidth, stepReg.isSigned),
																		trueSignal.bitWidth, trueSignal.isSigned);
		StateIdentifier stepIncrState = new StateIdentifier(methodID, phaseID, stageID, stepPlusOneState, false);
		VerilogNoneBlockAssign stepControl = new VerilogNoneBlockAssign(stepReg, stepControlString, stepIncrState);
		registerNoneBlockAssign(controlStep, stepControl, stepPlusOneState);

		//ステップ信号制御  step <= 0
		VerilogSignalString stepZero = new VerilogSignalString(stepReg.bitWidth+VerilogLiteralNumber.typeHexadecimal+0, stepReg.bitWidth, VerilogSignal.unsigned);
		StateIdentifier stepZeroState = new StateIdentifier(methodID, phaseID, stageID, stepIsZeroState, false);
		VerilogNoneBlockAssign stepIsZero = new VerilogNoneBlockAssign(stepReg, stepZero, stepZeroState);
		registerNoneBlockAssign(controlStep, stepIsZero, stepIsZeroState);
	}

	/**
	 * オブジェクトのフィールドが持つ配列引数の read write ポートをネゲートする
	 * */
	private void deAssertArrayRorW_OfObject(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		ArrayList<VerilogReg> arrayRorW = parentManager.parentClass.getBramRorWRegsForSubmod();
		for(VerilogReg r_or_w : arrayRorW){
			StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
			VerilogNoneBlockAssign r_or_w_deAssert = new VerilogNoneBlockAssign(r_or_w, parentManager.parentClass.boolFalse, startState);
			registerNoneBlockAssign(controlStep, r_or_w_deAssert, startStep);
		}
	}

	@Override
	public int getAssignedToNewRegStep(){
		return startStep;
	}

	@Override
	public boolean destSignalIsNotSaved(){

		return false;
	}
}














