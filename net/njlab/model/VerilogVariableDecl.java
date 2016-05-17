package net.njlab.model;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import net.njlab.circuit.FieldVariableSignal;
import net.njlab.circuit.KeyWord;
import net.njlab.circuit.ParamListVariableSignal;
import net.njlab.circuit.VerilogModule;
import net.njlab.circuit.VerilogPort;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.circuit.VerilogWire;
import net.njlab.config.Config;
import net.njlab.dfg.DFGraphLiteral;
import net.njlab.dfg.DFGraphNode;
import net.njlab.dfg.DFGraphVariableAccess;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import net.njlab.ipcore.DualPortRAM;
import net.njlab.tool.Manager;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpression;
import openjdk.com.sun.tools.javac.tree.JCTree.JCNewArray;
import openjdk.com.sun.tools.javac.tree.JCTree.JCNewClass;
import openjdk.com.sun.tools.javac.tree.JCTree.JCVariableDecl;

/**
 *  @author Keisuke Koike
 */


/*サブモジュールが持つ変数によってトップモジュールに現れる信号
 *
 * +--------------+-------------------+-------------------+--------------------------+------------------------+
 * |              |フィールドスカラ   |  フィールド配列   |  パラメータリストスカラ  |  パラメータリスト配列  |
 * +--------------+-------------------+-------------------+--------------------------+------------------------+
 * |no Annotation | 何もなし          |  何もなし         |  レジスタ                |  ワイヤ                |
 * +--------------+-------------------+-------------------+--------------------------+------------------------+
 * |ReadOnlyPort  |input port         |    ×             |     ×                   |    ×                  |
 * +--------------+-------------------+-------------------+--------------------------+------------------------+
 * |extToTop      |output port        |   入出力ポート    |     ×                   |    ×                  |
 * +--------------+-------------------+-------------------+--------------------------+------------------------+
 * */

public class VerilogVariableDecl  extends VerilogStatement implements Cloneable{

	JCVariableDecl vdecl;
	static private ArrayList<VerilogVariableDecl> classVariables;//クラス内部の全変数

	public static String byteType = "byte";
	public static String shortType = "short";
	public static String charType = "char";
	public static String intType = "int";
	public static String longType = "long";
	public static String booleanType = "boolean";
	public static String floatType = "float";
	public static String doubleType = "double";
	public static String defTypeField = "field";
	public static String defTypeParamList = "paramList";
	public static String defTypeMethod = "method";
	public static String privateModif = "private";
	public static String protectedModif = "protected";
	public static String publicModif = "public";
	public static String defaultModif = "default";
	public boolean isArray;
	boolean isPrimitive = true;	//byte, short, char, int, long 型のスカラ or 配列の場合 true
	boolean isFinal;
	boolean existInit;	//初期化があるかどうか
	boolean isReadOnlyPort = false; //JRThrashReadOnlyPort アノテーションの有無
	boolean isExtendedPort = false; //JRThrashExtToTop アノテーションの有無
	boolean isForwarfingInvalidate = false; //JRThrashFwdInvalidate アノテーションの有無
	boolean cacheEnable = false;	//JRThrashCacheEnable アノテーションの有無
	String name;	//名前
	String type;	//型
	String fieldModType = defaultModif;	//public, private , protected, default
	String parentName;	//宣言されたクラスやメソッドの名前
	String defType;	//どこで宣言されたか (フィールド, メソッドのパラメータリスト, メソッド内の一時変数)
	int dimension;	//配列型の場合の次元
	VerilogExpression init;
	static int variableIDseq;
	int variableID;
	String nameWithID;
	FieldVariableSignal fieldSignals;	//フィールドの変数から作成される信号
	ParamListVariableSignal prmLstSignals;	//パラメータリストの変数から作成される信号
	VerilogReg regMethodPrimitive;	//メソッドのスカラ変数
	private VerilogSignal primitiveSignal;	//プリミティブ型の変数からできる signal
	private DualPortRAM fieldDPRAM;
	private int cacheLatency;	//JRThrashCacheEnable を用いた場合のレイテンシ

	public String getDefType(){
		return defType;
	}

	static public void resetVariableID(int resetNum){
		variableIDseq = resetNum;
	}

	public String getType(){
		return type;
	}
	public String getName(){
		return name;
	}
	public int getID(){
		return variableID;
	}

	public boolean isForwarfingInvalidate(){
		return isForwarfingInvalidate;
	}

	public VerilogVariableDecl(JCVariableDecl vdecl, String parentName, String defType){

		this.vdecl = vdecl;
		this.parentName = parentName;
		this.defType = defType;
		this.name = vdecl.getName().toString();
		classVariables.add(this);
		variableID = variableIDseq++;
		checkType();
		if(vdecl.getModifiers().toString().indexOf("final")!=-1) isFinal = true;
		else 													 isFinal = false;
		checkFieldModType();
		makeInit();
		checkAnnotation();
		checkError();
	}

	//オブジェクトが持つフィールドを作る場合
	public VerilogVariableDecl(JCVariableDecl vdecl, String defType, VerilogExpression init){

		this.vdecl = vdecl;
		this.defType = defType;
		this.name = vdecl.getName().toString();
		checkType();
		if(vdecl.getModifiers().toString().indexOf("final")!=-1) isFinal = true;
		else 													 isFinal = false;
		checkFieldModType();
		checkAnnotation();
		this.init = init;
	}

