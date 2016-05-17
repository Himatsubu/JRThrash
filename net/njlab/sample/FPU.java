package net.njlab.sample;
/**
 *  @author Keisuke Koike
 */
public class FPU {

	double ret;

	double fpu(double operandA, double operandB, byte opcode){

		if(opcode==0)
			ret = operandA + operandB;
		else if(opcode==1)
			ret = operandA - operandB;
		else if(opcode==2)
			ret = operandA * operandB;
		else if(opcode==3)
			ret = operandA / operandB;
		else if(opcode==4)
			ret = (operandA == operandB) ? 1.0 : 0.0;
		else if(opcode==5)
			ret = (operandA != operandB) ? 1.0 : 0.0;
		else if(opcode==6)
			ret = (operandA < operandB) ? 1.0 : 0.0;
		else if(opcode==7)
			ret = (operandA <= operandB) ? 1.0 : 0.0;
		else if(opcode==8)
			ret = (operandA > operandB) ? 1.0 : 0.0;
		else
			ret = (operandA >= operandB) ? 1.0 : 0.0;

		return ret;
	}

	double fixedToFloat(int src){
		return src;
	}

	int floatToFixed(double src){
		return (char)src;
	}
}
