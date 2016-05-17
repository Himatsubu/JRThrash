package net.njlab.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Stack;

import net.njlab.dump.CompileMsgs;
import net.njlab.dump.Dump;
import net.njlab.sample.annotation.JRThrashUnroll;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpressionStatement;
import openjdk.com.sun.tools.javac.tree.JCTree.JCForLoop;
import openjdk.com.sun.tools.javac.tree.JCTree.JCStatement;
import openjdk.com.sun.tools.javac.tree.JCTree.JCVariableDecl;

/**
 *  @author Keisuke Koike
 */
public class VerilogForLoop  extends VerilogStatementsPhase {

	JCForLoop forLoop;
	VerilogStatAssemblage init = null;
	VerilogStatAssemblage cond = null;
	VerilogStatAssemblage update = null;
	VerilogStatementsPhase body;
	boolean unrolled = false;
	private String updateOp;	// + or - 展開するループの更新部の加減算  -> i (+ or -)= expression

	ArrayList<VerilogContinue> continuePhase = new ArrayList<VerilogContinue>();
	ArrayList<VerilogBreak> breakPhase = new ArrayList<VerilogBreak>();
	StateTransGraphNode stgNode;

	VerilogForLoop(JCForLoop forLoop, VerilogStatementsPhase parent){
		this.forLoop = forLoop;
		this.parent = parent;
		makeVariableStack();
		makeInit();
		makeCond();
		makeUpdate();
		makeBody();
	}

	/**
	 * 初期化部作成
	 * */
	void makeInit(){

		ArrayList<VerilogStatement> statements = new ArrayList<VerilogStatement>();
		for(JCStatement statement : forLoop.getInitializer()){

			if(statement instanceof JCExpressionStatement){
				statements.add( new VerilogExprStatement( ((JCExpressionStatement)statement).getExpression()) );
			}
			else if(statement instanceof JCVariableDecl){
				VerilogVariableDecl tmp = new VerilogVariableDecl((JCVariableDecl)statement, getParentMethod().methodName, VerilogVariableDecl.defTypeMethod);
				vdecls.add(tmp);
				statements.add(tmp);
			}
			else{
				System.out.println("DEBUG:	error for init");
			}
		}
		if(statements.size()!=0){
			init = new VerilogStatAssemblage(statements, this);
			statements.clear();
		}
	}
	/**
	 * 比較部作成
	 * */
	void makeCond(){
		if(forLoop.getCondition()!=null){
			VerilogExprStatement tmp = new VerilogExprStatement(forLoop.getCondition());
			cond = new VerilogStatAssemblage(tmp, this);
		}
	}
	/**
	 * 更新部作成
	 * */
	void makeUpdate(){

		ArrayList<VerilogStatement> statements = new ArrayList<VerilogStatement>();
		for(JCExpressionStatement statement : forLoop.getUpdate()){
			statements.add(new VerilogExprStatement(statement.getExpression()));
		}
		if(statements.size()!=0){
			update = new VerilogStatAssemblage(statements, this);
			statements.clear();
		}
	}
	/**
	 * ボディ作成
	 * */
	void makeBody(){

		VerilogStatementsPhase subPhase = VerilogStatementsPhase.makeSubBlock(forLoop.getStatement(), this);

		//skip対策
		if(subPhase==null)
			body = new VerilogContinue(null, this);
		else
			body = subPhase;
	}

	@Override
	public boolean existERR(){
		boolean ret = !buildSucceed;
		if(init!=null)
			ret |= init.existERR();
		if(cond!=null)
			ret |= cond.existERR();
		if(update!=null)
			ret |= update.existERR();
		ret |= body.existERR();
		return ret;
	}

	public void dump(PrintWriter out, int offset){

		Dump.tprintln(out, offset, "<ForLoop>	<Phase>  "+ this.stateID +"  </Phase>");
		if(breakPhase.size()!=0){
			Dump.tprint(out, offset+1, "<BreakPhase>");
			for(int i=0; i<breakPhase.size(); i++)
				Dump.tprint(out, 0, "	"+breakPhase.get(i));
			Dump.tprint(out, 0, "	</BreakPhase>");
			Dump.tprintln(out, offset+1, "\n");
		}
		if(init!=null){
			Dump.tprintln(out, offset+1, "<forInit>");
			init.dump(out, offset+2);
			Dump.tprintln(out, offset+1, "</forInit>\n");
		}
		if(cond!=null){
			Dump.tprintln(out, offset+1, "<forCond>");
			cond.dump(out, offset+2);
			Dump.tprintln(out, offset+1, "</forCond>\n");
		}
		if(update!=null){
			Dump.tprintln(out, offset+1, "<forUpdate>");
			update.dump(out, offset+2);
			Dump.tprintln(out, offset+1, "</forUpdate>\n");
		}
		Dump.tprintln(out, offset+1, "<forBody>");
		body.dump(out, offset+2);
		Dump.tprintln(out, offset+1, "</forBody>");
		Dump.tprintln(out, offset, "</ForLoop>\n");
	}


