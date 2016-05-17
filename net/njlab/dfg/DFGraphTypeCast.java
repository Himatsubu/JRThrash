package net.njlab.dfg;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.VerilogNoneBlockAssign;
import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogWire;
import net.njlab.circuit.stateManager.StateIdentifier;
import net.njlab.config.Config;
import net.njlab.dump.Dump;
import net.njlab.ipcore.FixedToFloat;
import net.njlab.ipcore.FloatToFixed;
import net.njlab.ipcore.VerilogIPcore;
import net.njlab.model.VerilogClass;
import net.njlab.model.VerilogVariableDecl;
import net.njlab.scheduling.SchedulingListSet;

/**
 *  @author Keisuke Koike
 */
public class DFGraphTypeCast extends DFGraphNode{

	DFGraphNode srcNode;
	String castType;
	VerilogIPcore assignedIPcore;
	boolean fixedToFloat = false;
	boolean floatToFixed = false;
	VerilogReg fixedReg = null; //floatToFixed のとき，fixed の結果を格納するレジスタ ( destSignal（ワイヤ） にアサインされる )

	public DFGraphTypeCast(DFGraphNode srcNode, String castType){
		srcNode.addDestNode(this);
		this.srcNode = srcNode;
		this.castType = castType;
		this.destType = DFGraphNode.getDestType(castType);
	}

	@Override
	 public void replaceSrcNode(DFGraphNode popNode, DFGraphNode pushNode){
		 if(srcNode==popNode){
			 srcNode = pushNode;
			 srcNode.addDestNode(this);
		 }
	 }

	@Override
	public void dumpNode(PrintWriter wout, int offset){
		Dump.tprintln(wout, offset, "<Cast>");
		super.dumpNode(wout, offset+1);
		Dump.tprintln(wout, offset+1, "<castType>	"+castType+"	</castType>");
		if(assignedIPcore==null)
			Dump.tprintln(wout, offset+1, "<ipcore>	notUsed	</ipcore>");
		else
			Dump.tprintln(wout, offset+1, "<ipcore>	"+ assignedIPcore.instanceName +"	</ipcore>");
		Dump.tprintln(wout, offset+1, "<srcNode>");
		srcNode.dumpNode(wout, offset+2);
		Dump.tprintln(wout, offset+1, "</srcNode>");
		Dump.tprintln(wout, offset+1, "<component><!--"+Dump.translateHTML(constructComponentString())+"--></component>");
		Dump.tprintln(wout, offset, "</Cast>");
	}

	private String constructComponentString(){

		if( assignedIPcore == null ){
			if(destSignal instanceof VerilogWire)
				return "		wire : "+destSignal.getSigName()+" = "+destSignal.assignExpr.getExprString(destSignal.bitWidth, destSignal.isSigned)+"	";
			else
				return "		reg  : "+destSignal.getSigName()+"	";
		}
		else{
			return "		IPcore : "+assignedIPcore.getInstanceName()+"	";
		}
	}

