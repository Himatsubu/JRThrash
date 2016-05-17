package net.njlab.tool;

import openjdk.com.sun.tools.javac.tree.JCTree.JCClassDecl;
import openjdk.com.sun.tools.javac.tree.JCTree.JCMethodDecl;
import openjdk.com.sun.tools.javac.tree.JCTree.JCVariableDecl;
import openjdk.com.sun.tools.javac.tree.JCTree.JCExpression;
import openjdk.com.sun.tools.javac.tree.JCTree;
import openjdk.com.sun.tools.javac.tree.JCTree.*;

import java.io.File;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.PrintWriter;
import java.io.IOException;

/**
 *  @author Keisuke Koike
 */
public class ParserTest {

	public ParserTest(){}

	void tprint(PrintWriter out, int offset, String st){
		int i,j;
		String[] split = st.split("\n");
		for(j=0; j<split.length; j++){
			for(i=0; i<offset; i++)
				out.print("	");
			out.print(split[j]+"\n");
		}

		//out.print(st);
	}

	void tprintln(PrintWriter out, int offset, String st){
		int i;
		for(i=0; i<offset; i++)
			out.print("	");
		out.print(st);
	}

	public void analizeTree(JCClassDecl decl){

		File file = new File(decl.name+"_syntax_tree.txt");
		PrintWriter out = null;
	    try{
	    	out = new PrintWriter(new BufferedWriter(new FileWriter(file)));
	    }
	    catch(IOException e){
	    	System.out.println(e);
	    }
	    tprint(out, 0, "<className> = "+decl.name.toString()+"\n\n");	//クラス名
	    dumpField(decl, out);  //フィールド情報
	    dumpMethod(decl, out); //メソッド情報
	    out.close();
	}

	/**
	 *フィールド情報ダンプ
	 */
	public void dumpField(JCClassDecl decl, PrintWriter out){

		tprintln(out, 0, "<FIELD>\n");
		for (JCTree def : decl.defs) {
			if(def == null){}
			else if(def instanceof JCVariableDecl){
				dumpVariable((JCVariableDecl)def, out, 1);
				tprintln(out, 0, "\n");
			}
		}
		tprintln(out, 0, "</FIELD>\n\n");
	}

	/**
	 * 変数宣言ダンプ
	 */
	public void dumpVariable(JCVariableDecl vdecl, PrintWriter out, int offset){
		tprintln(out, offset, "<VariableDecl>\n");
		//tprintln(out, offset+1, "<type> = "+vdecl.vartype+"\n");
		tprintln(out, offset+1, "<type>\n");
		dumpExpression(vdecl.vartype, out, offset+2);
		tprintln(out, offset+1, "</type>\n");
		tprintln(out, offset+1, "<name> = "+vdecl.getName()+"\n");
		if(vdecl.getInitializer()!=null){
			tprintln(out, offset+1, "<init> = "+vdecl.getInitializer()+"\n");
			dumpExpression(vdecl.getInitializer(), out, offset+2);
			tprintln(out, offset+1, "</init>\n");
		}
		if(vdecl.getModifiers().toString().compareToIgnoreCase("")!=0)
			tprintln(out, offset+1, "<modifiers> = "+vdecl.getModifiers()+"\n");
		//else
		//	tprintln(out, offset+1, "\n");
		tprintln(out, offset, "</VariableDecl>\n");
	}