	private VerilogVariableDecl findLoopVariable(String loopVariableName){

		VerilogVariableDecl loopVariable = null;
		if(init!=null){
			for(int i=init.vdecls.size()-1; i>=0; --i){
				if(init.vdecls.get(i).getName().compareTo(loopVariableName)==0){
					loopVariable = init.vdecls.get(i);
					return loopVariable;
				}
			}
		}

		for(int i=vdecls.size()-1; i>=0; --i){
			if(vdecls.get(i).getName().compareTo(loopVariableName)==0){
				loopVariable = vdecls.get(i);
				return loopVariable;
			}
		}

		for(int i=variableStack.size()-1; i>=0; --i){
			if(variableStack.get(i).getName().compareTo(loopVariableName)==0){
				loopVariable = variableStack.get(i);
				return loopVariable;
			}
		}
		return null;
	}

	/**
	 * アノテーション情報を元にループ展開できる場合は，ループ展開する
	 * */
	public void unrollLoop(String loopVariableName, int unrollNum, int unrollType){

		boolean unrollingEnable = true;

		if(unrollType!=JRThrashUnroll.modifyLoopVar &&
		   unrollType!=JRThrashUnroll.modifyLoopVar_IndependentIterator &&
		   unrollType!=JRThrashUnroll.simple &&
		   unrollType!=JRThrashUnroll.copyLoopVar){

			CompileMsgs.wdumpUnrollTypeCheck();
			return;
		}

		VerilogVariableDecl loopVariable = findLoopVariable(loopVariableName);
		if(loopVariable==null)
			return;

		if(init!=null){
			init.setUnrollParam(loopVariable, unrollNum, unrollType);
			init.makeDFG();
			unrollingEnable &= init.checkInitFormat();
		}

		if(update!=null){
			unrollingEnable &= update.exprHasLoopValue(loopVariableName);
		}

		if(unrollType==JRThrashUnroll.copyLoopVar && init==null){	//copyLoopVar は initが必要
			unrollingEnable &= false;
			CompileMsgs.wdumpForInitRequired();
			Dump.tprint(System.out, 1, forLoop.toString());
			System.out.println("\n");
		}

		if(unrollingEnable){	//初期化部か更新部に ループ変数が含まれているかチェック -> 含まれていればループ展開対象とする
			if(checkBodyFormat()){	//for 文本体の構造をチェック
				unrollUpdateAndBody(loopVariable, unrollNum, unrollType);
			}
		}
	}

	private void unrollUpdateAndBody(VerilogVariableDecl loopVariable, int unrollNum, int unrollType){

		if(!checkUpdateFormatForUnroll(unrollType, update, loopVariable, unrollNum)){

			if(unrollType==JRThrashUnroll.modifyLoopVar || unrollType==JRThrashUnroll.modifyLoopVar_IndependentIterator)
				CompileMsgs.wdumpForUpdateAsModifyLoopvar();

			else if(unrollType==JRThrashUnroll.copyLoopVar)
				CompileMsgs.wdumpForUpdateAsSimpleOrCopy();

			else
				CompileMsgs.wdumpForUpdateAsSimpleOrCopy();

			Dump.tprint(System.out, 1, forLoop.toString());
			System.out.println("\n");
			return;
		}

		if(init!=null)
			((VerilogBlock)body).setForInitPart(init);

		VerilogStatAssemblage update = this.update;	//update 退避
		if(update!=null)
			if(unrollType==JRThrashUnroll.modifyLoopVar ||
			   unrollType==JRThrashUnroll.simple 	    ||
			   unrollType==JRThrashUnroll.copyLoopVar)	//unrollType が simple か modifyLoopVar か copyLoopVar の場合, 更新部をbody に組み込む
				mergeForLoopUpdate();

		if(update!=null)
			((VerilogBlock)body).unrollStatements(updateOp, loopVariable, unrollNum, unrollType, update.getUpdateExpression(), update.stages.get(0).getDFGraphs().get(0)); //本体展開
		else
			((VerilogBlock)body).unrollStatements(updateOp, loopVariable, unrollNum, unrollType, null, null); //本体展開

		unrolled = true;
		System.out.println("MSG:	Loop unrolling is succeed.\n");
		Dump.tprint(System.out, 1, forLoop.toString());
		System.out.println("\n");
	}