	void checkType(){

		int i;
		dimension = 0;
		for(i=0; i<vdecl.getType().toString().length(); i++)
			if(vdecl.getType().toString().charAt(i)=='[')
				dimension++;

		if(dimension==0)	isArray = false;
		else				isArray = true;

		if(vdecl.getType().toString().indexOf(byteType)!=-1)	     type = byteType;
		else if(vdecl.getType().toString().indexOf(shortType)!=-1)   type = shortType;
		else if(vdecl.getType().toString().indexOf(charType)!=-1)    type = charType;
		else if(vdecl.getType().toString().indexOf(intType)!=-1)     type = intType;
		else if(vdecl.getType().toString().indexOf(longType)!=-1)    type = longType;
		else if(vdecl.getType().toString().indexOf(floatType)!=-1)   type = floatType;
		else if(vdecl.getType().toString().indexOf(doubleType)!=-1)  type = doubleType;
		else if(vdecl.getType().toString().indexOf(booleanType)!=-1) type = booleanType;
		else{
			StringBuffer stbuf = new StringBuffer(vdecl.getType().toString());
			if(isArray){
				int start = stbuf.indexOf("[");
				int last = stbuf.lastIndexOf("]");
				stbuf.delete(start, last+1);
			}
			type = stbuf.toString();
			isPrimitive = false;
		}
	}

	private void checkFieldModType(){

		if(vdecl.getModifiers().toString().indexOf(privateModif)!=-1)
			fieldModType = privateModif;

		else if(vdecl.getModifiers().toString().indexOf(protectedModif)!=-1)
			fieldModType = protectedModif;

		else if(vdecl.getModifiers().toString().indexOf(publicModif)!=-1)
			fieldModType = publicModif;
	}

	void makeInit(){
		if(vdecl.getInitializer()==null){
			existInit = false;
		}
		else{

			if(vdecl.getInitializer()==null){//null での初期化は初期化扱いしない
				existInit = false;
				return;
			}
			else
				existInit = true;

			if(vdecl.getInitializer() instanceof JCNewClass){
				init = new VerilogNewClass((JCNewClass)vdecl.getInitializer(), this); //makeSubExpression を使わない
			}
			else if(vdecl.getInitializer() instanceof JCNewArray){
				init = new VerilogNewArray((JCNewArray)vdecl.getInitializer(), this); //makeSubExpression を使わない
			}
			else{
				VerilogAssign tmp = new VerilogAssign(null, this, null);	// type dest = (castType)methodInv(...) のためのダミー
				init  = VerilogExpression.makeSubExpression(this, tmp, vdecl.getInitializer());
			}
		}
	}

	static void setClassVariables(ArrayList<VerilogVariableDecl> _classVariables){
		classVariables = _classVariables;
	}

	public void checkError(){

		if(name.charAt(0)=='$' || name.charAt(name.length()-1)=='$'){
			CompileMsgs.edumpUseDollar(name);
			buildSucceed = false;
			return;
		}
		if(isArray && defType.compareTo(defTypeMethod)==0){	//メソッド内部に配列が宣言されている
			CompileMsgs.edumpArrayDeclare(name);
			buildSucceed = false;
			return;
		}
		if(isArray && (!isPrimitive)){	//配列変数の型はプリミティブ型のみ対応しています
			CompileMsgs.edumpArrayMustBePrimitive(name);
			buildSucceed = false;
		}
		if(isArray && (!isFinal) && defType!=defTypeParamList){	//フィールド配列宣言にfinal がついていない
			CompileMsgs.edumpSetArrayToFinal(name);
			buildSucceed = false;
		}
		if(isArray && (!existInit) && defType!=defTypeParamList){	//フィールド配列に new がない
			CompileMsgs.edumpArrayDeclare(name);
			buildSucceed = false;
		}
		if((!isPrimitive) && defType.compareTo(defTypeField)!=0){	//クラス型の変数はフィールド変数として宣言してください
			CompileMsgs.edumpDeclareClassVarAsField(name);
			buildSucceed = false;
		}
		if((!isPrimitive) && (!isFinal)){	//クラス型の変数は final を付けて宣言してください
			CompileMsgs.edumpSetClassVarToFinalAndNew(name);
			buildSucceed = false;
		}
		if((!isPrimitive) && (!existInit)){	//クラス型の変数は new を使って初期化して下さい
			CompileMsgs.edumpSetClassVarToFinalAndNew(name);
			buildSucceed = false;
		}
		if(isArray && defType.compareTo(defTypeParamList)==0 && (dimension>=2)){	//パラメータリストの配列変数は1次元にしてください
			CompileMsgs.edumpOneDimArray(name);
			buildSucceed = false;
		}
		if(isPrimitive && (!isArray) && existInit && (defType.compareTo(defTypeField)==0)){//配列でないプリミティブ型変数の初期化がリテラル以外
			if(!(init instanceof VerilogLiteral)){
				CompileMsgs.edumpInitLiteral(name);
				buildSucceed = false;
			}
		}
		if(isReadOnlyPort && isExtendedPort){//JRThrashExtToTop と JRThrashReadOnlyPort が同時に付いている
			if(!(init instanceof VerilogLiteral)){
				CompileMsgs.edumpPutPortAnnotation(name);
				buildSucceed = false;
			}
		}
		if((isReadOnlyPort || isExtendedPort) && fieldModType.compareTo(privateModif)==0){	//ポート拡張系アノテーションと private が同時についている
			CompileMsgs.edumpPutPortAnotOnPrivate(name);
			buildSucceed = false;
		}
	}

