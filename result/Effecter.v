/*
TimeStamp:	2016/4/30		10:48
*/


module Effecter(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_voiceChange_req,	
	output                o_voiceChange_busy,	
	output                o_voiceChange_return,	
	input  signed  [ 9:0] i_fld_bufferInA_0_addr_0,	
	input  signed  [15:0] i_fld_bufferInA_0_datain_0,	
	output signed  [15:0] o_fld_bufferInA_0_dataout_0,	
	input                 i_fld_bufferInA_0_r_w_0,	
	input  signed  [ 9:0] i_fld_bufferInB_1_addr_0,	
	input  signed  [15:0] i_fld_bufferInB_1_datain_0,	
	output signed  [15:0] o_fld_bufferInB_1_dataout_0,	
	input                 i_fld_bufferInB_1_r_w_0,	
	input  signed  [ 9:0] i_fld_bufferOutA_2_addr_0,	
	input  signed  [15:0] i_fld_bufferOutA_2_datain_0,	
	output signed  [15:0] o_fld_bufferOutA_2_dataout_0,	
	input                 i_fld_bufferOutA_2_r_w_0,	
	input  signed  [ 9:0] i_fld_bufferOutB_3_addr_0,	
	input  signed  [15:0] i_fld_bufferOutB_3_datain_0,	
	output signed  [15:0] o_fld_bufferOutB_3_dataout_0,	
	input                 i_fld_bufferOutB_3_r_w_0,	
	input  signed  [15:0] i_voiceChange_rateA_6,	
	input  signed  [15:0] i_voiceChange_rateB_7,	
	input  signed  [15:0] i_voiceChange_threshold_8,	
	input                 i_voiceChange_bufSelect_9,	
	input  signed  [ 7:0] i_voiceChange_function_10	
);

	reg                r_sys_multSine_arbiter0;
	reg                r_sys_multSine_arbiter1;
	reg                r_sys_becomeHigh_arbiter2;
	reg                r_sys_becomeHigh_arbiter3;
	reg                r_sys_distortion_arbiter4;
	reg                r_sys_distortion_arbiter5;
	reg                r_sys_echo_arbiter6;
	reg                r_sys_echo_arbiter7;
	reg  signed [15:0] r_ip_MultInt_multiplicand_0;
	reg  signed [15:0] r_ip_MultInt_multiplier_0;
	wire signed [31:0] w_ip_MultInt_product_0;
	reg  signed [15:0] r_ip_MultInt_multiplicand_1;
	reg  signed [15:0] r_ip_MultInt_multiplier_1;
	wire signed [31:0] w_ip_MultInt_product_1;
	reg  signed [15:0] r_ip_MultInt_multiplicand_2;
	reg  signed [15:0] r_ip_MultInt_multiplier_2;
	wire signed [31:0] w_ip_MultInt_product_2;
	reg  signed [12:0] r_ip_Sin_phase_in_0;
	wire signed [14:0] w_ip_Sin_result_0;
	reg  signed [12:0] r_ip_Sin_phase_in_1;
	wire signed [14:0] w_ip_Sin_result_1;
	reg         [ 2:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg                r_sys_voiceChange_return;
	reg         [ 2:0] r_sys_voiceChange_caller;
	reg                r_sys_voiceChange_req;
	reg         [ 5:0] r_sys_voiceChange_phase;
	reg         [ 1:0] r_sys_voiceChange_stage;
	reg         [ 1:0] r_sys_voiceChange_step;
	reg                r_sys_voiceChange_busy;
	wire        [ 1:0] w_sys_voiceChange_stage_p1;
	wire        [ 1:0] w_sys_voiceChange_step_p1;
	reg         [ 2:0] r_sys_multSine_caller;
	reg                r_sys_multSine_req;
	reg         [ 3:0] r_sys_multSine_phase;
	reg         [ 1:0] r_sys_multSine_stage;
	reg         [ 4:0] r_sys_multSine_step;
	reg                r_sys_multSine_busy;
	wire        [ 1:0] w_sys_multSine_stage_p1;
	wire        [ 4:0] w_sys_multSine_step_p1;
	reg         [ 2:0] r_sys_becomeHigh_caller;
	reg                r_sys_becomeHigh_req;
	reg         [ 3:0] r_sys_becomeHigh_phase;
	reg         [ 1:0] r_sys_becomeHigh_stage;
	reg         [ 3:0] r_sys_becomeHigh_step;
	reg                r_sys_becomeHigh_busy;
	wire        [ 1:0] w_sys_becomeHigh_stage_p1;
	wire        [ 3:0] w_sys_becomeHigh_step_p1;
	reg         [ 2:0] r_sys_distortion_caller;
	reg                r_sys_distortion_req;
	reg         [ 4:0] r_sys_distortion_phase;
	reg         [ 1:0] r_sys_distortion_stage;
	reg         [ 2:0] r_sys_distortion_step;
	reg                r_sys_distortion_busy;
	wire        [ 1:0] w_sys_distortion_stage_p1;
	wire        [ 2:0] w_sys_distortion_step_p1;
	reg         [ 2:0] r_sys_echo_caller;
	reg                r_sys_echo_req;
	reg         [ 3:0] r_sys_echo_phase;
	reg         [ 1:0] r_sys_echo_stage;
	reg         [ 2:0] r_sys_echo_step;
	reg                r_sys_echo_busy;
	wire        [ 1:0] w_sys_echo_stage_p1;
	wire        [ 2:0] w_sys_echo_step_p1;
	wire signed [ 9:0] w_fld_bufferInA_0_addr_0;
	wire signed [15:0] w_fld_bufferInA_0_datain_0;
	wire signed [15:0] w_fld_bufferInA_0_dataout_0;
	wire               w_fld_bufferInA_0_r_w_0;
	wire               w_fld_bufferInA_0_ce_0;
	reg  signed [ 9:0] r_fld_bufferInA_0_addr_1;
	reg  signed [15:0] r_fld_bufferInA_0_datain_1;
	wire signed [15:0] w_fld_bufferInA_0_dataout_1;
	reg                r_fld_bufferInA_0_r_w_1;
	wire               w_fld_bufferInA_0_ce_1;
	wire signed [ 9:0] w_fld_bufferInB_1_addr_0;
	wire signed [15:0] w_fld_bufferInB_1_datain_0;
	wire signed [15:0] w_fld_bufferInB_1_dataout_0;
	wire               w_fld_bufferInB_1_r_w_0;
	wire               w_fld_bufferInB_1_ce_0;
	reg  signed [ 9:0] r_fld_bufferInB_1_addr_1;
	reg  signed [15:0] r_fld_bufferInB_1_datain_1;
	wire signed [15:0] w_fld_bufferInB_1_dataout_1;
	reg                r_fld_bufferInB_1_r_w_1;
	wire               w_fld_bufferInB_1_ce_1;
	wire signed [ 9:0] w_fld_bufferOutA_2_addr_0;
	wire signed [15:0] w_fld_bufferOutA_2_datain_0;
	wire signed [15:0] w_fld_bufferOutA_2_dataout_0;
	wire               w_fld_bufferOutA_2_r_w_0;
	wire               w_fld_bufferOutA_2_ce_0;
	reg  signed [ 9:0] r_fld_bufferOutA_2_addr_1;
	reg  signed [15:0] r_fld_bufferOutA_2_datain_1;
	wire signed [15:0] w_fld_bufferOutA_2_dataout_1;
	reg                r_fld_bufferOutA_2_r_w_1;
	wire               w_fld_bufferOutA_2_ce_1;
	wire signed [ 9:0] w_fld_bufferOutB_3_addr_0;
	wire signed [15:0] w_fld_bufferOutB_3_datain_0;
	wire signed [15:0] w_fld_bufferOutB_3_dataout_0;
	wire               w_fld_bufferOutB_3_r_w_0;
	wire               w_fld_bufferOutB_3_ce_0;
	reg  signed [ 9:0] r_fld_bufferOutB_3_addr_1;
	reg  signed [15:0] r_fld_bufferOutB_3_datain_1;
	wire signed [15:0] w_fld_bufferOutB_3_dataout_1;
	reg                r_fld_bufferOutB_3_r_w_1;
	wire               w_fld_bufferOutB_3_ce_1;
	reg  signed [31:0] r_fld_phase_4;
	reg  signed [15:0] r_fld_bufSize_5;
	reg  signed [15:0] r_voiceChange_rateA_6;
	reg  signed [15:0] r_voiceChange_rateB_7;
	reg  signed [15:0] r_voiceChange_threshold_8;
	reg                r_voiceChange_bufSelect_9;
	reg  signed [ 7:0] r_voiceChange_function_10;
	reg  signed [15:0] r_multSine_rateA_11;
	reg  signed [15:0] r_multSine_rateB_12;
	reg  signed [31:0] r_multSine_bufferIn_13_addr;
	reg  signed [15:0] r_multSine_bufferIn_13_datain;
	wire signed [15:0] w_multSine_bufferIn_13_dataout;
	reg                r_multSine_bufferIn_13_r_w;
	wire signed [31:0] w_multSine_bufferIn_13_addr;
	wire signed [15:0] w_multSine_bufferIn_13_datain;
	wire               w_multSine_bufferIn_13_r_w;
	wire               w_multSine_bufferIn_13_ce;
	wire               w_multSine_bufferIn_13_cacheHit;
	reg  signed [31:0] r_multSine_bufferOut_14_addr;
	reg  signed [15:0] r_multSine_bufferOut_14_datain;
	wire signed [15:0] w_multSine_bufferOut_14_dataout;
	reg                r_multSine_bufferOut_14_r_w;
	wire signed [31:0] w_multSine_bufferOut_14_addr;
	wire signed [15:0] w_multSine_bufferOut_14_datain;
	wire               w_multSine_bufferOut_14_r_w;
	wire               w_multSine_bufferOut_14_ce;
	wire               w_multSine_bufferOut_14_cacheHit;
	reg  signed [31:0] r_multSine_mulWave_15;
	reg  signed [31:0] r_multSine_i_16;
	reg  signed [31:0] r_multSine_j_17;
	reg  signed [31:0] r_multSine_input_18;
	reg  signed [31:0] r_becomeHigh_bufferIn_19_addr;
	reg  signed [15:0] r_becomeHigh_bufferIn_19_datain;
	wire signed [15:0] w_becomeHigh_bufferIn_19_dataout;
	reg                r_becomeHigh_bufferIn_19_r_w;
	wire signed [31:0] w_becomeHigh_bufferIn_19_addr;
	wire signed [15:0] w_becomeHigh_bufferIn_19_datain;
	wire               w_becomeHigh_bufferIn_19_r_w;
	wire               w_becomeHigh_bufferIn_19_ce;
	wire               w_becomeHigh_bufferIn_19_cacheHit;
	reg  signed [31:0] r_becomeHigh_bufferOut_20_addr;
	reg  signed [15:0] r_becomeHigh_bufferOut_20_datain;
	wire signed [15:0] w_becomeHigh_bufferOut_20_dataout;
	reg                r_becomeHigh_bufferOut_20_r_w;
	wire signed [31:0] w_becomeHigh_bufferOut_20_addr;
	wire signed [15:0] w_becomeHigh_bufferOut_20_datain;
	wire               w_becomeHigh_bufferOut_20_r_w;
	wire               w_becomeHigh_bufferOut_20_ce;
	wire               w_becomeHigh_bufferOut_20_cacheHit;
	reg  signed [31:0] r_becomeHigh_bufSizeDiv2_21;
	reg  signed [31:0] r_becomeHigh_tmp_22;
	reg  signed [31:0] r_becomeHigh_sinTmp_23;
	reg  signed [31:0] r_becomeHigh_i_24;
	reg  signed [31:0] r_becomeHigh_j_25;
	reg  signed [15:0] r_distortion_rateA_26;
	reg  signed [31:0] r_distortion_bufferIn_27_addr;
	reg  signed [15:0] r_distortion_bufferIn_27_datain;
	wire signed [15:0] w_distortion_bufferIn_27_dataout;
	reg                r_distortion_bufferIn_27_r_w;
	wire signed [31:0] w_distortion_bufferIn_27_addr;
	wire signed [15:0] w_distortion_bufferIn_27_datain;
	wire               w_distortion_bufferIn_27_r_w;
	wire               w_distortion_bufferIn_27_ce;
	wire               w_distortion_bufferIn_27_cacheHit;
	reg  signed [31:0] r_distortion_bufferOut_28_addr;
	reg  signed [15:0] r_distortion_bufferOut_28_datain;
	wire signed [15:0] w_distortion_bufferOut_28_dataout;
	reg                r_distortion_bufferOut_28_r_w;
	wire signed [31:0] w_distortion_bufferOut_28_addr;
	wire signed [15:0] w_distortion_bufferOut_28_datain;
	wire               w_distortion_bufferOut_28_r_w;
	wire               w_distortion_bufferOut_28_ce;
	wire               w_distortion_bufferOut_28_cacheHit;
	reg  signed [15:0] r_distortion_bufIn_29;
	reg  signed [31:0] r_distortion_i_30;
	reg  signed [31:0] r_distortion_j_31;
	reg  signed [31:0] r_echo_bufferIn_32_addr;
	reg  signed [15:0] r_echo_bufferIn_32_datain;
	wire signed [15:0] w_echo_bufferIn_32_dataout;
	reg                r_echo_bufferIn_32_r_w;
	wire signed [31:0] w_echo_bufferIn_32_addr;
	wire signed [15:0] w_echo_bufferIn_32_datain;
	wire               w_echo_bufferIn_32_r_w;
	wire               w_echo_bufferIn_32_ce;
	wire               w_echo_bufferIn_32_cacheHit;
	reg  signed [31:0] r_echo_bufferOut_33_addr;
	reg  signed [15:0] r_echo_bufferOut_33_datain;
	wire signed [15:0] w_echo_bufferOut_33_dataout;
	reg                r_echo_bufferOut_33_r_w;
	wire signed [31:0] w_echo_bufferOut_33_addr;
	wire signed [15:0] w_echo_bufferOut_33_datain;
	wire               w_echo_bufferOut_33_r_w;
	wire               w_echo_bufferOut_33_ce;
	wire               w_echo_bufferOut_33_cacheHit;
	reg  signed [31:0] r_echo_i_34;
	reg  signed [31:0] r_echo_j_35;
	reg  signed [31:0] r_multSine_copy1_input_37;
	reg  signed [31:0] r_multSine_copy2_input_38;
	reg  signed [31:0] r_multSine_copy3_input_39;
	reg  signed [31:0] r_multSine_copy4_input_40;
	reg  signed [31:0] r_multSine_copy5_input_41;
	reg  signed [31:0] r_multSine_copy6_input_42;
	reg  signed [31:0] r_multSine_copy7_input_43;
	reg  signed [31:0] r_sys_tmp0_int;
	reg  signed [31:0] r_sys_tmp1_int;
	wire               w_sys_tmp1;
	wire               w_sys_tmp2;
	wire               w_sys_tmp3;
	wire               w_sys_tmp4;
	wire               w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire               w_sys_tmp7;
	wire               w_sys_tmp8;
	wire               w_sys_tmp9;
	wire               w_sys_tmp10;
	wire signed [31:0] w_sys_tmp14;
	wire signed [31:0] w_sys_tmp15;
	wire signed [31:0] w_sys_tmp16;
	wire signed [31:0] w_sys_tmp17;
	wire signed [15:0] w_sys_tmp18;
	wire signed [31:0] w_sys_tmp19;
	wire signed [31:0] w_sys_tmp20;
	wire signed [15:0] w_sys_tmp21;
	wire signed [15:0] w_sys_tmp24;
	wire signed [31:0] w_sys_tmp25;
	wire signed [31:0] w_sys_tmp26;
	wire signed [31:0] w_sys_tmp28;
	wire signed [31:0] w_sys_tmp29;
	wire signed [31:0] w_sys_tmp30;
	wire signed [31:0] w_sys_tmp31;
	wire signed [31:0] w_sys_tmp32;
	wire signed [31:0] w_sys_tmp33;
	wire signed [31:0] w_sys_tmp34;
	wire signed [31:0] w_sys_tmp35;
	wire signed [31:0] w_sys_tmp40;
	wire signed [31:0] w_sys_tmp41;
	wire signed [15:0] w_sys_tmp46;
	wire signed [31:0] w_sys_tmp47;
	wire signed [31:0] w_sys_tmp48;
	wire signed [15:0] w_sys_tmp68;
	wire signed [31:0] w_sys_tmp69;
	wire signed [31:0] w_sys_tmp70;
	wire signed [15:0] w_sys_tmp90;
	wire signed [31:0] w_sys_tmp91;
	wire signed [31:0] w_sys_tmp92;
	wire signed [31:0] w_sys_tmp94;
	wire signed [31:0] w_sys_tmp95;
	wire signed [15:0] w_sys_tmp112;
	wire signed [31:0] w_sys_tmp113;
	wire signed [31:0] w_sys_tmp114;
	wire signed [31:0] w_sys_tmp116;
	wire signed [31:0] w_sys_tmp117;
	wire signed [15:0] w_sys_tmp134;
	wire signed [31:0] w_sys_tmp135;
	wire signed [31:0] w_sys_tmp136;
	wire signed [15:0] w_sys_tmp156;
	wire signed [31:0] w_sys_tmp157;
	wire signed [31:0] w_sys_tmp158;
	wire signed [15:0] w_sys_tmp178;
	wire signed [31:0] w_sys_tmp179;
	wire signed [31:0] w_sys_tmp180;
	wire signed [31:0] w_sys_tmp190;
	wire               w_sys_tmp191;
	wire signed [31:0] w_sys_tmp195;
	wire signed [15:0] w_sys_tmp196;
	wire signed [31:0] w_sys_tmp197;
	wire signed [31:0] w_sys_tmp198;
	wire signed [15:0] w_sys_tmp199;
	wire signed [31:0] w_sys_tmp200;
	wire signed [31:0] w_sys_tmp202;
	wire signed [31:0] w_sys_tmp203;
	wire signed [15:0] w_sys_tmp205;
	wire signed [31:0] w_sys_tmp206;
	wire signed [31:0] w_sys_tmp208;
	wire signed [15:0] w_sys_tmp209;
	wire signed [31:0] w_sys_tmp210;
	wire signed [31:0] w_sys_tmp211;
	wire signed [31:0] w_sys_tmp212;
	wire               w_sys_tmp213;
	wire signed [31:0] w_sys_tmp214;
	wire signed [31:0] w_sys_tmp215;
	wire signed [31:0] w_sys_tmp216;
	wire               w_sys_tmp217;
	wire signed [15:0] w_sys_tmp219;
	wire signed [31:0] w_sys_tmp220;
	wire signed [31:0] w_sys_tmp221;
	wire               w_sys_tmp222;
	wire signed [15:0] w_sys_tmp225;
	wire signed [31:0] w_sys_tmp226;
	wire               w_sys_tmp227;
	wire               w_sys_tmp228;
	wire signed [15:0] w_sys_tmp232;
	wire signed [31:0] w_sys_tmp233;
	wire signed [31:0] w_sys_tmp234;
	wire signed [31:0] w_sys_tmp235;
	wire signed [31:0] w_sys_tmp236;
	wire signed [31:0] w_sys_tmp237;
	wire signed [31:0] w_sys_tmp238;
	wire signed [31:0] w_sys_tmp239;
	wire signed [31:0] w_sys_tmp240;
	wire signed [31:0] w_sys_tmp241;
	wire signed [31:0] w_sys_tmp242;
	wire signed [31:0] w_sys_tmp244;
	wire signed [31:0] w_sys_tmp246;
	wire signed [31:0] w_sys_tmp247;
	wire signed [31:0] w_sys_tmp248;
	wire signed [31:0] w_sys_tmp249;
	wire signed [31:0] w_sys_tmp250;
	wire signed [31:0] w_sys_tmp252;
	wire signed [31:0] w_sys_tmp254;
	wire signed [15:0] w_sys_tmp256;
	wire signed [31:0] w_sys_tmp257;
	wire signed [31:0] w_sys_tmp258;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_multSine_bufferIn_13_cacheHit & w_multSine_bufferOut_14_cacheHit & w_becomeHigh_bufferIn_19_cacheHit & w_becomeHigh_bufferOut_20_cacheHit & w_distortion_bufferIn_27_cacheHit & w_distortion_bufferOut_28_cacheHit & w_echo_bufferIn_32_cacheHit & w_echo_bufferOut_33_cacheHit;
	assign o_voiceChange_busy = r_sys_voiceChange_busy;
	assign o_voiceChange_return = r_sys_voiceChange_return;
	assign w_sys_voiceChange_stage_p1 = (r_sys_voiceChange_stage + 2'h1);
	assign w_sys_voiceChange_step_p1 = (r_sys_voiceChange_step + 2'h1);
	assign w_sys_multSine_stage_p1 = (r_sys_multSine_stage + 2'h1);
	assign w_sys_multSine_step_p1 = (r_sys_multSine_step + 5'h1);
	assign w_sys_becomeHigh_stage_p1 = (r_sys_becomeHigh_stage + 2'h1);
	assign w_sys_becomeHigh_step_p1 = (r_sys_becomeHigh_step + 4'h1);
	assign w_sys_distortion_stage_p1 = (r_sys_distortion_stage + 2'h1);
	assign w_sys_distortion_step_p1 = (r_sys_distortion_step + 3'h1);
	assign w_sys_echo_stage_p1 = (r_sys_echo_stage + 2'h1);
	assign w_sys_echo_step_p1 = (r_sys_echo_step + 3'h1);
	assign o_fld_bufferInA_0_dataout_0 = w_fld_bufferInA_0_dataout_0;
	assign w_fld_bufferInA_0_addr_0 = ( r_sys_becomeHigh_arbiter2 ? $signed( w_becomeHigh_bufferIn_19_addr[9:0] ) : ( r_sys_multSine_arbiter0 ? $signed( w_multSine_bufferIn_13_addr[9:0] ) : ( r_sys_echo_arbiter6 ? $signed( w_echo_bufferIn_32_addr[9:0] ) : ( r_sys_distortion_arbiter4 ? $signed( w_distortion_bufferIn_27_addr[9:0] ) : i_fld_bufferInA_0_addr_0 )  )  )  ) ;
	assign w_fld_bufferInA_0_datain_0 = ( r_sys_becomeHigh_arbiter2 ? w_becomeHigh_bufferIn_19_datain : ( r_sys_multSine_arbiter0 ? w_multSine_bufferIn_13_datain : ( r_sys_echo_arbiter6 ? w_echo_bufferIn_32_datain : ( r_sys_distortion_arbiter4 ? w_distortion_bufferIn_27_datain : i_fld_bufferInA_0_datain_0 )  )  )  ) ;
	assign w_fld_bufferInA_0_r_w_0 = ( r_sys_becomeHigh_arbiter2 ? w_becomeHigh_bufferIn_19_r_w : ( r_sys_multSine_arbiter0 ? w_multSine_bufferIn_13_r_w : ( r_sys_echo_arbiter6 ? w_echo_bufferIn_32_r_w : ( r_sys_distortion_arbiter4 ? w_distortion_bufferIn_27_r_w : i_fld_bufferInA_0_r_w_0 )  )  )  ) ;
	assign w_fld_bufferInA_0_ce_0 = w_sys_ce;
	assign w_fld_bufferInA_0_ce_1 = w_sys_ce;
	assign o_fld_bufferInB_1_dataout_0 = w_fld_bufferInB_1_dataout_0;
	assign w_fld_bufferInB_1_addr_0 = ( r_sys_echo_arbiter7 ? $signed( w_echo_bufferIn_32_addr[9:0] ) : ( r_sys_becomeHigh_arbiter3 ? $signed( w_becomeHigh_bufferIn_19_addr[9:0] ) : ( r_sys_distortion_arbiter5 ? $signed( w_distortion_bufferIn_27_addr[9:0] ) : ( r_sys_multSine_arbiter1 ? $signed( w_multSine_bufferIn_13_addr[9:0] ) : i_fld_bufferInB_1_addr_0 )  )  )  ) ;
	assign w_fld_bufferInB_1_datain_0 = ( r_sys_echo_arbiter7 ? w_echo_bufferIn_32_datain : ( r_sys_becomeHigh_arbiter3 ? w_becomeHigh_bufferIn_19_datain : ( r_sys_distortion_arbiter5 ? w_distortion_bufferIn_27_datain : ( r_sys_multSine_arbiter1 ? w_multSine_bufferIn_13_datain : i_fld_bufferInB_1_datain_0 )  )  )  ) ;
	assign w_fld_bufferInB_1_r_w_0 = ( r_sys_echo_arbiter7 ? w_echo_bufferIn_32_r_w : ( r_sys_becomeHigh_arbiter3 ? w_becomeHigh_bufferIn_19_r_w : ( r_sys_distortion_arbiter5 ? w_distortion_bufferIn_27_r_w : ( r_sys_multSine_arbiter1 ? w_multSine_bufferIn_13_r_w : i_fld_bufferInB_1_r_w_0 )  )  )  ) ;
	assign w_fld_bufferInB_1_ce_0 = w_sys_ce;
	assign w_fld_bufferInB_1_ce_1 = w_sys_ce;
	assign o_fld_bufferOutA_2_dataout_0 = w_fld_bufferOutA_2_dataout_0;
	assign w_fld_bufferOutA_2_addr_0 = ( r_sys_becomeHigh_arbiter2 ? $signed( w_becomeHigh_bufferOut_20_addr[9:0] ) : ( r_sys_multSine_arbiter0 ? $signed( w_multSine_bufferOut_14_addr[9:0] ) : ( r_sys_echo_arbiter6 ? $signed( w_echo_bufferOut_33_addr[9:0] ) : ( r_sys_distortion_arbiter4 ? $signed( w_distortion_bufferOut_28_addr[9:0] ) : i_fld_bufferOutA_2_addr_0 )  )  )  ) ;
	assign w_fld_bufferOutA_2_datain_0 = ( r_sys_becomeHigh_arbiter2 ? w_becomeHigh_bufferOut_20_datain : ( r_sys_multSine_arbiter0 ? w_multSine_bufferOut_14_datain : ( r_sys_echo_arbiter6 ? w_echo_bufferOut_33_datain : ( r_sys_distortion_arbiter4 ? w_distortion_bufferOut_28_datain : i_fld_bufferOutA_2_datain_0 )  )  )  ) ;
	assign w_fld_bufferOutA_2_r_w_0 = ( r_sys_becomeHigh_arbiter2 ? w_becomeHigh_bufferOut_20_r_w : ( r_sys_multSine_arbiter0 ? w_multSine_bufferOut_14_r_w : ( r_sys_echo_arbiter6 ? w_echo_bufferOut_33_r_w : ( r_sys_distortion_arbiter4 ? w_distortion_bufferOut_28_r_w : i_fld_bufferOutA_2_r_w_0 )  )  )  ) ;
	assign w_fld_bufferOutA_2_ce_0 = w_sys_ce;
	assign w_fld_bufferOutA_2_ce_1 = w_sys_ce;
	assign o_fld_bufferOutB_3_dataout_0 = w_fld_bufferOutB_3_dataout_0;
	assign w_fld_bufferOutB_3_addr_0 = ( r_sys_echo_arbiter7 ? $signed( w_echo_bufferOut_33_addr[9:0] ) : ( r_sys_becomeHigh_arbiter3 ? $signed( w_becomeHigh_bufferOut_20_addr[9:0] ) : ( r_sys_distortion_arbiter5 ? $signed( w_distortion_bufferOut_28_addr[9:0] ) : ( r_sys_multSine_arbiter1 ? $signed( w_multSine_bufferOut_14_addr[9:0] ) : i_fld_bufferOutB_3_addr_0 )  )  )  ) ;
	assign w_fld_bufferOutB_3_datain_0 = ( r_sys_echo_arbiter7 ? w_echo_bufferOut_33_datain : ( r_sys_becomeHigh_arbiter3 ? w_becomeHigh_bufferOut_20_datain : ( r_sys_distortion_arbiter5 ? w_distortion_bufferOut_28_datain : ( r_sys_multSine_arbiter1 ? w_multSine_bufferOut_14_datain : i_fld_bufferOutB_3_datain_0 )  )  )  ) ;
	assign w_fld_bufferOutB_3_r_w_0 = ( r_sys_echo_arbiter7 ? w_echo_bufferOut_33_r_w : ( r_sys_becomeHigh_arbiter3 ? w_becomeHigh_bufferOut_20_r_w : ( r_sys_distortion_arbiter5 ? w_distortion_bufferOut_28_r_w : ( r_sys_multSine_arbiter1 ? w_multSine_bufferOut_14_r_w : i_fld_bufferOutB_3_r_w_0 )  )  )  ) ;
	assign w_fld_bufferOutB_3_ce_0 = w_sys_ce;
	assign w_fld_bufferOutB_3_ce_1 = w_sys_ce;
	assign w_multSine_bufferIn_13_dataout = ( r_sys_multSine_arbiter0 ? w_fld_bufferInA_0_dataout_0 : ( r_sys_multSine_arbiter1 ? w_fld_bufferInB_1_dataout_0 : 16'sh0 )  ) ;
	assign w_multSine_bufferIn_13_addr = r_multSine_bufferIn_13_addr;
	assign w_multSine_bufferIn_13_datain = r_multSine_bufferIn_13_datain;
	assign w_multSine_bufferIn_13_r_w = r_multSine_bufferIn_13_r_w;
	assign w_multSine_bufferIn_13_ce = w_sys_ce;
	assign w_multSine_bufferIn_13_cacheHit = ( r_sys_multSine_arbiter0 ? w_sys_boolTrue : ( r_sys_multSine_arbiter1 ? w_sys_boolTrue : w_sys_boolTrue )  ) ;
	assign w_multSine_bufferOut_14_dataout = ( r_sys_multSine_arbiter0 ? w_fld_bufferOutA_2_dataout_0 : ( r_sys_multSine_arbiter1 ? w_fld_bufferOutB_3_dataout_0 : 16'sh0 )  ) ;
	assign w_multSine_bufferOut_14_addr = r_multSine_bufferOut_14_addr;
	assign w_multSine_bufferOut_14_datain = r_multSine_bufferOut_14_datain;
	assign w_multSine_bufferOut_14_r_w = r_multSine_bufferOut_14_r_w;
	assign w_multSine_bufferOut_14_ce = w_sys_ce;
	assign w_multSine_bufferOut_14_cacheHit = ( r_sys_multSine_arbiter0 ? w_sys_boolTrue : ( r_sys_multSine_arbiter1 ? w_sys_boolTrue : w_sys_boolTrue )  ) ;
	assign w_becomeHigh_bufferIn_19_dataout = ( r_sys_becomeHigh_arbiter2 ? w_fld_bufferInA_0_dataout_0 : ( r_sys_becomeHigh_arbiter3 ? w_fld_bufferInB_1_dataout_0 : 16'sh0 )  ) ;
	assign w_becomeHigh_bufferIn_19_addr = r_becomeHigh_bufferIn_19_addr;
	assign w_becomeHigh_bufferIn_19_datain = r_becomeHigh_bufferIn_19_datain;
	assign w_becomeHigh_bufferIn_19_r_w = r_becomeHigh_bufferIn_19_r_w;
	assign w_becomeHigh_bufferIn_19_ce = w_sys_ce;
	assign w_becomeHigh_bufferIn_19_cacheHit = ( r_sys_becomeHigh_arbiter2 ? w_sys_boolTrue : ( r_sys_becomeHigh_arbiter3 ? w_sys_boolTrue : w_sys_boolTrue )  ) ;
	assign w_becomeHigh_bufferOut_20_dataout = ( r_sys_becomeHigh_arbiter2 ? w_fld_bufferOutA_2_dataout_0 : ( r_sys_becomeHigh_arbiter3 ? w_fld_bufferOutB_3_dataout_0 : 16'sh0 )  ) ;
	assign w_becomeHigh_bufferOut_20_addr = r_becomeHigh_bufferOut_20_addr;
	assign w_becomeHigh_bufferOut_20_datain = r_becomeHigh_bufferOut_20_datain;
	assign w_becomeHigh_bufferOut_20_r_w = r_becomeHigh_bufferOut_20_r_w;
	assign w_becomeHigh_bufferOut_20_ce = w_sys_ce;
	assign w_becomeHigh_bufferOut_20_cacheHit = ( r_sys_becomeHigh_arbiter2 ? w_sys_boolTrue : ( r_sys_becomeHigh_arbiter3 ? w_sys_boolTrue : w_sys_boolTrue )  ) ;
	assign w_distortion_bufferIn_27_dataout = ( r_sys_distortion_arbiter5 ? w_fld_bufferInB_1_dataout_0 : ( r_sys_distortion_arbiter4 ? w_fld_bufferInA_0_dataout_0 : 16'sh0 )  ) ;
	assign w_distortion_bufferIn_27_addr = r_distortion_bufferIn_27_addr;
	assign w_distortion_bufferIn_27_datain = r_distortion_bufferIn_27_datain;
	assign w_distortion_bufferIn_27_r_w = r_distortion_bufferIn_27_r_w;
	assign w_distortion_bufferIn_27_ce = w_sys_ce;
	assign w_distortion_bufferIn_27_cacheHit = ( r_sys_distortion_arbiter5 ? w_sys_boolTrue : ( r_sys_distortion_arbiter4 ? w_sys_boolTrue : w_sys_boolTrue )  ) ;
	assign w_distortion_bufferOut_28_dataout = ( r_sys_distortion_arbiter5 ? w_fld_bufferOutB_3_dataout_0 : ( r_sys_distortion_arbiter4 ? w_fld_bufferOutA_2_dataout_0 : 16'sh0 )  ) ;
	assign w_distortion_bufferOut_28_addr = r_distortion_bufferOut_28_addr;
	assign w_distortion_bufferOut_28_datain = r_distortion_bufferOut_28_datain;
	assign w_distortion_bufferOut_28_r_w = r_distortion_bufferOut_28_r_w;
	assign w_distortion_bufferOut_28_ce = w_sys_ce;
	assign w_distortion_bufferOut_28_cacheHit = ( r_sys_distortion_arbiter5 ? w_sys_boolTrue : ( r_sys_distortion_arbiter4 ? w_sys_boolTrue : w_sys_boolTrue )  ) ;
	assign w_echo_bufferIn_32_dataout = ( r_sys_echo_arbiter7 ? w_fld_bufferInB_1_dataout_0 : ( r_sys_echo_arbiter6 ? w_fld_bufferInA_0_dataout_0 : 16'sh0 )  ) ;
	assign w_echo_bufferIn_32_addr = r_echo_bufferIn_32_addr;
	assign w_echo_bufferIn_32_datain = r_echo_bufferIn_32_datain;
	assign w_echo_bufferIn_32_r_w = r_echo_bufferIn_32_r_w;
	assign w_echo_bufferIn_32_ce = w_sys_ce;
	assign w_echo_bufferIn_32_cacheHit = ( r_sys_echo_arbiter7 ? w_sys_boolTrue : ( r_sys_echo_arbiter6 ? w_sys_boolTrue : w_sys_boolTrue )  ) ;
	assign w_echo_bufferOut_33_dataout = ( r_sys_echo_arbiter7 ? w_fld_bufferOutB_3_dataout_0 : ( r_sys_echo_arbiter6 ? w_fld_bufferOutA_2_dataout_0 : 16'sh0 )  ) ;
	assign w_echo_bufferOut_33_addr = r_echo_bufferOut_33_addr;
	assign w_echo_bufferOut_33_datain = r_echo_bufferOut_33_datain;
	assign w_echo_bufferOut_33_r_w = r_echo_bufferOut_33_r_w;
	assign w_echo_bufferOut_33_ce = w_sys_ce;
	assign w_echo_bufferOut_33_cacheHit = ( r_sys_echo_arbiter7 ? w_sys_boolTrue : ( r_sys_echo_arbiter6 ? w_sys_boolTrue : w_sys_boolTrue )  ) ;
	assign w_sys_tmp1 = ($signed( {{24{r_voiceChange_function_10[7]}}, r_voiceChange_function_10} ) == w_sys_intZero);
	assign w_sys_tmp2 = ( !r_voiceChange_bufSelect_9 );
	assign w_sys_tmp3 = ($signed( {{24{r_voiceChange_function_10[7]}}, r_voiceChange_function_10} ) == w_sys_intOne);
	assign w_sys_tmp4 = ( !r_voiceChange_bufSelect_9 );
	assign w_sys_tmp5 = ($signed( {{24{r_voiceChange_function_10[7]}}, r_voiceChange_function_10} ) == w_sys_tmp6);
	assign w_sys_tmp6 = 32'sh00000002;
	assign w_sys_tmp7 = ( !r_voiceChange_bufSelect_9 );
	assign w_sys_tmp8 = ( !r_voiceChange_bufSelect_9 );
	assign w_sys_tmp9 = r_voiceChange_bufSelect_9;
	assign w_sys_tmp10 = (r_multSine_i_16 < $signed( {{16{r_fld_bufSize_5[15]}}, r_fld_bufSize_5} ));
	assign w_sys_tmp14 = $signed( {{16{w_multSine_bufferIn_13_dataout[15]}}, w_multSine_bufferIn_13_dataout} );
	assign w_sys_tmp15 = w_ip_MultInt_product_1;
	assign w_sys_tmp16 = (w_sys_tmp17 + w_sys_tmp20);
	assign w_sys_tmp17 = $signed( {{17{w_ip_Sin_result_0[14]}}, w_ip_Sin_result_0} );
	assign w_sys_tmp18 = $signed( w_sys_tmp19[15:0] );
	assign w_sys_tmp19 = w_ip_MultInt_product_0;
	assign w_sys_tmp20 = $signed( {{17{w_ip_Sin_result_1[14]}}, w_ip_Sin_result_1} );
	assign w_sys_tmp21 = $signed( w_sys_tmp15[15:0] );
	assign w_sys_tmp24 = $signed( w_sys_tmp25[15:0] );
	assign w_sys_tmp25 = w_sys_tmp240;
	assign w_sys_tmp26 = (w_sys_tmp15 + r_multSine_input_18);
	assign w_sys_tmp28 = w_sys_tmp241;
	assign w_sys_tmp29 = w_sys_tmp15;
	assign w_sys_tmp30 = 32'sh00000010;
	assign w_sys_tmp31 = 32'sh00000007;
	assign w_sys_tmp32 = 32'sh00000003;
	assign w_sys_tmp33 = (r_multSine_i_16 + w_sys_intOne);
	assign w_sys_tmp34 = (r_multSine_j_17 + w_sys_intOne);
	assign w_sys_tmp35 = (r_fld_phase_4 + w_sys_intOne);
	assign w_sys_tmp40 = w_ip_MultInt_product_2;
	assign w_sys_tmp41 = w_sys_tmp35;
	assign w_sys_tmp46 = $signed( w_sys_tmp47[15:0] );
	assign w_sys_tmp47 = w_sys_tmp242;
	assign w_sys_tmp48 = (w_sys_tmp15 + r_multSine_copy1_input_37);
	assign w_sys_tmp68 = $signed( w_sys_tmp69[15:0] );
	assign w_sys_tmp69 = w_sys_tmp244;
	assign w_sys_tmp70 = (w_sys_tmp15 + r_multSine_copy2_input_38);
	assign w_sys_tmp90 = $signed( w_sys_tmp91[15:0] );
	assign w_sys_tmp91 = w_sys_tmp246;
	assign w_sys_tmp92 = (w_sys_tmp15 + r_multSine_copy3_input_39);
	assign w_sys_tmp94 = w_sys_tmp247;
	assign w_sys_tmp95 = w_sys_tmp19;
	assign w_sys_tmp112 = $signed( w_sys_tmp113[15:0] );
	assign w_sys_tmp113 = w_sys_tmp248;
	assign w_sys_tmp114 = (w_sys_tmp15 + r_multSine_copy4_input_40);
	assign w_sys_tmp116 = w_sys_tmp249;
	assign w_sys_tmp117 = w_sys_tmp40;
	assign w_sys_tmp134 = $signed( w_sys_tmp135[15:0] );
	assign w_sys_tmp135 = w_sys_tmp250;
	assign w_sys_tmp136 = (w_sys_tmp15 + r_multSine_copy5_input_41);
	assign w_sys_tmp156 = $signed( w_sys_tmp157[15:0] );
	assign w_sys_tmp157 = w_sys_tmp252;
	assign w_sys_tmp158 = (w_sys_tmp15 + r_multSine_copy6_input_42);
	assign w_sys_tmp178 = $signed( w_sys_tmp179[15:0] );
	assign w_sys_tmp179 = w_sys_tmp254;
	assign w_sys_tmp180 = (w_sys_tmp15 + r_multSine_copy7_input_43);
	assign w_sys_tmp190 = $signed( {{16{w_sys_tmp256[15]}}, w_sys_tmp256} );
	assign w_sys_tmp191 = (r_becomeHigh_i_24 < $signed( {{16{r_fld_bufSize_5[15]}}, r_fld_bufSize_5} ));
	assign w_sys_tmp195 = $signed( {{17{w_ip_Sin_result_0[14]}}, w_ip_Sin_result_0} );
	assign w_sys_tmp196 = $signed( w_sys_tmp197[15:0] );
	assign w_sys_tmp197 = w_ip_MultInt_product_2;
	assign w_sys_tmp198 = 32'sh00000004;
	assign w_sys_tmp199 = $signed( w_sys_tmp200[15:0] );
	assign w_sys_tmp200 = w_sys_tmp257;
	assign w_sys_tmp202 = w_sys_tmp195;
	assign w_sys_tmp203 = 32'sh00000010;
	assign w_sys_tmp205 = $signed( w_sys_tmp206[15:0] );
	assign w_sys_tmp206 = $signed( {{16{w_sys_tmp199[15]}}, w_sys_tmp199} );
	assign w_sys_tmp208 = (r_becomeHigh_j_25 + r_becomeHigh_bufSizeDiv2_21);
	assign w_sys_tmp209 = $signed( r_becomeHigh_tmp_22[15:0] );
	assign w_sys_tmp210 = (r_becomeHigh_i_24 + w_sys_tmp211);
	assign w_sys_tmp211 = 32'sh00000002;
	assign w_sys_tmp212 = (r_becomeHigh_j_25 + w_sys_intOne);
	assign w_sys_tmp213 = (r_distortion_i_30 < $signed( {{16{r_fld_bufSize_5[15]}}, r_fld_bufSize_5} ));
	assign w_sys_tmp214 = (r_distortion_i_30 + w_sys_intOne);
	assign w_sys_tmp215 = (r_distortion_j_31 + w_sys_intOne);
	assign w_sys_tmp216 = $signed( {{16{w_distortion_bufferIn_27_dataout[15]}}, w_distortion_bufferIn_27_dataout} );
	assign w_sys_tmp217 = ($signed( {{16{r_distortion_bufIn_29[15]}}, r_distortion_bufIn_29} ) < w_sys_intZero);
	assign w_sys_tmp219 = $signed( w_sys_tmp220[15:0] );
	assign w_sys_tmp220 = ((w_sys_tmp222) ? w_sys_tmp221 : $signed( {{16{r_distortion_bufIn_29[15]}}, r_distortion_bufIn_29} ));
	assign w_sys_tmp221 = (-{ {16{r_distortion_rateA_26[15]}}, r_distortion_rateA_26});
	assign w_sys_tmp222 = ($signed( {{16{r_distortion_bufIn_29[15]}}, r_distortion_bufIn_29} ) < w_sys_tmp221);
	assign w_sys_tmp225 = $signed( w_sys_tmp226[15:0] );
	assign w_sys_tmp226 = ((w_sys_tmp227) ? $signed( {{16{r_distortion_rateA_26[15]}}, r_distortion_rateA_26} ) : $signed( {{16{r_distortion_bufIn_29[15]}}, r_distortion_bufIn_29} ));
	assign w_sys_tmp227 = (r_distortion_rateA_26 < r_distortion_bufIn_29);
	assign w_sys_tmp228 = (r_echo_i_34 < $signed( {{16{r_fld_bufSize_5[15]}}, r_fld_bufSize_5} ));
	assign w_sys_tmp232 = $signed( w_sys_tmp233[15:0] );
	assign w_sys_tmp233 = w_sys_tmp258;
	assign w_sys_tmp234 = (w_sys_tmp235 + w_sys_tmp236);
	assign w_sys_tmp235 = $signed( {{16{w_echo_bufferOut_33_dataout[15]}}, w_echo_bufferOut_33_dataout} );
	assign w_sys_tmp236 = $signed( {{16{w_echo_bufferIn_32_dataout[15]}}, w_echo_bufferIn_32_dataout} );
	assign w_sys_tmp237 = (r_echo_i_34 + w_sys_intOne);
	assign w_sys_tmp238 = (r_echo_j_35 + w_sys_intOne);
	assign w_sys_tmp239 = 32'sh00000400;
	assign w_sys_tmp240 = { { 29{w_sys_tmp26[31]} }, w_sys_tmp26[31 : 3] };
	assign w_sys_tmp241 = { { 16{w_sys_tmp29[31]} }, w_sys_tmp29[31 : 16] };
	assign w_sys_tmp242 = { { 29{w_sys_tmp48[31]} }, w_sys_tmp48[31 : 3] };
	assign w_sys_tmp244 = { { 29{w_sys_tmp70[31]} }, w_sys_tmp70[31 : 3] };
	assign w_sys_tmp246 = { { 29{w_sys_tmp92[31]} }, w_sys_tmp92[31 : 3] };
	assign w_sys_tmp247 = { { 16{w_sys_tmp95[31]} }, w_sys_tmp95[31 : 16] };
	assign w_sys_tmp248 = { { 29{w_sys_tmp114[31]} }, w_sys_tmp114[31 : 3] };
	assign w_sys_tmp249 = { { 16{w_sys_tmp117[31]} }, w_sys_tmp117[31 : 16] };
	assign w_sys_tmp250 = { { 29{w_sys_tmp136[31]} }, w_sys_tmp136[31 : 3] };
	assign w_sys_tmp252 = { { 29{w_sys_tmp158[31]} }, w_sys_tmp158[31 : 3] };
	assign w_sys_tmp254 = { { 29{w_sys_tmp180[31]} }, w_sys_tmp180[31 : 3] };
	assign w_sys_tmp256 = { { 15{r_fld_bufSize_5[15]} }, r_fld_bufSize_5[15 : 1] };
	assign w_sys_tmp257 = { { 16{w_sys_tmp197[31]} }, w_sys_tmp197[31 : 16] };
	assign w_sys_tmp258 = { { 31{w_sys_tmp234[31]} }, w_sys_tmp234[31 : 1] };


	DualPortRAM #(.DWIDTH(16), .AWIDTH(10), .WORDS(1024) )
		dpram_bufferInA_0(
			.clk (clock),
			.ce_0 (w_fld_bufferInA_0_ce_0),
			.addr_0 (w_fld_bufferInA_0_addr_0),
			.datain_0 (w_fld_bufferInA_0_datain_0),
			.dataout_0 (w_fld_bufferInA_0_dataout_0),
			.r_w_0 (w_fld_bufferInA_0_r_w_0),
			.ce_1 (w_fld_bufferInA_0_ce_1),
			.addr_1 (r_fld_bufferInA_0_addr_1),
			.datain_1 (r_fld_bufferInA_0_datain_1),
			.dataout_1 (w_fld_bufferInA_0_dataout_1),
			.r_w_1 (r_fld_bufferInA_0_r_w_1)
		);

	DualPortRAM #(.DWIDTH(16), .AWIDTH(10), .WORDS(1024) )
		dpram_bufferInB_1(
			.clk (clock),
			.ce_0 (w_fld_bufferInB_1_ce_0),
			.addr_0 (w_fld_bufferInB_1_addr_0),
			.datain_0 (w_fld_bufferInB_1_datain_0),
			.dataout_0 (w_fld_bufferInB_1_dataout_0),
			.r_w_0 (w_fld_bufferInB_1_r_w_0),
			.ce_1 (w_fld_bufferInB_1_ce_1),
			.addr_1 (r_fld_bufferInB_1_addr_1),
			.datain_1 (r_fld_bufferInB_1_datain_1),
			.dataout_1 (w_fld_bufferInB_1_dataout_1),
			.r_w_1 (r_fld_bufferInB_1_r_w_1)
		);

	DualPortRAM #(.DWIDTH(16), .AWIDTH(10), .WORDS(1024) )
		dpram_bufferOutA_2(
			.clk (clock),
			.ce_0 (w_fld_bufferOutA_2_ce_0),
			.addr_0 (w_fld_bufferOutA_2_addr_0),
			.datain_0 (w_fld_bufferOutA_2_datain_0),
			.dataout_0 (w_fld_bufferOutA_2_dataout_0),
			.r_w_0 (w_fld_bufferOutA_2_r_w_0),
			.ce_1 (w_fld_bufferOutA_2_ce_1),
			.addr_1 (r_fld_bufferOutA_2_addr_1),
			.datain_1 (r_fld_bufferOutA_2_datain_1),
			.dataout_1 (w_fld_bufferOutA_2_dataout_1),
			.r_w_1 (r_fld_bufferOutA_2_r_w_1)
		);

	DualPortRAM #(.DWIDTH(16), .AWIDTH(10), .WORDS(1024) )
		dpram_bufferOutB_3(
			.clk (clock),
			.ce_0 (w_fld_bufferOutB_3_ce_0),
			.addr_0 (w_fld_bufferOutB_3_addr_0),
			.datain_0 (w_fld_bufferOutB_3_datain_0),
			.dataout_0 (w_fld_bufferOutB_3_dataout_0),
			.r_w_0 (w_fld_bufferOutB_3_r_w_0),
			.ce_1 (w_fld_bufferOutB_3_ce_1),
			.addr_1 (r_fld_bufferOutB_3_addr_1),
			.datain_1 (r_fld_bufferOutB_3_datain_1),
			.dataout_1 (w_fld_bufferOutB_3_dataout_1),
			.r_w_1 (r_fld_bufferOutB_3_r_w_1)
		);

	MultInt
		MultInt_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_MultInt_multiplicand_0),
			.b (r_ip_MultInt_multiplier_0),
			.p (w_ip_MultInt_product_0)
		);

	MultInt
		MultInt_inst_1(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_MultInt_multiplicand_1),
			.b (r_ip_MultInt_multiplier_1),
			.p (w_ip_MultInt_product_1)
		);

	MultInt
		MultInt_inst_2(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_MultInt_multiplicand_2),
			.b (r_ip_MultInt_multiplier_2),
			.p (w_ip_MultInt_product_2)
		);

	Sin
		Sin_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.phase_in (r_ip_Sin_phase_in_0),	// in 13bit
			.sine (w_ip_Sin_result_0)	// out 15bit
		);

	Sin
		Sin_inst_1(
			.clk (clock),
			.ce (w_sys_ce),
			.phase_in (r_ip_Sin_phase_in_1),	// in 13bit
			.sine (w_ip_Sin_result_1)	// out 15bit
		);

	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multSine_arbiter0 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h8: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_multSine_arbiter0 <= w_sys_boolFalse;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_multSine_arbiter0 <= w_sys_boolTrue;

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
			r_sys_multSine_arbiter1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'ha: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_multSine_arbiter1 <= w_sys_boolFalse;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_multSine_arbiter1 <= w_sys_boolTrue;

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
			r_sys_becomeHigh_arbiter2 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h11: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_becomeHigh_arbiter2 <= w_sys_boolFalse;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_becomeHigh_arbiter2 <= w_sys_boolTrue;

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
			r_sys_becomeHigh_arbiter3 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h13: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_becomeHigh_arbiter3 <= w_sys_boolFalse;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_becomeHigh_arbiter3 <= w_sys_boolTrue;

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
			r_sys_distortion_arbiter4 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h1a: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_distortion_arbiter4 <= w_sys_boolFalse;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_distortion_arbiter4 <= w_sys_boolTrue;

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
			r_sys_distortion_arbiter5 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h1c: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_distortion_arbiter5 <= w_sys_boolFalse;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_distortion_arbiter5 <= w_sys_boolTrue;

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
			r_sys_echo_arbiter6 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h21: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_echo_arbiter6 <= w_sys_boolFalse;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_echo_arbiter6 <= w_sys_boolTrue;

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
			r_sys_echo_arbiter7 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h23: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_echo_arbiter7 <= w_sys_boolFalse;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_echo_arbiter7 <= w_sys_boolTrue;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'hc)) begin
										r_ip_MultInt_multiplicand_0 <= $signed( r_multSine_copy6_input_42[15:0] );

									end
									else
									if((r_sys_multSine_step==5'h9)) begin
										r_ip_MultInt_multiplicand_0 <= $signed( r_multSine_copy3_input_39[15:0] );

									end
									else
									if((r_sys_multSine_step==5'hd)) begin
										r_ip_MultInt_multiplicand_0 <= $signed( r_multSine_copy7_input_43[15:0] );

									end
									else
									if((5'h0<=r_sys_multSine_step && r_sys_multSine_step<=5'h6)) begin
										r_ip_MultInt_multiplicand_0 <= r_multSine_rateA_11;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h1<=r_sys_multSine_step && r_sys_multSine_step<=5'h6)) begin
										r_ip_MultInt_multiplier_0 <= $signed( w_sys_tmp41[15:0] );

									end
									else
									if((r_sys_multSine_step==5'h9) || (r_sys_multSine_step==5'hc) || (r_sys_multSine_step==5'hd)) begin
										r_ip_MultInt_multiplier_0 <= $signed( w_sys_tmp16[15:0] );

									end
									else
									if((r_sys_multSine_step==5'h0)) begin
										r_ip_MultInt_multiplier_0 <= $signed( r_fld_phase_4[15:0] );

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h7)) begin
										r_ip_MultInt_multiplicand_1 <= $signed( r_multSine_copy1_input_37[15:0] );

									end
									else
									if((r_sys_multSine_step==5'h6)) begin
										r_ip_MultInt_multiplicand_1 <= $signed( r_multSine_input_18[15:0] );

									end
									else
									if((r_sys_multSine_step==5'hc) || (r_sys_multSine_step==5'hf) || (r_sys_multSine_step==5'h10)) begin
										r_ip_MultInt_multiplicand_1 <= $signed( w_sys_tmp94[15:0] );

									end
									else
									if((r_sys_multSine_step==5'h0) || (r_sys_multSine_step==5'h1)) begin
										r_ip_MultInt_multiplicand_1 <= r_multSine_rateB_12;

									end
									else
									if((r_sys_multSine_step==5'hd) || (r_sys_multSine_step==5'he)) begin
										r_ip_MultInt_multiplicand_1 <= $signed( w_sys_tmp116[15:0] );

									end
									else
									if((r_sys_multSine_step==5'h9) || (r_sys_multSine_step==5'ha) || (r_sys_multSine_step==5'hb)) begin
										r_ip_MultInt_multiplicand_1 <= $signed( w_sys_tmp28[15:0] );

									end
									else
									if((r_sys_multSine_step==5'h8)) begin
										r_ip_MultInt_multiplicand_1 <= $signed( r_multSine_copy2_input_38[15:0] );

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h6) || (r_sys_multSine_step==5'h7) || (r_sys_multSine_step==5'h8)) begin
										r_ip_MultInt_multiplier_1 <= $signed( w_sys_tmp16[15:0] );

									end
									else
									if((5'h9<=r_sys_multSine_step && r_sys_multSine_step<=5'h10)) begin
										r_ip_MultInt_multiplier_1 <= $signed( w_sys_tmp31[15:0] );

									end
									else
									if((r_sys_multSine_step==5'h0) || (r_sys_multSine_step==5'h1)) begin
										r_ip_MultInt_multiplier_1 <= $signed( r_fld_phase_4[15:0] );

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h1<=r_sys_multSine_step && r_sys_multSine_step<=5'h6)) begin
										r_ip_MultInt_multiplicand_2 <= r_multSine_rateB_12;

									end
									else
									if((r_sys_multSine_step==5'h0)) begin
										r_ip_MultInt_multiplicand_2 <= r_multSine_rateA_11;

									end
									else
									if((r_sys_multSine_step==5'ha)) begin
										r_ip_MultInt_multiplicand_2 <= $signed( r_multSine_copy4_input_40[15:0] );

									end
									else
									if((r_sys_multSine_step==5'hb)) begin
										r_ip_MultInt_multiplicand_2 <= $signed( r_multSine_copy5_input_41[15:0] );

									end
								end

							endcase
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h6)) begin
										r_ip_MultInt_multiplicand_2 <= $signed( r_sys_tmp0_int[15:0] );

									end
									else
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_ip_MultInt_multiplicand_2 <= $signed( w_sys_tmp198[15:0] );

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h0<=r_sys_multSine_step && r_sys_multSine_step<=5'h6)) begin
										r_ip_MultInt_multiplier_2 <= $signed( w_sys_tmp41[15:0] );

									end
									else
									if((r_sys_multSine_step==5'ha) || (r_sys_multSine_step==5'hb)) begin
										r_ip_MultInt_multiplier_2 <= $signed( w_sys_tmp16[15:0] );

									end
								end

							endcase
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_ip_MultInt_multiplier_2 <= $signed( r_becomeHigh_i_24[15:0] );

									end
									else
									if((r_sys_becomeHigh_step==4'h6)) begin
										r_ip_MultInt_multiplier_2 <= $signed( w_sys_tmp202[15:0] );

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h4<=r_sys_multSine_step && r_sys_multSine_step<=5'ha)) begin
										r_ip_Sin_phase_in_0 <= $signed( r_sys_tmp1_int[12:0] );

									end
									else
									if((r_sys_multSine_step==5'h3)) begin
										r_ip_Sin_phase_in_0 <= $signed( w_sys_tmp18[12:0] );

									end
								end

							endcase
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h3)) begin
										r_ip_Sin_phase_in_0 <= $signed( w_sys_tmp196[12:0] );

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h5<=r_sys_multSine_step && r_sys_multSine_step<=5'ha)) begin
										r_ip_Sin_phase_in_1 <= $signed( r_sys_tmp0_int[12:0] );

									end
									else
									if((r_sys_multSine_step==5'h3) || (r_sys_multSine_step==5'h4)) begin
										r_ip_Sin_phase_in_1 <= $signed( w_sys_tmp21[12:0] );

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
					r_sys_processing_methodID <= ((i_voiceChange_req) ? 3'h1 : r_sys_processing_methodID);
				end

				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h8: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_processing_methodID <= 3'h2;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_processing_methodID <= 3'h2;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_processing_methodID <= 3'h3;

									end
								end

							endcase
						end

						6'h13: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_processing_methodID <= 3'h3;

									end
								end

							endcase
						end

						6'h1a: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_processing_methodID <= 3'h4;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_processing_methodID <= 3'h4;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_processing_methodID <= 3'h5;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_processing_methodID <= 3'h5;

									end
								end

							endcase
						end

						6'h27: begin
							r_sys_processing_methodID <= r_sys_voiceChange_caller;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_sys_processing_methodID <= r_sys_multSine_caller;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_sys_processing_methodID <= r_sys_becomeHigh_caller;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_sys_processing_methodID <= r_sys_distortion_caller;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_sys_processing_methodID <= r_sys_echo_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_voiceChange_return <= 1'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h24: begin
							r_sys_voiceChange_return <= w_sys_tmp9;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_voiceChange_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_voiceChange_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_voiceChange_phase <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h0: begin
							r_sys_voiceChange_phase <= 6'h3;
						end

						6'h3: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_phase <= ((w_sys_tmp1) ? 6'h6 : 6'hc);

									end
								end

							endcase
						end

						6'h6: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_phase <= ((w_sys_tmp2) ? 6'h8 : 6'ha);

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_phase <= 6'h25;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_phase <= 6'h25;

									end
								end

							endcase
						end

						6'hc: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_phase <= ((w_sys_tmp3) ? 6'hf : 6'h15);

									end
								end

							endcase
						end

						6'hf: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_phase <= ((w_sys_tmp4) ? 6'h11 : 6'h13);

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_phase <= 6'h25;

									end
								end

							endcase
						end

						6'h13: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_phase <= 6'h25;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_phase <= ((w_sys_tmp5) ? 6'h18 : 6'h1f);

									end
								end

							endcase
						end

						6'h18: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_phase <= ((w_sys_tmp7) ? 6'h1a : 6'h1c);

									end
								end

							endcase
						end

						6'h1a: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_phase <= 6'h25;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_phase <= 6'h25;

									end
								end

							endcase
						end

						6'h1f: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_phase <= ((w_sys_tmp8) ? 6'h21 : 6'h23);

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_phase <= 6'h25;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_phase <= 6'h25;

									end
								end

							endcase
						end

						6'h24: begin
							r_sys_voiceChange_phase <= 6'h27;
						end

						6'h25: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_phase <= 6'h24;

									end
								end

							endcase
						end

						6'h27: begin
							r_sys_voiceChange_phase <= 6'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_voiceChange_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h3: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h6: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'hc: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'hf: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h13: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h18: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1a: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1f: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h25: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_stage <= 2'h0;

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
			r_sys_voiceChange_step <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h3: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
								end

							endcase
						end

						6'h6: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= w_sys_voiceChange_step_p1;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= w_sys_voiceChange_step_p1;

									end
									else
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
								end

							endcase
						end

						6'hc: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
								end

							endcase
						end

						6'hf: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= w_sys_voiceChange_step_p1;

									end
								end

							endcase
						end

						6'h13: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= w_sys_voiceChange_step_p1;

									end
									else
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
								end

							endcase
						end

						6'h18: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
								end

							endcase
						end

						6'h1a: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= w_sys_voiceChange_step_p1;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= w_sys_voiceChange_step_p1;

									end
								end

							endcase
						end

						6'h1f: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= w_sys_voiceChange_step_p1;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h1)) begin
										r_sys_voiceChange_step <= 2'h0;

									end
									else
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= w_sys_voiceChange_step_p1;

									end
								end

							endcase
						end

						6'h25: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_voiceChange_step <= 2'h0;

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
			r_sys_voiceChange_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_voiceChange_busy <= ((i_voiceChange_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h0: begin
							r_sys_voiceChange_busy <= w_sys_boolTrue;
						end

						6'h27: begin
							r_sys_voiceChange_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multSine_caller <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h8: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_multSine_caller <= r_sys_processing_methodID;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_multSine_caller <= r_sys_processing_methodID;

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
			r_sys_multSine_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multSine_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_multSine_phase) 
						4'h0: begin
							r_sys_multSine_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_sys_multSine_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_sys_multSine_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_sys_multSine_phase <= ((w_sys_tmp10) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h13)) begin
										r_sys_multSine_phase <= 4'h5;

									end
								end

							endcase
						end

						4'ha: begin
							r_sys_multSine_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multSine_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_multSine_phase) 
						4'h2: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_sys_multSine_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_sys_multSine_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_sys_multSine_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h13)) begin
										r_sys_multSine_stage <= 2'h0;

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
			r_sys_multSine_step <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_multSine_phase) 
						4'h2: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_sys_multSine_step <= 5'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_sys_multSine_step <= 5'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_sys_multSine_step <= 5'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h13)) begin
										r_sys_multSine_step <= 5'h0;

									end
									else
									if((5'h0<=r_sys_multSine_step && r_sys_multSine_step<=5'h12)) begin
										r_sys_multSine_step <= w_sys_multSine_step_p1;

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
			r_sys_multSine_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_multSine_phase) 
						4'h0: begin
							r_sys_multSine_busy <= w_sys_boolTrue;
						end

						4'ha: begin
							r_sys_multSine_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_becomeHigh_caller <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h11: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_becomeHigh_caller <= r_sys_processing_methodID;

									end
								end

							endcase
						end

						6'h13: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_becomeHigh_caller <= r_sys_processing_methodID;

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
			r_sys_becomeHigh_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_becomeHigh_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h0: begin
							r_sys_becomeHigh_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_sys_becomeHigh_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_sys_becomeHigh_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_sys_becomeHigh_phase <= ((w_sys_tmp191) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'ha)) begin
										r_sys_becomeHigh_phase <= 4'h5;

									end
								end

							endcase
						end

						4'ha: begin
							r_sys_becomeHigh_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_becomeHigh_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h2: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_sys_becomeHigh_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_sys_becomeHigh_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_sys_becomeHigh_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'ha)) begin
										r_sys_becomeHigh_stage <= 2'h0;

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
			r_sys_becomeHigh_step <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h2: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_sys_becomeHigh_step <= 4'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_sys_becomeHigh_step <= 4'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_sys_becomeHigh_step <= 4'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'ha)) begin
										r_sys_becomeHigh_step <= 4'h0;

									end
									else
									if((4'h0<=r_sys_becomeHigh_step && r_sys_becomeHigh_step<=4'h9)) begin
										r_sys_becomeHigh_step <= w_sys_becomeHigh_step_p1;

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
			r_sys_becomeHigh_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h0: begin
							r_sys_becomeHigh_busy <= w_sys_boolTrue;
						end

						4'ha: begin
							r_sys_becomeHigh_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_distortion_caller <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h1a: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_distortion_caller <= r_sys_processing_methodID;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_distortion_caller <= r_sys_processing_methodID;

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
			r_sys_distortion_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_distortion_phase <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h0: begin
							r_sys_distortion_phase <= 5'h2;
						end

						5'h2: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_phase <= ((w_sys_tmp213) ? 5'h8 : 5'h10);

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h2)) begin
										r_sys_distortion_phase <= 5'ha;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_phase <= ((w_sys_tmp217) ? 5'hc : 5'he);

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_phase <= 5'h6;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_phase <= 5'h6;

									end
								end

							endcase
						end

						5'h10: begin
							r_sys_distortion_phase <= 5'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_distortion_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h2: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h2)) begin
										r_sys_distortion_stage <= 2'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_stage <= 2'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_stage <= 2'h0;

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
			r_sys_distortion_step <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h2: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_step <= 3'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_step <= 3'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_step <= 3'h0;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_step <= 3'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h2)) begin
										r_sys_distortion_step <= 3'h0;

									end
									else
									if((r_sys_distortion_step==3'h0) || (r_sys_distortion_step==3'h1)) begin
										r_sys_distortion_step <= w_sys_distortion_step_p1;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_step <= 3'h0;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_step <= 3'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_sys_distortion_step <= 3'h0;

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
			r_sys_distortion_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h0: begin
							r_sys_distortion_busy <= w_sys_boolTrue;
						end

						5'h10: begin
							r_sys_distortion_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_echo_caller <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h21: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_echo_caller <= r_sys_processing_methodID;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_sys_echo_caller <= r_sys_processing_methodID;

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
			r_sys_echo_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_echo_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_echo_phase) 
						4'h0: begin
							r_sys_echo_phase <= 4'h3;
						end

						4'h3: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_sys_echo_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_sys_echo_phase <= ((w_sys_tmp228) ? 4'h7 : 4'h9);

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h2)) begin
										r_sys_echo_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h9: begin
							r_sys_echo_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_echo_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_echo_phase) 
						4'h3: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_sys_echo_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_sys_echo_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h2)) begin
										r_sys_echo_stage <= 2'h0;

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
			r_sys_echo_step <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_echo_phase) 
						4'h3: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_sys_echo_step <= 3'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_sys_echo_step <= 3'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0) || (r_sys_echo_step==3'h1)) begin
										r_sys_echo_step <= w_sys_echo_step_p1;

									end
									else
									if((r_sys_echo_step==3'h2)) begin
										r_sys_echo_step <= 3'h0;

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
			r_sys_echo_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_echo_phase) 
						4'h0: begin
							r_sys_echo_busy <= w_sys_boolTrue;
						end

						4'h9: begin
							r_sys_echo_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bufferInA_0_addr_1 <= 10'sh0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bufferInA_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_fld_bufferInA_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_fld_bufferInA_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_fld_bufferInA_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_fld_bufferInA_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_fld_bufferInA_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bufferInB_1_addr_1 <= 10'sh0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bufferInB_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_fld_bufferInB_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_fld_bufferInB_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_fld_bufferInB_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_fld_bufferInB_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_fld_bufferInB_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bufferOutA_2_addr_1 <= 10'sh0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bufferOutA_2_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_fld_bufferOutA_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_fld_bufferOutA_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_fld_bufferOutA_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_fld_bufferOutA_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_fld_bufferOutA_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bufferOutB_3_addr_1 <= 10'sh0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bufferOutB_3_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_fld_bufferOutB_3_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_fld_bufferOutB_3_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_fld_bufferOutB_3_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_fld_bufferOutB_3_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_fld_bufferOutB_3_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_phase_4 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h0<=r_sys_multSine_step && r_sys_multSine_step<=5'h7)) begin
										r_fld_phase_4 <= w_sys_tmp35;

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
			r_fld_bufSize_5 <= $signed( w_sys_tmp239[15:0] );

		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_voiceChange_rateA_6 <= ((i_voiceChange_req) ? i_voiceChange_rateA_6 : r_voiceChange_rateA_6);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_voiceChange_rateB_7 <= ((i_voiceChange_req) ? i_voiceChange_rateB_7 : r_voiceChange_rateB_7);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_voiceChange_threshold_8 <= ((i_voiceChange_req) ? i_voiceChange_threshold_8 : r_voiceChange_threshold_8);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_voiceChange_bufSelect_9 <= ((i_voiceChange_req) ? i_voiceChange_bufSelect_9 : r_voiceChange_bufSelect_9);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_voiceChange_function_10 <= ((i_voiceChange_req) ? i_voiceChange_function_10 : r_voiceChange_function_10);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h8: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_multSine_rateA_11 <= r_voiceChange_rateA_6;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_multSine_rateA_11 <= r_voiceChange_rateA_6;

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

					case(r_sys_voiceChange_phase) 
						6'h8: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_multSine_rateB_12 <= r_voiceChange_rateB_7;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_multSine_rateB_12 <= r_voiceChange_rateB_7;

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
			r_multSine_bufferIn_13_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h0<=r_sys_multSine_step && r_sys_multSine_step<=5'h7)) begin
										r_multSine_bufferIn_13_addr <= r_multSine_i_16;

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
			r_multSine_bufferIn_13_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_multSine_bufferIn_13_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h0<=r_sys_multSine_step && r_sys_multSine_step<=5'h7)) begin
										r_multSine_bufferIn_13_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_multSine_bufferIn_13_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_multSine_bufferIn_13_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_multSine_bufferIn_13_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_multSine_bufferIn_13_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_multSine_bufferOut_14_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'hc<=r_sys_multSine_step && r_sys_multSine_step<=5'h13)) begin
										r_multSine_bufferOut_14_addr <= r_multSine_j_17;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h13)) begin
										r_multSine_bufferOut_14_datain <= w_sys_tmp178;

									end
									else
									if((r_sys_multSine_step==5'h10)) begin
										r_multSine_bufferOut_14_datain <= w_sys_tmp112;

									end
									else
									if((r_sys_multSine_step==5'hd)) begin
										r_multSine_bufferOut_14_datain <= w_sys_tmp46;

									end
									else
									if((r_sys_multSine_step==5'h12)) begin
										r_multSine_bufferOut_14_datain <= w_sys_tmp156;

									end
									else
									if((r_sys_multSine_step==5'h11)) begin
										r_multSine_bufferOut_14_datain <= w_sys_tmp134;

									end
									else
									if((r_sys_multSine_step==5'hf)) begin
										r_multSine_bufferOut_14_datain <= w_sys_tmp90;

									end
									else
									if((r_sys_multSine_step==5'he)) begin
										r_multSine_bufferOut_14_datain <= w_sys_tmp68;

									end
									else
									if((r_sys_multSine_step==5'hc)) begin
										r_multSine_bufferOut_14_datain <= w_sys_tmp24;

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
			r_multSine_bufferOut_14_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_multSine_bufferOut_14_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'hc<=r_sys_multSine_step && r_sys_multSine_step<=5'h13)) begin
										r_multSine_bufferOut_14_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'ha: begin
							r_multSine_bufferOut_14_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_multSine_bufferOut_14_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_multSine_bufferOut_14_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_multSine_bufferOut_14_r_w <= w_sys_boolFalse;
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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'hc) || (r_sys_multSine_step==5'hf) || (r_sys_multSine_step==5'h10)) begin
										r_multSine_mulWave_15 <= w_sys_tmp19;

									end
									else
									if((r_sys_multSine_step==5'h9) || (r_sys_multSine_step==5'ha) || (r_sys_multSine_step==5'hb)) begin
										r_multSine_mulWave_15 <= w_sys_tmp15;

									end
									else
									if((r_sys_multSine_step==5'hd) || (r_sys_multSine_step==5'he)) begin
										r_multSine_mulWave_15 <= w_sys_tmp40;

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

					case(r_sys_multSine_phase) 
						4'h4: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_multSine_i_16 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h0<=r_sys_multSine_step && r_sys_multSine_step<=5'h7)) begin
										r_multSine_i_16 <= w_sys_tmp33;

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

					case(r_sys_multSine_phase) 
						4'h4: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h0)) begin
										r_multSine_j_17 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'hc<=r_sys_multSine_step && r_sys_multSine_step<=5'h13)) begin
										r_multSine_j_17 <= w_sys_tmp34;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h2)) begin
										r_multSine_input_18 <= w_sys_tmp14;

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
			r_becomeHigh_bufferIn_19_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_becomeHigh_bufferIn_19_addr <= r_becomeHigh_i_24;

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
			r_becomeHigh_bufferIn_19_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_becomeHigh_bufferIn_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_becomeHigh_bufferIn_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_becomeHigh_bufferIn_19_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_becomeHigh_bufferIn_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_becomeHigh_bufferIn_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_becomeHigh_bufferIn_19_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_becomeHigh_bufferOut_20_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h9)) begin
										r_becomeHigh_bufferOut_20_addr <= r_becomeHigh_j_25;

									end
									else
									if((r_sys_becomeHigh_step==4'ha)) begin
										r_becomeHigh_bufferOut_20_addr <= w_sys_tmp208;

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

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'ha)) begin
										r_becomeHigh_bufferOut_20_datain <= w_sys_tmp209;

									end
									else
									if((r_sys_becomeHigh_step==4'h9)) begin
										r_becomeHigh_bufferOut_20_datain <= w_sys_tmp205;

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
			r_becomeHigh_bufferOut_20_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_becomeHigh_bufferOut_20_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_becomeHigh_bufferOut_20_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h9) || (r_sys_becomeHigh_step==4'ha)) begin
										r_becomeHigh_bufferOut_20_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'ha: begin
							r_becomeHigh_bufferOut_20_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_becomeHigh_bufferOut_20_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_becomeHigh_bufferOut_20_r_w <= w_sys_boolFalse;
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

					case(r_sys_becomeHigh_phase) 
						4'h2: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_becomeHigh_bufSizeDiv2_21 <= w_sys_tmp190;

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

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h9)) begin
										r_becomeHigh_tmp_22 <= $signed( {{16{w_sys_tmp199[15]}}, w_sys_tmp199} );

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

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h6)) begin
										r_becomeHigh_sinTmp_23 <= w_sys_tmp195;

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

					case(r_sys_becomeHigh_phase) 
						4'h4: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_becomeHigh_i_24 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_becomeHigh_i_24 <= w_sys_tmp210;

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

					case(r_sys_becomeHigh_phase) 
						4'h4: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h0)) begin
										r_becomeHigh_j_25 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'ha)) begin
										r_becomeHigh_j_25 <= w_sys_tmp212;

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

					case(r_sys_voiceChange_phase) 
						6'h1a: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_distortion_rateA_26 <= r_voiceChange_threshold_8;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_voiceChange_stage) 
								2'h0: begin
									if((r_sys_voiceChange_step==2'h0)) begin
										r_distortion_rateA_26 <= r_voiceChange_threshold_8;

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
			r_distortion_bufferIn_27_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h8: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_bufferIn_27_addr <= r_distortion_i_30;

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
			r_distortion_bufferIn_27_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_distortion_bufferIn_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_distortion_bufferIn_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_distortion_bufferIn_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h8: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_bufferIn_27_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h10: begin
							r_distortion_bufferIn_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_distortion_bufferIn_27_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_distortion_bufferOut_28_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_distortion_phase) 
						5'hc: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_bufferOut_28_addr <= r_distortion_j_31;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_bufferOut_28_addr <= r_distortion_j_31;

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

					case(r_sys_distortion_phase) 
						5'hc: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_bufferOut_28_datain <= w_sys_tmp219;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_bufferOut_28_datain <= w_sys_tmp225;

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
			r_distortion_bufferOut_28_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_distortion_bufferOut_28_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_distortion_bufferOut_28_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_distortion_bufferOut_28_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'hc: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_bufferOut_28_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_bufferOut_28_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'h10: begin
							r_distortion_bufferOut_28_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h9: begin
							r_distortion_bufferOut_28_r_w <= w_sys_boolFalse;
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

					case(r_sys_distortion_phase) 
						5'h8: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h2)) begin
										r_distortion_bufIn_29 <= $signed( w_sys_tmp216[15:0] );

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

					case(r_sys_distortion_phase) 
						5'h4: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_i_30 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_i_30 <= w_sys_tmp214;

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

					case(r_sys_distortion_phase) 
						5'h4: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_j_31 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_distortion_stage) 
								2'h0: begin
									if((r_sys_distortion_step==3'h0)) begin
										r_distortion_j_31 <= w_sys_tmp215;

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
			r_echo_bufferIn_32_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_echo_phase) 
						4'h7: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_echo_bufferIn_32_addr <= r_echo_i_34;

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
			r_echo_bufferIn_32_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_echo_bufferIn_32_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_echo_bufferIn_32_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_echo_bufferIn_32_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_echo_bufferIn_32_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h7: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_echo_bufferIn_32_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'h9: begin
							r_echo_bufferIn_32_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_echo_bufferOut_33_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h5: begin

					case(r_sys_echo_phase) 
						4'h7: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_echo_bufferOut_33_addr <= r_echo_i_34;

									end
									else
									if((r_sys_echo_step==3'h2)) begin
										r_echo_bufferOut_33_addr <= r_echo_j_35;

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

					case(r_sys_echo_phase) 
						4'h7: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h2)) begin
										r_echo_bufferOut_33_datain <= w_sys_tmp232;

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
			r_echo_bufferOut_33_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_voiceChange_phase) 
						6'h27: begin
							r_echo_bufferOut_33_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_multSine_phase) 
						4'ha: begin
							r_echo_bufferOut_33_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'ha: begin
							r_echo_bufferOut_33_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_distortion_phase) 
						5'h10: begin
							r_echo_bufferOut_33_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h5: begin

					case(r_sys_echo_phase) 
						4'h7: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_echo_bufferOut_33_r_w <= w_sys_boolFalse;

									end
									else
									if((r_sys_echo_step==3'h2)) begin
										r_echo_bufferOut_33_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'h9: begin
							r_echo_bufferOut_33_r_w <= w_sys_boolFalse;
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

					case(r_sys_echo_phase) 
						4'h3: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_echo_i_34 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_echo_i_34 <= w_sys_tmp237;

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

					case(r_sys_echo_phase) 
						4'h3: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h0)) begin
										r_echo_j_35 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_echo_stage) 
								2'h0: begin
									if((r_sys_echo_step==3'h2)) begin
										r_echo_j_35 <= w_sys_tmp238;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h3)) begin
										r_multSine_copy1_input_37 <= w_sys_tmp14;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h4)) begin
										r_multSine_copy2_input_38 <= w_sys_tmp14;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h5)) begin
										r_multSine_copy3_input_39 <= w_sys_tmp14;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h6)) begin
										r_multSine_copy4_input_40 <= w_sys_tmp14;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h7)) begin
										r_multSine_copy5_input_41 <= w_sys_tmp14;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h8)) begin
										r_multSine_copy6_input_42 <= w_sys_tmp14;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((r_sys_multSine_step==5'h9)) begin
										r_multSine_copy7_input_43 <= w_sys_tmp14;

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h4<=r_sys_multSine_step && r_sys_multSine_step<=5'h9)) begin
										r_sys_tmp0_int <= w_sys_tmp40;

									end
								end

							endcase
						end

					endcase
				end

				3'h3: begin

					case(r_sys_becomeHigh_phase) 
						4'h8: begin

							case(r_sys_becomeHigh_stage) 
								2'h0: begin
									if((r_sys_becomeHigh_step==4'h2)) begin
										r_sys_tmp0_int <= $signed( {{16{w_becomeHigh_bufferIn_19_dataout[15]}}, w_becomeHigh_bufferIn_19_dataout} );

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

					case(r_sys_multSine_phase) 
						4'h8: begin

							case(r_sys_multSine_stage) 
								2'h0: begin
									if((5'h4<=r_sys_multSine_step && r_sys_multSine_step<=5'h9)) begin
										r_sys_tmp1_int <= w_sys_tmp19;

									end
									else
									if((r_sys_multSine_step==5'h3)) begin
										r_sys_tmp1_int <= w_sys_tmp40;

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
