package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.KeyWord;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.dfg.DFGraphMethodInv;
import net.njlab.dfg.DFGraphNode;
import net.njlab.dfg.DFGraphTypeCast;
import net.njlab.dfg.DFGraphUserDefinedOp;
import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpression;
import openjdk.com.sun.tools.javac.tree.JCTree.JCFieldAccess;
import openjdk.com.sun.tools.javac.tree.JCTree.JCIdent;
import openjdk.com.sun.tools.javac.tree.JCTree.JCMethodInvocation;

/**
 *  @author Keisuke Koike
 */
public class VerilogMethodInv extends VerilogExpression{

	JCMethodInvocation methodInv;
	public String defClassName;	//メソッドが定義されているクラス名
	public String objName;			//メソッドを呼び出すオブジェクト変数名
	public String methodName;		//メソッド名
	ArrayList<VerilogExpression> arguments = new ArrayList<VerilogExpression>();
	//VerilogMethod originalMethod;	//呼び出すメソッド
	static int methodInvTime;
	int methodInvId;	//各メソッド呼出し文ごとに付けられるID
	VerilogReg arbiter;	//配列の制御信号などの arbiter シグナル
	public boolean isThreadRun = false;	//Thread の run メソッドである
	public boolean isThreadJoin = false;	//Thread の join メソッドである
	public boolean haveArrayArg = false;

	public VerilogMethodInv(JCMethodInvocation methodInv, VerilogStatement statParent, VerilogExpression exprParent){
		this.methodInv = methodInv;
		this.statParent = statParent;
		this.exprParent = exprParent;
		methodInvId = methodInvTime++;
	}

	@Override
	public void buildExpression(){

		makeMethodInf();

		for(JCExpression arg : methodInv.getArguments()){	//引数

			VerilogExpression tmp = VerilogExpression.makeSubExpression(statParent, this, arg);
			if(tmp==null){
				buildSucceed = false;
				return;
			}

			tmp.buildExpression();
			arguments.add(tmp);
		}

		VerilogMethod originalMethod = getMethod();
		if(originalMethod!=null){
			if(!getMethod().convertedIntoIP)
				statParent.haveMethodInv = true;	//自クラスの IPコア化しないメソッド
		}
		else{
			statParent.haveMethodInv = true;	//他クラスのメソッド
		}
	}

	void makeMethodInf(){

		//this.fieldName.methodName()	  -> fieldName.methodName()
		//fieldName.methodName()          -> fieldName.methodName()
		//className.methodName()	×
		//this.methodName()				  -> this.methodName()
		//methodName()					  -> this.methodName()

		if(methodInv.getMethodSelect() instanceof JCIdent){	//メソッド呼び出しが methodName(...) になっている
			methodName = ((JCIdent)methodInv.getMethodSelect()).getName().toString();
			defClassName = statParent.getPhaseParent().getParentClass().className;	//定義されているのはこのクラスの中
			objName = "this";														//this.methodName(...) と書かれていたことにする
		}
		else if(methodInv.getMethodSelect() instanceof JCFieldAccess){

			String[] variableName_methodName = methodInv.getMethodSelect().toString().split("\\.");

			if(variableName_methodName.length>3){
				buildSucceed = false;
				dumpError();
			}
			else if(variableName_methodName.length==3){	//this.fieldName.methodName()
				if(variableName_methodName[0].compareTo("this")!=0){
					buildSucceed = false;
					dumpError();
				}
				else{
					objName = variableName_methodName[1];
					methodName = variableName_methodName[2];
					defClassName = findDefClassName();
					if(defClassName==null)
						dumpError();
				}
			}
			else if(variableName_methodName.length==2){
				objName = variableName_methodName[0];
				methodName = variableName_methodName[1];

				if(variableName_methodName[0].compareTo("this")==0)			//this.methodName
					defClassName = statParent.getPhaseParent().getParentClass().className;
				else														//fieldName.methodName
					defClassName = findDefClassName();
				if(defClassName==null)
					dumpError();
			}
		}

		//再帰呼び出しかオーバーロードしたメソッドの呼び出し
		if(methodName!=null)
			if(statParent.getPhaseParent().getParentMethod().methodName.compareTo(methodName)==0 && objName.compareTo("this")==0){
				CompileMsgs.edumpRecursiveCall(methodInv.toString());
				buildSucceed = false;
			}
	}

	private String findDefClassName(){

		ArrayList<VerilogVariableDecl> parentClassVariables = statParent.getPhaseParent().getParentClass().getClassVariables();

		for(int i = parentClassVariables.size()-1; i>=0; i--){
			if(parentClassVariables.get(i).name.compareTo(objName)==0 && //名前が一致してかつフィールド宣言されている変数
			   parentClassVariables.get(i).defType.compareTo(VerilogVariableDecl.defTypeField)==0){

				return parentClassVariables.get(i).type;	//変数の型はクラス名
			}
		}
		//メソッド呼び出しを行うオブジェクトが見つからなかった
		buildSucceed = false;
		return null;
	}

