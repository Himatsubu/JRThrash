package net.njlab.dfg;
import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.TmpSignals;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;
import net.njlab.model.VerilogVariableDecl;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public abstract class DFGraphNode implements Cloneable, Comparable<DFGraphNode> {

	public static final int destTypeInt = 0;
	public static final int destTypeLong = destTypeInt+1;
	public static final int destTypeFloating = destTypeLong+1;
	public static final int destTypeBoolean = -1;
	public static final int destTypeVoid = -2;

	abstract public void replaceSrcNode(DFGraphNode popNode, DFGraphNode pushNode);//popNode がsrcノードにあれば，pushNodeと置き換える
	abstract public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag);
	abstract public void constantFolding(boolean[] optContinueFlag, Config config);
	abstract public void constantFoldingForBinarySequence(boolean[] foldingHppend);
	abstract public void addStatementNode(DFGraphManager parentManager, ArrayList<DFGraphNode> statementNode);//DFGraphManager と その statementNode にノードを登録
	abstract public int countNodeNum();
	//abstract public void makeAlways(ArrayList<VerilogNoneBlockAssign> startStep, ArrayList<VerilogNoneBlockAssign> endStep);
	abstract public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID);
	abstract public void computePriority(int minCntlStp, Config config);
	abstract public int getAssignedToNewRegStep();	//一時レジスタのデータが不要になるステップを調べる
	abstract protected boolean destSignalIsNotSaved();	//このノードの出力が，次のクロックには変わる可能性がある -> true （IPコアを用いてかつ，その出力をレジスタに納めていない）
	public DFGraphManager parentManager;

	protected ArrayList<DFGraphNode> destNodes = new ArrayList<DFGraphNode>(); //このノードをsrcとするノード.  後のグラフ結合に備えて配列で宣言
	protected VerilogSignal destSignal;
	public int destType = -10;
	private DFGraphNode originalNode;	//このノードがクローンの場合, コピー元のノードを指す

	//スケジューリング用変数
	public static final int notAssigned = 0;	//ステップへの割り当て未完
	public static final int waiting = 1;	//ステップへの割り当て待ち
	public static final int finished = 2;	//ステップへの割り当て完了
	public boolean destTypeIsReg = false;	//計算結果を一時レジスタに格納する-> true,  ワイヤに格納する -> false
	int assignState = notAssigned;
	int priority = 0;	//リストスケジューリングの優先度
	public int startStep=-1, endStep=-1;	//開始ステップと終了ステップ
	public int bornedStep=-1, diedStep=-1;	//このノードの結果を格納する一時レジスタの生存時間		初期値は絶対負の数
	protected int tmpRegisterID = -1;	//一時レジスタのID
	protected int minCntlStpFromThisNode;	//このノードがスタートしてからステージが終わるまでの最小ステップ数  (最小ステップ数 == 高スループットな演算IPが十分ある場合のステップ数)
	protected int minNodeOperatingStep;	//このノードを処理するのにかかる最小ステップ数 ( 最小 -> VeriableAccess で フォワーディングが成功した場合 )
	protected int fastestStepForAlap;	//ALAP で割り当てられる最速のステップ -> ステージの minCriticalPath - minCntlStpFromThisNode
	protected int componentSigniture = 0;			//共通のハードウェアコンポーネント(乗算IP等)を持つ場合, 同一の値を持つ

	//スケジューリング用関数
	abstract public void assignControlStep(int controlStep, SchedulingListSet listSet);

	public ArrayList<DFGraphNode> getDestNodes(){
		return destNodes;
	}

	public void addDestNode(DFGraphNode destNode){
		destNodes.add(destNode);
	}

	public void replaceNode(DFGraphNode pushNode){

		pushNode.destNodes.clear();

		if(this instanceof DFGraphVariableAccess){

			if(((DFGraphVariableAccess)this).isReadNode()==false)
				System.out.println("DEBUG:	error replaceNode	"+((DFGraphVariableAccess)this).getVariableDecl().getName());	//ライトノードが 置き換わるのは、おかしい

			for(DFGraphVariableAccess nextVar : ((DFGraphVariableAccess)this).nextVariable){
				nextVar.previousReadVariables.remove(this);
			}

			if(((DFGraphVariableAccess)this).previousWriteVariable!=null){
				((DFGraphVariableAccess)this).previousWriteVariable.nextVariable.remove(this);
			}
		}

		if(destNodes.size()==0)
			parentManager.setRootNode(pushNode);

		for(int i=0; i<destNodes.size(); i++){
			destNodes.get(i).replaceSrcNode(this, pushNode);
		}
		this.destNodes.clear();
		this.destNodes = null;	//エラーチェック用
	}

	public VerilogSignal getDestSignal(){
		return destSignal;
	}

	public void replaceDestSignal(VerilogSignal newSignal){
		destSignal = newSignal;
	}

	public int getPriority(){
		return priority;
	}

	public static int getDestType(String type){

		int retType=0;
		if(type.compareTo(VerilogVariableDecl.byteType)==0  || type.compareTo(VerilogVariableDecl.shortType)==0 ||
		   type.compareTo(VerilogVariableDecl.charType)==0  || type.compareTo(VerilogVariableDecl.intType)==0 ){
			retType = destTypeInt;
		}
		else if(type.compareTo(VerilogVariableDecl.longType)==0){
			retType = destTypeLong;
		}
		else if(type.compareTo(VerilogVariableDecl.floatType)==0 || type.compareTo(VerilogVariableDecl.doubleType)==0){
			retType = destTypeFloating;
		}
		else if(type.compareTo(VerilogVariableDecl.booleanType)==0){
			retType = destTypeBoolean;
		}
		else if(type.compareTo("void")==0){
			retType = destTypeVoid;
		}
		else{
			retType = Integer.MAX_VALUE;	//error
		}
		return retType;
	}

	public String getDestTypeString(Config config){

		String ret = null;
		if(destType==destTypeInt){
			ret = VerilogVariableDecl.intType;
		}
		else if(destType==destTypeFloating){
			if(config.floatingType == Config.singleType)
				ret = VerilogVariableDecl.floatType;
			else
				ret = VerilogVariableDecl.doubleType;
		}
		else if(destType==destTypeLong){
			ret = VerilogVariableDecl.longType;
		}
		else if(destType==destTypeVoid){
			ret = "void";
		}
		else if(destType==destTypeBoolean){
			ret = VerilogVariableDecl.booleanType;
		}
		else{
			System.out.println("DEBUG:	error   DFGraphNode  getDestTypeString");
		}
		return ret;
	}

	public DFGraphNode clone() {
		try {
			DFGraphNode tmp = (DFGraphNode)super.clone();
			tmp.destNodes = new ArrayList<DFGraphNode>();
			tmp.destSignal = null;
			tmp.originalNode = this;
			return tmp;
		} catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}

	public void dumpNode(PrintWriter wout, int offset){
		Dump.tprintln(wout, offset, "<nodeID>	"+this.hashCode()+"	</nodeID>");
		Dump.tprintln(wout, offset, "<startStep>	"+startStep+"	</startStep>");
		Dump.tprintln(wout, offset, "<endStep>	"+endStep+"	</endStep>");
		Dump.tprintln(wout, offset, "<destType>	"+getDestTypeString(parentManager.parentClass.config)+"	</destType>");
		Dump.tprintln(wout, offset, "<destTypeIsReg>	"+destTypeIsReg+"	</destTypeIsReg>");
		if(destSignal!=null)
			Dump.tprintln(wout, offset, "<destSignalName>	"+destSignal.getSigName()+"	</destSignalName>");
		else
			Dump.tprintln(wout, offset, "<destSignalName>	none	</destSignalName>");
		Dump.tprintln(wout, offset, "<priority>	"+priority+"	</priority>");
		Dump.tprintln(wout, offset, "<minPathToEnd>	"+minCntlStpFromThisNode+"	</minPathToEnd>");
		Dump.tprintln(wout, offset, "<fastestStepForAlap>	"+fastestStepForAlap+"	</fastestStepForAlap>");
		Dump.tprintln(wout, offset, "<componentID>	"+generateComponentID()+"	</componentID>");
	}

	void setEndStep(int latency, boolean useIP){
		if(useIP)
			endStep = startStep+latency+1;	//+1 -> IPコアの入力レジスタに代入する分
		else
			endStep = startStep;
	}

	/**
	 * (1)ノードの計算開始ステップを調べる<br>
	 * (2) (ソースソードの終了ステップ < カレントステップ) の場合，<br>
	 *     ソースノードの結果を一時レジスタに代入する必要があるので <br>
	 *     ソースノードの destTypeIsReg を true にする<br>
	 * (3)ソースノードがレジスタ読みとりの場合，フォワーディングについて調べる
	 * */
	public int getStartEnableStep(DFGraphNode srcNode, int currentStep){

		if(srcNode.assignState!=finished)
			System.out.println("DEBUG:	error DFGraphNode  getStartEnableStep");

		if(srcNode.destTypeIsReg)	//ソースノードがレジスタ代入の場合は，開始ノードが1ステップ遅れる
			return srcNode.endStep+1;

		//if(srcNode instanceof DFGraphVariableAccess)
		//	((DFGraphVariableAccess)srcNode).forwardingCheck(currentStep);

		if(srcNode.endStep < currentStep && srcNode.destSignalIsNotSaved()){	//結果の格納先を ワイヤアサイン から レジスタ代入に変更
			srcNode.destTypeIsReg = true;
		}

		return srcNode.endStep;
	}

	public int getAssignedState(){
		return assignState;
	}

	public int compareTo(DFGraphNode obj){
        int n1 = this.priority;
        int n2 = obj.priority;

        if(n1==n2)
        	return 0;

        return n1 > n2 ? -1 : 1;
    }

	public int getBitWidth(){

		Config config = parentManager.parentClass.config;

		if(destType==destTypeInt){
			return config.intBitWidth;
		}
		else if(destType==destTypeFloating){
			int bitWidth=0;
			if(config.floatingType==Config.doubleType)
				bitWidth = config.doubleBitWidth;
			else if(config.floatingType==Config.singleType)
				bitWidth = config.floatBitWidth;
			return bitWidth;
		}
		else if(destType==destTypeLong){
			return config.longBitWidth;
		}
		else if(destType==destTypeBoolean){
			return 1;
		}
		else {
			System.out.println("DEBUG:	error DFGraphNode getBitWidth");
		}
		return 0;
	}

	boolean isSignedType(){

		if(destType==destTypeFloating || destType==destTypeBoolean){
			return VerilogSignal.unsigned;
		}
		return VerilogSignal.signed;
	}


	public void assignDestSignal(VerilogClass parentClass){

		if(destTypeIsReg){
			destSignal = allocateTmpReg();
		}
		else{
			TmpSignals tmpSignals = parentClass.getTmpSignals();
			destSignal = tmpSignals.getWire(getBitWidth(), isSignedType());
		}
		//dumpBornDiedStep();
	}

	protected VerilogReg allocateTmpReg(){

		TmpSignals tmpSignals = parentManager.parentClass.getTmpSignals();

		if(destType==destTypeInt)
			return tmpSignals.getIntReg(tmpRegisterID);

		else if(destType==destTypeFloating)
			return  tmpSignals.getFloatReg(tmpRegisterID);

		else if(destType==destTypeLong)
			return tmpSignals.getLongReg(tmpRegisterID);

		else if(destType==destTypeBoolean)
			return tmpSignals.getBoolReg(tmpRegisterID);

		else
			System.out.println("DEBUG:	error DFGraphBinary bindTmpReg");
		return null;
	}

	//デバッグ用
	/*protected void dumpBornDiedStep(){

		if(destSignal!=null){
			if(destSignal instanceof VerilogReg){
				System.out.println(destSignal.name);
				System.out.println(this+"	born	"+bornedStep+"	"+destSignal+"		startStep	"+startStep);
				System.out.println(this+"	died	"+diedStep+"	"+destSignal+"		endStep	"+endStep+"\n");
			}
		}
	}*/

	void registerNoneBlockAssign(ArrayList<VerilogNoneBlockAssign>[] controlStep, VerilogNoneBlockAssign noneBlockAssign, int step){

		if(noneBlockAssign.getState().getStepID()!=step)
			System.out.println("DEBUG: error DFGraphNode registerNoneBlockAssign");

		if(controlStep[step]==null){
			controlStep[step] = new ArrayList<VerilogNoneBlockAssign>();
		}
		controlStep[step].add(noneBlockAssign);
	}

	void searchTimeToLive(){

		bornedStep = endStep;
		if(destNodes.size()==0){
			diedStep = endStep;
		}

		//このノードの結果が格納される一時レジスタの値を 最後に利用する destNode を調べる
		for(int i=0; i<destNodes.size(); i++){
			diedStep = Math.max(destNodes.get(i).getAssignedToNewRegStep(), diedStep);
		}
	}

	/**
	 * forwarding 時にvariableAccess が遅れると, variableAccess を入力とする組み合わせ回路の startStep が ソースノードの endStep 以前になってしまう.
	 * 回路は正しく作成されるが, DFGraphViewer で見るとおかしいので, 修正する.
	 * */
	void modifyStartAndEndStep(int srcEndStep){

		if(startStep < srcEndStep){

			if(startStep!=endStep)	//組み合わせ回路以外が修正されている可能性
				System.out.println("DEBUG:	error DFGraphNode modifyStartAndEndStep");

			startStep = srcEndStep;
			setEndStep(0, false);
		}

		if(destNodes.size()==0)
			return;

		for(int i=0; i<destNodes.size(); i++){
			destNodes.get(i).modifyStartAndEndStep(endStep);
		}
	}

	public void setRegisterID(int registerID){
		this.tmpRegisterID = registerID;
	}

	public int getRegisterID(){
		return tmpRegisterID;
	}

	/*
	 * DFGraphViewer で共通のハードウェア要素（レジスタやIPコア）を持つノードの識別用
	 * */
	private int generateComponentID(){

		if(this instanceof DFGraphUserDefinedOp){
			if( ((DFGraphUserDefinedOp)this).assignedIPcore!=null )
				return ((DFGraphUserDefinedOp)this).assignedIPcore.hashCode();
		}
		if(this instanceof DFGraphArrayAccess){
			if( ((DFGraphArrayAccess)this).srcVariable.getVariableDecl()!=null )
				return ((DFGraphArrayAccess)this).srcVariable.getVariableDecl().hashCode();
		}
		else if(this instanceof DFGraphBinary){
			if( ((DFGraphBinary)this).assignedIPcore!=null )
				return ((DFGraphBinary)this).assignedIPcore.hashCode();
		}
		else if(this instanceof DFGraphMethodInv){
			if( ((DFGraphMethodInv)this).method!=null )
				return ((DFGraphMethodInv)this).method.hashCode();
		}
		else if(this instanceof DFGraphTypeCast){
			if( ((DFGraphTypeCast)this).assignedIPcore!=null )
				return ((DFGraphTypeCast)this).assignedIPcore.hashCode();
		}
		else if(this instanceof DFGraphVariableAccess){
			if( ((DFGraphVariableAccess)this).getVariableDecl() != null)
				return ((DFGraphVariableAccess)this).getVariableDecl().hashCode();
		}
		return this.hashCode();
	}

	/*protected boolean impossibleToAssignforALAP(int controlStep){

		return (parentManager.config.alap && controlStep<fastestStepForAlap);	//ALAPスケジューリングの割り当て可能ステップに達していない
	}*/

	public void setComponentSign(){

		if(originalNode!=null)
			componentSigniture = originalNode.hashCode();
		else
			componentSigniture = this.hashCode();
	}

	public int getComponentSign(){
		return componentSigniture;
	}

	/**
	 * ノードのハッシュ値を返す. ただし, クローンノードの場合は, オリジナルノードのハッシュ値を返す
	 * */
	public int getNodeSign(){

		if(originalNode!=null)
			return originalNode.hashCode();

		return this.hashCode();
	}
}
















