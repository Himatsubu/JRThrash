package net.njlab.model;

import java.util.ArrayList;

/**
 *  @author Keisuke Koike
 */
public class VerilogScope {

	//if や for 等のブロック開始前に宣言された変数
	public ArrayList<VerilogVariableDecl> variableStack = new ArrayList<VerilogVariableDecl>();
}