	private void dumpError(){

		CompileMsgs.edumpMethodCanBeCalled(methodInv.toString());
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		for(int i=0; i<arguments.size(); i++){
			ret |= arguments.get(i).existERR();
		}
		return ret;
	}

	public void dump(PrintWriter out, int offset){
		Dump.tprintln(out, offset, "<MethodInv>");
		Dump.tprintln(out, offset+1, "<defClassName>	"+defClassName+"	</defClassName>");
		Dump.tprintln(out, offset+1, "<objName>	"+objName+"	</objName>");
		Dump.tprintln(out, offset+1, "<methodName>	"+methodName+"	</methodName>\n");
		Dump.tprintln(out, offset+1, "<argment>");
		for(int i=0; i<arguments.size(); i++)
			arguments.get(i).dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</argment>");
		Dump.tprintln(out, offset, "</MethodInv>\n");
	}

	@Override
	public boolean checkAssignKind(){

		boolean ret = false;
		for(int i=0; i<arguments.size(); i++)
			ret |= isAssignKind(arguments.get(i));

		for(int i=0; i<arguments.size(); i++)
			ret |= arguments.get(i).checkAssignKind();

		return ret;
	}

	@Override
	public ArrayList<VerilogVariableDecl> registerUsedVariables(){
		int i;
		ArrayList<VerilogVariableDecl> retArray = new ArrayList<VerilogVariableDecl>();
		for(i=0; i<arguments.size(); i++){
			retArray.addAll(arguments.get(i).registerUsedVariables());
		}
		return retArray;
	}


	@Override
	public DFGraphNode makeDFG(){

		if(objName.compareTo("this")==0){	//自クラスのメソッドを呼び出す

			VerilogMethod method = getMethod();
			if(!methodExist(method))
				return null;

			checkArgArrayDescription(method);
			makeArbiterReg();
			return makeNodeWithCastCheck(method);
		}
		else{
			VerilogClass parentClass = statParent.getPhaseParent().getParentClass();
			VerilogClass objClass = parentClass.getObjName_vClass().get(objName);

			if(objClass!=null){
				for(VerilogMethod method : objClass.getMethods()){	//他クラスのメソッドを呼び出す

					if(!methodExist(method))
						return null;

					if(method.methodName.compareTo(methodName)==0){
						checkArgArrayDescription(method);
						makeArbiterReg();
						return makeNodeWithCastCheck(method);
					}
					else if(methodName.compareTo("start")==0 && arguments.size()==0 && method.isThreadRun){	//このメソッドの名前が start && startの引数が0個 && 呼び出し元オブジェクトが run() メソッドを持っている
						isThreadRun = true;
						return makeNodeWithCastCheck(method);
					}
					else if(methodName.compareTo("join")==0 && arguments.size()==0 && method.getParentClass().extendsThread){	//このメソッドの名前が join && joinの引数が0個 && 呼び出し元オブジェクトがThread を継承している
						isThreadJoin = true;
						DFGraphNode[] argNodes = new DFGraphNode[0];
						return new DFGraphMethodInv(null, this, argNodes, DFGraphNode.destTypeVoid);
					}
				}
			}
		}

		CompileMsgs.edumpMethodNotFound(methodInv.toString());
		buildSucceed = false;
		return null;
	}

	private boolean methodExist(VerilogMethod method){

		if(method==null){
			CompileMsgs.edumpMethodNotFound(methodInv.toString());
			buildSucceed = false;
			return false;
		}
		return true;
	}

	private DFGraphMethodInv makeNodeWithCastCheck(VerilogMethod method){	//引数の変数をキャストする必要があるかチェック

		DFGraphNode[] argNodes = new DFGraphNode[method.vdecls.size()];
		castCheck(method, argNodes);

		DFGraphMethodInv methodInvNode;
		if(method.convertedIntoIP)
			methodInvNode = new DFGraphUserDefinedOp(method, this, argNodes, DFGraphNode.getDestType(method.retType));
		else
			methodInvNode = new DFGraphMethodInv(method, this, argNodes, DFGraphNode.getDestType(method.retType));

		return methodInvNode;
	}

	private void castCheck(VerilogMethod method, DFGraphNode[] argNodes) {

		for(int j=0; j<method.vdecls.size(); j++){

			DFGraphNode argNode = arguments.get(j).makeDFG();
			int argType = DFGraphNode.getDestType(method.vdecls.get(j).type);

			if(argType == argNode.destType){
				argNodes[j] = argNode;
			}
			else if(argType > argNode.destType){ //代入元変数側が小さい場合は，明示的キャストが不要 -> キャストが必要か調べる

				DFGraphTypeCast castNode = null;
				if(argType==DFGraphNode.destTypeFloating)
					castNode = new DFGraphTypeCast(argNode, method.vdecls.get(j).type);

				else if(argType==DFGraphNode.destTypeLong)
					castNode = new DFGraphTypeCast(argNode, method.vdecls.get(j).type);

				argNodes[j] = castNode;
			}
			else{
				System.out.println("DEBUG:	MethodInv makeDFG error");
			}
		}
	}

