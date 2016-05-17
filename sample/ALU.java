package net.njlab.sample;
/**
 *  @author Keisuke Koike
 */
public class ALU {

	int ret;

	int alu(int operandA, int operandB, byte opcode){


		switch(opcode){

			case 0: ret = operandA + operandB;
					break;

			case 1: ret = operandA - operandB;
					break;

			case 2: ret = operandA * operandB;
					break;

			case 3: ret = operandA / operandB;
					break;

			case 4: ret = operandA % operandB;
					break;

			case 5: ret = operandA << operandB;
					break;

			case 6: ret = operandA >> operandB;
					break;

			case 7: ret = operandA >>> operandB;
					break;

			case 8: ret = (operandA == operandB) ? 1 : 0;
	 		 	     break;

			case 9: ret = (operandA != operandB) ? 1 : 0;
					break;

			case 10: ret = (operandA < operandB) ? 1 : 0;
					 break;

			case 11: ret = (operandA <= operandB) ? 1 : 0;
			 		 break;

			case 12: ret = (operandA > operandB) ? 1 : 0;
					 break;

			case 13: ret = (operandA >= operandB) ? 1 : 0;
	 		 		 break;

			case 14: ret = operandA | operandB;
					break;

			case 15: ret = operandA & operandB;
					break;

			default : ret = ~operandA;
			  break;

			case 16: ret = operandA ^ operandB;
					 break;


		}
		return ret;
	}
}