	/**
	 *メソッド情報ダンプ
	 */
	public void dumpMethod(JCClassDecl decl, PrintWriter out){

		for (JCTree def : decl.defs) {
			if(def == null) continue;
			else if(def instanceof JCMethodDecl){
				if("<init>".compareTo(((JCMethodDecl)def).name.toString())==0) continue;	//コンストラクタは処理しない

				tprintln(out, 0, "<METHOD>\n");
				tprintln(out, 1, "<mathodName> = " + ((JCMethodDecl) def).getName()+"\n");
				tprintln(out, 1, "<returnType> = " + ((JCMethodDecl) def).getReturnType()+"\n");
				tprintln(out, 1, "<PARAM_LIST>\n");
				for(JCVariableDecl vdecl : ((JCMethodDecl)def).getParameters()){
					dumpVariable(vdecl, out, 2);
					tprintln(out, 0, "\n");
				}
				tprintln(out, 1, "</PARAM_LIST>\n\n");
				dumpBlock(((JCMethodDecl) def).getBody(), out, 1);
				tprintln(out, 0, "</METHOD>\n\n");
				//System.out.println(((JCMethodDecl) def).getBody().getClass());
			}
		}
	}

	/**
	 * JCStatement ダンプ
	 * */
	public void dumpStatement(JCStatement statement, PrintWriter out, int offset){

		tprintln(out, offset, "<Statement>\n");
		///tprint(out, offset, statement.toString()+"\n");
		if(statement instanceof JCClassDecl){
			System.out.println("error  ClassDecl");
		}
		else if(statement instanceof JCVariableDecl){
			//System.out.println("VariableDecl");
			dumpVariable((JCVariableDecl) statement, out, offset+1);
		}
		else if(statement instanceof JCSkip){
			System.out.println("Skip is not synthesizable");
		}
		else if(statement instanceof JCBlock){
			//System.out.println("Block");
			dumpBlock((JCBlock)statement, out, offset+1);
		}
		else if(statement instanceof JCDoWhileLoop){
			//System.out.println("DoWhileLoop");;
			 dumpDoWhileLoop((JCDoWhileLoop) statement, out, offset+1);
		}
		else if(statement instanceof JCWhileLoop){
			//System.out.println("WhileLoop");
			dumpWhileLoop((JCWhileLoop) statement, out, offset+1);
		}
		else if(statement instanceof JCForLoop){
			//System.out.println("ForLoop");
			dumpForLoop((JCForLoop)statement, out, offset+1);
		}
		else if(statement instanceof JCEnhancedForLoop){
			System.out.println("EnhancedForLoop is not synthesizable");
		}
		else if(statement instanceof JCLabeledStatement){
			System.out.println("LabeledStatement is not synthesizable");
		}
		else if(statement instanceof JCSwitch){
			//System.out.println("Switch");
			dumpSwitch((JCSwitch) statement, out, offset+1);
		}
		else if(statement instanceof JCCase){
			System.out.println("error CaseStatement");	//ここでcase はおかしい?
		}
		else if(statement instanceof JCSynchronized){
			System.out.println("Synchronized is not synthesizable");
		}
		else if(statement instanceof JCTry){
			System.out.println("Try is not synthesizable");
		}
		else if(statement instanceof JCIf){
			//System.out.println("If");
			dumpIF((JCIf)statement, out, offset+1);
		}
		else if(statement instanceof JCExpressionStatement){
			//System.out.println("ExpressionStatement");
			dumpExpressionStatement((JCExpressionStatement) statement,out, offset+1);
		}
		else if(statement instanceof JCBreak){
			//System.out.println("Break");
			dumpBreak((JCBreak) statement, out, offset+1);
		}
		else if(statement instanceof JCContinue){
			dumpContinue((JCContinue) statement, out, offset+1);
		}
		else if(statement instanceof JCReturn){
			//System.out.println("Return");
			dumpReturn((JCReturn) statement, out, offset+1);
		}
		else if(statement instanceof JCThrow){
			System.out.println("Throw is not synthesizable");
		}
		else if(statement instanceof JCAssert){
			System.out.println("Assert is not synthesizable");
		}
		tprintln(out, offset, "</Statement>\n");
	}

	/**
	 * {...} ダンプ
	 * */
	public void dumpBlock(JCBlock block, PrintWriter out, int offset){

		tprintln(out, offset, "<Block>\n");
		//tprint(out, offset, block.toString());
		for(JCStatement statement : block.getStatements()){
			dumpStatement(statement, out, offset+1);
			tprintln(out, 0, "\n");
		}
		tprintln(out, offset, "</Block>\n");
	}

