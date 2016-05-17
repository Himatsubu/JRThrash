package net.njlab.circuit.stateManager;

import net.njlab.circuit.VerilogNoneBlockAssign;

/**
 * @author koike
 * */
public class JRTStateReset  extends JRTState{


	VerilogNoneBlockAssign resetAssign = null;

	@Override
	void addState(StateIdentifier state, VerilogNoneBlockAssign assignExpr){

		if(resetAssign!=null)
			System.out.println("DEBUG: error JRTStateReset setAssignExpr");//reset パートで, 1つのレジスタに2回以上代入している

		resetAssign = assignExpr;
	}

	VerilogNoneBlockAssign makeAlways(){
		return resetAssign;
	}
}