	void checkAnnotation(){

		for(int i=0; i<vdecl.mods.annotations.size(); i++){
			if(vdecl.mods.annotations.get(i).toString().indexOf("JRThrashReadOnlyPort")!=-1)
				checkJRThrashReadOnlyPort();

			if(vdecl.mods.annotations.get(i).toString().indexOf("JRThrashExtToTop")!=-1)
				checkJRThrashExtToTop();

			if(vdecl.mods.annotations.get(i).toString().indexOf("JRThrashForwardingInvalidate")!=-1)
				checkJRThrashFwdInvalidate();

			if(vdecl.mods.annotations.get(i).toString().indexOf("JRThrashCacheEnable")!=-1)
				checkJRThrashCacheEnable();
		}
	}

	private void checkJRThrashReadOnlyPort(){

		if(this.defType.compareTo(defTypeField)==0 && isPrimitive){
			if(!isArray){
				isReadOnlyPort = true;
				if(init!=null){	//@JRThrashReadOnlyPort を付けた変数には書き込めません
					CompileMsgs.edumpWriteReadOnlyPort(vdecl.toString());
					buildSucceed = false;
				}
			}
			else{	//配列変数に @JRThrashReadOnlyPort を付けた
				CompileMsgs.edumpReadOnlyAnot(vdecl.toString());
				buildSucceed = false;
			}
		}
		else{	//JRThrashReadOnlyPort はプリミティブ型フィールド変数にしか付けられません
			CompileMsgs.edumpReadOnlyAnot(vdecl.toString());
			buildSucceed = false;
		}
	}

	private void checkJRThrashExtToTop(){

		if(this.defType.compareTo(defTypeField)==0 && isPrimitive){
			isExtendedPort = true;
		}
		else{
			CompileMsgs.edumpExtToTopAnot(vdecl.toString());
			buildSucceed = false;
		}
	}

	private void checkJRThrashFwdInvalidate(){

		if(this.defType.compareTo(defTypeField)==0 || this.defType.compareTo(defTypeMethod)==0){
			if(isPrimitive && !isArray){
				isForwarfingInvalidate = true;
				return;
			}
		}
		buildSucceed = false;
		CompileMsgs.edumpFwdInvalidateAnot(vdecl.toString());
	}

	private void checkJRThrashCacheEnable(){

		if(isArray && defType.compareTo(defTypeParamList)==0){

			for(int i=0; i<vdecl.mods.annotations.size(); ++i){

				List<JCExpression> annotationList = vdecl.mods.annotations.get(i).getArguments();
				try{
					cacheLatency = Integer.parseInt(Manager.extractAnnotationParam("cacheLatency", annotationList));	//キャッシュレイテンシセット
					cacheLatency = (cacheLatency < 0) ? 1 : cacheLatency;
					cacheEnable = true;
				}
				catch(NumberFormatException e){
					CompileMsgs.edumpCacheEnLatency(vdecl.toString());
					buildSucceed = false;
				}
			}
			return;
		}

		CompileMsgs.edumpCacheEnAnot(vdecl.toString());
		buildSucceed = false;
	}

	public void dump(PrintWriter out, int offset){

		Dump.tprintln(out, offset, "<VeriableDecl>");
		Dump.tprintln(out, offset+1,"<name>	"+name+"	</name>");
		Dump.tprintln(out, offset+1,"<type>	"+type+"	</type>");
		Dump.tprintln(out, offset+1,"<variableID>	"+variableID+"	</variableID>");
		Dump.tprintln(out, offset+1,"<parentName>	"+parentName+"	</parentName>");
		Dump.tprintln(out, offset+1,"<defType>	"+defType+"	</defType>");
		Dump.tprintln(out, offset+1, "<isArray>	"+isArray+"	</isArray>");
		Dump.tprintln(out, offset+1, "<isPrimitive>	"+isPrimitive+"	</isPrimitive>");
		Dump.tprintln(out, offset+1, "<isFinal>	"+isFinal+"	</isFinal>");
		Dump.tprintln(out, offset+1, "<dimension>	"+dimension+"	</dimension>");
		Dump.tprintln(out, offset+1, "<init>");
		if(existInit)	init.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</init>");
		Dump.tprintln(out, offset, "</VeriableDecl>\n");
	}

	public void dumpSimple(PrintWriter out, int offset){
		Dump.tprintln(out, offset,"<VeriableDecl>			<name>	"+name+"	</name>		<variableID>	"+variableID+"	</variableID>		<defType>	"+defType+"	</defType>			</VeriableDecl>");
	}

	@Override	//浮動動小数点数の統一  と  初期化部分のexpression 構築
	public void buildExpression(){

		standardizeFloating();
		if(init!=null)
			init.buildExpression();

		if(cacheEnable && !getPhaseParent().getParentClass().config.clockEnable){	//clockEnable が false の場合, cacheEnable は有効にならない
			buildSucceed = false;
			CompileMsgs.edumpCacheEnableClockEnable();
		}
	}