	/**
	 * do{...} while() ダンプ
	 * */
	public void dumpDoWhileLoop(JCDoWhileLoop doWhile, PrintWriter out, int offset){

		tprintln(out, offset, "<DoWhile>\n");
		//tprint(out, offset, doWhile.toString());
		tprintln(out, offset+1, "<doWhileCond>\n");
		dumpExpression(doWhile.getCondition(), out, offset+2);	// 条件部
		tprintln(out, offset+1, "</doWhileCond>\n\n");
		dumpStatement(doWhile.getStatement(), out, offset+1);	// {...}
		tprintln(out, 0, "\n");
		tprintln(out, offset, "</DoWhile>\n");
	}

	/**
	 * while(){...} ダンプ
	 * */
	public void dumpWhileLoop(JCWhileLoop whileLoop, PrintWriter out, int offset){

		tprintln(out, offset, "<While>\n");
		//tprint(out, offset, whileLoop.toString());
		tprintln(out, offset+1, "<whileCond>\n");
		dumpExpression(whileLoop.getCondition(), out, offset+2);	// 条件部
		tprintln(out, offset+1, "</whileCond>\n\n");
		dumpStatement(whileLoop.getStatement(), out, offset+1);	// {...}
		tprintln(out, 0, "\n");
		tprintln(out, offset, "</While>\n");
	}

	/**
	 * for(){...} ダンプ
	 * */
	public void dumpForLoop(JCForLoop forLoop, PrintWriter out, int offset){

		tprintln(out, offset, "<For>\n");
		//tprint(out, offset, forLoop.toString());
		tprintln(out, offset+1, "<forInit>\n");
		for(JCStatement statement : forLoop.getInitializer()){
			dumpStatement(statement, out, offset+2);	// 初期化部
			//System.out.println("for init--------"+statement+"\n");
			tprintln(out, 0, "\n");
		}
		tprintln(out, offset+1, "</forInit>\n\n");

		tprintln(out, offset+1, "<forCond>\n");
		dumpExpression(forLoop.getCondition(), out, offset+1);	// 条件部
		//System.out.println("for condition--------"+forLoop.getCondition()+"\n");
		tprintln(out, offset+1, "</forCond>\n\n");

		tprintln(out, offset+1, "<forUpdate>\n");
		for(JCStatement statement : forLoop.getUpdate()){
			dumpStatement(statement, out, offset+2);	// 更新部
			//System.out.println("for update--------"+statement+"\n");
			tprintln(out, 0, "\n");
		}
		tprintln(out, offset+1, "</forUpdate>\n\n");

		dumpStatement(forLoop.getStatement(), out, offset+1);	// {...}
		tprintln(out, 0, "\n");
		tprintln(out, offset, "</For>\n");
	}

	/**
	 * switch(){...} ダンプ
	 * */
	public void dumpSwitch(JCSwitch switchStatement, PrintWriter out, int offset){
		tprintln(out, offset, "<Switch>\n");
		//tprint(out, offset, switchStatement.toString());
		tprintln(out, offset+1, "<switchCond>\n");
		dumpExpression(switchStatement.getExpression(), out, offset+2);	//条件部
		tprintln(out, offset+1, "</switchCond>\n");

		for(JCCase cases : switchStatement.getCases()){	//case文
			dumpCase(cases,  out, offset+1);
			tprintln(out, 0, "\n");
		}
		tprintln(out, offset, "</Switch>\n");
	}

	/**
	 * case ダンプ
	 * */
	public void dumpCase(JCCase cases, PrintWriter out, int offset){
		tprintln(out, offset, "<Case>\n");
		//tprint(out, offset, cases.toString());
		if(cases.getExpression()!=null){//条件部
			dumpExpression(cases.getExpression(), out, offset+1);
		}
		tprintln(out, 0, "\n");

		for(JCStatement statement : cases.getStatements()){
			dumpStatement(statement,  out, offset+1);	//{...}
			tprintln(out, 0, "\n");
			//System.out.println("------  "+statement.toString());
		}
		tprintln(out, offset, "</Case>\n");
	}

