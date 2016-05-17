package net.njlab.circuit.stateManager;

import net.njlab.circuit.VerilogNoneBlockAssign;


/**
 * reset, methodID, phaseID, stageID, stepID のいずれかのステートを表すクラス
 * @author koike
 * */
public abstract class JRTState {

	abstract void addState(StateIdentifier state, VerilogNoneBlockAssign assignExpr);

}