	private void standardizeFloating(){	//浮動動小数点数の統一

		if(type.compareTo(floatType)==0 && this.getPhaseParent().getParentClass().config.floatingType==Config.doubleType){	//このクラスの浮動小数点数は double 型で計算されます
			type = doubleType;
			CompileMsgs.wdumpChangeFloatIntoDouble(parentName, name);
		}
		else if(type.compareTo(doubleType)==0 && this.getPhaseParent().getParentClass().config.floatingType==Config.singleType){	//このクラスの浮動小数点数は float 型で計算されます
			type = floatType;
			CompileMsgs.wdumpChangeDoubleIntoFloat(parentName, name);
		}
	}

	public static boolean isPrimitive(String type){

		boolean ret = false;
		if(type.compareTo(VerilogVariableDecl.byteType)==0) ret = true;
		else if(type.compareTo(VerilogVariableDecl.charType)==0) ret = true;
		else if(type.compareTo(VerilogVariableDecl.shortType)==0) ret = true;
		else if(type.compareTo(VerilogVariableDecl.intType)==0) ret = true;
		else if(type.compareTo(VerilogVariableDecl.longType)==0) ret = true;
		else if(type.compareTo(VerilogVariableDecl.floatType)==0) ret = true;
		else if(type.compareTo(VerilogVariableDecl.doubleType)==0) ret = true;
		else if(type.compareTo(VerilogVariableDecl.booleanType)==0) ret = true;
		return ret;
	}

	static public boolean isSigned(String type){

		if(type.compareTo(floatType)==0 || type.compareTo(doubleType)==0 || type.compareTo(booleanType)==0)
			return VerilogSignal.unsigned;
		return VerilogSignal.signed;
	}

	@Override
	public boolean checkAssignKind(){

		boolean ret = false;
		if(existInit){
			if(ret|=init.checkAssignKind()){
				CompileMsgs.edumpAssignKind(vdecl.getInitializer().toString()+" aa");
			}
			if(ret|=VerilogExpression.isIncDecAssign(init)){
				CompileMsgs.edumpAssignKind(vdecl.getInitializer().toString());
			}
		}
		if(ret)	buildSucceed = false;
		return ret;
	}


	@Override
	public boolean existERR(){

		boolean ret = !buildSucceed;
		if(init!=null)
			ret |= init.existERR();
		return ret;
	}

	@Override
	public DFGraphNode makeDFG(){

		Config config = getPhaseParent().getParentClass().config;

		if(init!=null){
			if(isPrimitive && defType.compareTo(defTypeMethod)==0 && (!isArray)){

				DFGraphVariableAccess dest = new DFGraphVariableAccess(this, null);
				return VerilogAssign.makeAssignNode(dest, init.makeDFG(), config);
			}
			else if(isPrimitive && defType.compareTo(defTypeField)==0 && (!isArray)){

				DFGraphNode tmp = init.makeDFG();
				DFGraphVariableAccess dest = new DFGraphVariableAccess(this, null);
				return VerilogAssign.makeAssignNode(dest, tmp, config);
			}
			else{
				//System.out.println("DEBUG:	variableDecl subModule makeDFG error");
				return null;
			}
		}
		else{
			if(defType.compareTo(defTypeField)==0 && (!isArray) && (!isReadOnlyPort)){

				DFGraphVariableAccess dest = new DFGraphVariableAccess(this, null);
				DFGraphLiteral resetZero = new DFGraphLiteral(type, 0, 0, 0.0f, 0.0, false);
				return VerilogAssign.makeAssignNode(dest, resetZero, config);
			}
		}
		return null;
	}

	public static int getBitWidth(VerilogModule module, String type){

		int retBitWidth = 0;
		if(type.compareTo(VerilogVariableDecl.byteType)==0)
			retBitWidth = module.config.byteBitWidth;
		else if(type.compareTo(VerilogVariableDecl.charType)==0)
			retBitWidth = module.config.charBitWidth;
		else if(type.compareTo(VerilogVariableDecl.shortType)==0)
			retBitWidth = module.config.shortBitWidth;
		else if(type.compareTo(VerilogVariableDecl.intType)==0)
			retBitWidth = module.config.intBitWidth;
		else if(type.compareTo(VerilogVariableDecl.longType)==0)
			retBitWidth = module.config.longBitWidth;
		else if(type.compareTo(VerilogVariableDecl.floatType)==0)
			retBitWidth = module.config.floatBitWidth;
		else if(type.compareTo(VerilogVariableDecl.doubleType)==0)
			retBitWidth = module.config.doubleBitWidth;
		else if(type.compareTo(VerilogVariableDecl.booleanType)==0)
			retBitWidth = 1;
		return retBitWidth;
	}

	private void makeParamListSignal(VerilogModule module, boolean isPrivate){

		if( module.claz.getMethod(parentName).convertedIntoIP )	//IPコア化されるメソッドのシグナルは，ここでは作らない
			return;

		boolean isSigned = isSigned(type);

		if(isArray){
			makeParamListArray(module, isSigned, isPrivate);
		}
		else{
			VerilogPort portParamList = isPrivate ? null : new VerilogPort(parentName+"_"+nameWithID, VerilogPort.input, getBitWidth(module, type), isSigned, this, VerilogPort.isNotBramControl);
			VerilogReg regParamList = new VerilogReg(parentName+"_"+nameWithID, getBitWidth(module, type), isSigned);
			prmLstSignals = new ParamListVariableSignal(portParamList, regParamList);
			primitiveSignal = regParamList;

			if(!isPrivate)
				module.addPort(portParamList);
			module.addRegister(regParamList);
		}
	}