	/**
	 * if{} else{}  ダンプ
	 * */
	public void dumpIF(JCIf ifstat, PrintWriter out, int offset){

		tprintln(out, offset, "<If>\n");
		//tprint(out, offset, ifstat.toString());
		tprintln(out, offset+1, "<ifCond>\n");
		dumpExpression(ifstat.getCondition(), out, offset+2);	//条件部
		tprintln(out, offset+1, "</ifCond>\n\n");
		tprintln(out, offset+1, "<thenPart>\n");
		dumpStatement(ifstat.getThenStatement(), out, offset+2); // then ブロック
		tprintln(out, offset+1, "</thenPart>\n\n");
		tprintln(out, offset+1, "<elsePart>\n");
		dumpStatement(ifstat.getElseStatement(), out, offset+2); // else ブロック
		tprintln(out, offset+1, "</elsePart>\n\n");
		tprintln(out, offset, "</If>\n");
	}

	/**
	 * 式文ダンプ
	 * */
	public void dumpExpressionStatement(JCExpressionStatement exprStat, PrintWriter out, int offset){
		tprintln(out, offset, "<ExpressionStatement>\n");
		//tprint(out, offset, exprStat.toString());
		dumpExpression(exprStat.getExpression(), out, offset+1);	//式
		tprintln(out, offset, "</ExpressionStatement>\n");
	}

	public void dumpBreak(JCBreak breakStat, PrintWriter out, int offset){
		tprintln(out, offset, "<BREAK>\n");
	}

	public void dumpContinue(JCContinue continueStat, PrintWriter out, int offset){
		tprintln(out, offset, "<CONTINUE>\n");
	}

	public void dumpReturn(JCReturn retutnStat, PrintWriter out, int offset){
		tprintln(out, offset, "<RETURN>\n");
	}

	/**
	 * JCExpression ダンプ
	 * */
	public void dumpExpression(JCExpression expr, PrintWriter out, int offset){

		//tprintln(out, offset, "<Expression> => ");
		//tprint(out, 0, expr.toString());
		if(expr instanceof JCConditional){
			//System.out.println("	Conditional");
			dumpContditional((JCConditional) expr, out, offset);
		}
		else if(expr instanceof JCMethodInvocation){
			//System.out.println("	JCMethodInvocation");
			dumpMethodInvocation((JCMethodInvocation) expr, out, offset);
		}
		else if(expr instanceof JCNewClass){
			//System.out.println("	NewClass is not synthesizable");
			dumpNewClass( (JCNewClass) expr,  out, offset);
		}
		else if(expr instanceof JCNewArray){
			//System.out.println("	NewArray");
			dumpNewArray((JCNewArray)expr, out, offset);
		}
		else if(expr instanceof JCParens){
			//System.out.println("	Parens");
			dumpParens((JCParens)expr, out, offset);
		}
		else if(expr instanceof JCAssign){
			//System.out.println("	Assign");
			dumpAssign( (JCAssign)expr, out, offset);
		}
		else if(expr instanceof JCAssignOp){
			//System.out.println("	AssignOp");
			dumpAssignOp((JCAssignOp) expr, out, offset);
		}
		else if(expr instanceof JCUnary){
			//System.out.println("	Unary");
			dumpUnary((JCUnary)expr, out, offset);
		}
		else if(expr instanceof JCBinary){
			//System.out.println("	Binary");
			dumpBinary((JCBinary)expr, out, offset);
		}
		else if(expr instanceof JCTypeCast){
			//System.out.println("	TypeCast");
			dumpTypeCast((JCTypeCast) expr, out, offset);
		}
		else if(expr instanceof JCInstanceOf){
			System.out.println("	InstanceOf is not synthesizable");
		}
		else if(expr instanceof JCArrayAccess){
			//System.out.println("	ArrayAccess");
			dumpArrayAccess((JCArrayAccess) expr, out, offset);
		}
		else if(expr instanceof JCFieldAccess){
			//System.out.println("	FieleAccess");
			dumpFieldAccess((JCFieldAccess) expr, out, offset);
		}
		else if(expr instanceof JCIdent){
			//System.out.println("	Ident");
			dumpIdent((JCIdent) expr, out, offset);
		}
		else if(expr instanceof JCLiteral){
			//System.out.println("	Literal");
			dumpLiteral((JCLiteral) expr, out, offset);
		}
		else if(expr instanceof JCPrimitiveTypeTree){
			//System.out.println("	PrimitiveTypeTree  "+expr);
			dumpPrimitiveTypeTree((JCPrimitiveTypeTree) expr, out, offset);
		}
		else if(expr instanceof JCArrayTypeTree){
			//System.out.println("	ArrayTypeTree	"+expr);
			dumpArrayTypeTree((JCArrayTypeTree) expr, out, offset);
		}
		else if(expr instanceof JCTypeApply){
			System.out.println("	TypeApply is not synthesizable");
		}
		else if(expr instanceof JCWildcard){
			System.out.println("	Wildcard is not synthesizable");
		}
		else if(expr instanceof JCAnnotation){
			System.out.println("	Annotation");
		}
		else if(expr instanceof JCErroneous){
			System.out.println("	Erroneous is not synthesizable");
		}
		else if(expr instanceof LetExpr){
			System.out.println("	LetExpr");
		}
		//tprintln(out, offset, "</Expression>\n");
	}


