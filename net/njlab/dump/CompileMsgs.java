package net.njlab.dump;

import openjdk.com.sun.tools.javac.tree.JCTree.JCArrayAccess;
import openjdk.com.sun.tools.javac.tree.JCTree.JCNewArray;

/**
 * @author koike
 * */
public class CompileMsgs {

	public static final String Japanese = "Japanese";
	public static final String English = "English";
	private static String language = English;

	public static void setLang(String lang){

		if(lang==null)
			return;

		if(lang.compareTo(Japanese)==0 || lang.compareTo("Ja")==0 || lang.compareTo("JA")==0)
			language = Japanese;
		else
			language = English;
	}


	public static void edumpFailedToMakeFile(String fileName, Exception e){

		System.out.println(e);
		System.out.println("ERR:	Failed to make "+fileName+"\n");
	}

	public static void mdumpMakeDPRAM(){

		System.out.println("MSG:	Dual port ram file is created.");
	}

	//============================================================Config============================================================
	public static void wdumpConfigFileNotFound(String className){

		if(language.compareTo(English)==0)
			System.out.println("WNG:	The config file of "+className+" is not found.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	"+className+" のコンフィグファイルが見つかりません.");
	}

	public static void wdumpTagNotRead(String tagName, String defaultValue){

		if(language.compareTo(English)==0)
			System.out.println("WNG:	<"+tagName+"> in the config file cant be read.	<"+tagName+"> is regarded as "+defaultValue+".");

		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	コンフィグファイルの <"+tagName+"> が読み込めません.  "+defaultValue+" とします.");
	}

	public static void wdumpMinOrMore(String tagName, int min){

		if(language.compareTo(English)==0)
			System.out.println("WNG:	<"+tagName+"> in the config file can be set to only "+min+" or more.	<"+tagName+"> is regarded as "+min+".");

		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	コンフィグファイルの <"+tagName+"> は "+min+" 以上の数しか指定できません.	"+min+" とします.");

	}