	private void makeParamListArray(VerilogModule module, boolean isSigned, boolean isPrivate){

		VerilogReg regExternalBramAddr = new VerilogReg(parentName+"_"+nameWithID+KeyWord.K_addr, module.config.paramListArrayAddrBitWidth, VerilogReg.signed);
		VerilogWire wireExternalBramAddr = new VerilogWire(parentName+"_"+nameWithID+KeyWord.K_addr, regExternalBramAddr.bitWidth, regExternalBramAddr, regExternalBramAddr.isSigned);
		VerilogPort portExternalBramAddr = isPrivate ? null :
													   new VerilogPort(parentName+"_"+nameWithID+KeyWord.K_addr, VerilogPort.output, module.config.paramListArrayAddrBitWidth, wireExternalBramAddr,
															   		   VerilogSignal.signed, this, VerilogPort.isBramAddr);

		VerilogReg regExternalBramDataIn = new VerilogReg(parentName+"_"+nameWithID+KeyWord.K_datain, getBitWidth(module, type), isSigned);
		VerilogWire wireExternalBramDataIn = new VerilogWire(parentName+"_"+nameWithID+KeyWord.K_datain, regExternalBramDataIn.bitWidth, regExternalBramDataIn, regExternalBramDataIn.isSigned);
		VerilogPort portExternalBramDataIn = isPrivate ? null :
														 new VerilogPort(parentName+"_"+nameWithID+KeyWord.K_datain, VerilogPort.output, getBitWidth(module, type), wireExternalBramDataIn,
																 		 isSigned, this, VerilogPort.isBramDataIn);

		VerilogPort portExternalBramDataOut = isPrivate ? null :
														  new VerilogPort(parentName+"_"+nameWithID+KeyWord.K_dataout, VerilogPort.input, getBitWidth(module, type), isSigned, this, VerilogPort.isBramDataOut);
		VerilogWire wireExternalBramDataOut = isPrivate ? new VerilogWire(parentName+"_"+nameWithID+KeyWord.K_dataout, getBitWidth(module, type),
																		  VerilogSignalString.getZero(getBitWidth(module, type), isSigned), isSigned) :
														  new VerilogWire(parentName+"_"+nameWithID+KeyWord.K_dataout, getBitWidth(module, type), portExternalBramDataOut, isSigned);


		VerilogReg regExternalBramRorW = new VerilogReg(parentName+"_"+nameWithID+KeyWord.K_r_w, 1, VerilogReg.unsigned);
		VerilogWire wireExternalBramRorW = new VerilogWire(parentName+"_"+nameWithID+KeyWord.K_r_w, regExternalBramRorW.bitWidth, regExternalBramRorW, regExternalBramRorW.isSigned);
		VerilogPort portExternalBramRorW = isPrivate ? null : new VerilogPort(parentName+"_"+nameWithID+KeyWord.K_r_w, VerilogPort.output, 1, wireExternalBramRorW,
														   					  VerilogSignal.unsigned, this, VerilogPort.isBramRorW);

		VerilogWire wireExternalBramCE = new VerilogWire(parentName+"_"+nameWithID+KeyWord.K__ce, 1, module.claz.wireClockEnable, VerilogSignal.unsigned);
		VerilogPort portExternalBramCE = isPrivate ? null :
													 new VerilogPort(parentName+"_"+nameWithID+KeyWord.K__ce, VerilogPort.output, 1, wireExternalBramCE, VerilogSignal.unsigned, this, VerilogPort.isBramClockEnable);

		VerilogPort portCacheHit = (!isPrivate && cacheEnable) ? new VerilogPort(parentName+"_"+nameWithID+KeyWord.K_cacheHit, VerilogPort.input, 1,
																				 VerilogSignal.unsigned, this, VerilogPort.isBramCacheHit) : null;

		VerilogWire wireCacheHit = (!isPrivate && cacheEnable) ? new VerilogWire(parentName+"_"+nameWithID+KeyWord.K_cacheHit, 1, portCacheHit, VerilogSignal.unsigned) :
			 													 new VerilogWire(parentName+"_"+nameWithID+KeyWord.K_cacheHit, 1, module.claz.boolTrue, VerilogSignal.unsigned);


		prmLstSignals = new ParamListVariableSignal(portExternalBramAddr, portExternalBramDataIn, portExternalBramDataOut,
													portExternalBramRorW, portExternalBramCE,     portCacheHit,
													wireExternalBramAddr, wireExternalBramDataIn, wireExternalBramRorW,
													wireExternalBramCE,   wireCacheHit,
													regExternalBramAddr,  regExternalBramDataIn, wireExternalBramDataOut, regExternalBramRorW);

		module.addRegister(regExternalBramAddr);
		module.addRegister(regExternalBramDataIn);
		module.addWire(wireExternalBramDataOut);
		module.addRegister(regExternalBramRorW);
		module.addWire(wireExternalBramAddr);
		module.addWire(wireExternalBramDataIn);
		module.addWire(wireExternalBramRorW);
		module.addWire(wireExternalBramCE);
		module.addWire(wireCacheHit);

		if(!isPrivate){
			module.addPort(portExternalBramAddr);
			module.addPort(portExternalBramDataIn);
			module.addPort(portExternalBramDataOut);
			module.addPort(portExternalBramRorW);
			module.addPort(portExternalBramCE);
			if(cacheEnable)
				module.addPort(portCacheHit);
		}
	}