	/**
	 * 3項演算ダンプ
	 * */
	public void dumpContditional(JCConditional conditional, PrintWriter out, int offset){

		tprintln(out, offset, "<Conditional>\n");
		tprintln(out, offset+1, "<cond>\n");
		dumpExpression(conditional.getCondition(), out, offset+2);
		tprintln(out, offset+1, "</cond>\n\n");
		tprintln(out, offset+1, "<trueExpre>\n");
		dumpExpression(conditional.getTrueExpression(), out, offset+2);
		tprintln(out, offset+1, "</trueExpre>\n\n");
		tprintln(out, offset+1, "<flaseExpre>\n");
		dumpExpression(conditional.getFalseExpression(), out, offset+2);
		tprintln(out, offset+1, "</flaseExpre>\n\n");
		tprintln(out, offset, "</Conditional>\n\n");
	}

	/**
	 * 関数呼び出しダンプ
	 * */
	public void dumpMethodInvocation(JCMethodInvocation methodInv, PrintWriter out, int offset){

		tprintln(out, offset, "<MethodInvocation>\n");
		//tprint(out, offset, methodInv.toString());
		dumpExpression(methodInv.getMethodSelect(), out, offset+1);//メソッド名
		tprintln(out, offset, "\n");
		for(JCExpression expr : methodInv.getArguments()){	//引数
			dumpExpression(expr, out, offset+1);
			tprintln(out, offset, "\n");
		}
		for(JCExpression expr : methodInv.getTypeArguments()){	//??不明
			dumpExpression(expr, out, offset+1);
			tprintln(out, offset, "\n");
		}
		tprintln(out, offset, "</MethodInvocation>\n");
	}

	/**
	 * newClass ダンプ
	 * */
	public void dumpNewClass( JCNewClass newClass, PrintWriter out, int offset){

		tprintln(out, offset, "<NewClass>\n");
		//tprint(out, offset, newClass.toString());
		dumpExpression(newClass.getIdentifier(), out, offset+1);
		tprintln(out, offset, "\n");
		for(JCExpression expr : newClass.getArguments()){	//引数
			dumpExpression(expr, out, offset+1);
			tprintln(out, offset, "\n");
		}
		for(JCExpression expr : newClass.getTypeArguments()){	//??不明
			dumpExpression(expr, out, offset+1);
			tprintln(out, offset, "\n");
		}
		//newClass.getClassBody() ??不明
		//dumpExpression(newClass.getEnclosingExpression(), out, offset+1); //??不明
		tprintln(out, offset, "</NewClass>\n\n");
	}