	public static void wdumpBitWidthSpec(){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	Set <*BitWidth> in the config file to the Java-defined bit width or less.");
			System.out.println("    	The Java-defined bit width are used.");
		}
		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	コンフィグファイルの各整数型は Java で定義されたビット幅以下で指定してください.	Java での定義ビット幅を使用します.");
	}

	public static void wdumpBitWidthSize(){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	Set <*BitWidth> in the config file to be  byte < short < int < long.");
			System.out.println("    	The Java-defined bit width are used.");
		}
		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	各整数型は byte < short < int < long となるように指定してください.	Java での定義ビット幅を使用します.");
	}

	//============================================================VerilogArrayAccess============================================================
	public static void edumpArrayDeclare(String arrayAccess){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Declare arrays as parameter list or field variables and Initialize field arrays by using \"new\".	"+arrayAccess);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	配列はフィールド変数かパラメータリストとして宣言してください. フィールド変数の配列は new で初期化してください.	"+arrayAccess);
	}


	//============================================================VerilogVariableDecl============================================================
	public static void edumpUseDollar(String varName){

		if(language.compareTo(English)==0){
			System.out.println("ERR:	Dont use '$' at Beginning and end of the variable.	"+varName);
			System.out.println("    	A foreach statement may be used.");
		}
		else if(language.compareTo(Japanese)==0){
			System.out.println("ERR:	変数の先頭と末尾に'$'は使えません.	"+varName);
			System.out.println("    	拡張for文や assertion を使用している可能性があります.");
		}
	}

	public static void edumpArrayMustBePrimitive(String varName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Only arrays of primitive type are supported.	"+varName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	配列変数の型はプリミティブ型のみ対応しています.	"+varName);
	}

	public static void edumpSetArrayToFinal(String varName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Declare arrays with \"final\".	"+varName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	配列変数は final を付けて宣言してください.	"+varName);
	}

	public static void edumpDeclareClassVarAsField(String varName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Declare class type variables as field variables.	"+varName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	クラス型の変数はフィールド変数として宣言してください.	"+varName);
	}

	public static void edumpSetClassVarToFinalAndNew(String varName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Declare class type variables with \"final\" and Initialize them by using new.	"+varName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	クラス型変数は final を付けて宣言し, new で初期化してください.	"+varName);
	}

	public static void edumpOneDimArray(String varName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	In parameter list, only one-dimensional arrays are supported.	"+varName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	パラメータリストの配列変数は1次元にしてください.	"+varName);
	}

	public static void edumpInitLiteral(String varName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Initialize field variables with number literal.	"+varName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	フィールドの初期化は数値リテラルを使用してください.	"+varName);
	}

	public static void edumpPutPortAnnotation(String varName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Dont put @JRThrashExtToTop and @JRThrashReadOnlyPort on the same variable.	"+varName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	@JRThrashExtToTop と @JRThrashReadOnlyPort は同じ変数に付けられません.	"+varName);
	}

	public static void edumpPutPortAnotOnPrivate(String varName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Dont put @JRThrashExtToTop or @JRThrashReadOnlyPort on private variables.	"+varName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	@JRThrashExtToTop , @JRThrashReadOnlyPort は private 変数につけられません.	"+varName);
	}

	public static void edumpWriteReadOnlyPort(String vdecl){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Dont write variables with @JRThrashReadOnlyPort.\n"+vdecl);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	@JRThrashReadOnlyPort を付けた変数には書き込めません.\n"+vdecl);
	}

	public static void edumpReadOnlyAnot(String vdecl){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	@JRThrashReadOnlyPort can be attached to only field variables of primitive.\n"+vdecl);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	@JRThrashReadOnlyPort はプリミティブ型フィールド変数にしか付けられません.\n"+vdecl);
	}

	public static void edumpExtToTopAnot(String vdecl){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	@JRThrashExtToTop can be attached to only field variables of primitive or array.\n"+vdecl);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	@JRThrashExtToTop は 配列またはプリミティブ型のフィールド変数にしか付けられません.\n"+vdecl);
	}

	public static void edumpFwdInvalidateAnot(String vdecl){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	@JRThrashExtToTop can be attached to only field or local primitive variables.\n"+vdecl);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	@JRThrashForwardingInvalidate はプリミティブ型のフィールド変数かローカル変数にしか付けられません.\n"+vdecl);
	}

	public static void edumpCacheEnLatency(String vdecl){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Set \"cacheLantency\" of @JRThrashCacheEnable to positive number.\n"+vdecl);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	@JRThrashCacheEnable の cacheLatency には, 正の整数を記入してください.\n"+vdecl);
	}

	public static void edumpCacheEnAnot(String vdecl){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	@JRThrashCacheEnable can be attached to arrays in parameter list.\n"+vdecl);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	@JRThrashCacheEnable はパラメータリストの配列変数にのみ付けられます.\n"+vdecl);
	}

	public static void edumpCacheEnableClockEnable(){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	As @JRThrashCacheEnable is used, set <clockEnable> in the config file to true.\n");

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	cacheEnable アノテーションを利用する場合, コンフィグファイルの clockEnable を有効にしてください.");
	}

	public static void wdumpChangeFloatIntoDouble(String parentName, String name){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	The floating number in this class is processed as double.");
			System.out.println("    	The type of \""+name+"\" in \""+parentName+"\" is changed into double.");
		}
		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	このクラスの浮動小数点数は double 型で計算されます.	"+parentName+" の "+name+" の型は float から double に変更されます.");
	}

	public static void wdumpChangeDoubleIntoFloat(String parentName, String name){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	The floating number in this class is processed as float.");
			System.out.println("    	The type of \""+name+"\" in \""+parentName+"\" is changed into float.");
		}
		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	このクラスの浮動小数点数は float 型で計算されます.	"+parentName+" の "+name+" の型は double から float に変更されます.");
	}

	public static void edumpAssignKind(String expr){

		if(language.compareTo(English)==0){
			System.out.println("ERR:	Dont use \"++\", \"--\", \"=\" and \"op=\" on right hand sides of assign expressions.	"+expr);
			System.out.println("    	Write method invocation such as \"variable = methodName(...)\" .\n");
		}
		else if(language.compareTo(Japanese)==0){
			System.out.println("ERR:	++, --, =, op=  は代入式の右辺で使えません	"+expr);
			System.out.println("    	また, メソッド呼び出しは   variable = methodName(...) として使用してください.\n");
		}
	}

	//============================================================VerilogForLoop============================================================
	public static void wdumpUnrollTypeCheck(){

		if(language.compareTo(English)==0){

			System.out.println("WNG:	The value of \"unrollType\" in @JRThrashUnroll is invalid.");
			System.out.println("    	Only the following values are usable.");
			System.out.println("    	JRThrashUnroll.modyfyLoopVar");
			System.out.println("    	JRThrashUnroll.modifyLoopVar_IndependentIterator");
			System.out.println("    	JRThrashUnroll.simple");
			System.out.println("    	JRThrashUnroll.copyLoopVar");
		}
		else if(language.compareTo(Japanese)==0){

			System.out.println("WNG:	@JRThrashUnroll の unrollType が不正な値です.");
			System.out.println("    	JRThrashUnroll.modyfyLoopVar");
			System.out.println("    	JRThrashUnroll.modifyLoopVar_IndependentIterator");
			System.out.println("    	JRThrashUnroll.simple");
			System.out.println("    	JRThrashUnroll.copyLoopVar のいずれかにしてください.");
		}
		System.out.println("");
	}

	public static void wdumpForInitRequired(){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	As \"unrollType\" in @JRThrashUnroll is \"copyLoopVar\", for-loop initialization is required.");
		}
		else if(language.compareTo(Japanese)==0){
			System.out.println("WNG:	unrollType が copyLoopVar の場合, for文の初期化部が必要です.");
		}
		System.out.println("");
	}

	public static void wdumpForUpdateAsModifyLoopvar(){

		if(language.compareTo(English)==0){

			System.out.println("WNG:	As \"unrollType\" in @JRThrashUnroll is \"modifyLoopVar\" or \"modifyLoopVar_IndependentIterator\", ");
			System.out.println("    	Dont write plural expressions on for-loop update and Write for-loop update in the following format.");
			System.out.println("    	loopVariable(++/--), loopVariable (+/-)= expression,  loopVariable = loopVariable(+/-)expressionl");
		}
		else if(language.compareTo(Japanese)==0){

			System.out.println("WNG:	unrollType が modifyLoopVar か modifyLoopVar_IndependentIterator の場合");
			System.out.println("    	展開するループの更新部に複数の式は記述できません.");
			System.out.println("    	また, 更新部は loopVariable(++/--), loopVariable (+/-)= expression,  loopVariable = loopVariable(+/-)expressionl の形式で記述してください.");
		}
		System.out.println("");
	}

	public static void wdumpForUpdateAsSimpleOrCopy(){

		if(language.compareTo(English)==0){

			System.out.println("WNG:	As \"unrollType\" in @JRThrashUnroll is \"simple\" or \"copyVariable\", ");
			System.out.println("    	Dont write method invocation on for-loop update.");
		}
		else if(language.compareTo(Japanese)==0){

			System.out.println("WNG:	unrollType が simple か copyVariable の場合");
			System.out.println("    	展開するループの更新部にメソッド呼び出しを記述しないでください.");
		}
		System.out.println("");
	}

	public static void wdumpForBodyCantUnroll(){

		if(language.compareTo(English)==0){

			System.out.println("WNG:	This for-loop cant be unrolled, ");
			System.out.println("    	Void for-loops or for-loops including sub block, break, continue, method invocation on the inside cant be unrolled.");
		}
		else if(language.compareTo(Japanese)==0){
			System.out.println("WNG:	このループは展開できません.");
			System.out.println("    	空のfor文や, 内部にサブブロック, break, continue, メソッド呼び出しを持つfor文は展開できません.");
		}
		System.out.println("");
	}

	//============================================================VerilogStatementsPhase============================================================
	public static void edumpUnusable(String unusable){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	"+unusable+" are unusable.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	"+unusable+" は使用できません.");
	}

	public static void wdumpCatchNotExecuted(){

		if(language.compareTo(English)==0)
			System.out.println("WNG:	Catch Blocks are not executed.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	catch ブロックの内容は実行されません.");
	}

	//============================================================VerilogBinary============================================================
	public static void wdumpFloatingModulo(String expr){

		if(language.compareTo(English)==0)
			System.out.println("WNG:	Floating \"%\" operations are not supported.  (replaced with \"/\")    "+expr);

		else if(language.compareTo(Japanese)==0)
			System.out.println("MSG:	浮動小数点型の '%' 演算はサポートしていません. '/' に置き換わります.	"+expr);
	}


	//============================================================VerilogCase============================================================
	public static void edumpCaseCondLiteral(String expr){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Write an integer literal in a Case conditional part.	"+expr);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	case 文の条件部は整数値で記述してください.	"+expr);
	}

	//============================================================VerilogClass============================================================
	public static void edumpOverload(String methodName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Dont overload methods.	"+methodName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	関数をオーバーロードしないでください.	"+methodName);
	}

	public static void wdumpConsistentClockEnable(){

		if(language.compareTo(English)==0)
			System.out.println("WNG:	Provide consistent <haveClockEnablePort> in config files for all Classes.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	コンフィグファイルの <haveClockEnablePort> が有効なクラスと無効なクラスがあります.	統一してください.");
	}

	//============================================================VerilogExpression============================================================
	public static void edumpDontNewClass(){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Dont instantiate classes in methods.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	メソッド内部でクラスのインスタンス化はできません.");
	}

	public static void edumpDontNewArray(){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Dont instantiate arrays in methods.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	メソッド内部で配列のインスタンス化はできません.");
	}


	//============================================================VerilogFieldAccess============================================================

	public static void edumpAccessibleField(String fieldAccess){


		if(language.compareTo(English)==0){
			System.out.println("ERR:	The field variables that can be accessed are the following declared in own class.	"+fieldAccess);
			System.out.println("ERR:	1.primitive ariables,  2.arrays,  3.arrays that objects hold (objName.arrayName[n])\n");
		}
		else if(language.compareTo(Japanese)==0){
			System.out.println("ERR:	アクセスできるフィールド変数は, 自クラスに宣言した以下のものだけです.	"+fieldAccess);
			System.out.println("    	1.プリミティブ変数,  2.配列変数,  3.オブジェクトの配列変数\n");
		}
	}

	public static void edumpObjNotFound(String fieldAccess){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	The Object is not found.	"+fieldAccess);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	オブジェクトが見つかりません.	"+fieldAccess);
	}

	public static void edumpAccessOnlyObjArray(String fieldAccess){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Object-hold field vairables that can be accessed is array type.	"+fieldAccess);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	オブジェクトのフィールドは, 配列型の変数しかアクセスできません.	"+fieldAccess);
	}

	//============================================================VerilogMethod============================================================
	public static void wdumpChangeFloatIntoDouble(String methodName){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	The floating number in this class is processed as double.");
			System.out.println("    	The return type of \""+methodName+"\" is changed into double.");
		}
		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	このクラスの浮動小数点数は double 型で計算されます.	"+methodName+"の返り値は float から double に変更されます.");
	}

	public static void wdumpChangeDoubleIntoFloat(String methodName){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	The floating number in this class is processed as float.");
			System.out.println("    	The return type of \""+methodName+"\" is changed into float.");
		}
		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	このクラスの浮動小数点数は float 型で計算されます.	"+methodName+"の返り値は double から float に変更されます.");
	}


	public static void edumpRetTypeMustBePrimitive(String methodName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	The Return type must be primitive.	"+methodName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	メソッドの戻り値はプリミティブ型にしてください.	"+methodName);
	}

	public static void edumpConvAnotMethodNotPrimitive(String methodName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Methods with \"@JRThrashConvertedIntoIPcore\" must be private methods.	"+methodName);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	@JRThrashConvertedIntoIPcore を指定するメソッドは, private で宣言してください.	"+methodName);
	}

	public static void wdumpBitWidthSpecInput(String methodName){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	The number of argments is not agree with one of \"inputBitWidth\" in @JRThrashPortBitWidthSpecify.");
			System.out.println("    	@JRThrashPortBitWidthSpecify is ignored.	"+methodName);
		}
		else if(language.compareTo(Japanese)==0){
			System.out.println("WNG:	@JRThrashPortBitWidthSpecify で指定された inputBitWidth の数とメソッドの引数の個数が一致しません.");
			System.out.println("    	@JRThrashPortBitWidthSpecifyは無視されます.	"+methodName);
		}
	}

	public static void wdumpBitWidthSpecInvalid(String methodName){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	The values of \"inputBitWidth\" in @JRThrashPortBitWidthSpecify is invalid.");
			System.out.println("    	@JRThrashPortBitWidthSpecify is ignored.	"+methodName);
		}
		else if(language.compareTo(Japanese)==0){
			System.out.println("WNG:	@JRThrashPortBitWidthSpecify で指定された inputBitWidth が無効な値をとりました.");
			System.out.println("    	このアノテーションは無視されます.	"+methodName);
		}
	}

	public static void edumpBitWidthSpecInputArray(String methodName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	The Argments with @JRThrashPortBitWidthSpecify must be primitive type.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	@JRThrashPortBitWidthSpecify が指定されたメソッドの引数は, プリミティブ型変数のみ指定できます.	"+methodName+"\n");
	}

	public static void edumpLoopVarMustBeLocal(String loopVar){

		if(language.compareTo(English)==0){
			System.out.println("ERR:	Unrolled loop variables must be local variables.");
			System.out.println("    	Dont declare field variables that are same name as unrolled loop variables.	"+loopVar+"\n");
		}
		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	ループ展開変数はローカル変数でなければりません. また同名の変数をフィールドに記述できません.	"+loopVar+"\n");

	}

	public static void edumpLoopUnrollNum(String methodName){

		if(language.compareTo(English)==0){
			System.out.println("ERR:	Set \"unrollNum\" in @JRThrashUnroll to a positive number.");
			System.out.println("    	@JRThrashUnroll is ignored.	"+methodName);
		}
		else if(language.compareTo(Japanese)==0){
			System.out.println("WNG:	@JRThrashUnroll の unrollNum には数字を記述してください.");
			System.out.println("    	このアノテーションは無視されます.	"+methodName);
		}
	}

	//============================================================VerilogMethodInv============================================================

	public static void edumpRecursiveCall(String methodInv){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Dont call recursive methods and Overloaded methods.	"+methodInv);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	再帰呼び出しはできません.	また, オーバーロードされた関数も呼び出せません.	"+methodInv);
	}


	public static void edumpMethodCanBeCalled(String methodInv){

		if(language.compareTo(English)==0){
			System.out.println("ERR:	You can call only the methods of own class or the object has.	"+methodInv);
			System.out.println("    	Only the following forms are usable.");
			System.out.println("    	(1) this.fieldName.methodName()");
			System.out.println("    	(2) fieldName.methodName()");
			System.out.println("    	(3) this.methodName()");
			System.out.println("    	(4) methodName()\n");
		}
		else if(language.compareTo(Japanese)==0){
			System.out.println("ERR:	呼び出せるメソッドは自クラスのメソッドかフィールドに宣言したオブジェクトのメソッドだけです.	"+methodInv);
			System.out.println("    	(1) this.fieldName.methodName()");
			System.out.println("    	(2) fieldName.methodName()");
			System.out.println("    	(3) this.methodName()");
			System.out.println("    	(4) methodName()	のいずれかの形式で書いてください\n");
		}
	}

	public static void edumpMethodNotFound(String methodInv){

		if(language.compareTo(English)==0){
			System.out.println("ERR:	The callee is not found.	"+methodInv);
			System.out.println("    	In case of using the \"start\" method of the Thread，implement \"run\" method in the class that inherits Thread.");
			System.out.println("    	You can call only the methods of own class or objects have.");
		}
		else if(language.compareTo(Japanese)==0){
			System.out.println("ERR:	呼び出すメソッドが見つかりません.	"+methodInv);
			System.out.println("    	スレッドの start() メソッドを使う場合は，Thread 継承クラスに run() を実装してください.");
			System.out.println("    	呼び出せるメソッドは自クラスのメソッドかフィールドに宣言したオブジェクトのメソッドだけです.");
		}
	}


	public static void edumpArratArgFormat(String methodInv){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Describe arrays directly in array arguments.	"+methodInv);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	配列引数には，配列変数を直接記述して下さい.	"+methodInv);
	}

	public static void edumpObjHoldArray(String methodInv){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Dont Describe arrays that objects have in arguments.	"+methodInv);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	オブジェクトのフィールド配列をメソッドの引数に指定できません.	"+methodInv);
	}

	public static void edumpSameArrayInArgs(String methodInv){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Dont Describe the identical array twice in the arguments of the method.	"+methodInv);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	配列引数に，同じ配列を2つ以上渡さないで下さい.	"+methodInv);
	}

	public static void wdumpDisagreeLatency(String methodInv){

		if(language.compareTo(English)==0)
			System.out.println("WNG:	The latency of the array parameter is not agree with the array argment.	"+methodInv);

		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	配列型の仮引数と実引数でレイテンシが一致していません.	"+methodInv);
	}


	public static void wdumpDisagreeCacheEnable(String methodInv){

		if(language.compareTo(English)==0)
			System.out.println("WNG:	The parameter has @JRThrashCacheEnable, but the argment dont.	"+methodInv);

		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	仮引数に @JRThrashCacheEnable が付いていますが, 実引数には付いていません.	"+methodInv);
	}

	//============================================================VerilogNewArray============================================================

	public static void edumpInitArray(String newArray){

		if(language.compareTo(English)==0){
			System.out.println("ERR:	Initialize array in the following format.	"+newArray);
			System.out.println("    	new type[elementNum][elementNum]...	");
		}
		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	配列の初期化は new type[elementNum][elementNum]... としてください.	"+newArray);
	}

	public static void edumpInitArrayWithInt(String newArray){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Initialize the number of array elements with integer.	"+newArray);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	配列の要素数は整数値で指定してください.	"+newArray);
	}

	//============================================================VerilogTypeCast============================================================

	public static void wdumpCastChangeFloatIntoDouble(String expr){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	The floating number in this class is processed as double.");
			System.out.println("    	The cast in \""+expr+"\" is changed into double.");
		}
		else if(language.compareTo(Japanese)==0)
			System.out.println("MSG:	このクラスの浮動小数点数は double 型で計算されます.	"+expr+"	のキャストは float から double に変更されます.");
	}

	public static void wdumpCastChangeDoubleIntoFloat(String expr){

		if(language.compareTo(English)==0){
			System.out.println("WNG:	The floating number in this class is processed as float.");
			System.out.println("    	The cast in \""+expr+"\" is changed into float.");
		}
		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	このクラスの浮動小数点数は float 型で計算されます.	"+expr+"	のキャストは double から float に変更されます.");
	}

	public static void edumpCastMustBePrimitive(String expr){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Casting types must be primitive.	"+expr);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	キャストする型はプリミティブ型にしてください	"+expr);
	}


	//============================================================moduleTreeNode============================================================
	public static void edumpRecursiveDecl(String className, String objName){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	The \""+objName+"\" in the \""+className+"\" is declared recursively.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	"+className+" の "+objName+" は再帰的に宣言されています.");
	}


	//============================================================moduleTreeNode============================================================
	public static void edumpNoTopModule(){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Top modules are missing.	There is a possibility that the objects are declared recursively.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	トップモジュールが見当たりません.	オブジェクトを再帰的に宣言している可能性があります.");
	}

	public static void edumpSamaNameClass(String className){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	The class of the same name is found.	"+className);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	同名のクラスがあります.	"+className);
	}

	public static void edumpClassDefNotFound(String className){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	The definition of "+className+" is not found.	"+className);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	"+className+" の定義が見つかりません.");
	}


	//============================================================VerilogLiteral============================================================
	public static void edumpNotSupportedLiteral(String literal){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	Only the literals of \"integer\", \"single/double floating number\" and \"true/false\" are supported.	"+literal);

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	リテラルは, 整数, 単・倍精度小数, true・false にのみ対応しています.	"+literal);
	}

	//============================================================VerilogIdent============================================================
	public static void edumpIdentNotFound(String ident, String className){

		if(language.compareTo(English)==0)
			System.out.println("ERR:	As \""+ident+"\" is not in \""+className+"\" , you are unable to acceess it.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("ERR:	"+ident+" は "+className+" の変数ではないのでアクセスできません.");
	}


	//============================================================DFGraphBinary============================================================
	public static void edumpOverShift(){

		if(language.compareTo(English)==0)
			System.out.println("WNG:	Shifting over the variable bit width, the result of hardware dont consistent with one of Java.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	変数のビット数以上のシフトをしています.	Java の実行結果と異なる可能性があります.");
	}

	public static void edumpMinusShift(){

		if(language.compareTo(English)==0)
			System.out.println("WNG:	Shifting by the negative number, the result of hardware dont consistent with one of Java.");

		else if(language.compareTo(Japanese)==0)
			System.out.println("WNG:	負の数のシフトをしています.	Java の実行結果と異なる可能性があります.");
	}
}




















