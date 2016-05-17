package net.njlab.dfg;


import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.VerilogBinaryExpression;
import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignalString;
import net.njlab.circuit.VerilogWire;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.ipcore.AddFloat;
import net.njlab.ipcore.AddInt;
import net.njlab.ipcore.CompareFloatLT;
import net.njlab.ipcore.CompareIntLT;
import net.njlab.ipcore.DivFloat;
import net.njlab.ipcore.DivInt;
import net.njlab.ipcore.MultFloat;
import net.njlab.ipcore.MultInt;
import net.njlab.ipcore.VerilogIPcore;
import net.njlab.model.VerilogBinary;
import net.njlab.model.VerilogVariableDecl;
import net.njlab.scheduling.SchedulingListSet;
import net.njlab.dump.*;

/**
 *  @author Keisuke Koike
 */
public class DFGraphBinary extends DFGraphNode{

	String opString;
	DFGraphNode leftNode, rightNode;//srcNode
	VerilogIPcore assignedIPcore = null;
	private VerilogWire binaryOpResult = null;	//2項演算の結果を assign する wire
	private boolean binaryOpResultIsReplaced = false;	//binaryOpResult がwire最適化により置き換えられた場合, binaryOpResultを変更してはいけない

	public DFGraphBinary(DFGraphNode leftNode, DFGraphNode rightNode, String opString,int destType){

		leftNode.addDestNode(this);
		rightNode.addDestNode(this);
		this.destType = destType;
		this.opString = opString;
		this.leftNode = leftNode;
		this.rightNode = rightNode;
		if(opString.compareTo(VerilogBinary.LT)==0 || opString.compareTo(VerilogBinary.EQ)==0 || opString.compareTo(VerilogBinary.NE)==0){
			this.destType = DFGraphNode.destTypeBoolean;
		}
	}

	@Override
	public void replaceSrcNode(DFGraphNode popNode, DFGraphNode pushNode){

		if(leftNode==popNode){
			leftNode = pushNode;
			leftNode.addDestNode(this);
		}
		if(rightNode==popNode){
			rightNode = pushNode;
			rightNode.addDestNode(this);
		}
	}

	@Override
	public void dumpNode(PrintWriter wout, int offset){

		String tmpOpString = opString;
		if(opString.compareTo("<")==0)
			tmpOpString = "LT";
		else if(opString.compareTo(">")==0)
			tmpOpString = "GT";
		else if(opString.compareTo("<=")==0)
			tmpOpString = "LE";
		else if(opString.compareTo(">=")==0)
			tmpOpString = "GE";
		else if(opString.compareTo("<<")==0)
			tmpOpString = "SL";
		else if(opString.compareTo(">>")==0)
			tmpOpString = "SR";
		else if(opString.compareTo(">>")==0)
			tmpOpString = "USR";
		else if(opString.compareTo("&")==0)
			tmpOpString = "BITAND";
		else if(opString.compareTo("&&")==0)
			tmpOpString = "AND";

		Dump.tprintln(wout, offset, "<Binary>");
		super.dumpNode(wout, offset+1);
		Dump.tprintln(wout, offset+1, "<op>	"+tmpOpString+"	</op>");
		if(assignedIPcore==null)
			Dump.tprintln(wout, offset+1, "<ipcore>	notUsed	</ipcore>");
		else
			Dump.tprintln(wout, offset+1, "<ipcore>	"+ assignedIPcore.instanceName+"	</ipcore>");
		Dump.tprintln(wout, offset+1, "<leftNode>");
		leftNode.dumpNode(wout, offset+2);
		Dump.tprintln(wout, offset+1, "</leftNode>\n");
		Dump.tprintln(wout, offset+1, "<rightNode>");
		rightNode.dumpNode(wout, offset+2);
		Dump.tprintln(wout, offset+1, "</rightNode>");
		Dump.tprintln(wout, offset+1, "<component><!--"+Dump.translateHTML(constructComponentString())+"--></component>");
		Dump.tprintln(wout, offset, "</Binary>");
	}

	private String constructComponentString(){

		if( assignedIPcore == null ){
			return "		verilog operator : "+opString+"	";
		}
		else{
			return "		IPcore : "+assignedIPcore.getInstanceName()+"	";
		}
	}


	private void constantMultCheck(boolean[] optContinueFlag, Config config){

		DFGraphLiteral oldLiteral=null;
		DFGraphNode oldNode=null;

		if(leftNode instanceof DFGraphLiteral){
			oldLiteral = (DFGraphLiteral)leftNode;
			oldNode = rightNode;
		}
		else if(rightNode instanceof DFGraphLiteral){
			oldLiteral = (DFGraphLiteral)rightNode;
			oldNode = leftNode;
		}
		else
			return;

		//×0, ×1 を調べる
		if(oldLiteral.destType==DFGraphNode.destTypeInt){
			if(oldLiteral.inum==0){
				replaceNode(oldLiteral);
				optContinueFlag[0] = true;;
			}
			else if(oldLiteral.inum==1){
				replaceNode(oldNode);
				optContinueFlag[0] = true;
			}
		}
		else if(oldLiteral.destType==DFGraphNode.destTypeFloating){
			if(config.floatingType==Config.singleType){
				if(oldLiteral.fnum==0.0f){
					replaceNode(oldLiteral);
					optContinueFlag[0] = true;
				}
				else if(oldLiteral.fnum==1.0f){
					replaceNode(oldNode);
					optContinueFlag[0] = true;
				}
			}
			else if(config.floatingType==Config.doubleType){
				if(oldLiteral.dnum==0.0){
					replaceNode(oldLiteral);
					optContinueFlag[0] = true;
				}
				else if(oldLiteral.dnum==1.0){
					replaceNode(oldNode);
					optContinueFlag[0] = true;
				}
			}
		}
		else if(oldLiteral.destType==DFGraphNode.destTypeLong){
			if(oldLiteral.lnum==0L){
				replaceNode(oldLiteral);
				optContinueFlag[0] = true;
			}
			else if(oldLiteral.lnum==1L){
				replaceNode(oldNode);
				optContinueFlag[0] = true;
			}
		}
	}