	/**
	 * newArary ダンプ
	 * */
	public void dumpNewArray(JCNewArray newArray, PrintWriter out, int offset){

		tprintln(out, offset, "<NewArray>\n");
		//tprint(out, offset, assign.toString());
		tprintln(out, offset+1, "<type>\n");
		if(newArray.getType()!=null){			//型 初期値を代入するタイプの場合 null
			dumpExpression(newArray.getType(), out, offset+2);
		}
		tprintln(out, offset+1, "</type>\n");

		tprintln(out, offset+1, "<dimension>\n");
		for(JCExpression expr : newArray.getDimensions()){	//次元
			dumpExpression(expr, out, offset+2);
		}
		tprintln(out, offset+1, "</dimension>\n");

		tprintln(out, offset+1, "<arratInit>\n");
		if(newArray.getInitializers()!=null){
			for(JCExpression expr : newArray.getInitializers()){	//初期値
				dumpExpression(expr, out, offset+2);
				tprintln(out, offset, "\n");
			}
		}
		tprintln(out, offset+1, "</arratInit>\n");
		tprintln(out, offset, "</NewArray>\n");
	}

	/**
	 * (...) ダンプ
	 * */
	public void dumpParens(JCParens parens, PrintWriter out, int offset){

		tprintln(out, offset, "<Parens>\n");
		//tprint(out, offset, parens.toString());
		tprint(out, offset, parens.toString());
		dumpExpression(parens.getExpression(), out, offset+1);
		tprintln(out, offset, "</Parens>\n");
	}

	/**
	 * 代入式ダンプ
	 * */
	public void dumpAssign( JCAssign assign, PrintWriter out, int offset){

		tprintln(out, offset, "<Assign>\n");
		//tprint(out, offset, assign.toString());
		dumpExpression(assign.getExpression(), out, offset+1);	//右辺
		tprintln(out, offset, "\n");
		dumpExpression(assign.getVariable(), out, offset+1);	//左辺
		tprintln(out, offset, "</Assign>\n");
	}

	/**
	 * 演算付代入式ダンプ
	 * */
	public void dumpAssignOp(JCAssignOp assignOp, PrintWriter out, int offset){

		tprintln(out, offset, "<AssignOp>\n");
		//tprint(out, offset, assignOp.toString());
		tprintln(out, offset+1, "<assignOperator> => "+assignOp.getTag()+"	"+assignOp.getOperator()+"\n\n");
		dumpExpression(assignOp.getExpression(), out, offset+1);	//右辺
		tprintln(out, offset, "\n");
		dumpExpression(assignOp.getVariable(), out, offset+1);	//左辺
		tprintln(out, offset, "</AssignOp>\n");
	}

	/**
	 * 単項演算式ダンプ
	 * */
	public void dumpUnary(JCUnary unary, PrintWriter out, int offset){

		tprintln(out, offset, "<Unary>\n");
		//tprint(out, offset, unary.toString());
		tprintln(out, offset+1, "<UnaryOp> => "+unary.getTag()+"	"+unary.getOperator()+"\n\n");
		dumpExpression(unary.getExpression(), out, offset+1);	//左式
		tprintln(out, offset, "</Unary>\n");
	}