	/**
	 * ループ展開の際の更新部の形を調べる<br>
	 * modifyVar 系 -> i+=expression  形式ならば OK<br>
	 * simple or copyVar  -> マージ条件 (ステージが1つでかつ, メソッド呼び出しが無い) を満たしていれば OK<br>
	 * */
	boolean checkUpdateFormatForUnroll(int unrollType, VerilogStatAssemblage forUpdatePart, VerilogVariableDecl loopVariable, int unrollNum){

		if(forUpdatePart==null)
			if(unrollType==JRThrashUnroll.simple || unrollType==JRThrashUnroll.copyLoopVar)
				return true;
			else
				return false;

		if(unrollType==JRThrashUnroll.modifyLoopVar ||
		   unrollType==JRThrashUnroll.modifyLoopVar_IndependentIterator){	//modifyLoopVar or modifyLoopVar_IndependentIterator -> makeDFG して, update の変更が上手くいったかどうかを調べる

			forUpdatePart.setUnrollParam(loopVariable, unrollNum, unrollType);
			forUpdatePart.setUpdateChangeFlag();	//ループ展開のために update 部を変更   loopVariable = loopVariable (+-) Expression  ==>  loopVariable = loopVariable (+-) (unrollNum * Expression)
			forUpdatePart.makeDFG();
			return forUpdatePart.updateChangeIsSuccessful;
		}
		else{	//simple or copyVar -> makeDFG して, body にマージ可能な形式かどうかを調べる

			forUpdatePart.makeDFG();
			if(!forUpdatePart.checkUpdateCanBeMerged())
				return false;
		}
		return true;
	}

	public void setUpdateInfo(String updateOp){
		this.updateOp = updateOp;
	}

	private boolean checkBodyFormat(){

		//ループ本体が展開できる条件
		if(body instanceof VerilogBlock){	//for文の本体が block文( { ... } )であること

			VerilogBlock block = (VerilogBlock)body;
			if(block.subBlock.size()==1){	// block文の中にstatementPhase が一つだけ入っていること
				if(block.subBlock.get(0) instanceof VerilogStatAssemblage){	//一つだけ入っている VerilogStatementPhase がVerilogstatAssemblage であること

					VerilogStatAssemblage statAssemblage = (VerilogStatAssemblage)block.subBlock.get(0);
					if( !statAssemblage.haveMethodInv() && statAssemblage.stages.size()!=1)	//VerilogstatAssemblage の中の式にメソッド呼び出しが無いこと && 1ステージであること
						return true;
				}
			}
		}
		CompileMsgs.wdumpForBodyCantUnroll();
		Dump.tprint(System.out, 1, forLoop.toString());
		System.out.println("\n");
		return false;
	}

	@Override
	protected void makeStateTransGraph(Stack<StateTransGraphNode> source,
									   Stack<StateTransGraphNode> elseSource,
									   Stack<StateTransGraphNode> strayChild,
									   Stack<StateTransGraphNode> strayElseChild){

		makeInitPartSTG(source, elseSource, strayChild, strayElseChild/*, bodyFirstStateKnower*/);
		if(cond!=null)
			strayElseChild.push(cond.stgNode);//条件分岐失敗時の行先を親に見つけさせる

		for(VerilogContinue cnt : continuePhase){

			if(update!=null)
				cnt.stgNode.setNextPhase(update.stgNode);

			else if(cond!=null)
				cnt.stgNode.setNextPhase(cond.stgNode);

			else
				cnt.stgNode.setNextPhase(body.getFirstPhase());
		}

		for(VerilogBreak cnt : breakPhase)
			strayChild.push(cnt.stgNode);
	}