	@Override
	public void constantFolding(boolean[] optContinueFlag, Config config){

		leftNode.constantFolding(optContinueFlag, config);
		rightNode.constantFolding(optContinueFlag, config);

		if((leftNode instanceof DFGraphLiteral) && (rightNode instanceof DFGraphLiteral)){
			DFGraphLiteral oldLeftLiteral = (DFGraphLiteral)leftNode;
			DFGraphLiteral oldRightLiteral = (DFGraphLiteral)rightNode;

			if(oldLeftLiteral.type.compareTo(oldRightLiteral.type)!=0)
				System.out.println("DEBUG:	error DFGraphBinary constantFilding error");

			if(opString.compareTo(VerilogBinary.OR)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum, oldLeftLiteral.lnum,
												oldLeftLiteral.fnum, oldLeftLiteral.dnum, oldLeftLiteral.bool || oldRightLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.AND)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum, oldLeftLiteral.lnum,
												oldLeftLiteral.fnum, oldLeftLiteral.dnum, oldLeftLiteral.bool && oldRightLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.BITOR)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum|oldRightLiteral.inum, oldLeftLiteral.lnum|oldRightLiteral.lnum,
												oldLeftLiteral.fnum, oldLeftLiteral.dnum, oldLeftLiteral.bool|oldRightLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.BITAND)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum&oldRightLiteral.inum, oldLeftLiteral.lnum&oldRightLiteral.lnum,
												oldLeftLiteral.fnum, oldLeftLiteral.dnum, oldLeftLiteral.bool&oldRightLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.BITXOR)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum^oldRightLiteral.inum, oldLeftLiteral.lnum^oldRightLiteral.lnum,
												oldLeftLiteral.fnum, oldLeftLiteral.dnum, oldLeftLiteral.bool^oldRightLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.EQ)==0){
				boolean boolLiteral = calcEQliteral(oldLeftLiteral, oldRightLiteral);
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.booleanType, 0, 0, 0, 0, boolLiteral));
			}
			else if(opString.compareTo(VerilogBinary.NE)==0){
				boolean boolLiteral = calcNEliteral(oldLeftLiteral, oldRightLiteral);
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.booleanType, 0, 0, 0, 0, boolLiteral));
			}
			else if(opString.compareTo(VerilogBinary.LT)==0){
				boolean boolLiteral = calcLTliteral(oldLeftLiteral, oldRightLiteral);
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.booleanType, 0, 0, 0, 0, boolLiteral));
			}
			else if(opString.compareTo(VerilogBinary.LE)==0){
				boolean boolLiteral = calcLEliteral(oldLeftLiteral, oldRightLiteral);
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.booleanType, 0, 0, 0, 0, boolLiteral));
			}
			else if(opString.compareTo(VerilogBinary.GT)==0){
				boolean boolLiteral = calcGTliteral(oldLeftLiteral, oldRightLiteral);
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.booleanType, 0, 0, 0, 0, boolLiteral));
			}
			else if(opString.compareTo(VerilogBinary.GE)==0){
				boolean boolLiteral = calcGEliteral(oldLeftLiteral, oldRightLiteral);
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.booleanType, 0, 0, 0, 0, boolLiteral));
			}
			else if(opString.compareTo(VerilogBinary.SL)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum<<oldRightLiteral.inum, oldLeftLiteral.lnum<<oldRightLiteral.lnum,
												oldLeftLiteral.fnum, oldLeftLiteral.dnum, oldLeftLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.SR)==0){//?? 用検証
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum>>oldRightLiteral.inum, oldLeftLiteral.lnum>>oldRightLiteral.lnum,
												oldLeftLiteral.fnum, oldLeftLiteral.dnum, oldLeftLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.USR)==0){//?? 用検証
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum>>>oldRightLiteral.inum, oldLeftLiteral.lnum>>>oldRightLiteral.lnum,
												oldLeftLiteral.fnum, oldLeftLiteral.dnum, oldLeftLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.PLUS)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum+oldRightLiteral.inum, oldLeftLiteral.lnum+oldRightLiteral.lnum,
												oldLeftLiteral.fnum+oldRightLiteral.fnum, oldLeftLiteral.dnum+oldRightLiteral.dnum, oldLeftLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.MINUS)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum-oldRightLiteral.inum, oldLeftLiteral.lnum-oldRightLiteral.lnum,
												oldLeftLiteral.fnum-oldRightLiteral.fnum, oldLeftLiteral.dnum-oldRightLiteral.dnum, oldLeftLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.MUL)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum*oldRightLiteral.inum, oldLeftLiteral.lnum*oldRightLiteral.lnum,
												oldLeftLiteral.fnum*oldRightLiteral.fnum, oldLeftLiteral.dnum*oldRightLiteral.dnum, oldLeftLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.DIV)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum/(oldRightLiteral.inum==0 ? 1 : oldRightLiteral.inum),//0割例外対策
												oldLeftLiteral.lnum/(oldRightLiteral.lnum==0L ? 1L : oldRightLiteral.lnum),
												oldLeftLiteral.fnum/oldRightLiteral.fnum, oldLeftLiteral.dnum/oldRightLiteral.dnum, oldLeftLiteral.bool));
			}
			else if(opString.compareTo(VerilogBinary.MOD)==0){
				replaceNode( new DFGraphLiteral(oldLeftLiteral.type, oldLeftLiteral.inum%(oldRightLiteral.inum==0 ? 1 : oldRightLiteral.inum),
												oldLeftLiteral.lnum%(oldRightLiteral.lnum==0L ? 1L : oldRightLiteral.lnum),
												oldLeftLiteral.fnum%oldRightLiteral.fnum, oldLeftLiteral.dnum%oldRightLiteral.dnum, oldLeftLiteral.bool));
			}
			else{
				System.out.println("DEBUG:	error DFGraphBinary cinstntfolding");
			}
			optContinueFlag[0] = true;
			return;
		}

		if(opString.compareTo(VerilogBinary.MUL)==0)
			constantMultCheck(optContinueFlag, config);
		return;
	}

	private boolean calcEQliteral(DFGraphLiteral oldLeftLiteral, DFGraphLiteral oldRightLiteral){
		if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.floatType)==0){
			return oldLeftLiteral.fnum==oldRightLiteral.fnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.doubleType)==0){
			return oldLeftLiteral.dnum==oldRightLiteral.dnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.longType)==0){
			return oldLeftLiteral.lnum==oldRightLiteral.lnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.intType)==0){
			return oldLeftLiteral.inum==oldRightLiteral.inum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.booleanType)==0){
			return oldLeftLiteral.bool==oldRightLiteral.bool;
		}
		System.out.println("DEBUG:	error DFGraphBinary calcEQliteral");
		return false;
	}

	private boolean calcNEliteral(DFGraphLiteral oldLeftLiteral, DFGraphLiteral oldRightLiteral){
		if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.floatType)==0){
			return oldLeftLiteral.fnum!=oldRightLiteral.fnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.doubleType)==0){
			return oldLeftLiteral.dnum!=oldRightLiteral.dnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.longType)==0){
			return oldLeftLiteral.lnum!=oldRightLiteral.lnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.intType)==0){
			return oldLeftLiteral.inum!=oldRightLiteral.inum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.booleanType)==0){
			return oldLeftLiteral.bool!=oldRightLiteral.bool;
		}
		System.out.println("DEBUG:	error DFGraphBinary calcNEliteral");
		return false;
	}

	private boolean calcLTliteral(DFGraphLiteral oldLeftLiteral, DFGraphLiteral oldRightLiteral){
		if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.floatType)==0){
			return oldLeftLiteral.fnum<oldRightLiteral.fnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.doubleType)==0){
			return oldLeftLiteral.dnum<oldRightLiteral.dnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.longType)==0){
			return oldLeftLiteral.lnum<oldRightLiteral.lnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.intType)==0){
			return oldLeftLiteral.inum<oldRightLiteral.inum;
		}
		System.out.println("DEBUG:	error DFGraphBinary calcLTliteral");
		return false;
	}

	private boolean calcGTliteral(DFGraphLiteral oldLeftLiteral, DFGraphLiteral oldRightLiteral){
		if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.floatType)==0){
			return oldLeftLiteral.fnum>oldRightLiteral.fnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.doubleType)==0){
			return oldLeftLiteral.dnum>oldRightLiteral.dnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.longType)==0){
			return oldLeftLiteral.lnum>oldRightLiteral.lnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.intType)==0){
			return oldLeftLiteral.inum>oldRightLiteral.inum;
		}
		System.out.println("DEBUG:	error DFGraphBinary calcGTliteral");
		return false;
	}

	private boolean calcLEliteral(DFGraphLiteral oldLeftLiteral, DFGraphLiteral oldRightLiteral){
		if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.floatType)==0){
			return oldLeftLiteral.fnum<=oldRightLiteral.fnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.doubleType)==0){
			return oldLeftLiteral.dnum<=oldRightLiteral.dnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.longType)==0){
			return oldLeftLiteral.lnum<=oldRightLiteral.lnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.intType)==0){
			return oldLeftLiteral.inum<=oldRightLiteral.inum;
		}
		System.out.println("DEBUG:	error DFGraphBinary calcLEliteral");
		return false;
	}

	private boolean calcGEliteral(DFGraphLiteral oldLeftLiteral, DFGraphLiteral oldRightLiteral){
		if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.floatType)==0){
			return oldLeftLiteral.fnum>=oldRightLiteral.fnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.doubleType)==0){
			return oldLeftLiteral.dnum>=oldRightLiteral.dnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.longType)==0){
			return oldLeftLiteral.lnum>=oldRightLiteral.lnum;
		}
		else if(oldLeftLiteral.type.compareTo(VerilogVariableDecl.intType)==0){
			return oldLeftLiteral.inum>=oldRightLiteral.inum;
		}
		System.out.println("DEBUG:	error DFGraphBinary calcGEliteral");
		return false;
	}


	/**
	 * (num1 - ?) - num0  ->  (num1-num0) - ?  のような DFG の親子ノードをまたいだ最適化を行う<br>
	 * 例 : (10 - x) -20 = -10 - x
	 * */
	@Override
	public void constantFoldingForBinarySequence(boolean[] foldingHappend){

		if(opString.compareTo(VerilogBinary.PLUS)==0){
			addFolding(foldingHappend);
		}
		else if(opString.compareTo(VerilogBinary.MINUS)==0){
			subFolding(foldingHappend);
		}
		else if(opString.compareTo(VerilogBinary.DIV)==0){
			divFolding(foldingHappend);
		}
		else if(opString.compareTo(VerilogBinary.MUL)==0){
			mulFolding(foldingHappend);
		}
		leftNode.constantFoldingForBinarySequence(foldingHappend);
		rightNode.constantFoldingForBinarySequence(foldingHappend);
	}

	private void addFolding(boolean[] foldingHappend){

		DFGraphBinary changedBinaryNode = null;	//定数が畳み込まれる DFGbinary ノード
		DFGraphLiteral foldedThisLiteral;
		boolean foldHappenInThisNode = false;

		if(leftNode instanceof DFGraphBinary && rightNode instanceof DFGraphLiteral){ // binaryNode + num0

			changedBinaryNode = (DFGraphBinary)leftNode;
			foldedThisLiteral = (DFGraphLiteral)rightNode;
			foldHappenInThisNode = addFoldingToChildBinaryNode(changedBinaryNode, foldedThisLiteral);
		}
		else if(leftNode instanceof DFGraphLiteral && rightNode instanceof DFGraphBinary){ // num0 + binaryNode

			changedBinaryNode = (DFGraphBinary)rightNode;
			foldedThisLiteral = (DFGraphLiteral)leftNode;
			foldHappenInThisNode = addFoldingToChildBinaryNode(changedBinaryNode, foldedThisLiteral);
		}

		foldingHappend[0] |= foldHappenInThisNode;
		if(foldHappenInThisNode)
			replaceNode(changedBinaryNode);//このノードはもう不要なので，このノードを src とするノードに  子binary (childBinaryNode) ノードを参照させる
	}

	private void subFolding(boolean[] foldingHappend){

		DFGraphBinary changedBinaryNode = null;	//定数が畳み込まれる DFGbinary ノード
		DFGraphLiteral foldedThisLiteral;
		boolean foldHappenInThisNode = false;

		if(leftNode instanceof DFGraphBinary && rightNode instanceof DFGraphLiteral){ // binaryNode - num0

			changedBinaryNode = (DFGraphBinary)leftNode;
			foldedThisLiteral = (DFGraphLiteral)rightNode;
			foldHappenInThisNode = subFoldingToLeftChildBinaryNode(changedBinaryNode, foldedThisLiteral);

		}
		else if(leftNode instanceof DFGraphLiteral && rightNode instanceof DFGraphBinary){ // num0 - binaryNode

			changedBinaryNode = (DFGraphBinary)rightNode;
			foldedThisLiteral = (DFGraphLiteral)leftNode;
			foldHappenInThisNode = subFoldingToRightChildBinaryNode(changedBinaryNode, foldedThisLiteral);
		}

		foldingHappend[0] |= foldHappenInThisNode;
		if(foldHappenInThisNode)
			replaceNode(changedBinaryNode);//このノードはもう不要なので，このノードを src とするノードに  子binary (childBinaryNode) ノードを参照させる
	}


	/**
	 * binary + num0   又は    num0 + binary を処理する
	 * */
	private boolean addFoldingToChildBinaryNode(DFGraphBinary changedChildBinaryNode, DFGraphLiteral foldedChildLiteral){// binaryNode + num0 を処理

		DFGraphLiteral childBinaryChildLiteral = null;
		boolean retVal = false;
		int inum;
		long lnum;
		float fnum;
		double dnum;

		if(changedChildBinaryNode.opString.compareTo(VerilogBinary.PLUS) == 0){	// (? + ?) + num0    又は   num0 + (? + ?)

			if(changedChildBinaryNode.leftNode instanceof DFGraphLiteral){	// (num1 + ?) + num0 -> (num1+num0) + ?   又は   num0 + (num1 + ?)  -> (num1+num0) + ?
				childBinaryChildLiteral = (DFGraphLiteral)(changedChildBinaryNode.leftNode);
			}
			else if(changedChildBinaryNode.rightNode instanceof DFGraphLiteral){	// (? + num1) + num0 -> ? + (num1+num0)  又は   num0 + (? + num1) -> ? + (num1+num0)
				childBinaryChildLiteral = (DFGraphLiteral)(changedChildBinaryNode.rightNode);
			}

			if(childBinaryChildLiteral!=null){

				inum = childBinaryChildLiteral.inum + foldedChildLiteral.inum;
				lnum = childBinaryChildLiteral.lnum + foldedChildLiteral.lnum;
				fnum = childBinaryChildLiteral.fnum + foldedChildLiteral.fnum;
				dnum = childBinaryChildLiteral.dnum + foldedChildLiteral.dnum;
				childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
				retVal = true;
			}
		}
		else if(changedChildBinaryNode.opString.compareTo(VerilogBinary.MINUS) == 0){	// (? - ?) + num0   又は   num0 + (? - ?)

			if(changedChildBinaryNode.leftNode instanceof DFGraphLiteral){	// (num1 - ?) + num0 -> (num1+num0) - ?   又は    num0 + (num1 - ?)  -> (num1+num0) - ?

				childBinaryChildLiteral = (DFGraphLiteral)(changedChildBinaryNode.leftNode);
				inum = childBinaryChildLiteral.inum + foldedChildLiteral.inum;
				lnum = childBinaryChildLiteral.lnum + foldedChildLiteral.lnum;
				fnum = childBinaryChildLiteral.fnum + foldedChildLiteral.fnum;
				dnum = childBinaryChildLiteral.dnum + foldedChildLiteral.dnum;
				childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
				retVal = true;
			}
			else if(changedChildBinaryNode.rightNode instanceof DFGraphLiteral){	// (? - num1) + num0 -> ? - (num1-num0)   又は   num0 + (? - num1) -> ? - (num1-num0)

				childBinaryChildLiteral = (DFGraphLiteral)(changedChildBinaryNode.rightNode);
				inum = childBinaryChildLiteral.inum - foldedChildLiteral.inum;
				lnum = childBinaryChildLiteral.lnum - foldedChildLiteral.lnum;
				fnum = childBinaryChildLiteral.fnum - foldedChildLiteral.fnum;
				dnum = childBinaryChildLiteral.dnum - foldedChildLiteral.dnum;
				childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
				retVal = true;
			}
		}

		if(retVal)
			if(childBinaryChildLiteral.type.compareTo(foldedChildLiteral.type) != 0)
				System.out.println("DEBUG:	check addFoldingToChild");

		return retVal;
	}

	/**
	 * binary - num0 を処理する
	 * */
	private boolean subFoldingToLeftChildBinaryNode(DFGraphBinary changedLeftBinary, DFGraphLiteral foldedRightLiteral){

		DFGraphLiteral childBinaryChildLiteral = null;
		boolean retVal = false;
		int inum;
		long lnum;
		float fnum;
		double dnum;

		if( changedLeftBinary.opString.compareTo(VerilogBinary.PLUS) == 0 ){	// (? + ?) - num0

			if(changedLeftBinary.leftNode instanceof DFGraphLiteral){	//(num1 + ?) - num0  ->  (num1-num0) + ?
				childBinaryChildLiteral = (DFGraphLiteral)changedLeftBinary.leftNode;
			}
			else if(changedLeftBinary.rightNode instanceof DFGraphLiteral){	//(? + num1) - num0  ->  ? + (num1-num0)
				childBinaryChildLiteral = (DFGraphLiteral)changedLeftBinary.rightNode;
			}

			if(childBinaryChildLiteral!=null){

				inum = childBinaryChildLiteral.inum - foldedRightLiteral.inum;
				lnum = childBinaryChildLiteral.lnum - foldedRightLiteral.lnum;
				fnum = childBinaryChildLiteral.fnum - foldedRightLiteral.fnum;
				dnum = childBinaryChildLiteral.dnum - foldedRightLiteral.dnum;
				childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
				retVal = true;
			}
		}
		else if( changedLeftBinary.opString.compareTo(VerilogBinary.MINUS) == 0){	// (? - ?) - num0

			if(changedLeftBinary.leftNode instanceof DFGraphLiteral){	//(num1 - ?) - num0  ->  (num1-num0) - ?

				childBinaryChildLiteral = (DFGraphLiteral)changedLeftBinary.leftNode;
				inum = childBinaryChildLiteral.inum - foldedRightLiteral.inum;
				lnum = childBinaryChildLiteral.lnum - foldedRightLiteral.lnum;
				fnum = childBinaryChildLiteral.fnum - foldedRightLiteral.fnum;
				dnum = childBinaryChildLiteral.dnum - foldedRightLiteral.dnum;
				childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
				retVal = true;
			}
			else if(changedLeftBinary.rightNode instanceof DFGraphLiteral){	//(? - num1) - num0  ->  ? - (num1+num0)

				childBinaryChildLiteral = (DFGraphLiteral)changedLeftBinary.rightNode;
				inum = childBinaryChildLiteral.inum + foldedRightLiteral.inum;
				lnum = childBinaryChildLiteral.lnum + foldedRightLiteral.lnum;
				fnum = childBinaryChildLiteral.fnum + foldedRightLiteral.fnum;
				dnum = childBinaryChildLiteral.dnum + foldedRightLiteral.dnum;
				childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
				retVal = true;
			}
		}

		if(retVal)
			if(childBinaryChildLiteral.type.compareTo(foldedRightLiteral.type) != 0)
				System.out.println("DEBUG:	check subFoldingToLeftChild");

		return retVal;
	}

	/**
	 * num0 - binary を処理する
	 * */
	private boolean subFoldingToRightChildBinaryNode(DFGraphBinary changedRightBinary, DFGraphLiteral foldedLeftLiteral){

		DFGraphLiteral childBinaryChildLiteral = null;
		boolean retVal = false;
		int inum;
		long lnum;
		float fnum;
		double dnum;

		if( changedRightBinary.opString.compareTo(VerilogBinary.PLUS) == 0 ){	// num0 - (? + ?)

			if(changedRightBinary.leftNode instanceof DFGraphLiteral){	//num0 - (num1 + ?) ->  (num0-num1) - ?
				childBinaryChildLiteral = (DFGraphLiteral)changedRightBinary.leftNode;
			}
			else if(changedRightBinary.rightNode instanceof DFGraphLiteral){	//  num0 - (? + num1) ->  num0 - (num1 + ?)  ->  (num0-num1) - ?

				//子binary ノードの左右ノード入れ替え
				swapLeftRightNode(changedRightBinary);
				childBinaryChildLiteral = (DFGraphLiteral)changedRightBinary.leftNode;
			}

			if(childBinaryChildLiteral!=null){

				inum = foldedLeftLiteral.inum - childBinaryChildLiteral.inum;
				lnum = foldedLeftLiteral.lnum - childBinaryChildLiteral.lnum;
				fnum = foldedLeftLiteral.fnum - childBinaryChildLiteral.fnum;
				dnum = foldedLeftLiteral.dnum - childBinaryChildLiteral.dnum;
				childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
				changedRightBinary.opString = VerilogBinary.MINUS;	//子binary演算変更
				retVal = true;
			}
		}
		else if(changedRightBinary.opString.compareTo(VerilogBinary.MINUS) == 0){	// num0 - (? - ?)

			if(changedRightBinary.leftNode instanceof DFGraphLiteral){	// num0 - (num1 - ?) -> (num0-num1) + ?

				childBinaryChildLiteral = (DFGraphLiteral)changedRightBinary.leftNode;
				inum = foldedLeftLiteral.inum - childBinaryChildLiteral.inum;
				lnum = foldedLeftLiteral.lnum - childBinaryChildLiteral.lnum;
				fnum = foldedLeftLiteral.fnum - childBinaryChildLiteral.fnum;
				dnum = foldedLeftLiteral.dnum - childBinaryChildLiteral.dnum;
				childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
				changedRightBinary.opString = VerilogBinary.PLUS;	//子binary演算変更
				retVal = true;
			}
			else if(changedRightBinary.rightNode instanceof DFGraphLiteral){	// num0 - (? - num1) -> num0 - (num1 - ?) -> (num0+num1) - ?

				//子binary ノードの左右ノード入れ替え
				swapLeftRightNode(changedRightBinary);
				childBinaryChildLiteral = (DFGraphLiteral)changedRightBinary.leftNode;

				inum = foldedLeftLiteral.inum + childBinaryChildLiteral.inum;
				lnum = foldedLeftLiteral.lnum + childBinaryChildLiteral.lnum;
				fnum = foldedLeftLiteral.fnum + childBinaryChildLiteral.fnum;
				dnum = foldedLeftLiteral.dnum + childBinaryChildLiteral.dnum;
				childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
				retVal = true;
			}
		}

		if(retVal)
			if(childBinaryChildLiteral.type.compareTo(foldedLeftLiteral.type) != 0)
				System.out.println("DEBUG:	check subFoldingToRightChild");

		return retVal;
	}

	private void swapLeftRightNode(DFGraphBinary binaryNode){

		DFGraphNode tmp = binaryNode.rightNode;
		binaryNode.rightNode = binaryNode.leftNode;
		binaryNode.leftNode = tmp;
	}

	/**
	 *    (? / num1) / num0   ->  ? / (num1*num0)
	 * */
	private void divFolding(boolean[] foldingHappend){

		if((leftNode instanceof DFGraphBinary)  &&  (rightNode instanceof DFGraphLiteral)){

			DFGraphBinary childBinaryNode = (DFGraphBinary)leftNode;
			DFGraphLiteral foldedRightLiteral = (DFGraphLiteral)rightNode;

			if((childBinaryNode.opString.compareTo(VerilogBinary.DIV)==0) && (childBinaryNode.rightNode instanceof DFGraphLiteral)){

				DFGraphLiteral childBinaryChildLiteral = (DFGraphLiteral)childBinaryNode.rightNode;

				int    inum = foldedRightLiteral.inum * childBinaryChildLiteral.inum;
				long   lnum = foldedRightLiteral.lnum * childBinaryChildLiteral.lnum;
				float  fnum = foldedRightLiteral.fnum * childBinaryChildLiteral.fnum;
				double dnum = foldedRightLiteral.dnum * childBinaryChildLiteral.dnum;
				childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
				replaceNode(childBinaryNode);	//このノードはもう不要なので，このノードを src とするノードに  子binary (childBinaryNode) ノードを参照させる
				foldingHappend[0] = true;

				if(childBinaryChildLiteral.type.compareTo(foldedRightLiteral.type)!=0)
					System.out.println("DEBUG:	check divFolding");
			}
		}
	}

	/**
	 *    (? * num1) * num0   ->  ? * (num1*num0)
	 * */
	private void mulFolding(boolean[] foldingHappend){

		DFGraphBinary childBinaryNode = null;
		DFGraphLiteral foldedChildLiteral = null;
		DFGraphLiteral childBinaryChildLiteral = null;

		if((leftNode instanceof DFGraphBinary)  &&  (rightNode instanceof DFGraphLiteral)){	//binary * num0

			foldedChildLiteral = (DFGraphLiteral)rightNode;
			childBinaryNode = (DFGraphBinary)leftNode;
		}
		else if((leftNode instanceof DFGraphLiteral)  &&  (rightNode instanceof DFGraphBinary)){	//num0 * binary

			foldedChildLiteral = (DFGraphLiteral)leftNode;
			childBinaryNode = (DFGraphBinary)rightNode;
		}

		if(childBinaryNode!=null){
			if(childBinaryNode.opString.compareTo(VerilogBinary.MUL)==0){

				if(childBinaryNode.leftNode instanceof DFGraphLiteral){	// (num1 * ?) * num0     又は    num0 * (num1 * ?)
					childBinaryChildLiteral = (DFGraphLiteral)childBinaryNode.leftNode;
				}
				else if(childBinaryNode.rightNode instanceof DFGraphLiteral){	// (? * num1) * num0     又は    num0 * (? * num1)
					childBinaryChildLiteral = (DFGraphLiteral)childBinaryNode.rightNode;
				}
			}
		}

		if((foldedChildLiteral != null)   &&   (childBinaryChildLiteral != null)){

			int    inum = foldedChildLiteral.inum * childBinaryChildLiteral.inum;
			long   lnum = foldedChildLiteral.lnum * childBinaryChildLiteral.lnum;
			float  fnum = foldedChildLiteral.fnum * childBinaryChildLiteral.fnum;
			double dnum = foldedChildLiteral.dnum * childBinaryChildLiteral.dnum;
			childBinaryChildLiteral.replaceNode( new DFGraphLiteral(childBinaryChildLiteral.type, inum, lnum, fnum, dnum, true));
			replaceNode(childBinaryNode);	//このノードはもう不要なので，このノードを src とするノードに  子binary (childBinaryNode) ノードを参照させる
			foldingHappend[0] = true;

			if(childBinaryChildLiteral.type.compareTo(foldedChildLiteral.type)!=0)
				System.out.println("DEBUG:	check divFolding");
		}
	}

	@Override
	public DFGraphBinary clone(){

		DFGraphBinary tmp = (DFGraphBinary)super.clone();
		tmp.leftNode = leftNode.clone();
		tmp.leftNode.addDestNode(tmp);
		tmp.rightNode = rightNode.clone();
		tmp.rightNode.addDestNode(tmp);
		tmp.assignedIPcore = null;
		return tmp;
	}

	@Override
	public int countNodeNum(){
		return 1+leftNode.countNodeNum()+rightNode.countNodeNum();
	}

	@Override
	public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag){
		boolean ret = false;
		ret |= leftNode.propagate(propagationNode, optContinueFlag);
		ret |= rightNode.propagate(propagationNode, optContinueFlag);
		return ret;
	}

	@Override
	public void addStatementNode(DFGraphManager parentManager, ArrayList<DFGraphNode> statementNode){
		statementNode.add(this);
		this.parentManager = parentManager;
		leftNode.addStatementNode(parentManager, statementNode);
		rightNode.addStatementNode(parentManager, statementNode);
	}

	@Override
	public void computePriority(int minCntlStp, Config config){	//priorityへの +2  -> IPコアに繋がっているレジスタに代入するステップ + IPコアの出力を一時レジスタに格納するステップ

		if(opString.compareTo(VerilogBinary.PLUS)==0 || opString.compareTo(VerilogBinary.MINUS)==0){
			computeAddSubPriority(config);
		}
		else if(opString.compareTo(VerilogBinary.MUL)==0){
			computeMultPriority(config);
		}
		else if(opString.compareTo(VerilogBinary.DIV)==0 || opString.compareTo(VerilogBinary.MOD)==0){
			computeDivPriority(config);
		}
		else if(opString.compareTo(VerilogBinary.LT)==0){// >=, >, <= はこれまでに < に変換済み
			computeCmpPriority(config);
		}
		else if(opString.compareTo(VerilogBinary.EQ)==0 || opString.compareTo(VerilogBinary.NE)==0){
			useIP = false;
			minNodeOperatingStep = config.compareOpChaining ? 0 : 1;
			destTypeIsReg = config.compareOpChaining ? false : true;
		}
		else if(opString.compareTo(VerilogBinary.BITAND)==0 || opString.compareTo(VerilogBinary.BITOR)==0 || opString.compareTo(VerilogBinary.BITXOR)==0){
			useIP = false;
			minNodeOperatingStep = config.BitOpChaining ? 0 : 1;
			destTypeIsReg = config.BitOpChaining ? false : true;
		}
		else if(opString.compareTo(VerilogBinary.AND)==0 || opString.compareTo(VerilogBinary.OR)==0){
			useIP = false;
			minNodeOperatingStep = config.logicalOpChaining ? 0 : 1;
			destTypeIsReg = config.logicalOpChaining ? false : true;
		}
		else if(opString.compareTo(VerilogBinary.SL)==0 || opString.compareTo(VerilogBinary.SR)==0 || opString.compareTo(VerilogBinary.USR)==0){
			useIP = false;
			minNodeOperatingStep = config.shiftOpChaining ? 0 : 1;
			destTypeIsReg = config.shiftOpChaining ? false : true;
		}
		else{
			System.out.println("DEBUG:	error DFGraphBinary computePriority");
		}
		minCntlStpFromThisNode = minCntlStp + minNodeOperatingStep;
		priority = minCntlStpFromThisNode;
		leftNode.computePriority(minCntlStpFromThisNode, config);
		rightNode.computePriority(minCntlStpFromThisNode, config);
	}

	private void computeAddSubPriority(Config config){

		if(leftNode.destType==DFGraphNode.destTypeFloating){	//floating の加減算
			isFloatOp = true;
			useIP = true;
			destTypeIsReg = config.addFloatChaining ? false : true;
			minNodeOperatingStep = config.addFloatLatency + 1;	//IPコアの入力レジスタに格納する分 +1
			minNodeOperatingStep += config.addFloatChaining ? 0 : 1;	//結果をレジスタに格納する分 +1

		}
		else{	//整数型の加減算
			useIP = config.addIntUseIP ? true : false;
			destTypeIsReg = config.addIntChaining ? false : true;
			minNodeOperatingStep = useIP ? config.addIntLatency +1 : 0;	//IPコアの入力レジスタに格納する分 +1
			minNodeOperatingStep += config.addIntChaining ? 0 : 1;	//結果をレジスタに格納する分 +1
		}
	}

	private void computeMultPriority(Config config){

		if(leftNode.destType==DFGraphNode.destTypeFloating){	//floating の乗算
			isFloatOp = true;
			useIP = true;
			destTypeIsReg = config.multFloatChaining ? false : true;
			minNodeOperatingStep = config.multFloatLatency + 1;	//IPコアの入力レジスタに格納する分 +1
			minNodeOperatingStep += config.multFloatChaining ? 0 : 1;	//結果をレジスタに格納する分 +1
		}
		else{	//整数型の乗算
			useIP = config.multIntUseIP ? true : false;
			destTypeIsReg = config.multIntChaining ? false : true;
			minNodeOperatingStep = useIP ? config.multIntLatency +1 : 0;	//IPコアの入力レジスタに格納する分 +1
			minNodeOperatingStep += config.multIntChaining ? 0 : 1;	//結果をレジスタに格納する分 +1
		}
	}

	private void computeDivPriority(Config config){

		if(leftNode.destType==DFGraphNode.destTypeFloating){	//floating の除算/剰余算
			isFloatOp = true;
			useIP = true;
			destTypeIsReg = config.divFloatChaining ? false : true;
			minNodeOperatingStep = config.divFloatLatency + 1;	//IPコアの入力レジスタに格納する分 +1
			minNodeOperatingStep += config.divFloatChaining ? 0 : 1;	//結果をレジスタに格納する分 +1
		}
		else{	//整数型の除算/剰余算
			useIP = config.divIntUseIP ? true : false;
			destTypeIsReg = config.divIntChaining ? false : true;
			minNodeOperatingStep = useIP ? config.divIntLatency +1 : 0;	//IPコアの入力レジスタに格納する分 +1
			minNodeOperatingStep += config.divIntChaining ? 0 : 1;	//結果をレジスタに格納する分 +1
		}
	}

	private void computeCmpPriority(Config config){

		if(leftNode.destType==DFGraphNode.destTypeFloating){	//floating の比較
			isFloatOp = true;
			useIP = true;
			destTypeIsReg = config.compareOpChaining ? false : true;
			minNodeOperatingStep = config.floatLessThanLatency +1;	//IPコアの入力レジスタに格納する分 +1
			minNodeOperatingStep += config.compareOpChaining ? 0 : 1;	//結果をレジスタに格納する分 +1
		}
		else{	//整数型の比較
			useIP = config.intLessThanUseIP ? true : false;
			destTypeIsReg = config.compareOpChaining ? false : true;
			minNodeOperatingStep = useIP ? config.intLessThanLatency + 1 : 0;	//IPコアの入力レジスタに格納する分 +1
			minNodeOperatingStep += config.compareOpChaining ? 0 : 1;	//結果をレジスタに格納する分 +1
		}
	}

	private boolean isFloatOp=false;
	private boolean useIP=false;

	@Override
	public void assignControlStep(int controlStep, SchedulingListSet listSet){

		if(leftNode.assignState==notAssigned)
			leftNode.assignControlStep(controlStep, listSet);

		if(rightNode.assignState==notAssigned)
			rightNode.assignControlStep(controlStep, listSet);

		if(this.parentManager.parentClass.config.greedyBinary){

			if(rightNode.assignState!=finished && leftNode.assignState==finished)
				++rightNode.priority;

			if(rightNode.assignState==finished && leftNode.assignState!=finished)
				++leftNode.priority;
		}

		//if(impossibleToAssignforALAP(controlStep))	//ALAPスケジューリングの割り当て可能ステップに達していない
		//	return;

		if(leftNode.assignState==finished && rightNode.assignState==finished){	//ソースが割り当て済み
			int startEnableStep = Math.max(getStartEnableStep(leftNode, controlStep) , getStartEnableStep(rightNode, controlStep));
			if(startEnableStep <= controlStep){	//このステップ以前にソースノードの計算が終了している
				assignStepOrEnqueueList(listSet, controlStep);
			}
		}
	}

	private void assignStepOrEnqueueList(SchedulingListSet listSet, int controlStep){

		if(useIP==false){
			startStep = controlStep;
			setEndStep(0, false);	//変更禁止
			assignState = finished;
			return;
		}

		if(opString.compareTo(VerilogBinary.PLUS)==0 || opString.compareTo(VerilogBinary.MINUS)==0){
			if(isFloatOp){	//floatの加減算 => IPコアの割り当て待ち
				listSet.addFloatList.addList(this);
			}
			else{
				listSet.addIntList.addList(this);
			}
		}
		else if(opString.compareTo(VerilogBinary.MUL)==0){
			if(isFloatOp){
				listSet.multFloatList.addList(this);
			}
			else{
				listSet.multIntList.addList(this);
			}
		}
		else if(opString.compareTo(VerilogBinary.DIV)==0 || opString.compareTo(VerilogBinary.MOD)==0){
			if(isFloatOp){
				listSet.DivFloatList.addList(this);
			}
			else{
				listSet.DivIntList.addList(this);
			}
		}
		else if(opString.compareTo(VerilogBinary.LT)==0){// >=, >, <= はこれまでに < に変換済み
			if(isFloatOp){
				listSet.compareFloatList.addList(this);
			}
			else{
				listSet.compareIntList.addList(this);
			}
		}
		assignState = waiting;
	}

	public void setIPcoreAndControlStep(VerilogIPcore ipcore, int controlStep){

		assignedIPcore = ipcore;
		startStep = controlStep;
		setEndStep(ipcore.latency, true);
		assignState = finished;

		//debug
		if(leftNode.assignState==finished && rightNode.assignState==finished){	//ソースが割り当て済み

			int startEnableStep = Math.max(getStartEnableStep(leftNode, controlStep) , getStartEnableStep(rightNode, controlStep));
			if(!(startEnableStep <= controlStep))	//このステップ以前にソースノードの計算が終了していない
				System.out.println("DEBUG:	error DFGraphBinary  setIPcoreAndControlStep");
		}
		else{
			System.out.println("DEBUG:	error DFGraphBinary  setIPcoreAndControlStep.");
		}
	}

	public boolean isLtOperation(){
		if(opString.compareTo(VerilogBinary.LT)==0)
			return true;
		return false;
	}

	public DFGraphNode getLeftNode(){
		return leftNode;
	}

	public DFGraphNode getRightNode(){
		return rightNode;
	}

	public String getOpString(){
		return opString;
	}

	@Override
	public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		String tmpOpString = opString;
		if(tmpOpString.compareTo(VerilogBinary.SR)==0)	//verilog と Java は >> と >>> の機能が逆
			tmpOpString = ">>>";
		else if(tmpOpString.compareTo(VerilogBinary.USR)==0)
			tmpOpString = ">>";


		if(useIP){//IPコア利用

			if(assignedIPcore instanceof AddFloat)
				makeAddFloatAlways(controlStep, (AddFloat)assignedIPcore, methodID, phaseID, stageID);
			else if(assignedIPcore instanceof AddInt)
				makeAddIntAlways(controlStep, (AddInt)assignedIPcore, methodID, phaseID, stageID);
			else if(assignedIPcore instanceof CompareFloatLT)
				makeCmpFloatLTalways(controlStep, (CompareFloatLT)assignedIPcore, methodID, phaseID, stageID);
			else if(assignedIPcore instanceof CompareIntLT)
				makeCmpIntLTalways(controlStep, (CompareIntLT)assignedIPcore, methodID, phaseID, stageID);
			else if(assignedIPcore instanceof DivFloat)
				makeDivFloatAlways(controlStep, (DivFloat)assignedIPcore, methodID, phaseID, stageID);
			else if(assignedIPcore instanceof DivInt)
				makeDivIntAlways(controlStep, (DivInt)assignedIPcore, methodID, phaseID, stageID);
			else if(assignedIPcore instanceof MultFloat)
				makeMultFloatAlways(controlStep, (MultFloat)assignedIPcore, methodID, phaseID, stageID);
			else if(assignedIPcore instanceof MultInt)
				makeMultIntAlways(controlStep, (MultInt)assignedIPcore, methodID, phaseID, stageID);

			makeNewDataAssign(controlStep, methodID, phaseID, stageID);//new data 信号を持つ場合, そのコントロールをする
			//genCodeForRetainTmpRegValue(controlStep);
		}
		else{

			if(checkShiftOp()){
				makeShiftAssign(controlStep, methodID, phaseID, stageID);
				return;
			}

			if(destTypeIsReg){	//IPコア未使用でレジスタ代入

				if(!binaryOpResultIsReplaced){	//最適化により binaryOpResult が別のノードの binaryOpResult を指してるとき, binaryOpResult を変更してはいけない
					if(binaryOpResult==null)
						binaryOpResult = parentManager.parentClass.getTmpSignals().getWire(destSignal.bitWidth, isSignedType());
					binaryOpResult.setAssignExpression(new VerilogBinaryExpression(leftNode.destSignal, rightNode.destSignal, tmpOpString));
				}

				StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);
				VerilogNoneBlockAssign nbAssignExpr = new VerilogNoneBlockAssign((VerilogReg)destSignal, binaryOpResult, endState);
				registerNoneBlockAssign(controlStep, nbAssignExpr, endStep);
				//genCodeForRetainTmpRegValue(controlStep);
			}
			else{	//IPコア未使用でワイヤアサイン
				VerilogBinaryExpression binary = new VerilogBinaryExpression(leftNode.destSignal, rightNode.destSignal, tmpOpString);
				((VerilogWire)destSignal).setAssignExpression(binary);
			}
		}
	}

	private void makeNewDataAssign(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		if(assignedIPcore.newData!=null){

			StateIdentifier newDataHighState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
			StateIdentifier newDataLowState = new StateIdentifier(methodID, phaseID, stageID, startStep+1, false);

			VerilogNoneBlockAssign newDataHigh = new VerilogNoneBlockAssign(assignedIPcore.newData,  parentManager.parentClass.boolTrue, newDataHighState);
			VerilogNoneBlockAssign newDataLow  = new VerilogNoneBlockAssign(assignedIPcore.newData,  parentManager.parentClass.boolFalse, newDataLowState);
			registerNoneBlockAssign(controlStep, newDataHigh, startStep);
			if(assignedIPcore.throughput>=2)	//スループット1の場合, startStep + 1 ステップ目に同時に newData 信号にアクセスする可能性がある -> low にしない
				registerNoneBlockAssign(controlStep, newDataLow, startStep+1);
		}
	}

	private void makeAddFloatAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, AddFloat addFloatIP, int methodID, int phaseID, int stageID){

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);

		VerilogNoneBlockAssign leftAssign = new VerilogNoneBlockAssign(addFloatIP.portA,  leftNode.destSignal, startState);
		VerilogNoneBlockAssign rightAssign = null;

		if(opString.compareTo(VerilogBinary.PLUS)==0){
			rightAssign = new VerilogNoneBlockAssign(addFloatIP.portB, rightNode.destSignal, startState);
		}
		else if(opString.compareTo(VerilogBinary.MINUS)==0){
			String signalName = rightNode.destSignal.getSigName();
			String assignString =  "{ ~"+signalName+"["+(rightNode.destSignal.bitWidth-1)+"], "+signalName+"["+(rightNode.destSignal.bitWidth-2)+":0] }";
			VerilogSignalString rightSignalStr = new VerilogSignalString(assignString, rightNode.destSignal);
			rightAssign = new VerilogNoneBlockAssign(addFloatIP.portB, rightSignalStr, startState);
		}
		registerNoneBlockAssign(controlStep, leftAssign, startStep);
		registerNoneBlockAssign(controlStep, rightAssign, startStep);

		if(destTypeIsReg){
			VerilogNoneBlockAssign resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, addFloatIP.result, endState);
			registerNoneBlockAssign(controlStep, resultAssign, endStep);
		}
		else{
			((VerilogWire)destSignal).setAssignExpression(addFloatIP.result);
		}
	}

	private void makeAddIntAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, AddInt addIntIP, int methodID, int phaseID, int stageID){

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);

		VerilogNoneBlockAssign leftAssign = new VerilogNoneBlockAssign(addIntIP.portA, leftNode.destSignal, startState);
		VerilogNoneBlockAssign rightAssign = new VerilogNoneBlockAssign(addIntIP.portB, rightNode.destSignal, startState);
		VerilogNoneBlockAssign addOrSub = null;

		if(opString.compareTo(VerilogBinary.PLUS)==0){
			 addOrSub = new VerilogNoneBlockAssign(addIntIP.addOrSub, parentManager.parentClass.boolTrue, startState);
		}
		else if(opString.compareTo(VerilogBinary.MINUS)==0){
			addOrSub = new VerilogNoneBlockAssign(addIntIP.addOrSub, parentManager.parentClass.boolFalse, startState);
		}

		registerNoneBlockAssign(controlStep, leftAssign, startStep);
		registerNoneBlockAssign(controlStep, rightAssign, startStep);
		registerNoneBlockAssign(controlStep, addOrSub, startStep);

		if(destTypeIsReg){
			VerilogNoneBlockAssign resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, addIntIP.result, endState);
			registerNoneBlockAssign(controlStep, resultAssign, endStep);
		}
		else{
			((VerilogWire)destSignal).setAssignExpression(addIntIP.result);
		}
	}

	private void makeCmpFloatLTalways(ArrayList<VerilogNoneBlockAssign>[] controlStep, CompareFloatLT cmpFloat, int methodID, int phaseID, int stageID){

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);

		VerilogNoneBlockAssign leftAssign = new VerilogNoneBlockAssign(cmpFloat.portA, leftNode.destSignal, startState);
		VerilogNoneBlockAssign rightAssign = new VerilogNoneBlockAssign(cmpFloat.portB, rightNode.destSignal, startState);
		registerNoneBlockAssign(controlStep, leftAssign, startStep);
		registerNoneBlockAssign(controlStep, rightAssign, startStep);

		if(destTypeIsReg){
			VerilogNoneBlockAssign resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, cmpFloat.result, endState);
			registerNoneBlockAssign(controlStep, resultAssign, endStep);
		}
		else{
			((VerilogWire)destSignal).setAssignExpression(cmpFloat.result);
		}
	}

	private void makeCmpIntLTalways(ArrayList<VerilogNoneBlockAssign>[] controlStep, CompareIntLT cmpInt, int methodID, int phaseID, int stageID){

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);

		VerilogNoneBlockAssign leftAssign = new VerilogNoneBlockAssign(cmpInt.portA, leftNode.destSignal, startState);
		VerilogNoneBlockAssign rightAssign = new VerilogNoneBlockAssign(cmpInt.portB, rightNode.destSignal, startState);
		registerNoneBlockAssign(controlStep, leftAssign, startStep);
		registerNoneBlockAssign(controlStep, rightAssign, startStep);

		if(destTypeIsReg){
			VerilogNoneBlockAssign resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, cmpInt.result, endState);
			registerNoneBlockAssign(controlStep, resultAssign, endStep);
		}
		else{
			((VerilogWire)destSignal).setAssignExpression(cmpInt.result);
		}
	}

	private void  makeDivFloatAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, DivFloat divFloat, int methodID, int phaseID, int stageID){

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);

		VerilogNoneBlockAssign leftAssign = new VerilogNoneBlockAssign(divFloat.portA, leftNode.destSignal, startState);
		VerilogNoneBlockAssign rightAssign = new VerilogNoneBlockAssign(divFloat.portB, rightNode.destSignal, startState);
		registerNoneBlockAssign(controlStep, leftAssign, startStep);
		registerNoneBlockAssign(controlStep, rightAssign, startStep);

		if(destTypeIsReg){
			VerilogNoneBlockAssign resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, divFloat.result, endState);
			registerNoneBlockAssign(controlStep, resultAssign, endStep);
		}
		else{
			((VerilogWire)destSignal).setAssignExpression(divFloat.result);
		}
	}

	private void  makeDivIntAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, DivInt divInt, int methodID, int phaseID, int stageID){

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);

		VerilogNoneBlockAssign leftAssign = new VerilogNoneBlockAssign(divInt.portA, leftNode.destSignal, startState);
		VerilogNoneBlockAssign rightAssign = new VerilogNoneBlockAssign(divInt.portB, rightNode.destSignal, startState);
		registerNoneBlockAssign(controlStep, leftAssign, startStep);
		registerNoneBlockAssign(controlStep, rightAssign, startStep);

		if(destTypeIsReg){
			VerilogNoneBlockAssign resultAssign = null;

			if(opString.compareTo(VerilogBinary.DIV)==0)
				resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, divInt.quotientPort, endState);
			else if(opString.compareTo(VerilogBinary.MOD)==0)
				resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, divInt.fractionalPort, endState);

			registerNoneBlockAssign(controlStep, resultAssign, endStep);
		}
		else{
			if(opString.compareTo(VerilogBinary.DIV)==0)
				((VerilogWire)destSignal).setAssignExpression(divInt.quotientPort);

			else if(opString.compareTo(VerilogBinary.MOD)==0)
				((VerilogWire)destSignal).setAssignExpression(divInt.fractionalPort);
		}
	}

	private void  makeMultFloatAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, MultFloat multFloat, int methodID, int phaseID, int stageID){

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);

		VerilogNoneBlockAssign leftAssign = new VerilogNoneBlockAssign(multFloat.portA, leftNode.destSignal, startState);
		VerilogNoneBlockAssign rightAssign = new VerilogNoneBlockAssign(multFloat.portB, rightNode.destSignal, startState);
		registerNoneBlockAssign(controlStep, leftAssign, startStep);
		registerNoneBlockAssign(controlStep, rightAssign, startStep);

		if(destTypeIsReg){
			VerilogNoneBlockAssign resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, multFloat.result, endState);
			registerNoneBlockAssign(controlStep, resultAssign, endStep);
		}
		else{
			((VerilogWire)destSignal).setAssignExpression(multFloat.result);
		}
	}

	private void  makeMultIntAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, MultInt multInt, int methodID, int phaseID, int stageID){

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);

		VerilogNoneBlockAssign leftAssign = new VerilogNoneBlockAssign(multInt.portA, leftNode.destSignal, startState);
		VerilogNoneBlockAssign rightAssign = new VerilogNoneBlockAssign(multInt.portB, rightNode.destSignal, startState);
		registerNoneBlockAssign(controlStep, leftAssign, startStep);
		registerNoneBlockAssign(controlStep, rightAssign, startStep);

		if(destTypeIsReg){
			VerilogNoneBlockAssign resultAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, multInt.result, endState);
			registerNoneBlockAssign(controlStep, resultAssign, endStep);
		}
		else{
			((VerilogWire)destSignal).setAssignExpression(multInt.result);
		}
	}

	/**
	 * variable (shiftOP) literal の形になっているかチェック
	 * */
	private boolean checkShiftOp(){

		if(opString.compareTo(VerilogBinary.USR )==0 || opString.compareTo(VerilogBinary.SR)==0 || opString.compareTo(VerilogBinary.SL )==0){
			if(rightNode instanceof DFGraphLiteral){
				if( ((DFGraphLiteral)rightNode).type.compareTo(VerilogVariableDecl.intType)==0 ||
					((DFGraphLiteral)rightNode).type.compareTo(VerilogVariableDecl.longType)==0){

					long shiftBit = ((DFGraphLiteral)rightNode).getIntegerLiteral();
					if(shiftBit!=0L)
						return true;
				}
			}
		}
		return false;
	}


	/**
	 * 定数シフトの場合の式を作る
	 * */
	private void  makeShiftAssign( ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		long shiftBit = ((DFGraphLiteral)rightNode).getIntegerLiteral();
		long leftNodeDestBit = ((long)leftNode.getDestSignal().bitWidth);
		String assignString = null;
		String shiftedSignalString = null;

		if( leftNodeDestBit <= shiftBit){
			CompileMsgs.edumpOverShift();
			System.out.println("    	"+this.parentManager.errDumpString);
		}

		if(shiftBit<0){
			CompileMsgs.edumpMinusShift();
			System.out.println("    	"+this.parentManager.errDumpString);
			shiftBit = Long.MAX_VALUE;
		}

		if(opString.compareTo(VerilogBinary.USR)==0 || opString.compareTo(VerilogBinary.SR)==0)
			shiftedSignalString = leftNode.getDestSignal().getSigName()+"["+(leftNodeDestBit-1)+" : "+shiftBit+"]";
		else
			shiftedSignalString = leftNode.getDestSignal().getSigName()+"["+(leftNodeDestBit-1-shiftBit)+" : 0]";

		if(opString.compareTo(VerilogBinary.USR)==0){

			if( leftNodeDestBit <= shiftBit )
				assignString = leftNodeDestBit+VerilogLiteralNumber.typeSignedHexadecimal+"0";
			else
				assignString = "{ "+shiftBit+VerilogLiteralNumber.typeSignedHexadecimal+"0, "+shiftedSignalString+" }";
		}
		else if(opString.compareTo(VerilogBinary.SR)==0){

			if( leftNodeDestBit <= shiftBit )
				assignString = "{ "+leftNodeDestBit+"{"+leftNode.getDestSignal().getSigName()+"["+(leftNodeDestBit-1)+"]} }";
			else
				assignString = "{ { "+(leftNodeDestBit-shiftBit)+"{"+leftNode.getDestSignal().getSigName()+"["+(leftNodeDestBit-1)+"]} }, "+shiftedSignalString+" }";
		}
		else if(opString.compareTo(VerilogBinary.SL)==0){

			if( leftNodeDestBit <= shiftBit )
				assignString = leftNodeDestBit+VerilogLiteralNumber.typeSignedHexadecimal+"0";
			else
				assignString = "{ "+shiftedSignalString+", "+shiftBit+VerilogLiteralNumber.typeSignedHexadecimal+"0 }";
		}

		if(!binaryOpResultIsReplaced){	//最適化により binaryOpResult が別のノードの binaryOpResult を指してるとき, binaryOpResult を変更してはいけない
			if(binaryOpResult==null)
				binaryOpResult = parentManager.parentClass.getTmpSignals().getWire((int)leftNodeDestBit, leftNode.getDestSignal().isSigned);
			VerilogSignalString shiftedSignal = new VerilogSignalString( assignString, (int)leftNodeDestBit, leftNode.getDestSignal().isSigned);
			binaryOpResult.setAssignExpression(shiftedSignal);
		}

		if(destTypeIsReg){	//IPコア未使用でレジスタ代入

			StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);
			VerilogNoneBlockAssign nbAssignExpr = new VerilogNoneBlockAssign((VerilogReg)destSignal, binaryOpResult, endState);
			registerNoneBlockAssign(controlStep, nbAssignExpr, endStep);
		}
		else{	//IPコア未使用でワイヤアサイン
			((VerilogWire)destSignal).setAssignExpression(binaryOpResult);
		}
	}

	@Override
	public int getAssignedToNewRegStep(){

		int ret = -1;

		if(useIP){	//IPコア使用
			ret = startStep;
		}
		else if(!destTypeIsReg){	//IPコア未使用で結果をワイヤアサイン
			if(destNodes.size()==0)
				ret = Integer.MAX_VALUE;

			for(int i=0; i<destNodes.size(); i++)
				ret = Math.max(destNodes.get(i).getAssignedToNewRegStep(), ret);
		}
		else{	//IPコア未使用で結果をレジスタ代入
			ret = endStep;
		}
		return ret;
	}


	/**
	 * useIP  && destTypeIsReg  -> false
	 * !useIP && destTypeIsReg  -> false
	 * useIP  && !destTypeIsReg -> true
	 * !useIP && !destTypeIsReg -> ソース参照
	 * */
	@Override
	public boolean destSignalIsNotSaved(){

		if(destTypeIsReg)
			return false;

		if(useIP)
			return true;

		return leftNode.destSignalIsNotSaved() | rightNode.destSignalIsNotSaved();	//どちらか一方でも出力が変わるなら，ここの出力も変わってしまう
	}

	@Override
	public void setComponentSign(){

		if(assignedIPcore!=null)
			componentSigniture = assignedIPcore.hashCode();
		else
			super.setComponentSign();
	}

	public VerilogWire getBinaryOpResult(){
		return binaryOpResult;
	}

	public void replaceBinaryOpResult(VerilogWire newWire){
		binaryOpResult = newWire;
		binaryOpResultIsReplaced = true;
	}
}