	/**
	 * 2項演算式ダンプ
	 * */
	public void dumpBinary(JCBinary binary, PrintWriter out, int offset){

		tprintln(out, offset, "<Binary>\n");
		//tprint(out, offset, binary.toString());
		tprintln(out, offset+1, "<BinaryOp> => "+binary.getTag()+"	"+binary.getOperator()+"\n\n");
		dumpExpression(binary.getLeftOperand(), out, offset+1);	//左式
		tprintln(out, offset+1, "\n");
		dumpExpression(binary.getRightOperand(), out, offset+1);	//右式
		tprintln(out, offset, "</Binary>\n");
	}

	/**
	 * キャスト式ダンプ
	 * */
	public void dumpTypeCast(JCTypeCast typeCast, PrintWriter out, int offset){

		tprintln(out, offset, "<TypeCast>\n");
		//tprint(out, offset, binary.toString());
		tprintln(out, offset+1, "<CastType> => "+typeCast.getType()+"\n\n");
		dumpExpression(typeCast.getExpression(), out, offset+1);	//キャストする式
		tprintln(out, offset, "</TypeCast>\n");
	}

	/**
	 *配列アクセスダンプ
	 * */
	public void dumpArrayAccess(JCArrayAccess arrayAccess, PrintWriter out, int offset){

		tprintln(out, offset, "<ArrayAccess>\n");
		//tprint(out, offset, arrayAccess.toString());
		tprintln(out, offset+1, "<Index>\n");
		dumpExpression(arrayAccess.getIndex(), out, offset+2);	//インデックス式
		tprintln(out, offset+1, "</Index>\n\n");
		dumpExpression(arrayAccess.getExpression(), out, offset+1); //インデックスの左側
		tprintln(out, offset, "</ArrayAccess>\n");
	}

	/**
	 * フィールドアクセスダンプ
	 * */
	public void dumpFieldAccess(JCFieldAccess fieldAccess, PrintWriter out, int offset){

		tprintln(out, offset, "<FieldAccess>	"+fieldAccess+"\n");
		//tprint(out, offset,  fieldAccess.toString());
		tprintln( out, offset+1, "<fieldIdentifier>\n");
		tprintln( out, offset+2, fieldAccess.getIdentifier()+"\n".toString()); //変数名
		tprintln( out, offset+1, "</fieldIdentifier>\n");
		dumpExpression(fieldAccess.getExpression(), out, offset+1); //変数名の左側
		tprintln(out, offset, "</FieldAccess>\n");
	}

	/**
	 * identifier ダンプ
	 * */
	public void dumpIdent(JCIdent ident, PrintWriter out, int offset){

		tprintln(out, offset, "<Ident>\n");
		//tprint(out, offset,  ident.toString());
		tprintln( out, offset+2, ident.getName()+"\n".toString()); //変数名
		tprintln(out, offset, "</Ident>\n");
	}

	/**
	 * 	リテラルダンプ
	 * */
	public void dumpLiteral(JCLiteral literal, PrintWriter out, int offset){

		tprintln(out, offset, "<Literal>\n");
		//tprint(out, offset,  ident.toString());
		tprintln( out, offset+1, "<type> => "+literal.type+"\n"); //型
		tprintln( out, offset+1, "<value> => "+literal.value+"\n"); //値
		tprintln(out, offset, "</Literal>\n");
	}

	/**
	 * プリミティブ型ダンプ
	 * */
	public void dumpPrimitiveTypeTree(JCPrimitiveTypeTree primitive, PrintWriter out, int offset){
		tprintln(out, offset, "<PrimitiveTypeTree>\n");
		tprintln( out, offset+1, "<type> => "+primitive.type+"\n");
		tprintln(out, offset, "</PrimitiveTypeTree>\n");
	}

	public void dumpArrayTypeTree(JCArrayTypeTree arrayPrimitive, PrintWriter out, int offset){
		tprintln(out, offset, "<ArrayTypeTree>\n");
		tprintln( out, offset+1, "<type> => "+arrayPrimitive.type+"\n");
		dumpExpression(arrayPrimitive.elemtype, out, offset+1); //変数名の左側
		tprintln(out, offset, "</ArrayTypeTree>\n");
	}
}