	public ParamListVariableSignal getParamListSignal(){
		return prmLstSignals;
	}

	/**
	 * 配列の要素数からアドレス線のbit幅を求める
	 * */
	private int getFieldArrayAddr(){

		int depth = getDepth(), retVal = 0, mod;
		boolean plus1 = false;
		if(depth==1)	retVal = 1;

		while(depth!=1){
			mod = depth%2;
			depth /= 2;
			++retVal;
			if(mod!=0)
				plus1 = true;
		}
		if(plus1)
			++retVal;
		return retVal;
	}

	int getDepth(){
		int depth = 1;
		for(int i=0; i<((VerilogNewArray)init).getElements().size(); i++)
			depth *= ((VerilogNewArray)init).getElements().get(i);
		if(depth<=0) depth = 1;
		return depth;
	}

	private void makeFieldSignal(VerilogModule module){
		boolean isSigned = isSigned(type);
		boolean isPrivate = fieldModType.compareTo(privateModif)==0;

		if(isArray){
			makeFieldArray(module, isPrivate, isSigned);
		}
		else if(isPrimitive){
			makeFieldPrimitive(module, isSigned);
		}
		//else{//クラス型変数

		//}
	}

	private void makeFieldArray(VerilogModule module, boolean isPrivate, boolean isSigned){

		VerilogPort portFieldBramAddr0 = isPrivate ? null : new VerilogPort(KeyWord.K_fld_+nameWithID+KeyWord.K_addr_0, VerilogPort.input, getFieldArrayAddr(),
																			VerilogSignal.signed, this, VerilogPort.isBramAddr);

		VerilogPort portFieldBramDataIn0 = isPrivate ? null : new VerilogPort(KeyWord.K_fld_+nameWithID+KeyWord.K_datain_0,
				  															  VerilogPort.input, getBitWidth(module, type), isSigned, this, VerilogPort.isBramDataIn);

		VerilogWire wireFieldBramDataOut0 = new VerilogWire(KeyWord.K_fld_+nameWithID+KeyWord.K_dataout_0, getBitWidth(module, type), isSigned);

		VerilogPort portFieldBramRorW0 = isPrivate ? null : new VerilogPort(KeyWord.K_fld_+nameWithID+KeyWord.K_r_w_0, VerilogPort.input, 1,
																			VerilogSignal.unsigned, this, VerilogPort.isBramRorW);

		VerilogSignal addrSignal = isPrivate ? VerilogSignalString.getZero(getFieldArrayAddr(), VerilogSignal.signed) : portFieldBramAddr0;
		VerilogSignal dataInSignal = isPrivate ? VerilogSignalString.getZero(getBitWidth(module, type), isSigned) : portFieldBramDataIn0;
		VerilogSignal RorW_Signal = isPrivate ? VerilogSignalString.getZero(1, VerilogSignal.unsigned) : portFieldBramRorW0;

		VerilogWire wireFieldBramAddr0 = new VerilogWire(KeyWord.K_fld_+nameWithID+KeyWord.K_addr_0, getFieldArrayAddr(), addrSignal, VerilogSignal.signed);

		VerilogWire wireFieldBramDataIn0 = new VerilogWire(KeyWord.K_fld_+nameWithID+KeyWord.K_datain_0, getBitWidth(module, type), dataInSignal, isSigned);

		VerilogPort portFieldBramDataOut0 = isPrivate ? null : new VerilogPort(KeyWord.K_fld_+nameWithID+KeyWord.K_dataout_0, VerilogPort.output, getBitWidth(module, type),
																			   wireFieldBramDataOut0, isSigned, this, VerilogPort.isBramDataOut);

		VerilogWire wireFieldBramRorW0 = new VerilogWire(KeyWord.K_fld_+nameWithID+KeyWord.K_r_w_0, 1, RorW_Signal, VerilogSignal.unsigned);

		VerilogWire wireFieldBramClockEn0 = new VerilogWire(KeyWord.K_fld_+nameWithID+KeyWord.K__ce+"_0", 1, module.claz.wireClockEnable, VerilogSignal.unsigned);

		VerilogReg regFieldBramAddr1 = new VerilogReg(KeyWord.K_fld_+nameWithID+KeyWord.K_addr_1,  getFieldArrayAddr(), VerilogReg.signed);
		VerilogReg regFieldBramDataIn1 = new VerilogReg(KeyWord.K_fld_+nameWithID+KeyWord.K_datain_1, getBitWidth(module, type), isSigned);
		VerilogWire wireFieldBramDataOut1 = new VerilogWire(KeyWord.K_fld_+nameWithID+KeyWord.K_dataout_1, getBitWidth(module, type), isSigned);
		VerilogReg regFieldBramRorW1 = new VerilogReg(KeyWord.K_fld_+nameWithID+KeyWord.K_r_w_1,  1, VerilogReg.unsigned);
		VerilogWire wireFieldBramClockEn1 = new VerilogWire(KeyWord.K_fld_+nameWithID+KeyWord.K__ce+"_1", 1, module.claz.wireClockEnable, VerilogSignal.unsigned);

		fieldSignals = new FieldVariableSignal(portFieldBramAddr0, portFieldBramDataIn0, portFieldBramDataOut0, portFieldBramRorW0,
											   wireFieldBramAddr0, wireFieldBramDataIn0, wireFieldBramDataOut0, wireFieldBramRorW0,
											   wireFieldBramClockEn0, wireFieldBramClockEn1,
											   regFieldBramAddr1,  regFieldBramDataIn1,  wireFieldBramDataOut1, regFieldBramRorW1);

		registerFieldArray(module, isPrivate,
						   portFieldBramAddr0,    portFieldBramDataIn0, wireFieldBramDataOut0, portFieldBramRorW0,
						   wireFieldBramAddr0,    wireFieldBramDataIn0, portFieldBramDataOut0, wireFieldBramRorW0,
						   wireFieldBramClockEn0, wireFieldBramClockEn1,
						   regFieldBramAddr1,     regFieldBramDataIn1,  wireFieldBramDataOut1, regFieldBramRorW1);

		//dpram登録
		fieldDPRAM = new DualPortRAM( wireFieldBramAddr0.bitWidth, wireFieldBramDataIn0.bitWidth, getDepth(),
									  module, nameWithID,  module.claz.clock,
									  wireFieldBramRorW0, wireFieldBramAddr0, wireFieldBramDataIn0, wireFieldBramDataOut0, wireFieldBramClockEn0,
									  regFieldBramRorW1,  regFieldBramAddr1,  regFieldBramDataIn1,  wireFieldBramDataOut1, wireFieldBramClockEn1,
									  getPhaseParent().getParentClass().config);
		module.addDualPortRAM(fieldDPRAM);
	}