	@Override
	public void constantFolding(boolean[] optContinueFlag, Config config){

		srcNode.constantFolding(optContinueFlag, config);
		if(srcNode instanceof DFGraphLiteral){
			DFGraphLiteral oldLiteral = ((DFGraphLiteral)srcNode);

			if(castType.compareTo(VerilogVariableDecl.intType)==0){
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.intType, castInt(oldLiteral, config), oldLiteral.lnum,
												oldLiteral.fnum, oldLiteral.dnum, oldLiteral.bool));
			}
			else if(castType.compareTo(VerilogVariableDecl.byteType)==0){
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.intType, castByte(oldLiteral, config), oldLiteral.lnum,
												oldLiteral.fnum, oldLiteral.dnum, oldLiteral.bool));
			}
			else if(castType.compareTo(VerilogVariableDecl.charType)==0 ){
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.intType, castChar(oldLiteral, config), oldLiteral.lnum,
												oldLiteral.fnum, oldLiteral.dnum, oldLiteral.bool));
			}
			else if(castType.compareTo(VerilogVariableDecl.shortType)==0){
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.intType, castShort(oldLiteral, config), oldLiteral.lnum,
												oldLiteral.fnum, oldLiteral.dnum, oldLiteral.bool));
			}
			else if(castType.compareTo(VerilogVariableDecl.longType)==0){
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.longType, oldLiteral.inum, castLong(oldLiteral, config),
												oldLiteral.fnum, oldLiteral.dnum, oldLiteral.bool));
			}
			else if(castType.compareTo(VerilogVariableDecl.floatType)==0){
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.floatType, oldLiteral.inum, oldLiteral.lnum,
												castFloat(oldLiteral, config), oldLiteral.dnum, oldLiteral.bool));
			}
			else if(castType.compareTo(VerilogVariableDecl.doubleType)==0){
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.doubleType, oldLiteral.inum, oldLiteral.lnum,
												oldLiteral.fnum, castDouble(oldLiteral, config), oldLiteral.bool));
			}
			else if(castType.compareTo(VerilogVariableDecl.booleanType)==0){
				replaceNode( new DFGraphLiteral(VerilogVariableDecl.booleanType, oldLiteral.inum, oldLiteral.lnum,
												oldLiteral.fnum, oldLiteral.dnum, castBool(oldLiteral)));
			}
			else{
				System.out.println("DEBUG:	error DFGraphTypeCast constantfolding");
			}
			optContinueFlag[0] = true;
		}
	}

	@Override
	public void constantFoldingForBinarySequence(boolean[] foldingHappend){

		srcNode.constantFoldingForBinarySequence(foldingHappend);
	}

	private int castInt(DFGraphLiteral oldLiteral, Config config){

		int ret=0;
		if(oldLiteral.destType==DFGraphNode.destTypeInt)
			ret = (int)oldLiteral.inum;
		else if(oldLiteral.destType==DFGraphNode.destTypeFloating){
			if(config.floatingType==Config.singleType)
				ret = (int)oldLiteral.fnum;
			else if(config.floatingType==Config.doubleType)
				ret = (int)oldLiteral.dnum;
		}
		else if(oldLiteral.destType==DFGraphNode.destTypeLong)
			ret = (int)oldLiteral.lnum;
		else
			System.out.println("DEBUG:	error DFGraphTypeCast  castInt");
		return ret;
	}

	private byte castByte(DFGraphLiteral oldLiteral, Config config){

		byte ret=0;
		if(oldLiteral.destType==DFGraphNode.destTypeInt)
			ret = (byte)oldLiteral.inum;
		else if(oldLiteral.destType==DFGraphNode.destTypeFloating){
			if(config.floatingType==Config.singleType)
				ret = (byte)oldLiteral.fnum;
			else if(config.floatingType==Config.doubleType)
				ret = (byte)oldLiteral.dnum;
		}
		else if(oldLiteral.destType==DFGraphNode.destTypeLong)
			ret = (byte)oldLiteral.lnum;
		else
			System.out.println("DEBUG:	error DFGraphTypeCast  castInt");
		return ret;
	}

	private short castShort(DFGraphLiteral oldLiteral, Config config){

		short ret=0;
		if(oldLiteral.destType==DFGraphNode.destTypeInt)
			ret = (short)oldLiteral.inum;
		else if(oldLiteral.destType==DFGraphNode.destTypeFloating){
			if(config.floatingType==Config.singleType)
				ret = (short)oldLiteral.fnum;
			else if(config.floatingType==Config.doubleType)
				ret = (short)oldLiteral.dnum;
		}
		else if(oldLiteral.destType==DFGraphNode.destTypeLong)
			ret = (short)oldLiteral.lnum;
		else
			System.out.println("DEBUG:	error DFGraphTypeCast  castInt");
		return ret;
	}

	private char castChar(DFGraphLiteral oldLiteral, Config config){

		char ret=0;
		if(oldLiteral.destType==DFGraphNode.destTypeInt)
			ret = (char)oldLiteral.inum;
		else if(oldLiteral.destType==DFGraphNode.destTypeFloating){
			if(config.floatingType==Config.singleType)
				ret = (char)oldLiteral.fnum;
			else if(config.floatingType==Config.doubleType)
				ret = (char)oldLiteral.dnum;
		}
		else if(oldLiteral.destType==DFGraphNode.destTypeLong)
			ret = (char)oldLiteral.lnum;
		else
			System.out.println("DEBUG:	error DFGraphTypeCast  castInt");
		return ret;
	}

	private long castLong(DFGraphLiteral oldLiteral, Config config){

		long ret=0L;
		if(oldLiteral.destType==DFGraphNode.destTypeInt)
			ret = (long)oldLiteral.inum;
		else if(oldLiteral.destType==DFGraphNode.destTypeFloating){
			if(config.floatingType==Config.singleType)
				ret = (long)oldLiteral.fnum;
			else if(config.floatingType==Config.doubleType)
				ret = (long)oldLiteral.dnum;
		}
		else if(oldLiteral.destType==DFGraphNode.destTypeLong)
			ret = (long)oldLiteral.lnum;
		else
			System.out.println("DEBUG:	error DFGraphTypeCast  castLong");
		return ret;
	}

	private float castFloat(DFGraphLiteral oldLiteral, Config config){

		float ret=0.0f;
		if(oldLiteral.destType==DFGraphNode.destTypeInt)
			ret = (float)oldLiteral.inum;
		else if(oldLiteral.destType==DFGraphNode.destTypeFloating){
			if(config.floatingType==Config.singleType)
				ret = (float)oldLiteral.fnum;
			else if(config.floatingType==Config.doubleType)
				ret = (float)oldLiteral.dnum;
		}
		else if(oldLiteral.destType==DFGraphNode.destTypeLong)
			ret = (float)oldLiteral.lnum;
		else
			System.out.println("DEBUG:	error DFGraphTypeCast  castFloat");
		return ret;
	}

	private double castDouble(DFGraphLiteral oldLiteral, Config config){

		double ret=0.0;
		if(oldLiteral.destType==DFGraphNode.destTypeInt)
			ret = (double)oldLiteral.inum;
		else if(oldLiteral.destType==DFGraphNode.destTypeFloating){
			if(config.floatingType==Config.singleType)
				ret = (double)oldLiteral.fnum;
			else if(config.floatingType==Config.doubleType)
				ret = (double)oldLiteral.dnum;
		}
		else if(oldLiteral.destType==DFGraphNode.destTypeLong)
			ret = (double)oldLiteral.lnum;
		else
			System.out.println("DEBUG:	error DFGraphTypeCast  castDouble");
		return ret;
	}

	private boolean castBool(DFGraphLiteral oldLiteral){

		boolean ret = true;
		if(oldLiteral.destType==DFGraphNode.destTypeBoolean)
			ret = (boolean)oldLiteral.bool;
		else
			System.out.println("DEBUG:	error DFGraphTypeCast  castInt");
		return ret;
	}

	@Override
	public DFGraphTypeCast clone(){

		DFGraphTypeCast tmp = (DFGraphTypeCast)super.clone();
		tmp.srcNode = srcNode.clone();
		tmp.srcNode.addDestNode(tmp);
		tmp.assignedIPcore = null;
		tmp.fixedReg = null;
		return tmp;
	}

	@Override
	public int countNodeNum(){
		return 1+srcNode.countNodeNum();
	}

	@Override
	public boolean propagate(DFGraphVariableAccess propagationNode, boolean[] optContinueFlag){
		boolean ret = false;
		ret |= srcNode.propagate(propagationNode, optContinueFlag);
		return ret;
	}

	@Override
	public void addStatementNode(DFGraphManager parentManager, ArrayList<DFGraphNode> statementNode){
		this.parentManager = parentManager;
		statementNode.add(this);
		srcNode.addStatementNode(parentManager, statementNode);
	}

	@Override
	public void computePriority(int minCntlStp, Config config){

		if(srcNode.destType==DFGraphNode.destTypeFloating){
			if(castType.compareTo(VerilogVariableDecl.floatType)==0 || castType.compareTo(VerilogVariableDecl.doubleType)==0){	//float => float 変換
				destTypeIsReg = false;
				minNodeOperatingStep = 0;
			}
			else{	//float => int変換
				destTypeIsReg = config.floatToFixedChaining ? false : true;
				minNodeOperatingStep = config.floatToFixedLatency + 1;
				minNodeOperatingStep += config.floatToFixedChaining ? 0 : 1;
				floatToFixed = true;
			}
		}
		else{
			if(castType.compareTo(VerilogVariableDecl.floatType)==0 || castType.compareTo(VerilogVariableDecl.doubleType)==0){	//int => float 変換
				destTypeIsReg = config.fixedToFloatChaining ? false : true;
				minNodeOperatingStep = config.fixedToFloatLatency + 1;
				minNodeOperatingStep += config.fixedToFloatChaining ? 0 : 1;
				fixedToFloat = true;
			}
			else{	//int => int 変換,  boolean => boolean 変換
				destTypeIsReg = false;
				minNodeOperatingStep = 0;
			}
		}
		minCntlStpFromThisNode = minCntlStp + minNodeOperatingStep;
		priority = minCntlStpFromThisNode;
		srcNode.computePriority(minCntlStpFromThisNode, config);
	}

	@Override
	public void assignControlStep(int controlStep, SchedulingListSet listSet){

		if(srcNode.assignState==notAssigned)
			srcNode.assignControlStep(controlStep, listSet);

		//if(impossibleToAssignforALAP(controlStep))	//ALAPスケジューリングの割り当て可能ステップに達していない
		//	return;

		if(srcNode.assignState==finished){

			int startEnableStep = getStartEnableStep(srcNode, controlStep);
			if(startEnableStep <= controlStep){	//このステップ以前にソースノードの計算が終了している
				if(fixedToFloat){
					listSet.FixedToFloatList.addList(this);
					assignState = waiting;
				}
				else if(floatToFixed){
					listSet.FloatToFixedList.addList(this);
					assignState = waiting;
				}
				else{
					if(startEnableStep <= controlStep){
						startStep = controlStep;
						setEndStep(0, false);
						assignState = finished;
					}
				}
			}
		}
	}

	public void setIPcoreAndControlStep(VerilogIPcore ipcore, int controlStep){
		assignedIPcore = ipcore;
		startStep = controlStep;
		setEndStep(ipcore.latency, true);
		assignState = finished;

		//debug
		if(srcNode.assignState==finished){	//ソースが割り当て済み
			int startEnableStep = getStartEnableStep(srcNode, controlStep);
			if(!(startEnableStep <= controlStep)){	//このステップ以前にソースノードの計算が終了していない
				System.out.println("DEBUG:	error DFGraphTypeCast  setIPcoreAndControlStep");
			}
		}
		else{
			System.out.println("DEBUG:	error DFGraphBinaryTypeCast  setIPcoreAndControlStep.");
		}
	}

	@Override
	public void assignDestSignal(VerilogClass parentClass){

		if(fixedToFloat){
			/*if(destTypeIsReg)
				destSignal = registerSharing ?  parentClass.getTmpSignals().getFloatReg(tmpRegisterID) : parentClass.getTmpSignals().getFloatReg();
			else
				destSignal = ((FixedToFloat)assignedIPcore).result;*/
			super.assignDestSignal(parentClass);
		}
		else if(floatToFixed){
			if(destTypeIsReg)
				fixedReg = allocateTmpReg();

			destSignal = parentClass.getTmpSignals().getWire(VerilogVariableDecl.getBitWidth(parentManager.parentClass.getModule(), castType), VerilogSignal.signed);
		}
		else{	//整数型 -> 整数型, floating -> floating, boolean -> boolean
			if(destTypeIsReg){
				destSignal = allocateTmpReg();
			}
			else{
				boolean isSigned = (destType==destTypeBoolean || destType==destTypeFloating) ? VerilogSignal.unsigned : VerilogSignal.signed;
				destSignal = parentClass.getTmpSignals().getWire(VerilogVariableDecl.getBitWidth(parentClass.getModule(), castType), isSigned);
			}
		}
		//dumpBornDiedStep();
	}

	@Override
	public void makeAlways(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
		StateIdentifier endState = new StateIdentifier(methodID, phaseID, stageID, endStep, false);

		if(fixedToFloat){
			VerilogNoneBlockAssign fixedAssign = new VerilogNoneBlockAssign(((FixedToFloat)assignedIPcore).portA, srcNode.destSignal, startState);
			registerNoneBlockAssign(controlStep, fixedAssign, startStep);

			if(destTypeIsReg){
				VerilogNoneBlockAssign floatAssign = new VerilogNoneBlockAssign((VerilogReg)destSignal, ((FixedToFloat)assignedIPcore).result, endState);
				registerNoneBlockAssign(controlStep, floatAssign, endStep);
			}
			else{
				((VerilogWire)destSignal).setAssignExpression( ((FixedToFloat)assignedIPcore).result );
			}
			makeNewDataAssign(controlStep, methodID, phaseID, stageID);
		}
		else if(floatToFixed){
			VerilogNoneBlockAssign floatAssign = new VerilogNoneBlockAssign(((FloatToFixed)assignedIPcore).portA, srcNode.destSignal, startState);
			registerNoneBlockAssign(controlStep, floatAssign, startStep);

			if(destTypeIsReg){
				VerilogNoneBlockAssign fixedAssign = new VerilogNoneBlockAssign(fixedReg, ((FloatToFixed)assignedIPcore).result, endState);
				registerNoneBlockAssign(controlStep, fixedAssign, endStep);
				((VerilogWire)destSignal).setAssignExpression(fixedReg);
			}
			else{
				((VerilogWire)destSignal).setAssignExpression( ((FloatToFixed)assignedIPcore).result );
			}
			makeNewDataAssign(controlStep, methodID, phaseID, stageID);
		}
		else{ //整数型 -> 整数型,  floating -> floating,  boolean -> boolean
			if(destTypeIsReg){
				VerilogNoneBlockAssign result = new VerilogNoneBlockAssign((VerilogReg)destSignal, srcNode.destSignal, endState);
				registerNoneBlockAssign(controlStep, result, endStep);
			}
			else{
				((VerilogWire)destSignal).setAssignExpression(srcNode.destSignal);
			}
		}
	}

	private void makeNewDataAssign(ArrayList<VerilogNoneBlockAssign>[] controlStep, int methodID, int phaseID, int stageID){

		if(assignedIPcore.newData!=null){

			StateIdentifier startState = new StateIdentifier(methodID, phaseID, stageID, startStep, false);
			VerilogNoneBlockAssign newDataHigh = new VerilogNoneBlockAssign(assignedIPcore.newData,  parentManager.parentClass.boolTrue, startState);
			VerilogNoneBlockAssign newDataLow  = new VerilogNoneBlockAssign(assignedIPcore.newData,  parentManager.parentClass.boolFalse, startState);
			registerNoneBlockAssign(controlStep, newDataHigh, startStep);
			if(assignedIPcore.throughput>=2)
				registerNoneBlockAssign(controlStep, newDataLow, startStep+1);
		}
	}

	@Override
	public int getAssignedToNewRegStep(){

		int ret = -1;
		if(assignedIPcore!=null){	//int -> float 変換, float -> int変換 なので startStep のIPコアへの入力時に死亡
			ret = startStep;
		}
		else if(!destTypeIsReg){	//結果がワイヤアサイン

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

		if(assignedIPcore!=null)
			return true;

		return srcNode.destSignalIsNotSaved();
	}

	@Override
	public void setComponentSign(){

		if(assignedIPcore!=null)
			componentSigniture = assignedIPcore.hashCode();
		else
			super.setComponentSign();
	}
}