	private void makeInitPartSTG(Stack<StateTransGraphNode> source,
				    			 Stack<StateTransGraphNode> elseSource,
				    			 Stack<StateTransGraphNode> strayChild,
				    			 Stack<StateTransGraphNode> strayElseChild/*,
				    			 StateTransGraphNode bodyFirstStateKnower*/){

		if(init!=null){	//parent -> init

			init.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
			dumpStgDebug(source, elseSource, "VerilogForLoop");
			moveStack(source, strayChild);
			moveStack(elseSource, strayElseChild);

			if(cond!=null){	//init -> cond

				cond.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
				dumpStgDebug(source, elseSource, "VerilogForLoop.");
				moveStack(source, strayChild);
				moveStack(elseSource, strayElseChild);
			}
		}
		else if(cond!=null){	//parent -> cond

			cond.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
			dumpStgDebug(source, elseSource, "VerilogForLoop..");
			moveStack(source, strayChild);
			moveStack(elseSource, strayElseChild);
		}
		body.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
		dumpStgDebug(source, elseSource, "VerilogForLoop...");
		makeDestOfBody(source, elseSource, strayChild, strayElseChild/*, bodyFirstStateKnower*/);//ボディパート以下の迷子に遷移先を教える
	}

	private void makeDestOfBody(Stack<StateTransGraphNode> source,
								Stack<StateTransGraphNode> elseSource,
								Stack<StateTransGraphNode> strayChild,
								Stack<StateTransGraphNode> strayElseChild/*,
								StateTransGraphNode bodyFirstStateKnower*/){

		if(update!=null){	//body -> update

			moveStack(source, strayChild);
			moveStack(elseSource, strayElseChild);
			update.makeStateTransGraph(source, elseSource, strayChild, strayElseChild);
			strayChild.pop();												//update は迷子ノードに入らない
			dumpStgDebug(source, elseSource, "VerilogForLoop....");

			if(cond!=null){	//update -> cond
				update.stgNode.setNextPhase(cond.stgNode);
			}
			else{
				StateTransGraphNode firstStateOfBody = body.getFirstPhase();//bodyFirstStateKnower.getNextPhase();	//ボディで遷移可能な最初のフェイズ

				if(firstStateOfBody != null){	//update -> body
					update.stgNode.setNextPhase(firstStateOfBody);
				}
				else{	//ボディは空ブロック update -> update
					update.stgNode.setNextPhase(update.stgNode);
				}
			}
		}
		else{
			if(cond!=null){	//body -> cond
				while(strayChild.size()>0)		strayChild.pop().setNextPhase(cond.stgNode);
				while(strayElseChild.size()>0)	strayElseChild.pop().setElsePhase(cond.stgNode);
			}
			else{
				StateTransGraphNode firstStateOfBody = body.getFirstPhase();	//ボディで遷移可能な最初のフェイズ

				if(firstStateOfBody != null){	//body -> body
					while(strayChild.size()>0)		strayChild.pop().setNextPhase(firstStateOfBody);
					while(strayElseChild.size()>0)	strayElseChild.pop().setElsePhase(firstStateOfBody);
				}
				else{
					stgNode = new StateTransGraphNode(this, phaseSignal, phaseLiteral);

					if(init!=null){	//for(init; ; ){ 空 }
						init.stgNode.setNextPhase(stgNode);
						strayChild.remove(init.stgNode);
					}
					else{	//for( ; ; ){ 空 }
						while(strayChild.size()>0)		strayChild.pop().setNextPhase(stgNode);
						while(strayElseChild.size()>0)	strayElseChild.pop().setElsePhase(stgNode);
					}
					stgNode.setNextPhase(stgNode);
				}
			}
		}
	}

	@Override
	protected StateTransGraphNode getFirstPhase(){

		if(init!=null)
			return init.stgNode;

		if(cond!=null)
			return cond.stgNode;

		StateTransGraphNode firstPhase = body.getFirstPhase();
		if(firstPhase!=null)
			return firstPhase;

		return this.stgNode;
	}

	/** update 部の body への組み込み<br>
	 *  simple                    -> 組み込む,      update 部の書き換えなし<br>
	 *  copyVar                   -> 組み込む,      update 部の書き換えなし<br>
	 *  modifyLoopvar             -> 組み込む,      update 部の書き換えあり<br>
	 *  modifyLoopvar_independent -> 組み込まない,  update 部の書き換えあり<br>
	 *  展開しないループ          -> 組み込む,      update 部の書き換えなし<br>
	 * */
	protected void mergeForLoopUpdate(){

		if(update==null || unrolled || continuePhase.size()>0)
			return;

		update.makeDFG();

		if(!(body instanceof VerilogBlock))
			return;

		if(update.checkUpdateCanBeMerged()){
			if(((VerilogBlock)body).mergeForUpdatePart(update)){
				update.schedulingIsFinished = true;
				update.resetDFGraphConnectivity();
				update = null;
			}
		}
	}
}