	private void registerFieldArray(VerilogModule module, boolean isPrivate,
									VerilogPort portFieldBramAddr0, VerilogPort portFieldBramDataIn0, VerilogWire wireFieldBramDataOut0,  VerilogPort portFieldBramRorW0,
									VerilogWire wireFieldBramAddr0, VerilogWire wireFieldBramDataIn0, VerilogPort portFieldBramDataOut0,  VerilogWire wireFieldBramRorW0,
									VerilogWire wireFieldBramClockEn0, VerilogWire wireFieldBramClockEn1,
									VerilogReg regFieldBramAddr1,    VerilogReg regFieldBramDataIn1,   VerilogWire wireFieldBramDataOut1, VerilogReg regFieldBramRorW1) {
		if(!isPrivate){
			module.addPort(portFieldBramAddr0);
			module.addPort(portFieldBramDataIn0);
			module.addPort(portFieldBramDataOut0);
			module.addPort(portFieldBramRorW0);
		}
		module.addWire(wireFieldBramAddr0);
		module.addWire(wireFieldBramDataIn0);
		module.addWire(wireFieldBramDataOut0);
		module.addWire(wireFieldBramRorW0);
		module.addWire(wireFieldBramClockEn0);

		module.addRegister(regFieldBramAddr1);
		module.addRegister(regFieldBramDataIn1);
		module.addWire(wireFieldBramDataOut1);
		module.addRegister(regFieldBramRorW1);
		module.addWire(wireFieldBramClockEn1);
	}



	private void makeFieldPrimitive(VerilogModule module, boolean isSigned){

		if(isReadOnlyPort){
			VerilogPort portFieldPrimitive = new VerilogPort(KeyWord.K_fld_+nameWithID, VerilogPort.input, getBitWidth(module, type), isSigned, this, VerilogPort.isNotBramControl);
			fieldSignals = new FieldVariableSignal(portFieldPrimitive);
			primitiveSignal = portFieldPrimitive ;
			module.addPort(portFieldPrimitive );
		}
		else if(isExtendedPort){
			VerilogReg regFieldPrimitive = new VerilogReg(KeyWord.K_fld_+nameWithID, getBitWidth(module, type), isSigned);
			fieldSignals = new FieldVariableSignal(regFieldPrimitive);
			primitiveSignal = regFieldPrimitive;
			VerilogPort portFieldPrimitive = new VerilogPort(KeyWord.K_fld_+nameWithID, VerilogPort.output, getBitWidth(module, type), regFieldPrimitive,
															 isSigned, this, VerilogPort.isNotBramControl);
			module.addPort(portFieldPrimitive);
			module.addRegister(regFieldPrimitive);
		}
		else{
			VerilogReg regFieldPrimitive = new VerilogReg(KeyWord.K_fld_+nameWithID, getBitWidth(module, type), isSigned);
			fieldSignals = new FieldVariableSignal(regFieldPrimitive);
			primitiveSignal = regFieldPrimitive;
			module.addRegister(regFieldPrimitive);
		}
	}

	public FieldVariableSignal getFieldSiganls(){
		return fieldSignals;
	}

	private void makeMethodSignal(VerilogModule module){
		regMethodPrimitive = new VerilogReg(parentName+"_"+nameWithID, getBitWidth(module, type), isSigned(type));
		primitiveSignal = regMethodPrimitive;
		module.addRegister(regMethodPrimitive);
	}

	public VerilogReg getMethodPrimitiveSignal(){
		return regMethodPrimitive;
	}

