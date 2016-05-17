package net.njlab.circuit;

/**
 *  @author Keisuke Koike
 */

public class KeyWord {

	//-----------Verilog 定義------------------------
	public static String K_module = "module";
	public static String K_endmodule = "endmodule";
	public static String K_input = "input";
	public static String K_output = "output";
	public static String K_parameter = "parameter";
	public static String K_begin = "begin";
	public static String K_end = "end";
	public static String K_signed = "signed";
	public static String K_reg = "reg";
	public static String K_wire = "wire";
	public static String K_assign = "assign";
	public static String K_always = "always@";
	public static String K_posedge = "posedge";
	public static String K_negedge = "negedge";
	public static String K_if = "if";
	public static String K_else = "else";
	public static String K_case = "case";
	public static String K_endcase = "endcase";
	public static String K_noneBlock = "<=";
	public static String K_assignEQ = "=";
	public static String K_compareEQ = "==";
	public static String K_default = "default";

	//------------JavaRock 定義---------------------
	public static String K_req = "_req";
	public static String K_busy = "_busy";
	public static String K_return = "_return";
	public static String K_done = "_done";
	public static String K_branch = "_branch";
	public static String K_phase = "_phase";
	public static String K_stage = "_stage";
	public static String K_step = "_step";
	public static String K_processing = "processing";
	public static String K_methodID = "_methodID";
	public static String K_caller = "_caller";
	public static String K_start = "_start";
	public static String K_pre_ = "pre_";
	public static String K_ce = "ce";
	public static String K__ce = "_ce";

	public static String K_addr = "_addr";
	public static String K_datain = "_datain";
	public static String K_dataout = "_dataout";
	public static String K_r_w = "_r_w";
	public static String K_addr_0 = "_addr_0";
	public static String K_datain_0 = "_datain_0";
	public static String K_dataout_0 = "_dataout_0";
	public static String K_r_w_0 = "_r_w_0";
	public static String K_addr_1 = "_addr_1";
	public static String K_datain_1 = "_datain_1";
	public static String K_dataout_1 = "_dataout_1";
	public static String K_r_w_1 = "_r_w_1";
	public static String K_cacheHit = "_cacheHit";

	public static String K_tmp = "tmp";
	public static String K_int = "_int";
	public static String K_long = "_long";
	public static String K_float = "_float";
	public static String K_bool = "_bool";
	public static String K_fld_ = "fld_";
	public static String K_dpram = "dpram_";
	public static String K_DWIDTH = "DWIDTH";
	public static String K_AWIDTH = "AWIDTH";
	public static String K_WORDS = "WORDS";

	public static String K_clock = "clock";
	public static String K_reset = "reset";
	public static String K_reset_n = "reset_n";
	public static String K_w_ = "w_";
	public static String K_r_ = "r_";
	public static String K_i_ = "i_";
	public static String K_o_ = "o_";
	public static String K_sys_ = "sys_";
	public static String K_arbiter = "_arbiter";
	public static String K_inst_ = "_inst_";
	public static String K_inst = "_inst";
	public static String K_copy = "copy";
	public static String K_ip_ = "ip_";
	public static String K_portA_ = "_portA_";
	public static String K_portB_ = "_portB_";
	public static String K_result_ = "_result_";
	public static String K_addSub_ = "_addSub_";
	public static String K_fixed_ = "_fixed_";
	public static String K_floating_ = "_floating_";
	public static String K_dividend_ = "_dividend_";
	public static String K_divisor_ = "_divisor_";
	public static String K_quotient_ = "_quotient_";
	public static String K_fractional_ = "_fractional_";
	public static String K_multiplicand_ = "_multiplicand_";
	public static String K_multiplier_ = "_multiplier_";
	public static String K_newData = "_newData_";
	public static String K_product_ = "_product_";

	public static String K_boolTrue = "boolTrue";
	public static String K_boolFalse = "boolFalse";
	public static String K_intOne = "intOne";
	public static String K_intZero = "intZero";
	public static String K_p1 = "_p1";
	public static String k_branchRest = "_branchRest";
	public static String K_caseBranch = "_caseBranch";
	public static String K_switchCond = "_switchCond_";
}