	private void makeArbiterReg(){

		if(haveArrayArg==false)
			return;

		arbiter = new VerilogReg(KeyWord.K_sys_+methodName+KeyWord.K_arbiter+methodInvId, 1, VerilogSignal.unsigned);
		VerilogClass parentClass = statParent.getPhaseParent().getParentClass();
		parentClass.module.addRegister(arbiter);
		parentClass.addArbiterRegister(arbiter);
	}

	/**
	 * メソッド呼び出しの配列引数の書き方チェック
	 * */
	private void checkArgArrayDescription(VerilogMethod method){

		for(int i=0; i<method.vdecls.size(); ++i){

			if(method.vdecls.get(i).isArray){

				if(!(arguments.get(i) instanceof VerilogIdent) && !(arguments.get(i) instanceof VerilogFieldAccess)){
					buildSucceed = false;
					CompileMsgs.edumpArratArgFormat(methodInv.toString());
				}
				else if(arguments.get(i) instanceof VerilogFieldAccess){

					if( ((VerilogFieldAccess)arguments.get(i)).objName != null ){
						buildSucceed = false;
						CompileMsgs.edumpObjHoldArray(methodInv.toString());
					}
				}
				haveArrayArg = true;
				checkBramCacheEnable(arguments.get(i), method.vdecls.get(i));
			}
		}

		//同じ配列が渡されていないかチェック
		int numArg = method.vdecls.size();
		for(int i=0; i<numArg; ++i){
			for(int j=i+1; j<numArg; ++j){

				if(method.vdecls.get(i).isArray && method.vdecls.get(j).isArray){	//比較する引数がどちらも配列型
					if(isSameArray(arguments.get(i), arguments.get(j))){
						buildSucceed = false;
						CompileMsgs.edumpSameArrayInArgs(methodInv.toString());
					}
				}
			}
		}
	}

	private boolean isSameArray(VerilogExpression expA, VerilogExpression expB){

		if( expA instanceof VerilogIdent && expB instanceof VerilogIdent)
			if( ((VerilogIdent)expA).variable==((VerilogIdent)expB).variable )
				return true;

		if( expA instanceof VerilogFieldAccess && expB instanceof VerilogFieldAccess)
			if( ((VerilogFieldAccess)expA).field == ((VerilogFieldAccess)expB).field )
				return true;

		if( expA instanceof VerilogIdent && expB instanceof VerilogFieldAccess)
			if( ((VerilogIdent)expA).variable == ((VerilogFieldAccess)expB).field )
				return true;

		if( expA instanceof VerilogFieldAccess && expB instanceof VerilogIdent)
			if( ((VerilogFieldAccess)expA).field == ((VerilogIdent)expB).variable)
				return true;

		return false;
	}

	/**
	 * 仮引数配列と実引数配列のレイテンシが違う場合警告を表示<br>
	 * 実引数が cacheEnable で仮引数が キャッシュ向こうの場合, 警告を表示
	 * */
	private void checkBramCacheEnable(VerilogExpression srcExpr, VerilogVariableDecl destVar){

		VerilogVariableDecl srcVar = null;

		if(srcExpr instanceof VerilogFieldAccess)
			srcVar = ((VerilogFieldAccess)srcExpr).field;

		else if(srcExpr instanceof VerilogIdent)
			srcVar = ((VerilogIdent)srcExpr).variable;

		if(srcVar==null || destVar==null)
			return;

		if(srcVar.isArray && destVar.isArray){
			if(srcVar.getBramLatency() != destVar.getBramLatency()){
				CompileMsgs.wdumpDisagreeLatency(methodInv.toString());
				System.out.println("    	"+srcVar.getName()+" (latency = "+srcVar.getBramLatency()+")	"+destVar.getName()+" (latency = "+destVar.getBramLatency()+")\n");
			}
		}

		if(!srcVar.cacheEnable && destVar.cacheEnable){
			CompileMsgs.wdumpDisagreeCacheEnable(methodInv.toString());
			System.out.println("    	"+srcVar.getName()+" (cache disable)"+"	"+destVar.getName()+" (cache enable)\n");
		}
	}

	static public void resetCalledTimes(int num){
		methodInvTime = num;
	}

	public VerilogReg getArbiterReg(){
		return arbiter;
	}

	public VerilogMethod getMethod(){
		return this.statParent.getPhaseParent().getParentClass().getMethod(methodName);
	}
}





