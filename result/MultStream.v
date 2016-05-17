/*
TimeStamp:	2013/12/16		12:59
*/


module MultStream(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_multStream_req,	
	output                o_multStream_busy,	
	output signed  [31:0] o_multStream_a_6_addr,	
	output signed  [31:0] o_multStream_a_6_datain,	
	input  signed  [31:0] i_multStream_a_6_dataout,	
	output                o_multStream_a_6_r_w,	
	output                o_multStream_a_6_ce,	
	output signed  [31:0] o_multStream_b_7_addr,	
	output signed  [31:0] o_multStream_b_7_datain,	
	input  signed  [31:0] i_multStream_b_7_dataout,	
	output                o_multStream_b_7_r_w,	
	output                o_multStream_b_7_ce,	
	output signed  [31:0] o_multStream_result_8_addr,	
	output signed  [31:0] o_multStream_result_8_datain,	
	input  signed  [31:0] i_multStream_result_8_dataout,	
	output                o_multStream_result_8_r_w,	
	output                o_multStream_result_8_ce	
);

	reg                r_sys_typeB_arbiter0;
	reg  signed [31:0] r_ip_Multint_multiplicand_0;
	reg  signed [31:0] r_ip_Multint_multiplier_0;
	wire signed [63:0] w_ip_Multint_product_0;
	reg  signed [31:0] r_ip_Multint_multiplicand_1;
	reg  signed [31:0] r_ip_Multint_multiplier_1;
	wire signed [63:0] w_ip_Multint_product_1;
	reg         [ 2:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 2:0] r_sys_multStream_caller;
	reg                r_sys_multStream_req;
	reg         [ 3:0] r_sys_multStream_phase;
	reg         [ 1:0] r_sys_multStream_stage;
	reg         [ 2:0] r_sys_multStream_step;
	reg                r_sys_multStream_busy;
	wire        [ 1:0] w_sys_multStream_stage_p1;
	wire        [ 2:0] w_sys_multStream_step_p1;
	reg         [ 2:0] r_sys_typeA_caller;
	reg                r_sys_typeA_req;
	reg         [ 3:0] r_sys_typeA_phase;
	reg         [ 1:0] r_sys_typeA_stage;
	reg         [ 3:0] r_sys_typeA_step;
	reg                r_sys_typeA_busy;
	wire        [ 1:0] w_sys_typeA_stage_p1;
	wire        [ 3:0] w_sys_typeA_step_p1;
	reg         [ 2:0] r_sys_typeB_caller;
	reg                r_sys_typeB_req;
	reg         [ 3:0] r_sys_typeB_phase;
	reg         [ 1:0] r_sys_typeB_stage;
	reg         [ 3:0] r_sys_typeB_step;
	reg                r_sys_typeB_busy;
	wire        [ 1:0] w_sys_typeB_stage_p1;
	wire        [ 3:0] w_sys_typeB_step_p1;
	reg         [ 2:0] r_sys_typeC_caller;
	reg                r_sys_typeC_req;
	reg         [ 3:0] r_sys_typeC_phase;
	reg         [ 1:0] r_sys_typeC_stage;
	reg         [ 3:0] r_sys_typeC_step;
	reg                r_sys_typeC_busy;
	wire        [ 1:0] w_sys_typeC_stage_p1;
	wire        [ 3:0] w_sys_typeC_step_p1;
	reg         [ 2:0] r_sys_typeD_caller;
	reg                r_sys_typeD_req;
	reg         [ 3:0] r_sys_typeD_phase;
	reg         [ 1:0] r_sys_typeD_stage;
	reg         [ 3:0] r_sys_typeD_step;
	reg                r_sys_typeD_busy;
	wire        [ 1:0] w_sys_typeD_stage_p1;
	wire        [ 3:0] w_sys_typeD_step_p1;
	reg         [ 2:0] r_sys_typeE_caller;
	reg                r_sys_typeE_req;
	reg         [ 3:0] r_sys_typeE_phase;
	reg         [ 1:0] r_sys_typeE_stage;
	reg         [ 4:0] r_sys_typeE_step;
	reg                r_sys_typeE_busy;
	wire        [ 1:0] w_sys_typeE_stage_p1;
	wire        [ 4:0] w_sys_typeE_step_p1;
	reg  signed [31:0] r_fld_ax_0;
	reg  signed [31:0] r_fld_bx_1;
	reg  signed [31:0] r_fld_cx_2;
	reg  signed [31:0] r_fld_dx_3;
	reg  signed [31:0] r_fld_ex_4;
	reg  signed [31:0] r_fld_fx_5;
	reg  signed [31:0] r_multStream_a_6_addr;
	reg  signed [31:0] r_multStream_a_6_datain;
	wire signed [31:0] w_multStream_a_6_dataout;
	reg                r_multStream_a_6_r_w;
	wire signed [31:0] w_multStream_a_6_addr;
	wire signed [31:0] w_multStream_a_6_datain;
	wire               w_multStream_a_6_r_w;
	wire               w_multStream_a_6_ce;
	wire               w_multStream_a_6_cacheHit;
	reg  signed [31:0] r_multStream_b_7_addr;
	reg  signed [31:0] r_multStream_b_7_datain;
	wire signed [31:0] w_multStream_b_7_dataout;
	reg                r_multStream_b_7_r_w;
	wire signed [31:0] w_multStream_b_7_addr;
	wire signed [31:0] w_multStream_b_7_datain;
	wire               w_multStream_b_7_r_w;
	wire               w_multStream_b_7_ce;
	wire               w_multStream_b_7_cacheHit;
	reg  signed [31:0] r_multStream_result_8_addr;
	reg  signed [31:0] r_multStream_result_8_datain;
	wire signed [31:0] w_multStream_result_8_dataout;
	reg                r_multStream_result_8_r_w;
	wire signed [31:0] w_multStream_result_8_addr;
	wire signed [31:0] w_multStream_result_8_datain;
	wire               w_multStream_result_8_r_w;
	wire               w_multStream_result_8_ce;
	wire               w_multStream_result_8_cacheHit;
	reg  signed [31:0] r_multStream_i_9;
	reg  signed [31:0] r_typeA_a_10_addr;
	reg  signed [31:0] r_typeA_a_10_datain;
	wire signed [31:0] w_typeA_a_10_dataout;
	reg                r_typeA_a_10_r_w;
	wire signed [31:0] w_typeA_a_10_addr;
	wire signed [31:0] w_typeA_a_10_datain;
	wire               w_typeA_a_10_r_w;
	wire               w_typeA_a_10_ce;
	wire               w_typeA_a_10_cacheHit;
	reg  signed [31:0] r_typeA_b_11_addr;
	reg  signed [31:0] r_typeA_b_11_datain;
	wire signed [31:0] w_typeA_b_11_dataout;
	reg                r_typeA_b_11_r_w;
	wire signed [31:0] w_typeA_b_11_addr;
	wire signed [31:0] w_typeA_b_11_datain;
	wire               w_typeA_b_11_r_w;
	wire               w_typeA_b_11_ce;
	wire               w_typeA_b_11_cacheHit;
	reg  signed [31:0] r_typeA_result_12_addr;
	reg  signed [31:0] r_typeA_result_12_datain;
	wire signed [31:0] w_typeA_result_12_dataout;
	reg                r_typeA_result_12_r_w;
	wire signed [31:0] w_typeA_result_12_addr;
	wire signed [31:0] w_typeA_result_12_datain;
	wire               w_typeA_result_12_r_w;
	wire               w_typeA_result_12_ce;
	wire               w_typeA_result_12_cacheHit;
	reg  signed [31:0] r_typeA_i_13;
	reg  signed [31:0] r_typeA_j_14;
	reg  signed [31:0] r_typeB_a_15_addr;
	reg  signed [31:0] r_typeB_a_15_datain;
	wire signed [31:0] w_typeB_a_15_dataout;
	reg                r_typeB_a_15_r_w;
	wire signed [31:0] w_typeB_a_15_addr;
	wire signed [31:0] w_typeB_a_15_datain;
	wire               w_typeB_a_15_r_w;
	wire               w_typeB_a_15_ce;
	wire               w_typeB_a_15_cacheHit;
	reg  signed [31:0] r_typeB_b_16_addr;
	reg  signed [31:0] r_typeB_b_16_datain;
	wire signed [31:0] w_typeB_b_16_dataout;
	reg                r_typeB_b_16_r_w;
	wire signed [31:0] w_typeB_b_16_addr;
	wire signed [31:0] w_typeB_b_16_datain;
	wire               w_typeB_b_16_r_w;
	wire               w_typeB_b_16_ce;
	wire               w_typeB_b_16_cacheHit;
	reg  signed [31:0] r_typeB_result_17_addr;
	reg  signed [31:0] r_typeB_result_17_datain;
	wire signed [31:0] w_typeB_result_17_dataout;
	reg                r_typeB_result_17_r_w;
	wire signed [31:0] w_typeB_result_17_addr;
	wire signed [31:0] w_typeB_result_17_datain;
	wire               w_typeB_result_17_r_w;
	wire               w_typeB_result_17_ce;
	wire               w_typeB_result_17_cacheHit;
	reg  signed [31:0] r_typeB_i_18;
	reg  signed [31:0] r_typeC_a_19_addr;
	reg  signed [31:0] r_typeC_a_19_datain;
	wire signed [31:0] w_typeC_a_19_dataout;
	reg                r_typeC_a_19_r_w;
	wire signed [31:0] w_typeC_a_19_addr;
	wire signed [31:0] w_typeC_a_19_datain;
	wire               w_typeC_a_19_r_w;
	wire               w_typeC_a_19_ce;
	wire               w_typeC_a_19_cacheHit;
	reg  signed [31:0] r_typeC_b_20_addr;
	reg  signed [31:0] r_typeC_b_20_datain;
	wire signed [31:0] w_typeC_b_20_dataout;
	reg                r_typeC_b_20_r_w;
	wire signed [31:0] w_typeC_b_20_addr;
	wire signed [31:0] w_typeC_b_20_datain;
	wire               w_typeC_b_20_r_w;
	wire               w_typeC_b_20_ce;
	wire               w_typeC_b_20_cacheHit;
	reg  signed [31:0] r_typeC_result_21_addr;
	reg  signed [31:0] r_typeC_result_21_datain;
	wire signed [31:0] w_typeC_result_21_dataout;
	reg                r_typeC_result_21_r_w;
	wire signed [31:0] w_typeC_result_21_addr;
	wire signed [31:0] w_typeC_result_21_datain;
	wire               w_typeC_result_21_r_w;
	wire               w_typeC_result_21_ce;
	wire               w_typeC_result_21_cacheHit;
	reg  signed [31:0] r_typeC_i_22;
	reg  signed [31:0] r_typeD_a_23_addr;
	reg  signed [31:0] r_typeD_a_23_datain;
	wire signed [31:0] w_typeD_a_23_dataout;
	reg                r_typeD_a_23_r_w;
	wire signed [31:0] w_typeD_a_23_addr;
	wire signed [31:0] w_typeD_a_23_datain;
	wire               w_typeD_a_23_r_w;
	wire               w_typeD_a_23_ce;
	wire               w_typeD_a_23_cacheHit;
	reg  signed [31:0] r_typeD_b_24_addr;
	reg  signed [31:0] r_typeD_b_24_datain;
	wire signed [31:0] w_typeD_b_24_dataout;
	reg                r_typeD_b_24_r_w;
	wire signed [31:0] w_typeD_b_24_addr;
	wire signed [31:0] w_typeD_b_24_datain;
	wire               w_typeD_b_24_r_w;
	wire               w_typeD_b_24_ce;
	wire               w_typeD_b_24_cacheHit;
	reg  signed [31:0] r_typeD_result_25_addr;
	reg  signed [31:0] r_typeD_result_25_datain;
	wire signed [31:0] w_typeD_result_25_dataout;
	reg                r_typeD_result_25_r_w;
	wire signed [31:0] w_typeD_result_25_addr;
	wire signed [31:0] w_typeD_result_25_datain;
	wire               w_typeD_result_25_r_w;
	wire               w_typeD_result_25_ce;
	wire               w_typeD_result_25_cacheHit;
	reg  signed [31:0] r_typeD_i_26;
	reg  signed [31:0] r_typeE_a_27_addr;
	reg  signed [31:0] r_typeE_a_27_datain;
	wire signed [31:0] w_typeE_a_27_dataout;
	reg                r_typeE_a_27_r_w;
	wire signed [31:0] w_typeE_a_27_addr;
	wire signed [31:0] w_typeE_a_27_datain;
	wire               w_typeE_a_27_r_w;
	wire               w_typeE_a_27_ce;
	wire               w_typeE_a_27_cacheHit;
	reg  signed [31:0] r_typeE_b_28_addr;
	reg  signed [31:0] r_typeE_b_28_datain;
	wire signed [31:0] w_typeE_b_28_dataout;
	reg                r_typeE_b_28_r_w;
	wire signed [31:0] w_typeE_b_28_addr;
	wire signed [31:0] w_typeE_b_28_datain;
	wire               w_typeE_b_28_r_w;
	wire               w_typeE_b_28_ce;
	wire               w_typeE_b_28_cacheHit;
	reg  signed [31:0] r_typeE_result_29_addr;
	reg  signed [31:0] r_typeE_result_29_datain;
	wire signed [31:0] w_typeE_result_29_dataout;
	reg                r_typeE_result_29_r_w;
	wire signed [31:0] w_typeE_result_29_addr;
	wire signed [31:0] w_typeE_result_29_datain;
	wire               w_typeE_result_29_r_w;
	wire               w_typeE_result_29_ce;
	wire               w_typeE_result_29_cacheHit;
	reg  signed [31:0] r_typeE_i_30;
	reg  signed [31:0] r_typeB_copy0_i_31;
	reg  signed [31:0] r_typeB_copy1_i_32;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire signed [31:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire               w_sys_tmp32;
	wire signed [31:0] w_sys_tmp33;
	wire signed [31:0] w_sys_tmp37;
	wire signed [31:0] w_sys_tmp38;
	wire signed [31:0] w_sys_tmp39;
	wire signed [31:0] w_sys_tmp40;
	wire signed [31:0] w_sys_tmp41;
	wire               w_sys_tmp60;
	wire signed [31:0] w_sys_tmp61;
	wire signed [31:0] w_sys_tmp64;
	wire signed [31:0] w_sys_tmp65;
	wire signed [31:0] w_sys_tmp66;
	wire signed [31:0] w_sys_tmp67;
	wire signed [31:0] w_sys_tmp68;
	wire signed [31:0] w_sys_tmp69;
	wire               w_sys_tmp91;
	wire signed [31:0] w_sys_tmp92;
	wire signed [31:0] w_sys_tmp96;
	wire signed [31:0] w_sys_tmp97;
	wire signed [31:0] w_sys_tmp98;
	wire signed [31:0] w_sys_tmp100;
	wire signed [31:0] w_sys_tmp107;
	wire signed [31:0] w_sys_tmp108;
	wire signed [31:0] w_sys_tmp117;
	wire signed [31:0] w_sys_tmp118;
	wire signed [31:0] w_sys_tmp126;
	wire signed [31:0] w_sys_tmp127;
	wire               w_sys_tmp128;
	wire signed [31:0] w_sys_tmp129;
	wire signed [31:0] w_sys_tmp130;
	wire signed [31:0] w_sys_tmp131;
	wire signed [31:0] w_sys_tmp133;
	wire signed [31:0] w_sys_tmp134;
	wire signed [31:0] w_sys_tmp135;
	wire signed [31:0] w_sys_tmp137;
	wire signed [31:0] w_sys_tmp144;
	wire signed [31:0] w_sys_tmp145;
	wire signed [31:0] w_sys_tmp154;
	wire signed [31:0] w_sys_tmp155;
	wire               w_sys_tmp163;
	wire signed [31:0] w_sys_tmp164;
	wire signed [31:0] w_sys_tmp167;
	wire signed [31:0] w_sys_tmp168;
	wire signed [31:0] w_sys_tmp169;
	wire signed [31:0] w_sys_tmp170;
	wire signed [31:0] w_sys_tmp174;
	wire signed [31:0] w_sys_tmp192;
	wire signed [31:0] w_sys_tmp193;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_multStream_a_6_cacheHit & w_multStream_b_7_cacheHit & w_multStream_result_8_cacheHit & w_typeA_a_10_cacheHit & w_typeA_b_11_cacheHit & w_typeA_result_12_cacheHit & w_typeB_a_15_cacheHit & w_typeB_b_16_cacheHit & w_typeB_result_17_cacheHit & w_typeC_a_19_cacheHit & w_typeC_b_20_cacheHit & w_typeC_result_21_cacheHit & w_typeD_a_23_cacheHit & w_typeD_b_24_cacheHit & w_typeD_result_25_cacheHit & w_typeE_a_27_cacheHit & w_typeE_b_28_cacheHit & w_typeE_result_29_cacheHit;
	assign o_multStream_busy = r_sys_multStream_busy;
	assign w_sys_multStream_stage_p1 = (r_sys_multStream_stage + 2'h1);
	assign w_sys_multStream_step_p1 = (r_sys_multStream_step + 3'h1);
	assign w_sys_typeA_stage_p1 = (r_sys_typeA_stage + 2'h1);
	assign w_sys_typeA_step_p1 = (r_sys_typeA_step + 4'h1);
	assign w_sys_typeB_stage_p1 = (r_sys_typeB_stage + 2'h1);
	assign w_sys_typeB_step_p1 = (r_sys_typeB_step + 4'h1);
	assign w_sys_typeC_stage_p1 = (r_sys_typeC_stage + 2'h1);
	assign w_sys_typeC_step_p1 = (r_sys_typeC_step + 4'h1);
	assign w_sys_typeD_stage_p1 = (r_sys_typeD_stage + 2'h1);
	assign w_sys_typeD_step_p1 = (r_sys_typeD_step + 4'h1);
	assign w_sys_typeE_stage_p1 = (r_sys_typeE_stage + 2'h1);
	assign w_sys_typeE_step_p1 = (r_sys_typeE_step + 5'h1);
	assign w_multStream_a_6_dataout = i_multStream_a_6_dataout;
	assign w_multStream_a_6_addr = ( r_sys_typeB_arbiter0 ? w_typeB_a_15_addr : r_multStream_a_6_addr ) ;
	assign w_multStream_a_6_datain = ( r_sys_typeB_arbiter0 ? w_typeB_a_15_datain : r_multStream_a_6_datain ) ;
	assign w_multStream_a_6_r_w = ( r_sys_typeB_arbiter0 ? w_typeB_a_15_r_w : r_multStream_a_6_r_w ) ;
	assign w_multStream_a_6_ce = w_sys_ce;
	assign w_multStream_a_6_cacheHit = w_sys_boolTrue;
	assign o_multStream_a_6_addr = w_multStream_a_6_addr;
	assign o_multStream_a_6_datain = w_multStream_a_6_datain;
	assign o_multStream_a_6_r_w = w_multStream_a_6_r_w;
	assign o_multStream_a_6_ce = w_multStream_a_6_ce;
	assign w_multStream_b_7_dataout = i_multStream_b_7_dataout;
	assign w_multStream_b_7_addr = ( r_sys_typeB_arbiter0 ? w_typeB_b_16_addr : r_multStream_b_7_addr ) ;
	assign w_multStream_b_7_datain = ( r_sys_typeB_arbiter0 ? w_typeB_b_16_datain : r_multStream_b_7_datain ) ;
	assign w_multStream_b_7_r_w = ( r_sys_typeB_arbiter0 ? w_typeB_b_16_r_w : r_multStream_b_7_r_w ) ;
	assign w_multStream_b_7_ce = w_sys_ce;
	assign w_multStream_b_7_cacheHit = w_sys_boolTrue;
	assign o_multStream_b_7_addr = w_multStream_b_7_addr;
	assign o_multStream_b_7_datain = w_multStream_b_7_datain;
	assign o_multStream_b_7_r_w = w_multStream_b_7_r_w;
	assign o_multStream_b_7_ce = w_multStream_b_7_ce;
	assign w_multStream_result_8_dataout = i_multStream_result_8_dataout;
	assign w_multStream_result_8_addr = ( r_sys_typeB_arbiter0 ? w_typeB_result_17_addr : r_multStream_result_8_addr ) ;
	assign w_multStream_result_8_datain = ( r_sys_typeB_arbiter0 ? w_typeB_result_17_datain : r_multStream_result_8_datain ) ;
	assign w_multStream_result_8_r_w = ( r_sys_typeB_arbiter0 ? w_typeB_result_17_r_w : r_multStream_result_8_r_w ) ;
	assign w_multStream_result_8_ce = w_sys_ce;
	assign w_multStream_result_8_cacheHit = w_sys_boolTrue;
	assign o_multStream_result_8_addr = w_multStream_result_8_addr;
	assign o_multStream_result_8_datain = w_multStream_result_8_datain;
	assign o_multStream_result_8_r_w = w_multStream_result_8_r_w;
	assign o_multStream_result_8_ce = w_multStream_result_8_ce;
	assign w_typeA_a_10_dataout = 32'sh0;
	assign w_typeA_a_10_addr = r_typeA_a_10_addr;
	assign w_typeA_a_10_datain = r_typeA_a_10_datain;
	assign w_typeA_a_10_r_w = r_typeA_a_10_r_w;
	assign w_typeA_a_10_ce = w_sys_ce;
	assign w_typeA_a_10_cacheHit = w_sys_boolTrue;
	assign w_typeA_b_11_dataout = 32'sh0;
	assign w_typeA_b_11_addr = r_typeA_b_11_addr;
	assign w_typeA_b_11_datain = r_typeA_b_11_datain;
	assign w_typeA_b_11_r_w = r_typeA_b_11_r_w;
	assign w_typeA_b_11_ce = w_sys_ce;
	assign w_typeA_b_11_cacheHit = w_sys_boolTrue;
	assign w_typeA_result_12_dataout = 32'sh0;
	assign w_typeA_result_12_addr = r_typeA_result_12_addr;
	assign w_typeA_result_12_datain = r_typeA_result_12_datain;
	assign w_typeA_result_12_r_w = r_typeA_result_12_r_w;
	assign w_typeA_result_12_ce = w_sys_ce;
	assign w_typeA_result_12_cacheHit = w_sys_boolTrue;
	assign w_typeB_a_15_dataout = ( r_sys_typeB_arbiter0 ? w_multStream_a_6_dataout : 32'sh0 ) ;
	assign w_typeB_a_15_addr = r_typeB_a_15_addr;
	assign w_typeB_a_15_datain = r_typeB_a_15_datain;
	assign w_typeB_a_15_r_w = r_typeB_a_15_r_w;
	assign w_typeB_a_15_ce = w_sys_ce;
	assign w_typeB_a_15_cacheHit = ( r_sys_typeB_arbiter0 ? w_multStream_a_6_cacheHit : w_sys_boolTrue ) ;
	assign w_typeB_b_16_dataout = ( r_sys_typeB_arbiter0 ? w_multStream_b_7_dataout : 32'sh0 ) ;
	assign w_typeB_b_16_addr = r_typeB_b_16_addr;
	assign w_typeB_b_16_datain = r_typeB_b_16_datain;
	assign w_typeB_b_16_r_w = r_typeB_b_16_r_w;
	assign w_typeB_b_16_ce = w_sys_ce;
	assign w_typeB_b_16_cacheHit = ( r_sys_typeB_arbiter0 ? w_multStream_b_7_cacheHit : w_sys_boolTrue ) ;
	assign w_typeB_result_17_dataout = ( r_sys_typeB_arbiter0 ? w_multStream_result_8_dataout : 32'sh0 ) ;
	assign w_typeB_result_17_addr = r_typeB_result_17_addr;
	assign w_typeB_result_17_datain = r_typeB_result_17_datain;
	assign w_typeB_result_17_r_w = r_typeB_result_17_r_w;
	assign w_typeB_result_17_ce = w_sys_ce;
	assign w_typeB_result_17_cacheHit = ( r_sys_typeB_arbiter0 ? w_multStream_result_8_cacheHit : w_sys_boolTrue ) ;
	assign w_typeC_a_19_dataout = 32'sh0;
	assign w_typeC_a_19_addr = r_typeC_a_19_addr;
	assign w_typeC_a_19_datain = r_typeC_a_19_datain;
	assign w_typeC_a_19_r_w = r_typeC_a_19_r_w;
	assign w_typeC_a_19_ce = w_sys_ce;
	assign w_typeC_a_19_cacheHit = w_sys_boolTrue;
	assign w_typeC_b_20_dataout = 32'sh0;
	assign w_typeC_b_20_addr = r_typeC_b_20_addr;
	assign w_typeC_b_20_datain = r_typeC_b_20_datain;
	assign w_typeC_b_20_r_w = r_typeC_b_20_r_w;
	assign w_typeC_b_20_ce = w_sys_ce;
	assign w_typeC_b_20_cacheHit = w_sys_boolTrue;
	assign w_typeC_result_21_dataout = 32'sh0;
	assign w_typeC_result_21_addr = r_typeC_result_21_addr;
	assign w_typeC_result_21_datain = r_typeC_result_21_datain;
	assign w_typeC_result_21_r_w = r_typeC_result_21_r_w;
	assign w_typeC_result_21_ce = w_sys_ce;
	assign w_typeC_result_21_cacheHit = w_sys_boolTrue;
	assign w_typeD_a_23_dataout = 32'sh0;
	assign w_typeD_a_23_addr = r_typeD_a_23_addr;
	assign w_typeD_a_23_datain = r_typeD_a_23_datain;
	assign w_typeD_a_23_r_w = r_typeD_a_23_r_w;
	assign w_typeD_a_23_ce = w_sys_ce;
	assign w_typeD_a_23_cacheHit = w_sys_boolTrue;
	assign w_typeD_b_24_dataout = 32'sh0;
	assign w_typeD_b_24_addr = r_typeD_b_24_addr;
	assign w_typeD_b_24_datain = r_typeD_b_24_datain;
	assign w_typeD_b_24_r_w = r_typeD_b_24_r_w;
	assign w_typeD_b_24_ce = w_sys_ce;
	assign w_typeD_b_24_cacheHit = w_sys_boolTrue;
	assign w_typeD_result_25_dataout = 32'sh0;
	assign w_typeD_result_25_addr = r_typeD_result_25_addr;
	assign w_typeD_result_25_datain = r_typeD_result_25_datain;
	assign w_typeD_result_25_r_w = r_typeD_result_25_r_w;
	assign w_typeD_result_25_ce = w_sys_ce;
	assign w_typeD_result_25_cacheHit = w_sys_boolTrue;
	assign w_typeE_a_27_dataout = 32'sh0;
	assign w_typeE_a_27_addr = r_typeE_a_27_addr;
	assign w_typeE_a_27_datain = r_typeE_a_27_datain;
	assign w_typeE_a_27_r_w = r_typeE_a_27_r_w;
	assign w_typeE_a_27_ce = w_sys_ce;
	assign w_typeE_a_27_cacheHit = w_sys_boolTrue;
	assign w_typeE_b_28_dataout = 32'sh0;
	assign w_typeE_b_28_addr = r_typeE_b_28_addr;
	assign w_typeE_b_28_datain = r_typeE_b_28_datain;
	assign w_typeE_b_28_r_w = r_typeE_b_28_r_w;
	assign w_typeE_b_28_ce = w_sys_ce;
	assign w_typeE_b_28_cacheHit = w_sys_boolTrue;
	assign w_typeE_result_29_dataout = 32'sh0;
	assign w_typeE_result_29_addr = r_typeE_result_29_addr;
	assign w_typeE_result_29_datain = r_typeE_result_29_datain;
	assign w_typeE_result_29_r_w = r_typeE_result_29_r_w;
	assign w_typeE_result_29_ce = w_sys_ce;
	assign w_typeE_result_29_cacheHit = w_sys_boolTrue;
	assign w_sys_tmp1 = (r_multStream_i_9 < w_sys_tmp2);
	assign w_sys_tmp2 = 32'sh00000040;
	assign w_sys_tmp5 = (r_multStream_i_9 + w_sys_tmp6);
	assign w_sys_tmp6 = 32'sh00000003;
	assign w_sys_tmp8 = (r_multStream_i_9 + w_sys_tmp9);
	assign w_sys_tmp9 = 32'sh00000007;
	assign w_sys_tmp10 = (r_multStream_i_9 + w_sys_intOne);
	assign w_sys_tmp32 = (r_typeA_i_13 < w_sys_tmp33);
	assign w_sys_tmp33 = 32'sh00000040;
	assign w_sys_tmp37 = $signed( w_ip_Multint_product_0[31:0] );
	assign w_sys_tmp38 = w_typeA_a_10_dataout;
	assign w_sys_tmp39 = w_typeA_b_11_dataout;
	assign w_sys_tmp40 = (r_typeA_i_13 + w_sys_intOne);
	assign w_sys_tmp41 = (r_typeA_j_14 + w_sys_intOne);
	assign w_sys_tmp60 = (r_typeB_i_18 < w_sys_tmp61);
	assign w_sys_tmp61 = 32'sh00000040;
	assign w_sys_tmp64 = $signed( w_ip_Multint_product_1[31:0] );
	assign w_sys_tmp65 = w_typeB_a_15_dataout;
	assign w_sys_tmp66 = w_typeB_b_16_dataout;
	assign w_sys_tmp67 = (r_typeB_copy0_i_31 + w_sys_intOne);
	assign w_sys_tmp68 = (r_typeB_copy1_i_32 + w_sys_intOne);
	assign w_sys_tmp69 = (r_typeB_i_18 + w_sys_intOne);
	assign w_sys_tmp91 = (r_typeC_i_22 < w_sys_tmp92);
	assign w_sys_tmp92 = 32'sh00000040;
	assign w_sys_tmp96 = $signed( w_ip_Multint_product_1[31:0] );
	assign w_sys_tmp97 = w_typeC_a_19_dataout;
	assign w_sys_tmp98 = w_typeC_b_20_dataout;
	assign w_sys_tmp100 = (r_typeC_i_22 + w_sys_intOne);
	assign w_sys_tmp107 = (r_typeC_i_22 + w_sys_tmp108);
	assign w_sys_tmp108 = 32'sh00000002;
	assign w_sys_tmp117 = (r_typeC_i_22 + w_sys_tmp118);
	assign w_sys_tmp118 = 32'sh00000003;
	assign w_sys_tmp126 = (r_typeC_i_22 + w_sys_tmp127);
	assign w_sys_tmp127 = 32'sh00000004;
	assign w_sys_tmp128 = (r_typeD_i_26 < w_sys_tmp129);
	assign w_sys_tmp129 = 32'sh00000040;
	assign w_sys_tmp130 = (r_typeD_i_26 + w_sys_tmp131);
	assign w_sys_tmp131 = 32'sh00000004;
	assign w_sys_tmp133 = $signed( w_ip_Multint_product_0[31:0] );
	assign w_sys_tmp134 = w_typeD_a_23_dataout;
	assign w_sys_tmp135 = w_typeD_b_24_dataout;
	assign w_sys_tmp137 = (r_typeD_i_26 + w_sys_intOne);
	assign w_sys_tmp144 = (r_typeD_i_26 + w_sys_tmp145);
	assign w_sys_tmp145 = 32'sh00000002;
	assign w_sys_tmp154 = (r_typeD_i_26 + w_sys_tmp155);
	assign w_sys_tmp155 = 32'sh00000003;
	assign w_sys_tmp163 = (r_typeE_i_30 < w_sys_tmp164);
	assign w_sys_tmp164 = 32'sh00000040;
	assign w_sys_tmp167 = $signed( w_ip_Multint_product_0[31:0] );
	assign w_sys_tmp168 = w_typeE_a_27_dataout;
	assign w_sys_tmp169 = w_typeE_b_28_dataout;
	assign w_sys_tmp170 = (r_typeE_i_30 + w_sys_intOne);
	assign w_sys_tmp174 = w_sys_tmp170;
	assign w_sys_tmp192 = 32'sh00000002;
	assign w_sys_tmp193 = 32'sh0000000a;


	Multint
		Multint_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_Multint_multiplicand_0),
			.b (r_ip_Multint_multiplier_0),
			.p (w_ip_Multint_product_0)
		);

	Multint
		Multint_inst_1(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_Multint_multiplicand_1),
			.b (r_ip_Multint_multiplier_1),
			.p (w_ip_Multint_product_1)
		);

	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeB_arbiter0 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h9: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_typeB_arbiter0 <= w_sys_boolTrue;

									end
									else
									if((r_sys_multStream_step==3'h1)) begin
										r_sys_typeB_arbiter0 <= w_sys_boolFalse;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h2<=r_sys_typeA_step && r_sys_typeA_step<=4'h5)) begin
										r_ip_Multint_multiplicand_0 <= w_sys_tmp38;

									end
								end

							endcase
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((4'h2<=r_sys_typeD_step && r_sys_typeD_step<=4'h5)) begin
										r_ip_Multint_multiplicand_0 <= w_sys_tmp134;

									end
								end

							endcase
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h2) || (r_sys_typeE_step==5'h9) || (r_sys_typeE_step==5'h10) || (r_sys_typeE_step==5'h17)) begin
										r_ip_Multint_multiplicand_0 <= w_sys_tmp168;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h2<=r_sys_typeA_step && r_sys_typeA_step<=4'h5)) begin
										r_ip_Multint_multiplier_0 <= w_sys_tmp39;

									end
								end

							endcase
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((4'h2<=r_sys_typeD_step && r_sys_typeD_step<=4'h5)) begin
										r_ip_Multint_multiplier_0 <= w_sys_tmp135;

									end
								end

							endcase
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h2) || (r_sys_typeE_step==5'h9) || (r_sys_typeE_step==5'h10) || (r_sys_typeE_step==5'h17)) begin
										r_ip_Multint_multiplier_0 <= w_sys_tmp169;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h2<=r_sys_typeB_step && r_sys_typeB_step<=4'h5)) begin
										r_ip_Multint_multiplicand_1 <= w_sys_tmp65;

									end
								end

							endcase
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((4'h2<=r_sys_typeC_step && r_sys_typeC_step<=4'h5)) begin
										r_ip_Multint_multiplicand_1 <= w_sys_tmp97;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h2<=r_sys_typeB_step && r_sys_typeB_step<=4'h5)) begin
										r_ip_Multint_multiplier_1 <= w_sys_tmp66;

									end
								end

							endcase
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((4'h2<=r_sys_typeC_step && r_sys_typeC_step<=4'h5)) begin
										r_ip_Multint_multiplier_1 <= w_sys_tmp98;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_processing_methodID <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_processing_methodID <= ((i_multStream_req) ? 3'h1 : r_sys_processing_methodID);
				end

				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h9: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_processing_methodID <= 3'h3;

									end
								end

							endcase
						end

						4'hb: begin
							r_sys_processing_methodID <= r_sys_multStream_caller;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_sys_processing_methodID <= r_sys_typeA_caller;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_sys_processing_methodID <= r_sys_typeB_caller;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_sys_processing_methodID <= r_sys_typeC_caller;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_sys_processing_methodID <= r_sys_typeD_caller;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_sys_processing_methodID <= r_sys_typeE_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multStream_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multStream_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multStream_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h0: begin
							r_sys_multStream_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_multStream_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_multStream_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_multStream_phase <= ((w_sys_tmp1) ? 4'h8 : 4'h9);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h3)) begin
										r_sys_multStream_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h1)) begin
										r_sys_multStream_phase <= 4'hb;

									end
								end

							endcase
						end

						4'hb: begin
							r_sys_multStream_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multStream_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h2: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_multStream_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_multStream_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_multStream_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h3)) begin
										r_sys_multStream_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h1)) begin
										r_sys_multStream_stage <= 2'h0;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multStream_step <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h2: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_multStream_step <= 3'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_multStream_step <= 3'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_multStream_step <= 3'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h3)) begin
										r_sys_multStream_step <= 3'h0;

									end
									else
									if((r_sys_multStream_step==3'h0) || (r_sys_multStream_step==3'h1) || (r_sys_multStream_step==3'h2)) begin
										r_sys_multStream_step <= w_sys_multStream_step_p1;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h1)) begin
										r_sys_multStream_step <= 3'h0;

									end
									else
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_multStream_step <= w_sys_multStream_step_p1;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multStream_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_multStream_busy <= ((i_multStream_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h0: begin
							r_sys_multStream_busy <= w_sys_boolTrue;
						end

						4'hb: begin
							r_sys_multStream_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeA_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeA_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeA_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h0: begin
							r_sys_typeA_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_sys_typeA_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_sys_typeA_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_sys_typeA_phase <= ((w_sys_tmp32) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'ha)) begin
										r_sys_typeA_phase <= 4'h5;

									end
								end

							endcase
						end

						4'ha: begin
							r_sys_typeA_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeA_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h2: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_sys_typeA_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_sys_typeA_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_sys_typeA_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'ha)) begin
										r_sys_typeA_stage <= 2'h0;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeA_step <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h2: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_sys_typeA_step <= 4'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_sys_typeA_step <= 4'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_sys_typeA_step <= 4'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeA_step && r_sys_typeA_step<=4'h9)) begin
										r_sys_typeA_step <= w_sys_typeA_step_p1;

									end
									else
									if((r_sys_typeA_step==4'ha)) begin
										r_sys_typeA_step <= 4'h0;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeA_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h0: begin
							r_sys_typeA_busy <= w_sys_boolTrue;
						end

						4'ha: begin
							r_sys_typeA_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeB_caller <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h9: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_sys_typeB_caller <= r_sys_processing_methodID;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeB_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeB_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h0: begin
							r_sys_typeB_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeB_stage) 
								2'h1: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_phase <= ((w_sys_tmp60) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'ha)) begin
										r_sys_typeB_phase <= 4'h5;

									end
								end

							endcase
						end

						4'ha: begin
							r_sys_typeB_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeB_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h2: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_stage <= w_sys_typeB_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'ha)) begin
										r_sys_typeB_stage <= 2'h0;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeB_step <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h2: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_step <= 4'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_step <= 4'h0;

									end
								end

								2'h1: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_step <= 4'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_sys_typeB_step <= 4'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'ha)) begin
										r_sys_typeB_step <= 4'h0;

									end
									else
									if((4'h0<=r_sys_typeB_step && r_sys_typeB_step<=4'h9)) begin
										r_sys_typeB_step <= w_sys_typeB_step_p1;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeB_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h0: begin
							r_sys_typeB_busy <= w_sys_boolTrue;
						end

						4'ha: begin
							r_sys_typeB_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeC_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeC_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeC_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h0: begin
							r_sys_typeC_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h0)) begin
										r_sys_typeC_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h0)) begin
										r_sys_typeC_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h0)) begin
										r_sys_typeC_phase <= ((w_sys_tmp91) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'ha)) begin
										r_sys_typeC_phase <= 4'h5;

									end
								end

							endcase
						end

						4'ha: begin
							r_sys_typeC_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeC_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h2: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h0)) begin
										r_sys_typeC_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h0)) begin
										r_sys_typeC_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h0)) begin
										r_sys_typeC_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'ha)) begin
										r_sys_typeC_stage <= 2'h0;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeC_step <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h2: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h0)) begin
										r_sys_typeC_step <= 4'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h0)) begin
										r_sys_typeC_step <= 4'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h0)) begin
										r_sys_typeC_step <= 4'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'ha)) begin
										r_sys_typeC_step <= 4'h0;

									end
									else
									if((4'h0<=r_sys_typeC_step && r_sys_typeC_step<=4'h9)) begin
										r_sys_typeC_step <= w_sys_typeC_step_p1;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeC_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h0: begin
							r_sys_typeC_busy <= w_sys_boolTrue;
						end

						4'ha: begin
							r_sys_typeC_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeD_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeD_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeD_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h0: begin
							r_sys_typeD_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_phase <= ((w_sys_tmp128) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'ha)) begin
										r_sys_typeD_phase <= 4'h6;

									end
								end

							endcase
						end

						4'ha: begin
							r_sys_typeD_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeD_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h2: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'ha)) begin
										r_sys_typeD_stage <= 2'h0;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeD_step <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h2: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_step <= 4'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_step <= 4'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_step <= 4'h0;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_sys_typeD_step <= 4'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeD_step && r_sys_typeD_step<=4'h9)) begin
										r_sys_typeD_step <= w_sys_typeD_step_p1;

									end
									else
									if((r_sys_typeD_step==4'ha)) begin
										r_sys_typeD_step <= 4'h0;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeD_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h0: begin
							r_sys_typeD_busy <= w_sys_boolTrue;
						end

						4'ha: begin
							r_sys_typeD_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeE_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeE_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeE_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h0: begin
							r_sys_typeE_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0)) begin
										r_sys_typeE_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0)) begin
										r_sys_typeE_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0)) begin
										r_sys_typeE_phase <= ((w_sys_tmp163) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h1c)) begin
										r_sys_typeE_phase <= 4'h5;

									end
								end

							endcase
						end

						4'ha: begin
							r_sys_typeE_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeE_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h2: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0)) begin
										r_sys_typeE_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0)) begin
										r_sys_typeE_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0)) begin
										r_sys_typeE_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h1c)) begin
										r_sys_typeE_stage <= 2'h0;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeE_step <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h2: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0)) begin
										r_sys_typeE_step <= 5'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0)) begin
										r_sys_typeE_step <= 5'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0)) begin
										r_sys_typeE_step <= 5'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((5'h0<=r_sys_typeE_step && r_sys_typeE_step<=5'h1b)) begin
										r_sys_typeE_step <= w_sys_typeE_step_p1;

									end
									else
									if((r_sys_typeE_step==5'h1c)) begin
										r_sys_typeE_step <= 5'h0;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_typeE_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h0: begin
							r_sys_typeE_busy <= w_sys_boolTrue;
						end

						4'ha: begin
							r_sys_typeE_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_ax_0 <= w_sys_intZero;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bx_1 <= w_sys_intOne;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_cx_2 <= w_sys_tmp192;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_dx_3 <= w_sys_tmp193;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_ex_4 <= w_sys_intZero;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_fx_5 <= w_sys_intZero;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_multStream_a_6_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h8: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((3'h0<=r_sys_multStream_step && r_sys_multStream_step<=3'h3)) begin
										r_multStream_a_6_addr <= r_multStream_i_9;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h8: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((3'h0<=r_sys_multStream_step && r_sys_multStream_step<=3'h3)) begin
										r_multStream_a_6_datain <= w_sys_tmp5;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_multStream_a_6_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h8: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((3'h0<=r_sys_multStream_step && r_sys_multStream_step<=3'h3)) begin
										r_multStream_a_6_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'hb: begin
							r_multStream_a_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_multStream_a_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_multStream_a_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_multStream_a_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_multStream_a_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_multStream_a_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_multStream_b_7_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h8: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((3'h0<=r_sys_multStream_step && r_sys_multStream_step<=3'h3)) begin
										r_multStream_b_7_addr <= r_multStream_i_9;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h8: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((3'h0<=r_sys_multStream_step && r_sys_multStream_step<=3'h3)) begin
										r_multStream_b_7_datain <= w_sys_tmp8;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_multStream_b_7_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h8: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((3'h0<=r_sys_multStream_step && r_sys_multStream_step<=3'h3)) begin
										r_multStream_b_7_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'hb: begin
							r_multStream_b_7_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_multStream_b_7_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_multStream_b_7_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_multStream_b_7_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_multStream_b_7_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_multStream_b_7_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_multStream_result_8_addr <= 32'sh0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_multStream_result_8_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_multStream_result_8_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_multStream_result_8_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_multStream_result_8_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_multStream_result_8_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_multStream_result_8_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_multStream_result_8_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'h4: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((r_sys_multStream_step==3'h0)) begin
										r_multStream_i_9 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_multStream_stage) 
								2'h0: begin
									if((3'h0<=r_sys_multStream_step && r_sys_multStream_step<=3'h3)) begin
										r_multStream_i_9 <= w_sys_tmp10;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeA_a_10_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeA_step && r_sys_typeA_step<=4'h3)) begin
										r_typeA_a_10_addr <= r_typeA_i_13;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeA_a_10_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeA_a_10_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeA_step && r_sys_typeA_step<=4'h3)) begin
										r_typeA_a_10_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeA_a_10_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeA_a_10_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeA_a_10_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeA_a_10_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeA_a_10_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeA_b_11_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeA_step && r_sys_typeA_step<=4'h3)) begin
										r_typeA_b_11_addr <= r_typeA_i_13;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeA_b_11_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeA_b_11_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeA_step && r_sys_typeA_step<=4'h3)) begin
										r_typeA_b_11_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeA_b_11_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeA_b_11_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeA_b_11_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeA_b_11_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeA_b_11_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeA_result_12_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeA_step && r_sys_typeA_step<=4'ha)) begin
										r_typeA_result_12_addr <= r_typeA_j_14;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeA_step && r_sys_typeA_step<=4'ha)) begin
										r_typeA_result_12_datain <= w_sys_tmp37;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeA_result_12_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeA_result_12_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeA_step && r_sys_typeA_step<=4'ha)) begin
										r_typeA_result_12_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeA_result_12_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeA_result_12_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeA_result_12_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeA_result_12_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeA_result_12_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h4: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_typeA_i_13 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeA_step && r_sys_typeA_step<=4'h3)) begin
										r_typeA_i_13 <= w_sys_tmp40;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_typeA_phase) 
						4'h4: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((r_sys_typeA_step==4'h0)) begin
										r_typeA_j_14 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeA_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeA_step && r_sys_typeA_step<=4'ha)) begin
										r_typeA_j_14 <= w_sys_tmp41;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeB_a_15_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeB_step && r_sys_typeB_step<=4'h3)) begin
										r_typeB_a_15_addr <= r_typeB_copy1_i_32;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeB_a_15_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeB_a_15_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeB_a_15_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeB_step && r_sys_typeB_step<=4'h3)) begin
										r_typeB_a_15_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeB_a_15_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeB_a_15_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeB_a_15_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeB_a_15_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeB_b_16_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeB_step && r_sys_typeB_step<=4'h3)) begin
										r_typeB_b_16_addr <= r_typeB_copy0_i_31;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeB_b_16_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeB_b_16_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeB_b_16_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeB_step && r_sys_typeB_step<=4'h3)) begin
										r_typeB_b_16_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeB_b_16_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeB_b_16_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeB_b_16_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeB_b_16_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeB_result_17_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeB_step && r_sys_typeB_step<=4'ha)) begin
										r_typeB_result_17_addr <= r_typeB_i_18;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeB_step && r_sys_typeB_step<=4'ha)) begin
										r_typeB_result_17_datain <= w_sys_tmp64;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeB_result_17_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeB_result_17_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeB_result_17_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeB_step && r_sys_typeB_step<=4'ha)) begin
										r_typeB_result_17_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeB_result_17_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeB_result_17_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeB_result_17_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeB_result_17_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h4: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_typeB_i_18 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeB_step && r_sys_typeB_step<=4'ha)) begin
										r_typeB_i_18 <= w_sys_tmp69;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeC_a_19_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h3)) begin
										r_typeC_a_19_addr <= w_sys_tmp117;

									end
									else
									if((r_sys_typeC_step==4'h2)) begin
										r_typeC_a_19_addr <= w_sys_tmp107;

									end
									else
									if((r_sys_typeC_step==4'h1)) begin
										r_typeC_a_19_addr <= w_sys_tmp100;

									end
									else
									if((r_sys_typeC_step==4'h0)) begin
										r_typeC_a_19_addr <= r_typeC_i_22;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeC_a_19_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeC_a_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeC_a_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeC_a_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeC_step && r_sys_typeC_step<=4'h3)) begin
										r_typeC_a_19_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeC_a_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeC_a_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeC_a_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeC_b_20_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h3)) begin
										r_typeC_b_20_addr <= w_sys_tmp117;

									end
									else
									if((r_sys_typeC_step==4'h2)) begin
										r_typeC_b_20_addr <= w_sys_tmp107;

									end
									else
									if((r_sys_typeC_step==4'h1)) begin
										r_typeC_b_20_addr <= w_sys_tmp100;

									end
									else
									if((r_sys_typeC_step==4'h0)) begin
										r_typeC_b_20_addr <= r_typeC_i_22;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeC_b_20_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeC_b_20_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeC_b_20_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeC_b_20_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeC_step && r_sys_typeC_step<=4'h3)) begin
										r_typeC_b_20_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeC_b_20_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeC_b_20_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeC_b_20_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeC_result_21_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'ha)) begin
										r_typeC_result_21_addr <= w_sys_tmp117;

									end
									else
									if((r_sys_typeC_step==4'h9)) begin
										r_typeC_result_21_addr <= w_sys_tmp107;

									end
									else
									if((r_sys_typeC_step==4'h8)) begin
										r_typeC_result_21_addr <= w_sys_tmp100;

									end
									else
									if((r_sys_typeC_step==4'h7)) begin
										r_typeC_result_21_addr <= r_typeC_i_22;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeC_step && r_sys_typeC_step<=4'ha)) begin
										r_typeC_result_21_datain <= w_sys_tmp96;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeC_result_21_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeC_result_21_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeC_result_21_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeC_result_21_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeC_step && r_sys_typeC_step<=4'ha)) begin
										r_typeC_result_21_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeC_result_21_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeC_result_21_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeC_result_21_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_typeC_phase) 
						4'h4: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'h0)) begin
										r_typeC_i_22 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeC_stage) 
								2'h0: begin
									if((r_sys_typeC_step==4'ha)) begin
										r_typeC_i_22 <= w_sys_tmp126;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeD_a_23_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h3)) begin
										r_typeD_a_23_addr <= w_sys_tmp154;

									end
									else
									if((r_sys_typeD_step==4'h0)) begin
										r_typeD_a_23_addr <= r_typeD_i_26;

									end
									else
									if((r_sys_typeD_step==4'h2)) begin
										r_typeD_a_23_addr <= w_sys_tmp144;

									end
									else
									if((r_sys_typeD_step==4'h1)) begin
										r_typeD_a_23_addr <= w_sys_tmp137;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeD_a_23_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeD_a_23_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeD_a_23_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeD_a_23_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeD_a_23_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeD_step && r_sys_typeD_step<=4'h3)) begin
										r_typeD_a_23_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeD_a_23_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeD_a_23_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeD_b_24_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h3)) begin
										r_typeD_b_24_addr <= w_sys_tmp154;

									end
									else
									if((r_sys_typeD_step==4'h0)) begin
										r_typeD_b_24_addr <= r_typeD_i_26;

									end
									else
									if((r_sys_typeD_step==4'h2)) begin
										r_typeD_b_24_addr <= w_sys_tmp144;

									end
									else
									if((r_sys_typeD_step==4'h1)) begin
										r_typeD_b_24_addr <= w_sys_tmp137;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeD_b_24_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeD_b_24_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeD_b_24_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeD_b_24_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeD_b_24_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeD_step && r_sys_typeD_step<=4'h3)) begin
										r_typeD_b_24_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeD_b_24_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeD_b_24_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeD_result_25_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'ha)) begin
										r_typeD_result_25_addr <= w_sys_tmp154;

									end
									else
									if((r_sys_typeD_step==4'h7)) begin
										r_typeD_result_25_addr <= r_typeD_i_26;

									end
									else
									if((r_sys_typeD_step==4'h9)) begin
										r_typeD_result_25_addr <= w_sys_tmp144;

									end
									else
									if((r_sys_typeD_step==4'h8)) begin
										r_typeD_result_25_addr <= w_sys_tmp137;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeD_step && r_sys_typeD_step<=4'ha)) begin
										r_typeD_result_25_datain <= w_sys_tmp133;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeD_result_25_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeD_result_25_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeD_result_25_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeD_result_25_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeD_result_25_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h8: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((4'h7<=r_sys_typeD_step && r_sys_typeD_step<=4'ha)) begin
										r_typeD_result_25_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeD_result_25_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'ha: begin
							r_typeD_result_25_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_typeD_phase) 
						4'h4: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_typeD_i_26 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_typeD_stage) 
								2'h0: begin
									if((r_sys_typeD_step==4'h0)) begin
										r_typeD_i_26 <= w_sys_tmp130;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeE_a_27_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h7) || (r_sys_typeE_step==5'he) || (r_sys_typeE_step==5'h15)) begin
										r_typeE_a_27_addr <= w_sys_tmp174;

									end
									else
									if((r_sys_typeE_step==5'h0)) begin
										r_typeE_a_27_addr <= r_typeE_i_30;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeE_a_27_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeE_a_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeE_a_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeE_a_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeE_a_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeE_a_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0) || (r_sys_typeE_step==5'h7) || (r_sys_typeE_step==5'he) || (r_sys_typeE_step==5'h15)) begin
										r_typeE_a_27_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeE_a_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeE_b_28_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h7) || (r_sys_typeE_step==5'he) || (r_sys_typeE_step==5'h15)) begin
										r_typeE_b_28_addr <= w_sys_tmp174;

									end
									else
									if((r_sys_typeE_step==5'h0)) begin
										r_typeE_b_28_addr <= r_typeE_i_30;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeE_b_28_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeE_b_28_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeE_b_28_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeE_b_28_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeE_b_28_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeE_b_28_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0) || (r_sys_typeE_step==5'h7) || (r_sys_typeE_step==5'he) || (r_sys_typeE_step==5'h15)) begin
										r_typeE_b_28_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeE_b_28_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeE_result_29_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h7) || (r_sys_typeE_step==5'he) || (r_sys_typeE_step==5'h15) || (r_sys_typeE_step==5'h1c)) begin
										r_typeE_result_29_addr <= r_typeE_i_30;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h7) || (r_sys_typeE_step==5'he) || (r_sys_typeE_step==5'h15) || (r_sys_typeE_step==5'h1c)) begin
										r_typeE_result_29_datain <= w_sys_tmp167;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_typeE_result_29_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_multStream_phase) 
						4'hb: begin
							r_typeE_result_29_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_typeA_phase) 
						4'ha: begin
							r_typeE_result_29_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_typeB_phase) 
						4'ha: begin
							r_typeE_result_29_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_typeC_phase) 
						4'ha: begin
							r_typeE_result_29_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_typeD_phase) 
						4'ha: begin
							r_typeE_result_29_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h7) || (r_sys_typeE_step==5'he) || (r_sys_typeE_step==5'h15) || (r_sys_typeE_step==5'h1c)) begin
										r_typeE_result_29_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'ha: begin
							r_typeE_result_29_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h6: begin

					case(r_sys_typeE_phase) 
						4'h4: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h0)) begin
										r_typeE_i_30 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeE_stage) 
								2'h0: begin
									if((r_sys_typeE_step==5'h7) || (r_sys_typeE_step==5'he) || (r_sys_typeE_step==5'h15) || (r_sys_typeE_step==5'h1c)) begin
										r_typeE_i_30 <= w_sys_tmp170;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h4: begin

							case(r_sys_typeB_stage) 
								2'h1: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_typeB_copy0_i_31 <= r_typeB_i_18;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeB_step && r_sys_typeB_step<=4'h3)) begin
										r_typeB_copy0_i_31 <= w_sys_tmp67;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_typeB_phase) 
						4'h4: begin

							case(r_sys_typeB_stage) 
								2'h1: begin
									if((r_sys_typeB_step==4'h0)) begin
										r_typeB_copy1_i_32 <= r_typeB_i_18;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_typeB_stage) 
								2'h0: begin
									if((4'h0<=r_sys_typeB_step && r_sys_typeB_step<=4'h3)) begin
										r_typeB_copy1_i_32 <= w_sys_tmp68;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


endmodule