	public void makeSignal(VerilogModule module){
		nameWithID = name +"_"+variableID;
		if(defType.compareTo(defTypeParamList)==0){

			VerilogMethod method = module.claz.getMethod(parentName);
			boolean isPrivate = method.methodModType.compareTo(VerilogVariableDecl.privateModif)==0;
			makeParamListSignal(module, isPrivate);
		}
		else if(defType.compareTo(defTypeField)==0){
			makeFieldSignal(module);
		}
		else if(defType.compareTo(defTypeMethod)==0){
			makeMethodSignal(module);
		}
	}

	/**
	 * オブジェクトのフィールドがもつ配列にアクセスするための信号をセットする
	 * */
	public void setArraySignalOfObject(VerilogSignal arrayControlSignal, int bramControllSignalType){

		if(fieldSignals==null)
			fieldSignals = new FieldVariableSignal(null, null, null, null, null, null, null, null, null, null, null, null, null, null);

		if(bramControllSignalType==VerilogPort.isBramAddr)
			fieldSignals.setRegFieldBramAddr1((VerilogReg)arrayControlSignal);

		else if(bramControllSignalType==VerilogPort.isBramRorW)
			fieldSignals.setRegFieldBramRorW1((VerilogReg)arrayControlSignal);

		else if(bramControllSignalType==VerilogPort.isBramDataIn)
			fieldSignals.setRegFieldBramDataIn1((VerilogReg)arrayControlSignal);

		else if(bramControllSignalType==VerilogPort.isBramDataOut)
			fieldSignals.setWireFieldBramDataOut1((VerilogWire)arrayControlSignal);
	}


	@Override
	public void findUsedVariables(){
		if(defType.compareTo(defTypeMethod)==0){
			if(init!=null){
				usedReadVariables.addAll(init.registerUsedVariables());
				usedWriteVariable = this;
			}
		}
	}

	public VerilogSignal getPrimitiveSignal(){
		return primitiveSignal;
	}

	/**
	 * ループ展開時に，ループ内部で宣言されていた変数は，展開数分コピーされる<br>
	 * そのとき，このクラスのインスタンスも展開数に応じてコピーされる
	 * */
	public VerilogVariableDecl duplicate(int cloneNum, VerilogClass parentClass){
		try {
			VerilogVariableDecl tmp = (VerilogVariableDecl)super.clone();
			tmp.name = KeyWord.K_copy+cloneNum+"_"+tmp.name;
			parentClass.classVariables.add(tmp);
			tmp.variableID = variableIDseq++;
			return tmp;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	/**
	 * 変数から作成されるハードウェアコンポーネント
	 *
	 * +--------------+-------------------+-------------------+--------------------------+------------------------+-------------------+
	 * |              |  フィールドスカラ |  フィールド配列   |  パラメータリストスカラ  |  パラメータリスト配列  |  メソッド内スカラ |
	 * +--------------+-------------------+-------------------+--------------------------+------------------------+-------------------+
	 * |no Annotation |     レジスタ      |      BRAM         |        レジスタ          |      レジスタ(複)      |      レジスタ     |
	 * +--------------+-------------------+-------------------+--------------------------+------------------------+-------------------+
	 * |ReadOnlyPort  |   input port      |       ×          |           ×             |           ×           |         ×        |
	 * +--------------+-------------------+-------------------+--------------------------+------------------------+-------------------+
	 */
	public String constructComponentString(){


		if(isArray){
			if(defType.compareTo(defTypeField)==0){

				if(fieldDPRAM==null){	//オブジェクトのフィールドがもつ配列にアクセス
					String signalNames = "		reg  : "+fieldSignals.getFieldArrayAddrReg1().getSigName()+"	\n";
					signalNames += "		reg  : "+fieldSignals.getFieldArrayRorW_Reg1().getSigName()+"	\n";
					signalNames += "		reg  : "+fieldSignals.getFieldArrayDataInReg1().getSigName()+"	\n";
					signalNames += "		wire : "+fieldSignals.getFieldArrayDataOut1().getSigName()+"	";
					return signalNames;
				}
				else{
					return "		DPRAM : "+fieldDPRAM.getInstanceName()+"	";
				}
			}
			else if(defType.compareTo(defTypeParamList)==0){
				String signalNames = "		reg  : "+prmLstSignals.getPrmLstArrayAddrReg().getSigName()+"	\n";
				signalNames += "		reg  : "+prmLstSignals.getPrmLstArrayRorW_Reg().getSigName()+"	\n";
				signalNames += "		reg  : "+prmLstSignals.getPrmLstArrayDataInReg().getSigName()+"	\n";
				signalNames += "		wire : "+prmLstSignals.getPrmLstArrayDataOutWire().getSigName()+"	";
				return signalNames;
			}
		}
		else{
			if(defType.compareTo(defTypeField)==0){
				String signalType = (isReadOnlyPort) ? "		input : " : "	reg : ";
				return signalType+primitiveSignal.getSigName()+"	";
			}
			else{
				return "		reg : "+primitiveSignal.getSigName()+"	";
			}
		}
		return null;
	}

	public int getBramLatency(){

		int ret = cacheEnable ? cacheLatency : getPhaseParent().getParentClass().config.bramLatency;
		return ret;
	}

	public int getBramThroughput(){

		return getPhaseParent().getParentClass().config.bramThroughput;
	}
}












