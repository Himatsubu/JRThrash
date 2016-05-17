/*
TimeStamp:	2013/12/16		12:59
*/


module SumArrayFloat(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_sumArrayFast_req,	
	output                o_sumArrayFast_busy,	
	output signed  [63:0] o_sumArrayFast_return,	
	input                 i_sumArray_req,	
	output                o_sumArray_busy,	
	output signed  [63:0] o_sumArray_return	
);

	reg                r_sys_setArray_arbiter0;
	reg                r_sys_sumArrayFastSub_arbiter1;
	reg                r_sys_setArray_arbiter2;
	reg  signed [31:0] r_ip_DivInt_dividend_0;
	reg  signed [31:0] r_ip_DivInt_divisor_0;
	wire signed [31:0] w_ip_DivInt_quotient_0;
	wire signed [31:0] w_ip_DivInt_fractional_0;
	reg  signed [31:0] r_ip_DivInt_dividend_1;
	reg  signed [31:0] r_ip_DivInt_divisor_1;
	wire signed [31:0] w_ip_DivInt_quotient_1;
	wire signed [31:0] w_ip_DivInt_fractional_1;
	reg         [63:0] r_ip_AddFloat_portA_0;
	reg         [63:0] r_ip_AddFloat_portB_0;
	wire        [63:0] w_ip_AddFloat_result_0;
	reg         [63:0] r_ip_MultFloat_multiplicand_0;
	reg         [63:0] r_ip_MultFloat_multiplier_0;
	wire        [63:0] w_ip_MultFloat_product_0;
	reg  signed [31:0] r_ip_FixedToFloat_fixed_0;
	wire        [63:0] w_ip_FixedToFloat_floating_0;
	reg         [ 2:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 2:0] r_sys_setArray_caller;
	reg                r_sys_setArray_req;
	reg         [ 3:0] r_sys_setArray_phase;
	reg         [ 1:0] r_sys_setArray_stage;
	reg         [ 5:0] r_sys_setArray_step;
	reg                r_sys_setArray_busy;
	wire        [ 1:0] w_sys_setArray_stage_p1;
	wire        [ 5:0] w_sys_setArray_step_p1;
	reg         [63:0] r_sys_sumArrayFast_return;
	reg         [ 2:0] r_sys_sumArrayFast_caller;
	reg                r_sys_sumArrayFast_req;
	reg         [ 3:0] r_sys_sumArrayFast_phase;
	reg         [ 1:0] r_sys_sumArrayFast_stage;
	reg         [ 4:0] r_sys_sumArrayFast_step;
	reg                r_sys_sumArrayFast_busy;
	wire        [ 1:0] w_sys_sumArrayFast_stage_p1;
	wire        [ 4:0] w_sys_sumArrayFast_step_p1;
	reg         [ 2:0] r_sys_sumArrayFastSub_caller;
	reg                r_sys_sumArrayFastSub_req;
	reg         [ 3:0] r_sys_sumArrayFastSub_phase;
	reg         [ 1:0] r_sys_sumArrayFastSub_stage;
	reg         [ 4:0] r_sys_sumArrayFastSub_step;
	reg                r_sys_sumArrayFastSub_busy;
	wire        [ 1:0] w_sys_sumArrayFastSub_stage_p1;
	wire        [ 4:0] w_sys_sumArrayFastSub_step_p1;
	reg         [63:0] r_sys_sumArray_return;
	reg         [ 2:0] r_sys_sumArray_caller;
	reg                r_sys_sumArray_req;
	reg         [ 3:0] r_sys_sumArray_phase;
	reg         [ 1:0] r_sys_sumArray_stage;
	reg         [ 3:0] r_sys_sumArray_step;
	reg                r_sys_sumArray_busy;
	wire        [ 1:0] w_sys_sumArray_stage_p1;
	wire        [ 3:0] w_sys_sumArray_step_p1;
	wire signed [ 9:0] w_fld_ax_0_addr_0;
	wire        [63:0] w_fld_ax_0_datain_0;
	wire        [63:0] w_fld_ax_0_dataout_0;
	wire               w_fld_ax_0_r_w_0;
	wire               w_fld_ax_0_ce_0;
	reg  signed [ 9:0] r_fld_ax_0_addr_1;
	reg         [63:0] r_fld_ax_0_datain_1;
	wire        [63:0] w_fld_ax_0_dataout_1;
	reg                r_fld_ax_0_r_w_1;
	wire               w_fld_ax_0_ce_1;
	wire signed [ 8:0] w_fld_tmp_1_addr_0;
	wire        [63:0] w_fld_tmp_1_datain_0;
	wire        [63:0] w_fld_tmp_1_dataout_0;
	wire               w_fld_tmp_1_r_w_0;
	wire               w_fld_tmp_1_ce_0;
	reg  signed [ 8:0] r_fld_tmp_1_addr_1;
	reg         [63:0] r_fld_tmp_1_datain_1;
	wire        [63:0] w_fld_tmp_1_dataout_1;
	reg                r_fld_tmp_1_r_w_1;
	wire               w_fld_tmp_1_ce_1;
	reg  signed [31:0] r_setArray_ax_2_addr;
	reg         [63:0] r_setArray_ax_2_datain;
	wire        [63:0] w_setArray_ax_2_dataout;
	reg                r_setArray_ax_2_r_w;
	wire signed [31:0] w_setArray_ax_2_addr;
	wire        [63:0] w_setArray_ax_2_datain;
	wire               w_setArray_ax_2_r_w;
	wire               w_setArray_ax_2_ce;
	wire               w_setArray_ax_2_cacheHit;
	reg  signed [31:0] r_setArray_l_3;
	reg  signed [31:0] r_sumArrayFast_i_4;
	reg  signed [31:0] r_sumArrayFastSub_ax_5_addr;
	reg         [63:0] r_sumArrayFastSub_ax_5_datain;
	wire        [63:0] w_sumArrayFastSub_ax_5_dataout;
	reg                r_sumArrayFastSub_ax_5_r_w;
	wire signed [31:0] w_sumArrayFastSub_ax_5_addr;
	wire        [63:0] w_sumArrayFastSub_ax_5_datain;
	wire               w_sumArrayFastSub_ax_5_r_w;
	wire               w_sumArrayFastSub_ax_5_ce;
	wire               w_sumArrayFastSub_ax_5_cacheHit;
	reg  signed [31:0] r_sumArrayFastSub_tmp_6_addr;
	reg         [63:0] r_sumArrayFastSub_tmp_6_datain;
	wire        [63:0] w_sumArrayFastSub_tmp_6_dataout;
	reg                r_sumArrayFastSub_tmp_6_r_w;
	wire signed [31:0] w_sumArrayFastSub_tmp_6_addr;
	wire        [63:0] w_sumArrayFastSub_tmp_6_datain;
	wire               w_sumArrayFastSub_tmp_6_r_w;
	wire               w_sumArrayFastSub_tmp_6_ce;
	wire               w_sumArrayFastSub_tmp_6_cacheHit;
	reg  signed [31:0] r_sumArrayFastSub_num_7;
	reg  signed [31:0] r_sumArrayFastSub_i_8;
	reg  signed [31:0] r_sumArrayFastSub_j_9;
	reg  signed [31:0] r_sumArrayFastSub_i_10;
	reg  signed [31:0] r_sumArrayFastSub_j_11;
	reg         [63:0] r_sumArray_result_12;
	reg  signed [31:0] r_sumArray_n_13;
	reg  signed [31:0] r_sumArrayFastSub_copy0_i_14;
	reg  signed [31:0] r_sumArrayFastSub_copy0_i_15;
	reg         [63:0] r_sys_tmp0_float;
	reg         [63:0] r_sys_tmp1_float;
	reg         [63:0] r_sys_tmp2_float;
	reg         [63:0] r_sys_tmp3_float;
	reg         [63:0] r_sys_tmp4_float;
	reg         [63:0] r_sys_tmp5_float;
	reg         [63:0] r_sys_tmp6_float;
	reg         [63:0] r_sys_tmp7_float;
	reg         [63:0] r_sys_tmp8_float;
	reg         [63:0] r_sys_tmp9_float;
	reg         [63:0] r_sys_tmp10_float;
	reg         [63:0] r_sys_tmp11_float;
	reg         [63:0] r_sys_tmp12_float;
	reg         [63:0] r_sys_tmp13_float;
	reg         [63:0] r_sys_tmp14_float;
	reg         [63:0] r_sys_tmp15_float;
	reg         [63:0] r_sys_tmp16_float;
	reg         [63:0] r_sys_tmp17_float;
	reg         [63:0] r_sys_tmp18_float;
	reg         [63:0] r_sys_tmp19_float;
	reg         [63:0] r_sys_tmp20_float;
	reg         [63:0] r_sys_tmp21_float;
	reg         [63:0] r_sys_tmp22_float;
	reg         [63:0] r_sys_tmp23_float;
	reg         [63:0] r_sys_tmp24_float;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp3;
	wire signed [31:0] w_sys_tmp4;
	wire        [63:0] w_sys_tmp6;
	wire        [63:0] w_sys_tmp7;
	wire        [63:0] w_sys_tmp8;
	wire        [63:0] w_sys_tmp10;
	wire               w_sys_tmp11;
	wire signed [31:0] w_sys_tmp12;
	wire signed [31:0] w_sys_tmp13;
	wire signed [31:0] w_sys_tmp14;
	wire signed [31:0] w_sys_tmp16;
	wire        [63:0] w_sys_tmp17;
	wire               w_sys_tmp24;
	wire signed [31:0] w_sys_tmp26;
	wire signed [31:0] w_sys_tmp30;
	wire signed [31:0] w_sys_tmp31;
	wire        [63:0] w_sys_tmp32;
	wire signed [31:0] w_sys_tmp48;
	wire signed [31:0] w_sys_tmp49;
	wire        [63:0] w_sys_tmp50;
	wire signed [31:0] w_sys_tmp66;
	wire signed [31:0] w_sys_tmp67;
	wire        [63:0] w_sys_tmp68;
	wire signed [31:0] w_sys_tmp84;
	wire signed [31:0] w_sys_tmp85;
	wire        [63:0] w_sys_tmp86;
	wire signed [31:0] w_sys_tmp102;
	wire signed [31:0] w_sys_tmp103;
	wire        [63:0] w_sys_tmp104;
	wire signed [31:0] w_sys_tmp120;
	wire signed [31:0] w_sys_tmp121;
	wire        [63:0] w_sys_tmp122;
	wire signed [31:0] w_sys_tmp138;
	wire        [63:0] w_sys_tmp140;
	wire signed [31:0] w_sys_tmp156;
	wire signed [31:0] w_sys_tmp157;
	wire        [63:0] w_sys_tmp158;
	wire signed [31:0] w_sys_tmp174;
	wire signed [31:0] w_sys_tmp175;
	wire        [63:0] w_sys_tmp176;
	wire signed [31:0] w_sys_tmp192;
	wire signed [31:0] w_sys_tmp193;
	wire        [63:0] w_sys_tmp194;
	wire signed [31:0] w_sys_tmp210;
	wire signed [31:0] w_sys_tmp211;
	wire        [63:0] w_sys_tmp212;
	wire signed [31:0] w_sys_tmp228;
	wire signed [31:0] w_sys_tmp229;
	wire        [63:0] w_sys_tmp230;
	wire signed [31:0] w_sys_tmp246;
	wire signed [31:0] w_sys_tmp247;
	wire        [63:0] w_sys_tmp248;
	wire signed [31:0] w_sys_tmp264;
	wire signed [31:0] w_sys_tmp265;
	wire        [63:0] w_sys_tmp266;
	wire signed [31:0] w_sys_tmp281;
	wire               w_sys_tmp282;
	wire signed [31:0] w_sys_tmp283;
	wire signed [31:0] w_sys_tmp284;
	wire signed [31:0] w_sys_tmp285;
	wire        [63:0] w_sys_tmp286;
	wire        [63:0] w_sys_tmp287;
	wire signed [31:0] w_sys_tmp289;
	wire signed [31:0] w_sys_tmp291;
	wire               w_sys_tmp292;
	wire        [63:0] w_sys_tmp297;
	wire        [63:0] w_sys_tmp298;
	wire        [63:0] w_sys_tmp299;
	wire signed [31:0] w_sys_tmp300;
	wire signed [31:0] w_sys_tmp301;
	wire signed [31:0] w_sys_tmp302;
	wire signed [31:0] w_sys_tmp303;
	wire signed [31:0] w_sys_tmp305;
	wire               w_sys_tmp376;
	wire signed [31:0] w_sys_tmp377;
	wire        [63:0] w_sys_tmp382;
	wire        [63:0] w_sys_tmp383;
	wire        [63:0] w_sys_tmp384;
	wire signed [31:0] w_sys_tmp385;
	wire signed [31:0] w_sys_tmp386;
	wire signed [31:0] w_sys_tmp387;
	wire signed [31:0] w_sys_tmp388;
	wire signed [31:0] w_sys_tmp390;
	wire        [63:0] w_sys_tmp461;
	wire               w_sys_tmp462;
	wire signed [31:0] w_sys_tmp463;
	wire        [63:0] w_sys_tmp465;
	wire        [63:0] w_sys_tmp466;
	wire signed [31:0] w_sys_tmp467;
	wire        [63:0] w_sys_tmp468;
	wire signed [31:0] w_sys_tmp469;
	wire signed [31:0] w_sys_tmp470;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_setArray_ax_2_cacheHit & w_sumArrayFastSub_ax_5_cacheHit & w_sumArrayFastSub_tmp_6_cacheHit;
	assign w_sys_setArray_stage_p1 = (r_sys_setArray_stage + 2'h1);
	assign w_sys_setArray_step_p1 = (r_sys_setArray_step + 6'h1);
	assign o_sumArrayFast_busy = r_sys_sumArrayFast_busy;
	assign o_sumArrayFast_return = r_sys_sumArrayFast_return;
	assign w_sys_sumArrayFast_stage_p1 = (r_sys_sumArrayFast_stage + 2'h1);
	assign w_sys_sumArrayFast_step_p1 = (r_sys_sumArrayFast_step + 5'h1);
	assign w_sys_sumArrayFastSub_stage_p1 = (r_sys_sumArrayFastSub_stage + 2'h1);
	assign w_sys_sumArrayFastSub_step_p1 = (r_sys_sumArrayFastSub_step + 5'h1);
	assign o_sumArray_busy = r_sys_sumArray_busy;
	assign o_sumArray_return = r_sys_sumArray_return;
	assign w_sys_sumArray_stage_p1 = (r_sys_sumArray_stage + 2'h1);
	assign w_sys_sumArray_step_p1 = (r_sys_sumArray_step + 4'h1);
	assign w_fld_ax_0_addr_0 = ( r_sys_setArray_arbiter0 ? $signed( w_setArray_ax_2_addr[9:0] ) : ( r_sys_sumArrayFastSub_arbiter1 ? $signed( w_sumArrayFastSub_ax_5_addr[9:0] ) : ( r_sys_setArray_arbiter2 ? $signed( w_setArray_ax_2_addr[9:0] ) : 10'sh0 )  )  ) ;
	assign w_fld_ax_0_datain_0 = ( r_sys_setArray_arbiter0 ? w_setArray_ax_2_datain : ( r_sys_sumArrayFastSub_arbiter1 ? w_sumArrayFastSub_ax_5_datain : ( r_sys_setArray_arbiter2 ? w_setArray_ax_2_datain : 64'h0 )  )  ) ;
	assign w_fld_ax_0_r_w_0 = ( r_sys_setArray_arbiter0 ? w_setArray_ax_2_r_w : ( r_sys_sumArrayFastSub_arbiter1 ? w_sumArrayFastSub_ax_5_r_w : ( r_sys_setArray_arbiter2 ? w_setArray_ax_2_r_w : 1'h0 )  )  ) ;
	assign w_fld_ax_0_ce_0 = w_sys_ce;
	assign w_fld_ax_0_ce_1 = w_sys_ce;
	assign w_fld_tmp_1_addr_0 = ( r_sys_sumArrayFastSub_arbiter1 ? $signed( w_sumArrayFastSub_tmp_6_addr[8:0] ) : 9'sh0 ) ;
	assign w_fld_tmp_1_datain_0 = ( r_sys_sumArrayFastSub_arbiter1 ? w_sumArrayFastSub_tmp_6_datain : 64'h0 ) ;
	assign w_fld_tmp_1_r_w_0 = ( r_sys_sumArrayFastSub_arbiter1 ? w_sumArrayFastSub_tmp_6_r_w : 1'h0 ) ;
	assign w_fld_tmp_1_ce_0 = w_sys_ce;
	assign w_fld_tmp_1_ce_1 = w_sys_ce;
	assign w_setArray_ax_2_dataout = ( r_sys_setArray_arbiter0 ? w_fld_ax_0_dataout_0 : ( r_sys_setArray_arbiter2 ? w_fld_ax_0_dataout_0 : 64'h0 )  ) ;
	assign w_setArray_ax_2_addr = r_setArray_ax_2_addr;
	assign w_setArray_ax_2_datain = r_setArray_ax_2_datain;
	assign w_setArray_ax_2_r_w = r_setArray_ax_2_r_w;
	assign w_setArray_ax_2_ce = w_sys_ce;
	assign w_setArray_ax_2_cacheHit = ( r_sys_setArray_arbiter0 ? w_sys_boolTrue : ( r_sys_setArray_arbiter2 ? w_sys_boolTrue : w_sys_boolTrue )  ) ;
	assign w_sumArrayFastSub_ax_5_dataout = ( r_sys_sumArrayFastSub_arbiter1 ? w_fld_ax_0_dataout_0 : 64'h0 ) ;
	assign w_sumArrayFastSub_ax_5_addr = r_sumArrayFastSub_ax_5_addr;
	assign w_sumArrayFastSub_ax_5_datain = r_sumArrayFastSub_ax_5_datain;
	assign w_sumArrayFastSub_ax_5_r_w = r_sumArrayFastSub_ax_5_r_w;
	assign w_sumArrayFastSub_ax_5_ce = w_sys_ce;
	assign w_sumArrayFastSub_ax_5_cacheHit = ( r_sys_sumArrayFastSub_arbiter1 ? w_sys_boolTrue : w_sys_boolTrue ) ;
	assign w_sumArrayFastSub_tmp_6_dataout = ( r_sys_sumArrayFastSub_arbiter1 ? w_fld_tmp_1_dataout_0 : 64'h0 ) ;
	assign w_sumArrayFastSub_tmp_6_addr = r_sumArrayFastSub_tmp_6_addr;
	assign w_sumArrayFastSub_tmp_6_datain = r_sumArrayFastSub_tmp_6_datain;
	assign w_sumArrayFastSub_tmp_6_r_w = r_sumArrayFastSub_tmp_6_r_w;
	assign w_sumArrayFastSub_tmp_6_ce = w_sys_ce;
	assign w_sumArrayFastSub_tmp_6_cacheHit = ( r_sys_sumArrayFastSub_arbiter1 ? w_sys_boolTrue : w_sys_boolTrue ) ;
	assign w_sys_tmp1 = (r_setArray_l_3 < w_sys_tmp2);
	assign w_sys_tmp2 = 32'sh00000400;
	assign w_sys_tmp3 = (r_setArray_l_3 + w_sys_tmp4);
	assign w_sys_tmp4 = 32'sh00000010;
	assign w_sys_tmp6 = ((w_sys_tmp11) ? r_sys_tmp23_float : r_sys_tmp24_float);
	assign w_sys_tmp7 = w_ip_FixedToFloat_floating_0;
	assign w_sys_tmp8 = 64'h405407ae147ae148;
	assign w_sys_tmp10 = 64'h409f4047ae147ae1;
	assign w_sys_tmp11 = (w_sys_tmp12 < w_sys_tmp13);
	assign w_sys_tmp12 = 32'sh00000008;
	assign w_sys_tmp13 = w_ip_DivInt_fractional_0;
	assign w_sys_tmp14 = 32'sh00000011;
	assign w_sys_tmp16 = (r_setArray_l_3 + w_sys_intOne);
	assign w_sys_tmp17 = ((w_sys_tmp24) ? r_sys_tmp22_float : r_sys_tmp21_float);
	assign w_sys_tmp24 = (w_sys_tmp12 < w_sys_tmp26);
	assign w_sys_tmp26 = w_ip_DivInt_fractional_1;
	assign w_sys_tmp30 = (r_setArray_l_3 + w_sys_tmp31);
	assign w_sys_tmp31 = 32'sh00000002;
	assign w_sys_tmp32 = ((w_sys_tmp11) ? r_sys_tmp20_float : r_sys_tmp19_float);
	assign w_sys_tmp48 = (r_setArray_l_3 + w_sys_tmp49);
	assign w_sys_tmp49 = 32'sh00000003;
	assign w_sys_tmp50 = ((w_sys_tmp24) ? r_sys_tmp18_float : r_sys_tmp17_float);
	assign w_sys_tmp66 = (r_setArray_l_3 + w_sys_tmp67);
	assign w_sys_tmp67 = 32'sh00000004;
	assign w_sys_tmp68 = ((w_sys_tmp11) ? r_sys_tmp16_float : r_sys_tmp15_float);
	assign w_sys_tmp84 = (r_setArray_l_3 + w_sys_tmp85);
	assign w_sys_tmp85 = 32'sh00000005;
	assign w_sys_tmp86 = ((w_sys_tmp24) ? r_sys_tmp14_float : r_sys_tmp13_float);
	assign w_sys_tmp102 = (r_setArray_l_3 + w_sys_tmp103);
	assign w_sys_tmp103 = 32'sh00000006;
	assign w_sys_tmp104 = ((w_sys_tmp11) ? r_sys_tmp12_float : r_sys_tmp11_float);
	assign w_sys_tmp120 = (r_setArray_l_3 + w_sys_tmp121);
	assign w_sys_tmp121 = 32'sh00000007;
	assign w_sys_tmp122 = ((w_sys_tmp24) ? r_sys_tmp10_float : r_sys_tmp9_float);
	assign w_sys_tmp138 = (r_setArray_l_3 + w_sys_tmp12);
	assign w_sys_tmp140 = ((w_sys_tmp11) ? r_sys_tmp8_float : r_sys_tmp7_float);
	assign w_sys_tmp156 = (r_setArray_l_3 + w_sys_tmp157);
	assign w_sys_tmp157 = 32'sh00000009;
	assign w_sys_tmp158 = ((w_sys_tmp24) ? r_sys_tmp6_float : r_sys_tmp5_float);
	assign w_sys_tmp174 = (r_setArray_l_3 + w_sys_tmp175);
	assign w_sys_tmp175 = 32'sh0000000a;
	assign w_sys_tmp176 = ((w_sys_tmp11) ? r_sys_tmp4_float : r_sys_tmp3_float);
	assign w_sys_tmp192 = (r_setArray_l_3 + w_sys_tmp193);
	assign w_sys_tmp193 = 32'sh0000000b;
	assign w_sys_tmp194 = ((w_sys_tmp24) ? r_sys_tmp2_float : r_sys_tmp1_float);
	assign w_sys_tmp210 = (r_setArray_l_3 + w_sys_tmp211);
	assign w_sys_tmp211 = 32'sh0000000c;
	assign w_sys_tmp212 = ((w_sys_tmp11) ? r_sys_tmp0_float : r_sys_tmp24_float);
	assign w_sys_tmp228 = (r_setArray_l_3 + w_sys_tmp229);
	assign w_sys_tmp229 = 32'sh0000000d;
	assign w_sys_tmp230 = ((w_sys_tmp24) ? r_sys_tmp23_float : r_sys_tmp21_float);
	assign w_sys_tmp246 = (r_setArray_l_3 + w_sys_tmp247);
	assign w_sys_tmp247 = 32'sh0000000e;
	assign w_sys_tmp248 = ((w_sys_tmp11) ? r_sys_tmp22_float : r_sys_tmp19_float);
	assign w_sys_tmp264 = (r_setArray_l_3 + w_sys_tmp265);
	assign w_sys_tmp265 = 32'sh0000000f;
	assign w_sys_tmp266 = ((w_sys_tmp24) ? r_sys_tmp20_float : r_sys_tmp24_float);
	assign w_sys_tmp281 = 32'sh00000400;
	assign w_sys_tmp282 = (w_sys_tmp283 < r_sumArrayFast_i_4);
	assign w_sys_tmp283 = 32'sh00000008;
	assign w_sys_tmp284 = w_sys_tmp469;
	assign w_sys_tmp285 = 32'sh00000002;
	assign w_sys_tmp286 = w_ip_AddFloat_result_0;
	assign w_sys_tmp287 = w_fld_ax_0_dataout_1;
	assign w_sys_tmp289 = 32'sh00000002;
	assign w_sys_tmp291 = 32'sh00000003;
	assign w_sys_tmp292 = (r_sumArrayFastSub_i_8 < r_sumArrayFastSub_num_7);
	assign w_sys_tmp297 = w_ip_AddFloat_result_0;
	assign w_sys_tmp298 = w_fld_ax_0_dataout_1;
	assign w_sys_tmp299 = w_sumArrayFastSub_ax_5_dataout;
	assign w_sys_tmp300 = (r_sumArrayFastSub_copy0_i_14 + w_sys_intOne);
	assign w_sys_tmp301 = (r_sumArrayFastSub_copy0_i_14 + w_sys_tmp302);
	assign w_sys_tmp302 = 32'sh00000002;
	assign w_sys_tmp303 = (r_sumArrayFastSub_i_8 + w_sys_tmp302);
	assign w_sys_tmp305 = (r_sumArrayFastSub_j_9 + w_sys_intOne);
	assign w_sys_tmp376 = (r_sumArrayFastSub_i_10 < w_sys_tmp377);
	assign w_sys_tmp377 = w_sys_tmp470;
	assign w_sys_tmp382 = w_ip_AddFloat_result_0;
	assign w_sys_tmp383 = w_fld_tmp_1_dataout_1;
	assign w_sys_tmp384 = w_sumArrayFastSub_tmp_6_dataout;
	assign w_sys_tmp385 = (r_sumArrayFastSub_copy0_i_15 + w_sys_intOne);
	assign w_sys_tmp386 = (r_sumArrayFastSub_copy0_i_15 + w_sys_tmp387);
	assign w_sys_tmp387 = 32'sh00000002;
	assign w_sys_tmp388 = (r_sumArrayFastSub_i_10 + w_sys_tmp387);
	assign w_sys_tmp390 = (r_sumArrayFastSub_j_11 + w_sys_intOne);
	assign w_sys_tmp461 = 64'h0;
	assign w_sys_tmp462 = (r_sumArray_n_13 < w_sys_tmp463);
	assign w_sys_tmp463 = 32'sh00000400;
	assign w_sys_tmp465 = w_ip_AddFloat_result_0;
	assign w_sys_tmp466 = w_fld_ax_0_dataout_1;
	assign w_sys_tmp467 = (r_sumArray_n_13 + w_sys_intOne);
	assign w_sys_tmp468 = r_sumArray_result_12;
	assign w_sys_tmp469 = { { 30{r_sumArrayFast_i_4[31]} }, r_sumArrayFast_i_4[31 : 2] };
	assign w_sys_tmp470 = { { 31{r_sumArrayFastSub_num_7[31]} }, r_sumArrayFastSub_num_7[31 : 1] };


	DualPortRAM #(.DWIDTH(64), .AWIDTH(10), .WORDS(1024) )
		dpram_ax_0(
			.clk (clock),
			.ce_0 (w_fld_ax_0_ce_0),
			.addr_0 (w_fld_ax_0_addr_0),
			.datain_0 (w_fld_ax_0_datain_0),
			.dataout_0 (w_fld_ax_0_dataout_0),
			.r_w_0 (w_fld_ax_0_r_w_0),
			.ce_1 (w_fld_ax_0_ce_1),
			.addr_1 (r_fld_ax_0_addr_1),
			.datain_1 (r_fld_ax_0_datain_1),
			.dataout_1 (w_fld_ax_0_dataout_1),
			.r_w_1 (r_fld_ax_0_r_w_1)
		);

	DualPortRAM #(.DWIDTH(64), .AWIDTH(9), .WORDS(512) )
		dpram_tmp_1(
			.clk (clock),
			.ce_0 (w_fld_tmp_1_ce_0),
			.addr_0 (w_fld_tmp_1_addr_0),
			.datain_0 (w_fld_tmp_1_datain_0),
			.dataout_0 (w_fld_tmp_1_dataout_0),
			.r_w_0 (w_fld_tmp_1_r_w_0),
			.ce_1 (w_fld_tmp_1_ce_1),
			.addr_1 (r_fld_tmp_1_addr_1),
			.datain_1 (r_fld_tmp_1_datain_1),
			.dataout_1 (w_fld_tmp_1_dataout_1),
			.r_w_1 (r_fld_tmp_1_r_w_1)
		);

	DivInt
		DivInt_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.dividend (r_ip_DivInt_dividend_0),
			.divisor (r_ip_DivInt_divisor_0),
			.fractional (w_ip_DivInt_fractional_0),
			.quotient (w_ip_DivInt_quotient_0)
		);

	DivInt
		DivInt_inst_1(
			.clk (clock),
			.ce (w_sys_ce),
			.dividend (r_ip_DivInt_dividend_1),
			.divisor (r_ip_DivInt_divisor_1),
			.fractional (w_ip_DivInt_fractional_1),
			.quotient (w_ip_DivInt_quotient_1)
		);

	AddFloat
		AddFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_0),
			.b (r_ip_AddFloat_portB_0),
			.result (w_ip_AddFloat_result_0)
		);

	MultFloat
		MultFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_MultFloat_multiplicand_0),
			.b (r_ip_MultFloat_multiplier_0),
			.result (w_ip_MultFloat_product_0)
		);

	FixedToFloat
		FixedToFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_FixedToFloat_fixed_0),
			.result (w_ip_FixedToFloat_floating_0)
		);

	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setArray_arbiter0 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h2: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h1)) begin
										r_sys_setArray_arbiter0 <= w_sys_boolFalse;

									end
									else
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_setArray_arbiter0 <= w_sys_boolTrue;

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
			r_sys_sumArrayFastSub_arbiter1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h7: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h1)) begin
										r_sys_sumArrayFastSub_arbiter1 <= w_sys_boolFalse;

									end
									else
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFastSub_arbiter1 <= w_sys_boolTrue;

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
			r_sys_setArray_arbiter2 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h2: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h1)) begin
										r_sys_setArray_arbiter2 <= w_sys_boolFalse;

									end
									else
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_setArray_arbiter2 <= w_sys_boolTrue;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h5)) begin
										r_ip_DivInt_dividend_0 <= w_sys_tmp174;

									end
									else
									if((r_sys_setArray_step==6'h7)) begin
										r_ip_DivInt_dividend_0 <= w_sys_tmp246;

									end
									else
									if((r_sys_setArray_step==6'h4)) begin
										r_ip_DivInt_dividend_0 <= w_sys_tmp138;

									end
									else
									if((r_sys_setArray_step==6'h3)) begin
										r_ip_DivInt_dividend_0 <= w_sys_tmp102;

									end
									else
									if((r_sys_setArray_step==6'h0)) begin
										r_ip_DivInt_dividend_0 <= r_setArray_l_3;

									end
									else
									if((r_sys_setArray_step==6'h6)) begin
										r_ip_DivInt_dividend_0 <= w_sys_tmp210;

									end
									else
									if((r_sys_setArray_step==6'h2)) begin
										r_ip_DivInt_dividend_0 <= w_sys_tmp66;

									end
									else
									if((r_sys_setArray_step==6'h1)) begin
										r_ip_DivInt_dividend_0 <= w_sys_tmp30;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((6'h0<=r_sys_setArray_step && r_sys_setArray_step<=6'h7)) begin
										r_ip_DivInt_divisor_0 <= w_sys_tmp14;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h5)) begin
										r_ip_DivInt_dividend_1 <= w_sys_tmp192;

									end
									else
									if((r_sys_setArray_step==6'h4)) begin
										r_ip_DivInt_dividend_1 <= w_sys_tmp156;

									end
									else
									if((r_sys_setArray_step==6'h1)) begin
										r_ip_DivInt_dividend_1 <= w_sys_tmp48;

									end
									else
									if((r_sys_setArray_step==6'h3)) begin
										r_ip_DivInt_dividend_1 <= w_sys_tmp120;

									end
									else
									if((r_sys_setArray_step==6'h0)) begin
										r_ip_DivInt_dividend_1 <= w_sys_tmp16;

									end
									else
									if((r_sys_setArray_step==6'h7)) begin
										r_ip_DivInt_dividend_1 <= w_sys_tmp264;

									end
									else
									if((r_sys_setArray_step==6'h2)) begin
										r_ip_DivInt_dividend_1 <= w_sys_tmp84;

									end
									else
									if((r_sys_setArray_step==6'h6)) begin
										r_ip_DivInt_dividend_1 <= w_sys_tmp228;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((6'h0<=r_sys_setArray_step && r_sys_setArray_step<=6'h7)) begin
										r_ip_DivInt_divisor_1 <= w_sys_tmp14;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h8) || (r_sys_setArray_step==6'ha) || (r_sys_setArray_step==6'hc) || (r_sys_setArray_step==6'he) || (r_sys_setArray_step==6'h10) || (r_sys_setArray_step==6'h12) || (r_sys_setArray_step==6'h14) || (r_sys_setArray_step==6'h16) || (r_sys_setArray_step==6'h18) || (r_sys_setArray_step==6'h1a) || (r_sys_setArray_step==6'h1c) || (r_sys_setArray_step==6'h1e) || (r_sys_setArray_step==6'h20) || (r_sys_setArray_step==6'h22) || (r_sys_setArray_step==6'h24) || (r_sys_setArray_step==6'h26)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp7;

									end
								end

							endcase
						end

					endcase
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h9: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h3) || (r_sys_sumArrayFast_step==5'h5) || (r_sys_sumArrayFast_step==5'ha)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp0_float;

									end
								end

							endcase
						end

					endcase
				end

				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h2<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h9)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp298;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h2<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h9)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp383;

									end
								end

							endcase
						end

					endcase
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h8: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h2)) begin
										r_ip_AddFloat_portA_0 <= r_sumArray_result_12;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h8) || (r_sys_setArray_step==6'ha) || (r_sys_setArray_step==6'hc) || (r_sys_setArray_step==6'he) || (r_sys_setArray_step==6'h10) || (r_sys_setArray_step==6'h12) || (r_sys_setArray_step==6'h14) || (r_sys_setArray_step==6'h16) || (r_sys_setArray_step==6'h18) || (r_sys_setArray_step==6'h1a) || (r_sys_setArray_step==6'h1c) || (r_sys_setArray_step==6'h1e) || (r_sys_setArray_step==6'h20) || (r_sys_setArray_step==6'h22) || (r_sys_setArray_step==6'h24) || (r_sys_setArray_step==6'h26)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp10;

									end
								end

							endcase
						end

					endcase
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h9: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'ha)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp286;

									end
									else
									if((r_sys_sumArrayFast_step==5'h3) || (r_sys_sumArrayFast_step==5'h5)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp287;

									end
								end

							endcase
						end

					endcase
				end

				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h2<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h9)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp299;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h2<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h9)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp384;

									end
								end

							endcase
						end

					endcase
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h8: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h2)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp466;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h7) || (r_sys_setArray_step==6'h9) || (r_sys_setArray_step==6'hb) || (r_sys_setArray_step==6'hd) || (r_sys_setArray_step==6'hf) || (r_sys_setArray_step==6'h11) || (r_sys_setArray_step==6'h13) || (r_sys_setArray_step==6'h15) || (r_sys_setArray_step==6'h17) || (r_sys_setArray_step==6'h19) || (r_sys_setArray_step==6'h1b) || (r_sys_setArray_step==6'h1d) || (r_sys_setArray_step==6'h1f) || (r_sys_setArray_step==6'h21) || (r_sys_setArray_step==6'h23) || (r_sys_setArray_step==6'h25)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp7;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h7) || (r_sys_setArray_step==6'h9) || (r_sys_setArray_step==6'hb) || (r_sys_setArray_step==6'hd) || (r_sys_setArray_step==6'hf) || (r_sys_setArray_step==6'h11) || (r_sys_setArray_step==6'h13) || (r_sys_setArray_step==6'h15) || (r_sys_setArray_step==6'h17) || (r_sys_setArray_step==6'h19) || (r_sys_setArray_step==6'h1b) || (r_sys_setArray_step==6'h1d) || (r_sys_setArray_step==6'h1f) || (r_sys_setArray_step==6'h21) || (r_sys_setArray_step==6'h23) || (r_sys_setArray_step==6'h25)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp8;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h16) || (r_sys_setArray_step==6'h17)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp192;

									end
									else
									if((r_sys_setArray_step==6'h6) || (r_sys_setArray_step==6'h7)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp48;

									end
									else
									if((r_sys_setArray_step==6'he) || (r_sys_setArray_step==6'hf)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp120;

									end
									else
									if((r_sys_setArray_step==6'h1c) || (r_sys_setArray_step==6'h1d)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp246;

									end
									else
									if((r_sys_setArray_step==6'h2) || (r_sys_setArray_step==6'h3)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp16;

									end
									else
									if((r_sys_setArray_step==6'h10) || (r_sys_setArray_step==6'h11)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp138;

									end
									else
									if((r_sys_setArray_step==6'h18) || (r_sys_setArray_step==6'h19)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp210;

									end
									else
									if((r_sys_setArray_step==6'h4) || (r_sys_setArray_step==6'h5)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp30;

									end
									else
									if((r_sys_setArray_step==6'ha) || (r_sys_setArray_step==6'hb)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp84;

									end
									else
									if((r_sys_setArray_step==6'h12) || (r_sys_setArray_step==6'h13)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp156;

									end
									else
									if((r_sys_setArray_step==6'h14) || (r_sys_setArray_step==6'h15)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp174;

									end
									else
									if((r_sys_setArray_step==6'h0) || (r_sys_setArray_step==6'h1)) begin
										r_ip_FixedToFloat_fixed_0 <= r_setArray_l_3;

									end
									else
									if((r_sys_setArray_step==6'hc) || (r_sys_setArray_step==6'hd)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp102;

									end
									else
									if((r_sys_setArray_step==6'h1e) || (r_sys_setArray_step==6'h1f)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp264;

									end
									else
									if((r_sys_setArray_step==6'h8) || (r_sys_setArray_step==6'h9)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp66;

									end
									else
									if((r_sys_setArray_step==6'h1a) || (r_sys_setArray_step==6'h1b)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp228;

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
					r_sys_processing_methodID <= ((i_sumArray_req) ? 3'h4 : ((i_sumArrayFast_req) ? 3'h2 : r_sys_processing_methodID));
				end

				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h9: begin
							r_sys_processing_methodID <= r_sys_setArray_caller;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h2: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_processing_methodID <= 3'h1;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_processing_methodID <= 3'h3;

									end
								end

							endcase
						end

						4'hb: begin
							r_sys_processing_methodID <= r_sys_sumArrayFast_caller;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'hf: begin
							r_sys_processing_methodID <= r_sys_sumArrayFastSub_caller;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h2: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_processing_methodID <= 3'h1;

									end
								end

							endcase
						end

						4'hc: begin
							r_sys_processing_methodID <= r_sys_sumArray_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setArray_caller <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h2: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_setArray_caller <= r_sys_processing_methodID;

									end
								end

							endcase
						end

					endcase
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h2: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_setArray_caller <= r_sys_processing_methodID;

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
			r_sys_setArray_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setArray_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h0: begin
							r_sys_setArray_phase <= 4'h3;
						end

						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_sys_setArray_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_sys_setArray_phase <= ((w_sys_tmp1) ? 4'h7 : 4'h9);

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_sys_setArray_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h2c)) begin
										r_sys_setArray_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin
							r_sys_setArray_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setArray_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h2c)) begin
										r_sys_setArray_stage <= 2'h0;

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
			r_sys_setArray_step <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_sys_setArray_step <= 6'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_sys_setArray_step <= 6'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_sys_setArray_step <= 6'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h2c)) begin
										r_sys_setArray_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_setArray_step && r_sys_setArray_step<=6'h2b)) begin
										r_sys_setArray_step <= w_sys_setArray_step_p1;

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
			r_sys_setArray_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h0: begin
							r_sys_setArray_busy <= w_sys_boolTrue;
						end

						4'h9: begin
							r_sys_setArray_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArrayFast_return <= 64'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h8: begin
							r_sys_sumArrayFast_return <= r_sys_tmp0_float;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArrayFast_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArrayFast_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArrayFast_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h0: begin
							r_sys_sumArrayFast_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h1)) begin
										r_sys_sumArrayFast_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_phase <= ((w_sys_tmp282) ? 4'h7 : 4'h9);

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFast_stage) 
								2'h1: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h8: begin
							r_sys_sumArrayFast_phase <= 4'hb;
						end

						4'h9: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'hf)) begin
										r_sys_sumArrayFast_phase <= 4'h8;

									end
								end

							endcase
						end

						4'hb: begin
							r_sys_sumArrayFast_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArrayFast_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h2: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h1)) begin
										r_sys_sumArrayFast_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h1)) begin
										r_sys_sumArrayFast_stage <= w_sys_sumArrayFast_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'hf)) begin
										r_sys_sumArrayFast_stage <= 2'h0;

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
			r_sys_sumArrayFast_step <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h2: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_step <= w_sys_sumArrayFast_step_p1;

									end
									else
									if((r_sys_sumArrayFast_step==5'h1)) begin
										r_sys_sumArrayFast_step <= 5'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_step <= 5'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_step <= 5'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_step <= w_sys_sumArrayFast_step_p1;

									end
									else
									if((r_sys_sumArrayFast_step==5'h1)) begin
										r_sys_sumArrayFast_step <= 5'h0;

									end
								end

								2'h1: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFast_step <= 5'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFast_step && r_sys_sumArrayFast_step<=5'he)) begin
										r_sys_sumArrayFast_step <= w_sys_sumArrayFast_step_p1;

									end
									else
									if((r_sys_sumArrayFast_step==5'hf)) begin
										r_sys_sumArrayFast_step <= 5'h0;

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
			r_sys_sumArrayFast_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_sumArrayFast_busy <= ((i_sumArrayFast_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h0: begin
							r_sys_sumArrayFast_busy <= w_sys_boolTrue;
						end

						4'hb: begin
							r_sys_sumArrayFast_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArrayFastSub_caller <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h7: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sys_sumArrayFastSub_caller <= r_sys_processing_methodID;

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
			r_sys_sumArrayFastSub_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArrayFastSub_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h0: begin
							r_sys_sumArrayFastSub_phase <= 4'h3;
						end

						4'h3: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h1: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_phase <= ((w_sys_tmp292) ? 4'h7 : 4'h9);

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'he)) begin
										r_sys_sumArrayFastSub_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h1: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_phase <= 4'ha;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_phase <= ((w_sys_tmp376) ? 4'hd : 4'hf);

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'he)) begin
										r_sys_sumArrayFastSub_phase <= 4'ha;

									end
								end

							endcase
						end

						4'hf: begin
							r_sys_sumArrayFastSub_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArrayFastSub_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h3: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_stage <= w_sys_sumArrayFastSub_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'he)) begin
										r_sys_sumArrayFastSub_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_stage <= w_sys_sumArrayFastSub_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_stage <= 2'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_stage <= 2'h0;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'he)) begin
										r_sys_sumArrayFastSub_stage <= 2'h0;

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
			r_sys_sumArrayFastSub_step <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h3: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_step <= 5'h0;

									end
								end

								2'h1: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_step <= 5'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_step <= 5'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'hd)) begin
										r_sys_sumArrayFastSub_step <= w_sys_sumArrayFastSub_step_p1;

									end
									else
									if((r_sys_sumArrayFastSub_step==5'he)) begin
										r_sys_sumArrayFastSub_step <= 5'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_step <= 5'h0;

									end
								end

								2'h1: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_step <= 5'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sys_sumArrayFastSub_step <= 5'h0;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'hd)) begin
										r_sys_sumArrayFastSub_step <= w_sys_sumArrayFastSub_step_p1;

									end
									else
									if((r_sys_sumArrayFastSub_step==5'he)) begin
										r_sys_sumArrayFastSub_step <= 5'h0;

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
			r_sys_sumArrayFastSub_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h0: begin
							r_sys_sumArrayFastSub_busy <= w_sys_boolTrue;
						end

						4'hf: begin
							r_sys_sumArrayFastSub_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArray_return <= 64'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h9: begin
							r_sys_sumArray_return <= w_sys_tmp468;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArray_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArray_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArray_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h0: begin
							r_sys_sumArray_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_sumArray_stage) 
								2'h1: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_phase <= ((w_sys_tmp462) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h7)) begin
										r_sys_sumArray_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin
							r_sys_sumArray_phase <= 4'hc;
						end

						4'ha: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_phase <= 4'h9;

									end
								end

							endcase
						end

						4'hc: begin
							r_sys_sumArray_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumArray_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h2: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h1)) begin
										r_sys_sumArray_stage <= w_sys_sumArray_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h7)) begin
										r_sys_sumArray_stage <= 2'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_stage <= 2'h0;

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
			r_sys_sumArray_step <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h2: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_step <= w_sys_sumArray_step_p1;

									end
									else
									if((r_sys_sumArray_step==4'h1)) begin
										r_sys_sumArray_step <= 4'h0;

									end
								end

								2'h1: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_step <= 4'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_step <= 4'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_step <= 4'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((4'h0<=r_sys_sumArray_step && r_sys_sumArray_step<=4'h6)) begin
										r_sys_sumArray_step <= w_sys_sumArray_step_p1;

									end
									else
									if((r_sys_sumArray_step==4'h7)) begin
										r_sys_sumArray_step <= 4'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sys_sumArray_step <= 4'h0;

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
			r_sys_sumArray_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_sumArray_busy <= ((i_sumArray_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h0: begin
							r_sys_sumArray_busy <= w_sys_boolTrue;
						end

						4'hc: begin
							r_sys_sumArray_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_ax_0_addr_1 <= 10'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h2a)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp192[9:0] );

									end
									else
									if((r_sys_setArray_step==6'h29)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp156[9:0] );

									end
									else
									if((r_sys_setArray_step==6'h26)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp48[9:0] );

									end
									else
									if((r_sys_setArray_step==6'h28)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp120[9:0] );

									end
									else
									if((r_sys_setArray_step==6'h25)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp16[9:0] );

									end
									else
									if((r_sys_setArray_step==6'h2c)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp264[9:0] );

									end
									else
									if((r_sys_setArray_step==6'h27)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp84[9:0] );

									end
									else
									if((r_sys_setArray_step==6'h2b)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp228[9:0] );

									end
								end

							endcase
						end

					endcase
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h9: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_intZero[9:0] );

									end
									else
									if((r_sys_sumArrayFast_step==5'h2)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp289[9:0] );

									end
									else
									if((r_sys_sumArrayFast_step==5'h1)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_intOne[9:0] );

									end
									else
									if((r_sys_sumArrayFast_step==5'h3)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp291[9:0] );

									end
								end

							endcase
						end

					endcase
				end

				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_fld_ax_0_addr_1 <= $signed( r_sumArrayFastSub_i_8[9:0] );

									end
								end

							endcase
						end

					endcase
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h8: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_fld_ax_0_addr_1 <= $signed( r_sumArray_n_13[9:0] );

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h2b)) begin
										r_fld_ax_0_datain_1 <= w_sys_tmp230;

									end
									else
									if((r_sys_setArray_step==6'h28)) begin
										r_fld_ax_0_datain_1 <= w_sys_tmp122;

									end
									else
									if((r_sys_setArray_step==6'h29)) begin
										r_fld_ax_0_datain_1 <= w_sys_tmp158;

									end
									else
									if((r_sys_setArray_step==6'h27)) begin
										r_fld_ax_0_datain_1 <= w_sys_tmp86;

									end
									else
									if((r_sys_setArray_step==6'h2a)) begin
										r_fld_ax_0_datain_1 <= w_sys_tmp194;

									end
									else
									if((r_sys_setArray_step==6'h26)) begin
										r_fld_ax_0_datain_1 <= w_sys_tmp50;

									end
									else
									if((r_sys_setArray_step==6'h2c)) begin
										r_fld_ax_0_datain_1 <= w_sys_tmp266;

									end
									else
									if((r_sys_setArray_step==6'h25)) begin
										r_fld_ax_0_datain_1 <= w_sys_tmp17;

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
			r_fld_ax_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((6'h25<=r_sys_setArray_step && r_sys_setArray_step<=6'h2c)) begin
										r_fld_ax_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'h9: begin
							r_fld_ax_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h9: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFast_step && r_sys_sumArrayFast_step<=5'h3)) begin
										r_fld_ax_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hb: begin
							r_fld_ax_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_fld_ax_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hf: begin
							r_fld_ax_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'h8: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_fld_ax_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hc: begin
							r_fld_ax_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_tmp_1_addr_1 <= 9'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_fld_tmp_1_addr_1 <= $signed( r_sumArrayFastSub_i_10[8:0] );

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
			r_fld_tmp_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h9: begin
							r_fld_tmp_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'hb: begin
							r_fld_tmp_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_fld_tmp_1_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hf: begin
							r_fld_tmp_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'hc: begin
							r_fld_tmp_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_setArray_ax_2_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h2a)) begin
										r_setArray_ax_2_addr <= w_sys_tmp174;

									end
									else
									if((r_sys_setArray_step==6'h2c)) begin
										r_setArray_ax_2_addr <= w_sys_tmp246;

									end
									else
									if((r_sys_setArray_step==6'h29)) begin
										r_setArray_ax_2_addr <= w_sys_tmp138;

									end
									else
									if((r_sys_setArray_step==6'h28)) begin
										r_setArray_ax_2_addr <= w_sys_tmp102;

									end
									else
									if((r_sys_setArray_step==6'h25)) begin
										r_setArray_ax_2_addr <= r_setArray_l_3;

									end
									else
									if((r_sys_setArray_step==6'h2b)) begin
										r_setArray_ax_2_addr <= w_sys_tmp210;

									end
									else
									if((r_sys_setArray_step==6'h27)) begin
										r_setArray_ax_2_addr <= w_sys_tmp66;

									end
									else
									if((r_sys_setArray_step==6'h26)) begin
										r_setArray_ax_2_addr <= w_sys_tmp30;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h2b)) begin
										r_setArray_ax_2_datain <= w_sys_tmp212;

									end
									else
									if((r_sys_setArray_step==6'h28)) begin
										r_setArray_ax_2_datain <= w_sys_tmp104;

									end
									else
									if((r_sys_setArray_step==6'h25)) begin
										r_setArray_ax_2_datain <= w_sys_tmp6;

									end
									else
									if((r_sys_setArray_step==6'h26)) begin
										r_setArray_ax_2_datain <= w_sys_tmp32;

									end
									else
									if((r_sys_setArray_step==6'h27)) begin
										r_setArray_ax_2_datain <= w_sys_tmp68;

									end
									else
									if((r_sys_setArray_step==6'h29)) begin
										r_setArray_ax_2_datain <= w_sys_tmp140;

									end
									else
									if((r_sys_setArray_step==6'h2c)) begin
										r_setArray_ax_2_datain <= w_sys_tmp248;

									end
									else
									if((r_sys_setArray_step==6'h2a)) begin
										r_setArray_ax_2_datain <= w_sys_tmp176;

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
			r_setArray_ax_2_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((6'h25<=r_sys_setArray_step && r_sys_setArray_step<=6'h2c)) begin
										r_setArray_ax_2_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'h9: begin
							r_setArray_ax_2_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'hb: begin
							r_setArray_ax_2_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'hf: begin
							r_setArray_ax_2_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'hc: begin
							r_setArray_ax_2_r_w <= w_sys_boolFalse;
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

					case(r_sys_setArray_phase) 
						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_setArray_l_3 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h0)) begin
										r_setArray_l_3 <= w_sys_tmp3;

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

					case(r_sys_sumArrayFast_phase) 
						4'h4: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sumArrayFast_i_4 <= w_sys_tmp281;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFast_stage) 
								2'h1: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sumArrayFast_i_4 <= w_sys_tmp284;

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
			r_sumArrayFastSub_ax_5_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_sumArrayFastSub_ax_5_addr <= w_sys_tmp300;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h7<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'he)) begin
										r_sumArrayFastSub_ax_5_addr <= r_sumArrayFastSub_j_11;

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

					case(r_sys_sumArrayFastSub_phase) 
						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h7<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'he)) begin
										r_sumArrayFastSub_ax_5_datain <= w_sys_tmp382;

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
			r_sumArrayFastSub_ax_5_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h9: begin
							r_sumArrayFastSub_ax_5_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'hb: begin
							r_sumArrayFastSub_ax_5_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_sumArrayFastSub_ax_5_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h7<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'he)) begin
										r_sumArrayFastSub_ax_5_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'hf: begin
							r_sumArrayFastSub_ax_5_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'hc: begin
							r_sumArrayFastSub_ax_5_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sumArrayFastSub_tmp_6_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h7<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'he)) begin
										r_sumArrayFastSub_tmp_6_addr <= r_sumArrayFastSub_j_9;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_sumArrayFastSub_tmp_6_addr <= w_sys_tmp385;

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

					case(r_sys_sumArrayFastSub_phase) 
						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h7<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'he)) begin
										r_sumArrayFastSub_tmp_6_datain <= w_sys_tmp297;

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
			r_sumArrayFastSub_tmp_6_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_setArray_phase) 
						4'h9: begin
							r_sumArrayFastSub_tmp_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'hb: begin
							r_sumArrayFastSub_tmp_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_sumArrayFastSub_phase) 
						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h7<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'he)) begin
										r_sumArrayFastSub_tmp_6_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_sumArrayFastSub_tmp_6_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hf: begin
							r_sumArrayFastSub_tmp_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_sumArray_phase) 
						4'hc: begin
							r_sumArrayFastSub_tmp_6_r_w <= w_sys_boolFalse;
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

					case(r_sys_sumArrayFast_phase) 
						4'h7: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h0)) begin
										r_sumArrayFastSub_num_7 <= r_sumArrayFast_i_4;

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

					case(r_sys_sumArrayFastSub_phase) 
						4'h3: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sumArrayFastSub_i_8 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_sumArrayFastSub_i_8 <= w_sys_tmp303;

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

					case(r_sys_sumArrayFastSub_phase) 
						4'h3: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sumArrayFastSub_j_9 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h7<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'he)) begin
										r_sumArrayFastSub_j_9 <= w_sys_tmp305;

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

					case(r_sys_sumArrayFastSub_phase) 
						4'h9: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sumArrayFastSub_i_10 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_sumArrayFastSub_i_10 <= w_sys_tmp388;

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

					case(r_sys_sumArrayFastSub_phase) 
						4'h9: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sumArrayFastSub_j_11 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h7<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'he)) begin
										r_sumArrayFastSub_j_11 <= w_sys_tmp390;

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

					case(r_sys_sumArray_phase) 
						4'h2: begin

							case(r_sys_sumArray_stage) 
								2'h1: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sumArray_result_12 <= w_sys_tmp461;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h7)) begin
										r_sumArray_result_12 <= w_sys_tmp465;

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

					case(r_sys_sumArray_phase) 
						4'h4: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sumArray_n_13 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumArray_stage) 
								2'h0: begin
									if((r_sys_sumArray_step==4'h0)) begin
										r_sumArray_n_13 <= w_sys_tmp467;

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

					case(r_sys_sumArrayFastSub_phase) 
						4'h3: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h1: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sumArrayFastSub_copy0_i_14 <= r_sumArrayFastSub_i_8;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_sumArrayFastSub_copy0_i_14 <= w_sys_tmp301;

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

					case(r_sys_sumArrayFastSub_phase) 
						4'h9: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h1: begin
									if((r_sys_sumArrayFastSub_step==5'h0)) begin
										r_sumArrayFastSub_copy0_i_15 <= r_sumArrayFastSub_i_10;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_sumArrayFastSub_stage) 
								2'h0: begin
									if((5'h0<=r_sys_sumArrayFastSub_step && r_sys_sumArrayFastSub_step<=5'h7)) begin
										r_sumArrayFastSub_copy0_i_15 <= w_sys_tmp386;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h24)) begin
										r_sys_tmp0_float <= w_ip_MultFloat_product_0;

									end
								end

							endcase
						end

					endcase
				end

				3'h2: begin

					case(r_sys_sumArrayFast_phase) 
						4'h9: begin

							case(r_sys_sumArrayFast_stage) 
								2'h0: begin
									if((r_sys_sumArrayFast_step==5'h8)) begin
										r_sys_tmp0_float <= w_ip_AddFloat_result_0;

									end
									else
									if((r_sys_sumArrayFast_step==5'hf)) begin
										r_sys_tmp0_float <= w_sys_tmp286;

									end
									else
									if((r_sys_sumArrayFast_step==5'h2) || (r_sys_sumArrayFast_step==5'h4)) begin
										r_sys_tmp0_float <= w_fld_ax_0_dataout_1;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h23)) begin
										r_sys_tmp1_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h22)) begin
										r_sys_tmp2_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h21)) begin
										r_sys_tmp3_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h20)) begin
										r_sys_tmp4_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h1f)) begin
										r_sys_tmp5_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h1e)) begin
										r_sys_tmp6_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h1d)) begin
										r_sys_tmp7_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h1c)) begin
										r_sys_tmp8_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h1b)) begin
										r_sys_tmp9_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h1a)) begin
										r_sys_tmp10_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h19)) begin
										r_sys_tmp11_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h18)) begin
										r_sys_tmp12_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h17)) begin
										r_sys_tmp13_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h16)) begin
										r_sys_tmp14_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h15)) begin
										r_sys_tmp15_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h14)) begin
										r_sys_tmp16_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h13)) begin
										r_sys_tmp17_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h12)) begin
										r_sys_tmp18_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h11) || (r_sys_setArray_step==6'h29)) begin
										r_sys_tmp19_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'h10) || (r_sys_setArray_step==6'h2a)) begin
										r_sys_tmp20_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'hf) || (r_sys_setArray_step==6'h27)) begin
										r_sys_tmp21_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'he) || (r_sys_setArray_step==6'h28)) begin
										r_sys_tmp22_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'hc) || (r_sys_setArray_step==6'h26)) begin
										r_sys_tmp23_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==6'hd) || (r_sys_setArray_step==6'h25) || (r_sys_setArray_step==6'h2b)) begin
										r_sys_tmp24_float <= w_ip_AddFloat_result_0;

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
