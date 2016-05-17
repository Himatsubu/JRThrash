package net.njlab.dfg;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.VerilogLiteralNumber;
import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogWire;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.model.VerilogClass;
import net.njlab.model.VerilogVariableDecl;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public class DFGraphLiteral extends DFGraphNode{


	public String type;
	public int inum;
	public long lnum;
	public float fnum;
	public double dnum;
	public boolean bool;

	public DFGraphLiteral(String type, int inum, long lnum, float fnum, double dnum, boolean bool){
		this.inum = inum;
		this.lnum = lnum;
		this.fnum = fnum;
		this.dnum = dnum;
		this.bool = bool;
		this.type = type;
		this.destType = DFGraphNode.getDestType(type);
	}
	public void replaceSrcNode(DFGraphNode popNode, DFGraphNode pushNode){}

	@Override
	public void dumpNode(PrintWriter wout, int offset){
		Dump.tprintln(wout, offset, "<Literal>");
		super.dumpNode(wout, offset+1);
		Dump.tprintln(wout, offset+1, "<type>	"+type+"	</type>");
		Dump.tprintln(wout, offset+1, "<value>	"+getLiteralString(false)+"	</value>");
		Dump.tprintln(wout, offset+1, "<component><!--"+Dump.translateHTML("		wire : "+destSignal.getSigName()+" = "+destSignal.assignExpr.getExprString(destSignal.bitWidth, destSignal.isSigned)+"	")+"--></component>");
		Dump.tprintln(wout, offset, "</Literal>");
	}

	private String getLiteralString(boolean isHex){
		if(type.compareTo(VerilogVariableDecl.booleanType)==0)
			return ""+bool;
		else if(type.compareTo(VerilogVariableDecl.intType)==0)
			return ""+inum;
		else if(type.compareTo(VerilogVariableDecl.longType)==0)
			return ""+lnum;
		else if(type.compareTo(VerilogVariableDecl.floatType)==0){
			if(isHex)
				return Float.toHexString(fnum);
			return ""+fnum;
		}
		else if(type.compareTo(VerilogVariableDecl.doubleType)==0){
			if(isHex)
				return Double.toHexString(dnum);
			return ""+dnum;
		}
		else
			return "error";
	}

	@Override
	public void constantFolding(boolean[] optContinueFlag, Config config){}

	@Override
	public void constantFoldingForBinarySequence(boolean[] foldingHappend){};

	@Override
	public DFGraphLiteral clone(){

		DFGraphLiteral tmp;
		tmp = (DFGraphLiteral)super.clone();
		return tmp;
	}

	@Override
	public int countNodeNum(){
		return 1;
	}

	@Override
	public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag){
		return false;
	}

	@Override
	public void addStatementNode(DFGraphManager parentManager, ArrayList<DFGraphNode> statementNode){
		this.parentManager = parentManager;
		statementNode.add(this);
	}

	@Override
	public void computePriority(int minCntlStp, Config config){
		minNodeOperatingStep = 0;
		minCntlStpFromThisNode = minCntlStp;
		destTypeIsReg = false;
		priority = minCntlStpFromThisNode;
	}

	@Override
	public void assignControlStep(int controlStep, SchedulingListSet listSet){
		startStep = controlStep;
		setEndStep(0, false);
		assignState = finished;
	}

	public long getIntegerLiteral(){
		if(type.compareTo(VerilogVariableDecl.intType)==0)
			return (long)inum;
		if(type.compareTo(VerilogVariableDecl.longType)==0)
			return lnum;
		else{
			System.out.println("DEBUG:	error	DFGraphLiteral   getIntegerLiteral");
			return 0L;
		}
	}

	public void changeIntegerLiteralNumber(long changeNum){
		lnum = changeNum;
		inum = (int)changeNum;
	}

	@Override
	public void assignDestSignal(VerilogClass parentClass){

		if(type.compareTo(VerilogVariableDecl.booleanType)==0){
			if(bool)
				destSignal = parentManager.parentClass.boolTrue;
			else
				destSignal = parentManager.parentClass.boolFalse;
		}
		else if(type.compareTo(VerilogVariableDecl.intType)==0){
			if(inum==0)
				destSignal = parentManager.parentClass.intZero;
			else if(inum==1)
				destSignal = parentManager.parentClass.intOne;
			else
				super.assignDestSignal(parentClass);
		}
		else
			super.assignDestSignal(parentClass);
	}

	@Override
	public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		if(type.compareTo(VerilogVariableDecl.booleanType)==0){//bindTmpReg の時点で結果のアサインが決まっている
			return;
		}
		else if(type.compareTo(VerilogVariableDecl.intType)==0){//bindTmpReg の時点で結果のアサインが決まっている
			if(inum==0 || inum==1) 	 return;
		}
		String literalString = getLiteralString();
		String literalType = (destSignal.isSigned) ? VerilogLiteralNumber.typeSignedHexadecimal : VerilogLiteralNumber.typeHexadecimal;
		VerilogLiteralNumber literal = new VerilogLiteralNumber(destSignal.bitWidth, literalType, literalString);
		((VerilogWire)destSignal).setAssignExpression(literal);
	}

	private String getLiteralString(){

		if(destType==DFGraphNode.destTypeFloating){

			if(parentManager.parentClass.config.floatingType==Config.doubleType)
				return Long.toHexString(Double.doubleToRawLongBits(dnum))+"";
			else if(parentManager.parentClass.config.floatingType==Config.singleType)
				return Integer.toHexString(Float.floatToRawIntBits(fnum))+"";
		}
		else if(destType==DFGraphNode.destTypeInt){

			int intBitWidth = parentManager.parentClass.config.intBitWidth;
			int inumTmp = inum;
			int tmp;
			StringBuffer literalString = new StringBuffer();
			do{
				intBitWidth -= 4;
				tmp = inumTmp & 0x0000000F;
				inumTmp = inumTmp >> 4;
				literalString.insert(0, Integer.toHexString(tmp));
			}
			while(intBitWidth>0);

			return literalString.toString();
		}
		else if(destType==DFGraphNode.destTypeLong){

			int longBitWidth = parentManager.parentClass.config.longBitWidth;
			long lnumTmp = lnum;
			int tmp;
			StringBuffer literalString = new StringBuffer();
			do{
				longBitWidth -= 4;
				tmp = (int)(lnumTmp & 0x000000000000000F);
				lnumTmp = lnumTmp >> 4;
				literalString.insert(0, Integer.toHexString(tmp));
			}
			while(longBitWidth>0);

			return literalString.toString();
		}
		return null;
	}

	@Override
	public int getAssignedToNewRegStep(){

		System.out.println("DEBUG:	error DFGraphLiteral getDiedStep");//このメソッドは呼ばれない
		return 0;
	}

	@Override
	public boolean destSignalIsNotSaved(){

		return false;
	}
}






