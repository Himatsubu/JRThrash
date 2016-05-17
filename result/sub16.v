/*
TimeStamp:	2016/5/18		3:32
*/


module sub16(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	input  signed  [ 9:0] i_fld_T_0_addr_0,	
	input          [31:0] i_fld_T_0_datain_0,	
	output         [31:0] o_fld_T_0_dataout_0,	
	input                 i_fld_T_0_r_w_0,	
	input  signed  [ 9:0] i_fld_V_1_addr_0,	
	input          [31:0] i_fld_V_1_datain_0,	
	output         [31:0] o_fld_V_1_dataout_0,	
	input                 i_fld_V_1_r_w_0,	
	input  signed  [ 9:0] i_fld_U_2_addr_0,	
	input          [31:0] i_fld_U_2_datain_0,	
	output         [31:0] o_fld_U_2_dataout_0,	
	input                 i_fld_U_2_r_w_0,	
	input  signed  [ 9:0] i_fld_result_3_addr_0,	
	input          [31:0] i_fld_result_3_datain_0,	
	output         [31:0] o_fld_result_3_dataout_0,	
	input                 i_fld_result_3_r_w_0	
);

	reg         [31:0] r_ip_AddFloat_portA_0;
	reg         [31:0] r_ip_AddFloat_portB_0;
	wire        [31:0] w_ip_AddFloat_result_0;
	reg         [31:0] r_ip_AddFloat_portA_1;
	reg         [31:0] r_ip_AddFloat_portB_1;
	wire        [31:0] w_ip_AddFloat_result_1;
	reg         [31:0] r_ip_AddFloat_portA_2;
	reg         [31:0] r_ip_AddFloat_portB_2;
	wire        [31:0] w_ip_AddFloat_result_2;
	reg         [31:0] r_ip_AddFloat_portA_3;
	reg         [31:0] r_ip_AddFloat_portB_3;
	wire        [31:0] w_ip_AddFloat_result_3;
	reg         [31:0] r_ip_AddFloat_portA_4;
	reg         [31:0] r_ip_AddFloat_portB_4;
	wire        [31:0] w_ip_AddFloat_result_4;
	reg         [31:0] r_ip_AddFloat_portA_5;
	reg         [31:0] r_ip_AddFloat_portB_5;
	wire        [31:0] w_ip_AddFloat_result_5;
	reg         [31:0] r_ip_AddFloat_portA_6;
	reg         [31:0] r_ip_AddFloat_portB_6;
	wire        [31:0] w_ip_AddFloat_result_6;
	reg         [31:0] r_ip_AddFloat_portA_7;
	reg         [31:0] r_ip_AddFloat_portB_7;
	wire        [31:0] w_ip_AddFloat_result_7;
	reg         [31:0] r_ip_AddFloat_portA_8;
	reg         [31:0] r_ip_AddFloat_portB_8;
	wire        [31:0] w_ip_AddFloat_result_8;
	reg         [31:0] r_ip_AddFloat_portA_9;
	reg         [31:0] r_ip_AddFloat_portB_9;
	wire        [31:0] w_ip_AddFloat_result_9;
	reg         [31:0] r_ip_MultFloat_multiplicand_0;
	reg         [31:0] r_ip_MultFloat_multiplier_0;
	wire        [31:0] w_ip_MultFloat_product_0;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 1:0] r_sys_run_caller;
	reg                r_sys_run_req;
	reg         [ 3:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 6:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 6:0] w_sys_run_step_p1;
	wire signed [ 9:0] w_fld_T_0_addr_0;
	wire        [31:0] w_fld_T_0_datain_0;
	wire        [31:0] w_fld_T_0_dataout_0;
	wire               w_fld_T_0_r_w_0;
	wire               w_fld_T_0_ce_0;
	reg  signed [ 9:0] r_fld_T_0_addr_1;
	reg         [31:0] r_fld_T_0_datain_1;
	wire        [31:0] w_fld_T_0_dataout_1;
	reg                r_fld_T_0_r_w_1;
	wire               w_fld_T_0_ce_1;
	wire signed [ 9:0] w_fld_V_1_addr_0;
	wire        [31:0] w_fld_V_1_datain_0;
	wire        [31:0] w_fld_V_1_dataout_0;
	wire               w_fld_V_1_r_w_0;
	wire               w_fld_V_1_ce_0;
	reg  signed [ 9:0] r_fld_V_1_addr_1;
	reg         [31:0] r_fld_V_1_datain_1;
	wire        [31:0] w_fld_V_1_dataout_1;
	reg                r_fld_V_1_r_w_1;
	wire               w_fld_V_1_ce_1;
	wire signed [ 9:0] w_fld_U_2_addr_0;
	wire        [31:0] w_fld_U_2_datain_0;
	wire        [31:0] w_fld_U_2_dataout_0;
	wire               w_fld_U_2_r_w_0;
	wire               w_fld_U_2_ce_0;
	reg  signed [ 9:0] r_fld_U_2_addr_1;
	reg         [31:0] r_fld_U_2_datain_1;
	wire        [31:0] w_fld_U_2_dataout_1;
	reg                r_fld_U_2_r_w_1;
	wire               w_fld_U_2_ce_1;
	wire signed [ 9:0] w_fld_result_3_addr_0;
	wire        [31:0] w_fld_result_3_datain_0;
	wire        [31:0] w_fld_result_3_dataout_0;
	wire               w_fld_result_3_r_w_0;
	wire               w_fld_result_3_ce_0;
	reg  signed [ 9:0] r_fld_result_3_addr_1;
	reg         [31:0] r_fld_result_3_datain_1;
	wire        [31:0] w_fld_result_3_dataout_1;
	reg                r_fld_result_3_r_w_1;
	wire               w_fld_result_3_ce_1;
	reg  signed [31:0] r_run_k_4;
	reg  signed [31:0] r_run_j_5;
	reg         [31:0] r_run_dt_6;
	reg         [31:0] r_run_dx_7;
	reg         [31:0] r_run_dy_8;
	reg         [31:0] r_run_r1_9;
	reg         [31:0] r_run_r2_10;
	reg         [31:0] r_run_r3_11;
	reg         [31:0] r_run_r4_12;
	reg         [31:0] r_run_YY_13;
	reg  signed [31:0] r_run_copy0_j_14;
	reg  signed [31:0] r_run_copy1_j_15;
	reg  signed [31:0] r_run_copy2_j_16;
	reg  signed [31:0] r_run_copy3_j_17;
	reg  signed [31:0] r_run_copy4_j_18;
	reg  signed [31:0] r_run_copy5_j_19;
	reg  signed [31:0] r_run_copy6_j_20;
	reg  signed [31:0] r_run_copy7_j_21;
	reg  signed [31:0] r_run_copy8_j_22;
	reg  signed [31:0] r_run_copy9_j_23;
	reg  signed [31:0] r_run_copy10_j_24;
	reg  signed [31:0] r_run_copy11_j_25;
	reg  signed [31:0] r_run_copy12_j_26;
	reg         [31:0] r_sys_tmp0_float;
	reg         [31:0] r_sys_tmp1_float;
	reg         [31:0] r_sys_tmp2_float;
	reg         [31:0] r_sys_tmp3_float;
	reg         [31:0] r_sys_tmp4_float;
	reg         [31:0] r_sys_tmp5_float;
	reg         [31:0] r_sys_tmp6_float;
	reg         [31:0] r_sys_tmp7_float;
	reg         [31:0] r_sys_tmp8_float;
	reg         [31:0] r_sys_tmp9_float;
	reg         [31:0] r_sys_tmp10_float;
	reg         [31:0] r_sys_tmp11_float;
	reg         [31:0] r_sys_tmp12_float;
	reg         [31:0] r_sys_tmp13_float;
	reg         [31:0] r_sys_tmp14_float;
	wire        [31:0] w_sys_tmp1;
	wire        [31:0] w_sys_tmp2;
	wire        [31:0] w_sys_tmp3;
	wire        [31:0] w_sys_tmp4;
	wire        [31:0] w_sys_tmp5;
	wire        [31:0] w_sys_tmp6;
	wire signed [31:0] w_sys_tmp7;
	wire               w_sys_tmp8;
	wire               w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp11;
	wire signed [31:0] w_sys_tmp12;
	wire               w_sys_tmp13;
	wire               w_sys_tmp14;
	wire signed [31:0] w_sys_tmp15;
	wire signed [31:0] w_sys_tmp18;
	wire signed [31:0] w_sys_tmp19;
	wire signed [31:0] w_sys_tmp20;
	wire        [31:0] w_sys_tmp21;
	wire        [31:0] w_sys_tmp22;
	wire signed [31:0] w_sys_tmp23;
	wire signed [31:0] w_sys_tmp24;
	wire        [31:0] w_sys_tmp26;
	wire        [31:0] w_sys_tmp27;
	wire signed [31:0] w_sys_tmp28;
	wire signed [31:0] w_sys_tmp29;
	wire signed [31:0] w_sys_tmp31;
	wire signed [31:0] w_sys_tmp32;
	wire signed [31:0] w_sys_tmp33;
	wire        [31:0] w_sys_tmp35;
	wire signed [31:0] w_sys_tmp36;
	wire signed [31:0] w_sys_tmp37;
	wire signed [31:0] w_sys_tmp38;
	wire signed [31:0] w_sys_tmp41;
	wire signed [31:0] w_sys_tmp42;
	wire signed [31:0] w_sys_tmp44;
	wire signed [31:0] w_sys_tmp45;
	wire signed [31:0] w_sys_tmp46;
	wire signed [31:0] w_sys_tmp49;
	wire signed [31:0] w_sys_tmp50;
	wire signed [31:0] w_sys_tmp51;
	wire        [31:0] w_sys_tmp54;
	wire signed [31:0] w_sys_tmp55;
	wire signed [31:0] w_sys_tmp56;
	wire signed [31:0] w_sys_tmp57;
	wire        [31:0] w_sys_tmp60;
	wire signed [31:0] w_sys_tmp62;
	wire signed [31:0] w_sys_tmp63;
	wire signed [31:0] w_sys_tmp65;
	wire signed [31:0] w_sys_tmp66;
	wire signed [31:0] w_sys_tmp67;
	wire        [31:0] w_sys_tmp69;
	wire        [31:0] w_sys_tmp70;
	wire signed [31:0] w_sys_tmp71;
	wire signed [31:0] w_sys_tmp72;
	wire signed [31:0] w_sys_tmp73;
	wire signed [31:0] w_sys_tmp78;
	wire signed [31:0] w_sys_tmp79;
	wire signed [31:0] w_sys_tmp81;
	wire signed [31:0] w_sys_tmp82;
	wire signed [31:0] w_sys_tmp83;
	wire signed [31:0] w_sys_tmp85;
	wire signed [31:0] w_sys_tmp86;
	wire signed [31:0] w_sys_tmp87;
	wire signed [31:0] w_sys_tmp88;
	wire signed [31:0] w_sys_tmp89;
	wire signed [31:0] w_sys_tmp91;
	wire signed [31:0] w_sys_tmp92;
	wire signed [31:0] w_sys_tmp93;
	wire signed [31:0] w_sys_tmp94;
	wire signed [31:0] w_sys_tmp96;
	wire signed [31:0] w_sys_tmp97;
	wire signed [31:0] w_sys_tmp98;
	wire        [31:0] w_sys_tmp105;
	wire        [31:0] w_sys_tmp114;
	wire        [31:0] w_sys_tmp468;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 7'h1);
	assign o_fld_T_0_dataout_0 = w_fld_T_0_dataout_0;
	assign w_fld_T_0_addr_0 = i_fld_T_0_addr_0;
	assign w_fld_T_0_datain_0 = i_fld_T_0_datain_0;
	assign w_fld_T_0_r_w_0 = i_fld_T_0_r_w_0;
	assign w_fld_T_0_ce_0 = w_sys_ce;
	assign w_fld_T_0_ce_1 = w_sys_ce;
	assign o_fld_V_1_dataout_0 = w_fld_V_1_dataout_0;
	assign w_fld_V_1_addr_0 = i_fld_V_1_addr_0;
	assign w_fld_V_1_datain_0 = i_fld_V_1_datain_0;
	assign w_fld_V_1_r_w_0 = i_fld_V_1_r_w_0;
	assign w_fld_V_1_ce_0 = w_sys_ce;
	assign w_fld_V_1_ce_1 = w_sys_ce;
	assign o_fld_U_2_dataout_0 = w_fld_U_2_dataout_0;
	assign w_fld_U_2_addr_0 = i_fld_U_2_addr_0;
	assign w_fld_U_2_datain_0 = i_fld_U_2_datain_0;
	assign w_fld_U_2_r_w_0 = i_fld_U_2_r_w_0;
	assign w_fld_U_2_ce_0 = w_sys_ce;
	assign w_fld_U_2_ce_1 = w_sys_ce;
	assign o_fld_result_3_dataout_0 = w_fld_result_3_dataout_0;
	assign w_fld_result_3_addr_0 = i_fld_result_3_addr_0;
	assign w_fld_result_3_datain_0 = i_fld_result_3_datain_0;
	assign w_fld_result_3_r_w_0 = i_fld_result_3_r_w_0;
	assign w_fld_result_3_ce_0 = w_sys_ce;
	assign w_fld_result_3_ce_1 = w_sys_ce;
	assign w_sys_tmp1 = 32'h3e088889;
	assign w_sys_tmp2 = 32'h3d088889;
	assign w_sys_tmp3 = 32'h3af5c28f;
	assign w_sys_tmp4 = 32'h3bf5c28f;
	assign w_sys_tmp5 = 32'h3ce66665;
	assign w_sys_tmp6 = 32'h3ee66665;
	assign w_sys_tmp7 = 32'sh00000014;
	assign w_sys_tmp8 = ( !w_sys_tmp9 );
	assign w_sys_tmp9 = (w_sys_tmp10 < r_run_k_4);
	assign w_sys_tmp10 = 32'sh00000019;
	assign w_sys_tmp11 = (r_run_k_4 + w_sys_intOne);
	assign w_sys_tmp12 = 32'sh00000008;
	assign w_sys_tmp13 = ( !w_sys_tmp14 );
	assign w_sys_tmp14 = (w_sys_tmp15 < r_run_j_5);
	assign w_sys_tmp15 = 32'sh0000000d;
	assign w_sys_tmp18 = (w_sys_tmp19 + r_run_k_4);
	assign w_sys_tmp19 = (r_run_j_5 * w_sys_tmp20);
	assign w_sys_tmp20 = 32'sh0000001f;
	assign w_sys_tmp21 = w_ip_AddFloat_result_9;
	assign w_sys_tmp22 = w_ip_AddFloat_result_8;
	assign w_sys_tmp23 = (w_sys_tmp24 + r_run_k_4);
	assign w_sys_tmp24 = (r_run_copy12_j_26 * w_sys_tmp20);
	assign w_sys_tmp26 = w_ip_MultFloat_product_0;
	assign w_sys_tmp27 = w_fld_U_2_dataout_1;
	assign w_sys_tmp28 = (w_sys_tmp29 + r_run_k_4);
	assign w_sys_tmp29 = (r_run_copy11_j_25 * w_sys_tmp20);
	assign w_sys_tmp31 = (w_sys_tmp32 + r_run_k_4);
	assign w_sys_tmp32 = (w_sys_tmp33 * w_sys_tmp20);
	assign w_sys_tmp33 = (r_run_copy10_j_24 + w_sys_intOne);
	assign w_sys_tmp35 = w_fld_T_0_dataout_1;
	assign w_sys_tmp36 = (w_sys_tmp37 + r_run_k_4);
	assign w_sys_tmp37 = (w_sys_tmp38 * w_sys_tmp20);
	assign w_sys_tmp38 = (r_run_copy9_j_23 - w_sys_intOne);
	assign w_sys_tmp41 = (w_sys_tmp42 + r_run_k_4);
	assign w_sys_tmp42 = (r_run_copy8_j_22 * w_sys_tmp20);
	assign w_sys_tmp44 = (w_sys_tmp45 + w_sys_intOne);
	assign w_sys_tmp45 = (w_sys_tmp46 + r_run_k_4);
	assign w_sys_tmp46 = (r_run_copy7_j_21 * w_sys_tmp20);
	assign w_sys_tmp49 = (w_sys_tmp50 - w_sys_intOne);
	assign w_sys_tmp50 = (w_sys_tmp51 + r_run_k_4);
	assign w_sys_tmp51 = (r_run_copy6_j_20 * w_sys_tmp20);
	assign w_sys_tmp54 = w_ip_AddFloat_result_2;
	assign w_sys_tmp55 = (w_sys_tmp56 + r_run_k_4);
	assign w_sys_tmp56 = (w_sys_tmp57 * w_sys_tmp20);
	assign w_sys_tmp57 = (r_run_copy5_j_19 + w_sys_intOne);
	assign w_sys_tmp60 = 32'h40000000;
	assign w_sys_tmp62 = (w_sys_tmp63 + r_run_k_4);
	assign w_sys_tmp63 = (r_run_copy4_j_18 * w_sys_tmp20);
	assign w_sys_tmp65 = (w_sys_tmp66 + r_run_k_4);
	assign w_sys_tmp66 = (w_sys_tmp67 * w_sys_tmp20);
	assign w_sys_tmp67 = (r_run_copy3_j_17 - w_sys_intOne);
	assign w_sys_tmp69 = w_ip_AddFloat_result_6;
	assign w_sys_tmp70 = w_ip_AddFloat_result_4;
	assign w_sys_tmp71 = (w_sys_tmp72 + w_sys_intOne);
	assign w_sys_tmp72 = (w_sys_tmp73 + r_run_k_4);
	assign w_sys_tmp73 = (r_run_copy2_j_16 * w_sys_tmp20);
	assign w_sys_tmp78 = (w_sys_tmp79 + r_run_k_4);
	assign w_sys_tmp79 = (r_run_copy1_j_15 * w_sys_tmp20);
	assign w_sys_tmp81 = (w_sys_tmp82 - w_sys_intOne);
	assign w_sys_tmp82 = (w_sys_tmp83 + r_run_k_4);
	assign w_sys_tmp83 = (r_run_copy0_j_14 * w_sys_tmp20);
	assign w_sys_tmp85 = (r_run_copy0_j_14 + w_sys_intOne);
	assign w_sys_tmp86 = (r_run_copy1_j_15 + w_sys_intOne);
	assign w_sys_tmp87 = (r_run_copy2_j_16 + w_sys_intOne);
	assign w_sys_tmp88 = (r_run_copy3_j_17 + w_sys_intOne);
	assign w_sys_tmp89 = (r_run_copy4_j_18 + w_sys_intOne);
	assign w_sys_tmp91 = (r_run_copy6_j_20 + w_sys_intOne);
	assign w_sys_tmp92 = (r_run_copy7_j_21 + w_sys_intOne);
	assign w_sys_tmp93 = (r_run_copy8_j_22 + w_sys_intOne);
	assign w_sys_tmp94 = (r_run_copy9_j_23 + w_sys_intOne);
	assign w_sys_tmp96 = (r_run_copy11_j_25 + w_sys_intOne);
	assign w_sys_tmp97 = (r_run_copy12_j_26 + w_sys_intOne);
	assign w_sys_tmp98 = (r_run_j_5 + w_sys_intOne);
	assign w_sys_tmp105 = w_ip_AddFloat_result_3;
	assign w_sys_tmp114 = w_ip_AddFloat_result_0;
	assign w_sys_tmp468 = w_ip_AddFloat_result_5;


	DualPortRAM #(.DWIDTH(32), .AWIDTH(10), .WORDS(1024) )
		dpram_T_0(
			.clk (clock),
			.ce_0 (w_fld_T_0_ce_0),
			.addr_0 (w_fld_T_0_addr_0),
			.datain_0 (w_fld_T_0_datain_0),
			.dataout_0 (w_fld_T_0_dataout_0),
			.r_w_0 (w_fld_T_0_r_w_0),
			.ce_1 (w_fld_T_0_ce_1),
			.addr_1 (r_fld_T_0_addr_1),
			.datain_1 (r_fld_T_0_datain_1),
			.dataout_1 (w_fld_T_0_dataout_1),
			.r_w_1 (r_fld_T_0_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(10), .WORDS(1024) )
		dpram_V_1(
			.clk (clock),
			.ce_0 (w_fld_V_1_ce_0),
			.addr_0 (w_fld_V_1_addr_0),
			.datain_0 (w_fld_V_1_datain_0),
			.dataout_0 (w_fld_V_1_dataout_0),
			.r_w_0 (w_fld_V_1_r_w_0),
			.ce_1 (w_fld_V_1_ce_1),
			.addr_1 (r_fld_V_1_addr_1),
			.datain_1 (r_fld_V_1_datain_1),
			.dataout_1 (w_fld_V_1_dataout_1),
			.r_w_1 (r_fld_V_1_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(10), .WORDS(1024) )
		dpram_U_2(
			.clk (clock),
			.ce_0 (w_fld_U_2_ce_0),
			.addr_0 (w_fld_U_2_addr_0),
			.datain_0 (w_fld_U_2_datain_0),
			.dataout_0 (w_fld_U_2_dataout_0),
			.r_w_0 (w_fld_U_2_r_w_0),
			.ce_1 (w_fld_U_2_ce_1),
			.addr_1 (r_fld_U_2_addr_1),
			.datain_1 (r_fld_U_2_datain_1),
			.dataout_1 (w_fld_U_2_dataout_1),
			.r_w_1 (r_fld_U_2_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(10), .WORDS(1024) )
		dpram_result_3(
			.clk (clock),
			.ce_0 (w_fld_result_3_ce_0),
			.addr_0 (w_fld_result_3_addr_0),
			.datain_0 (w_fld_result_3_datain_0),
			.dataout_0 (w_fld_result_3_dataout_0),
			.r_w_0 (w_fld_result_3_r_w_0),
			.ce_1 (w_fld_result_3_ce_1),
			.addr_1 (r_fld_result_3_addr_1),
			.datain_1 (r_fld_result_3_datain_1),
			.dataout_1 (w_fld_result_3_dataout_1),
			.r_w_1 (r_fld_result_3_r_w_1)
		);

	AddFloat
		AddFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_0),
			.b (r_ip_AddFloat_portB_0),
			.result (w_ip_AddFloat_result_0)
		);

	AddFloat
		AddFloat_inst_1(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_1),
			.b (r_ip_AddFloat_portB_1),
			.result (w_ip_AddFloat_result_1)
		);

	AddFloat
		AddFloat_inst_2(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_2),
			.b (r_ip_AddFloat_portB_2),
			.result (w_ip_AddFloat_result_2)
		);

	AddFloat
		AddFloat_inst_3(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_3),
			.b (r_ip_AddFloat_portB_3),
			.result (w_ip_AddFloat_result_3)
		);

	AddFloat
		AddFloat_inst_4(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_4),
			.b (r_ip_AddFloat_portB_4),
			.result (w_ip_AddFloat_result_4)
		);

	AddFloat
		AddFloat_inst_5(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_5),
			.b (r_ip_AddFloat_portB_5),
			.result (w_ip_AddFloat_result_5)
		);

	AddFloat
		AddFloat_inst_6(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_6),
			.b (r_ip_AddFloat_portB_6),
			.result (w_ip_AddFloat_result_6)
		);

	AddFloat
		AddFloat_inst_7(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_7),
			.b (r_ip_AddFloat_portB_7),
			.result (w_ip_AddFloat_result_7)
		);

	AddFloat
		AddFloat_inst_8(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_8),
			.b (r_ip_AddFloat_portB_8),
			.result (w_ip_AddFloat_result_8)
		);

	AddFloat
		AddFloat_inst_9(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_9),
			.b (r_ip_AddFloat_portB_9),
			.result (w_ip_AddFloat_result_9)
		);

	MultFloat
		MultFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_MultFloat_multiplicand_0),
			.b (r_ip_MultFloat_multiplier_0),
			.result (w_ip_MultFloat_product_0)
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h25) || (r_sys_run_step==7'h3b)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp12_float;

									end
									else
									if((r_sys_run_step==7'hf)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp7_float;

									end
									else
									if((r_sys_run_step==7'h4) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h30)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp13_float;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h1a)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

									end
									else
									if((r_sys_run_step==7'h25)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

									end
									else
									if((r_sys_run_step==7'h30)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

									end
									else
									if((r_sys_run_step==7'hf)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

									end
									else
									if((r_sys_run_step==7'h4)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

									end
									else
									if((r_sys_run_step==7'h3b)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h11) || (r_sys_run_step==7'h27) || (r_sys_run_step==7'h3d)) begin
										r_ip_AddFloat_portA_1 <= r_sys_tmp12_float;

									end
									else
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h32)) begin
										r_ip_AddFloat_portA_1 <= r_sys_tmp13_float;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h3d)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

									end
									else
									if((r_sys_run_step==7'h11)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

									end
									else
									if((r_sys_run_step==7'h1c)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

									end
									else
									if((r_sys_run_step==7'h27)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

									end
									else
									if((r_sys_run_step==7'h32)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

									end
									else
									if((r_sys_run_step==7'h6)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp35[31], w_sys_tmp35[30:0] };

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h18) || (r_sys_run_step==7'h2e) || (r_sys_run_step==7'h44)) begin
										r_ip_AddFloat_portA_2 <= r_sys_tmp12_float;

									end
									else
									if((r_sys_run_step==7'hd) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h39)) begin
										r_ip_AddFloat_portA_2 <= r_sys_tmp13_float;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h2e)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'hd)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h39)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h23)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h44)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h18)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'hf) || (r_sys_run_step==7'h24) || (r_sys_run_step==7'h3a)) begin
										r_ip_AddFloat_portA_3 <= r_sys_tmp12_float;

									end
									else
									if((r_sys_run_step==7'h19) || (r_sys_run_step==7'h2f) || (r_sys_run_step==7'h45)) begin
										r_ip_AddFloat_portA_3 <= r_sys_tmp13_float;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h24)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'hf)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h19)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h3a)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h2f)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h45)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h10) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h26) || (r_sys_run_step==7'h31) || (r_sys_run_step==7'h3c) || (r_sys_run_step==7'h47)) begin
										r_ip_AddFloat_portA_4 <= r_sys_tmp8_float;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h3c)) begin
										r_ip_AddFloat_portB_4 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h26)) begin
										r_ip_AddFloat_portB_4 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h10)) begin
										r_ip_AddFloat_portB_4 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h47)) begin
										r_ip_AddFloat_portB_4 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h31)) begin
										r_ip_AddFloat_portB_4 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h1b)) begin
										r_ip_AddFloat_portB_4 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h12) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h28) || (r_sys_run_step==7'h33) || (r_sys_run_step==7'h3e) || (r_sys_run_step==7'h49)) begin
										r_ip_AddFloat_portA_5 <= w_sys_tmp54;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h12) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h28) || (r_sys_run_step==7'h33) || (r_sys_run_step==7'h3e) || (r_sys_run_step==7'h49)) begin
										r_ip_AddFloat_portB_5 <= r_sys_tmp9_float;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h15) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h41) || (r_sys_run_step==7'h4c)) begin
										r_ip_AddFloat_portA_6 <= w_sys_tmp70;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h15) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h41) || (r_sys_run_step==7'h4c)) begin
										r_ip_AddFloat_portB_6 <= r_sys_tmp10_float;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h16)) begin
										r_ip_AddFloat_portA_7 <= r_sys_tmp14_float;

									end
									else
									if((r_sys_run_step==7'h1e) || (r_sys_run_step==7'h29) || (r_sys_run_step==7'h34) || (r_sys_run_step==7'h3f) || (r_sys_run_step==7'h4a)) begin
										r_ip_AddFloat_portA_7 <= w_sys_tmp105;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h1e)) begin
										r_ip_AddFloat_portB_7 <= { ~r_sys_tmp4_float[31], r_sys_tmp4_float[30:0] };

									end
									else
									if((r_sys_run_step==7'h3f)) begin
										r_ip_AddFloat_portB_7 <= { ~r_sys_tmp11_float[31], r_sys_tmp11_float[30:0] };

									end
									else
									if((r_sys_run_step==7'h16)) begin
										r_ip_AddFloat_portB_7 <= { ~w_sys_tmp26[31], w_sys_tmp26[30:0] };

									end
									else
									if((r_sys_run_step==7'h34)) begin
										r_ip_AddFloat_portB_7 <= { ~r_sys_tmp11_float[31], r_sys_tmp11_float[30:0] };

									end
									else
									if((r_sys_run_step==7'h4a)) begin
										r_ip_AddFloat_portB_7 <= { ~r_sys_tmp11_float[31], r_sys_tmp11_float[30:0] };

									end
									else
									if((r_sys_run_step==7'h29)) begin
										r_ip_AddFloat_portB_7 <= { ~r_sys_tmp5_float[31], r_sys_tmp5_float[30:0] };

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h1d) || (r_sys_run_step==7'h33) || (r_sys_run_step==7'h3e) || (r_sys_run_step==7'h49) || (r_sys_run_step==7'h53)) begin
										r_ip_AddFloat_portA_8 <= r_sys_tmp14_float;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h1d) || (r_sys_run_step==7'h33) || (r_sys_run_step==7'h3e) || (r_sys_run_step==7'h49) || (r_sys_run_step==7'h53)) begin
										r_ip_AddFloat_portB_8 <= w_sys_tmp26;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h2d)) begin
										r_ip_AddFloat_portA_9 <= w_sys_tmp21;

									end
									else
									if((r_sys_run_step==7'h22) || (r_sys_run_step==7'h38) || (r_sys_run_step==7'h43) || (r_sys_run_step==7'h4e) || (r_sys_run_step==7'h58)) begin
										r_ip_AddFloat_portA_9 <= w_sys_tmp22;

									end
									else
									if((r_sys_run_step==7'h28)) begin
										r_ip_AddFloat_portA_9 <= r_sys_tmp14_float;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h2d) || (r_sys_run_step==7'h38) || (r_sys_run_step==7'h43) || (r_sys_run_step==7'h4e) || (r_sys_run_step==7'h58)) begin
										r_ip_AddFloat_portB_9 <= r_sys_tmp11_float;

									end
									else
									if((r_sys_run_step==7'h22)) begin
										r_ip_AddFloat_portB_9 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_run_step==7'h28)) begin
										r_ip_AddFloat_portB_9 <= w_sys_tmp26;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h7) || (7'hc<=r_sys_run_step && r_sys_run_step<=7'h10)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r2_10;

									end
									else
									if((r_sys_run_step==7'h8) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h29) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h34) || (r_sys_run_step==7'h37) || (r_sys_run_step==7'h3f) || (r_sys_run_step==7'h42)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp60;

									end
									else
									if((r_sys_run_step==7'ha) || (r_sys_run_step==7'h2a)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp11_float;

									end
									else
									if((r_sys_run_step==7'h2d)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp7_float;

									end
									else
									if((r_sys_run_step==7'h14) || (r_sys_run_step==7'h38)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_run_step==7'h22)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp2_float;

									end
									else
									if((r_sys_run_step==7'h40)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_run_step==7'h1f)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_run_step==7'h11) || (r_sys_run_step==7'h17)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_run_step==7'h35)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp0_float;

									end
									else
									if((7'h2<=r_sys_run_step && r_sys_run_step<=7'h6) || (r_sys_run_step==7'h9)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r1_9;

									end
									else
									if((r_sys_run_step==7'h1a) || (r_sys_run_step==7'h25) || (r_sys_run_step==7'h30) || (r_sys_run_step==7'h3b) || (r_sys_run_step==7'h46) || (r_sys_run_step==7'h51)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r4_12;

									end
									else
									if((r_sys_run_step==7'h43)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp6_float;

									end
									else
									if((r_sys_run_step==7'h18) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2e) || (r_sys_run_step==7'h39) || (r_sys_run_step==7'h44) || (r_sys_run_step==7'h4e)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r3_11;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'he)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp7_float;

									end
									else
									if((r_sys_run_step==7'hc)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp10_float;

									end
									else
									if((r_sys_run_step==7'h8) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h29) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h34) || (r_sys_run_step==7'h37) || (r_sys_run_step==7'h3f) || (r_sys_run_step==7'h42)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp35;

									end
									else
									if((r_sys_run_step==7'h14) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h2a) || (r_sys_run_step==7'h35) || (r_sys_run_step==7'h40)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp114;

									end
									else
									if((r_sys_run_step==7'h1a) || (r_sys_run_step==7'h25) || (r_sys_run_step==7'h30) || (r_sys_run_step==7'h3b) || (r_sys_run_step==7'h46) || (r_sys_run_step==7'h51)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp69;

									end
									else
									if((r_sys_run_step==7'hf)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp2_float;

									end
									else
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h17) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h2e) || (r_sys_run_step==7'h38) || (r_sys_run_step==7'h39) || (r_sys_run_step==7'h43) || (r_sys_run_step==7'h44)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp14_float;

									end
									else
									if((r_sys_run_step==7'h4e)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp468;

									end
									else
									if((r_sys_run_step==7'hd)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_run_step==7'h7) || (r_sys_run_step==7'h10)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp6_float;

									end
									else
									if((7'h2<=r_sys_run_step && r_sys_run_step<=7'h6)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp27;

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
			r_sys_processing_methodID <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_processing_methodID <= ((i_run_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_run_phase) 
						4'hf: begin
							r_sys_processing_methodID <= r_sys_run_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_run_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_run_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_run_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'h0: begin
							r_sys_run_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp8) ? 4'h9 : 4'hf);

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 4'ha;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp13) ? 4'hd : 4'h6);

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h5d)) begin
										r_sys_run_phase <= 4'ha;

									end
								end

							endcase
						end

						4'hf: begin
							r_sys_run_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_run_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= w_sys_run_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h5d)) begin
										r_sys_run_stage <= 2'h0;

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
			r_sys_run_step <= 7'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h5d)) begin
										r_sys_run_step <= 7'h0;

									end
									else
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h5c)) begin
										r_sys_run_step <= w_sys_run_step_p1;

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
			r_sys_run_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_run_busy <= ((i_run_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_run_phase) 
						4'h0: begin
							r_sys_run_busy <= w_sys_boolTrue;
						end

						4'hf: begin
							r_sys_run_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_T_0_addr_1 <= 10'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h37)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp23[9:0] );

									end
									else
									if((r_sys_run_step==7'h2) || (r_sys_run_step==7'hd) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2e) || (r_sys_run_step==7'h39)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp36[9:0] );

									end
									else
									if((r_sys_run_step==7'h1) || (r_sys_run_step==7'hc) || (r_sys_run_step==7'h17) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h38)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp31[9:0] );

									end
									else
									if((r_sys_run_step==7'h7) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h28) || (r_sys_run_step==7'h33) || (r_sys_run_step==7'h3e)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp65[9:0] );

									end
									else
									if((r_sys_run_step==7'ha) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h41)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp81[9:0] );

									end
									else
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h2a) || (r_sys_run_step==7'h35) || (r_sys_run_step==7'h40)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp78[9:0] );

									end
									else
									if((r_sys_run_step==7'h4) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h25) || (r_sys_run_step==7'h30) || (r_sys_run_step==7'h3b)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp49[9:0] );

									end
									else
									if((r_sys_run_step==7'h3) || (r_sys_run_step==7'he) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h24) || (r_sys_run_step==7'h2f) || (r_sys_run_step==7'h3a)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp44[9:0] );

									end
									else
									if((r_sys_run_step==7'h8) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h29) || (r_sys_run_step==7'h34) || (r_sys_run_step==7'h3f)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp71[9:0] );

									end
									else
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h27) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h3d)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp62[9:0] );

									end
									else
									if((r_sys_run_step==7'h5) || (r_sys_run_step==7'h10) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h26) || (r_sys_run_step==7'h31) || (r_sys_run_step==7'h3c)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp55[9:0] );

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
			r_fld_T_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h41)) begin
										r_fld_T_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hf: begin
							r_fld_T_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_V_1_addr_1 <= 10'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h5)) begin
										r_fld_V_1_addr_1 <= $signed( w_sys_tmp41[9:0] );

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
			r_fld_V_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h5)) begin
										r_fld_V_1_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hf: begin
							r_fld_V_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_U_2_addr_1 <= 10'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h5)) begin
										r_fld_U_2_addr_1 <= $signed( w_sys_tmp28[9:0] );

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
			r_fld_U_2_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h5)) begin
										r_fld_U_2_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hf: begin
							r_fld_U_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_result_3_addr_1 <= 10'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h27) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h3d) || (r_sys_run_step==7'h48) || (r_sys_run_step==7'h53) || (r_sys_run_step==7'h5d)) begin
										r_fld_result_3_addr_1 <= $signed( w_sys_tmp18[9:0] );

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h27) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h3d) || (r_sys_run_step==7'h48) || (r_sys_run_step==7'h53) || (r_sys_run_step==7'h5d)) begin
										r_fld_result_3_datain_1 <= w_sys_tmp21;

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
			r_fld_result_3_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h27) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h3d) || (r_sys_run_step==7'h48) || (r_sys_run_step==7'h53) || (r_sys_run_step==7'h5d)) begin
										r_fld_result_3_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'hf: begin
							r_fld_result_3_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_k_4 <= w_sys_tmp7;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_k_4 <= w_sys_tmp11;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_j_5 <= w_sys_tmp12;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h27) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h3d) || (r_sys_run_step==7'h48) || (r_sys_run_step==7'h53) || (r_sys_run_step==7'h5d)) begin
										r_run_j_5 <= w_sys_tmp98;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_dx_7 <= w_sys_tmp1;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_dy_8 <= w_sys_tmp2;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_r1_9 <= w_sys_tmp3;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_r2_10 <= w_sys_tmp4;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_r3_11 <= w_sys_tmp5;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_r4_12 <= w_sys_tmp6;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy0_j_14 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'ha) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h41)) begin
										r_run_copy0_j_14 <= w_sys_tmp85;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy1_j_15 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h2a) || (r_sys_run_step==7'h35) || (r_sys_run_step==7'h40)) begin
										r_run_copy1_j_15 <= w_sys_tmp86;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy2_j_16 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h8) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h29) || (r_sys_run_step==7'h34) || (r_sys_run_step==7'h3f)) begin
										r_run_copy2_j_16 <= w_sys_tmp87;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy3_j_17 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h7) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h28) || (r_sys_run_step==7'h33) || (r_sys_run_step==7'h3e)) begin
										r_run_copy3_j_17 <= w_sys_tmp88;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy4_j_18 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h27) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h3d)) begin
										r_run_copy4_j_18 <= w_sys_tmp89;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy5_j_19 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h5) || (r_sys_run_step==7'h10) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h26) || (r_sys_run_step==7'h31) || (r_sys_run_step==7'h3c)) begin
										r_run_copy5_j_19 <= w_sys_tmp57;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy6_j_20 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h4) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h25) || (r_sys_run_step==7'h30) || (r_sys_run_step==7'h3b)) begin
										r_run_copy6_j_20 <= w_sys_tmp91;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy7_j_21 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h3) || (r_sys_run_step==7'he) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h24) || (r_sys_run_step==7'h2f) || (r_sys_run_step==7'h3a)) begin
										r_run_copy7_j_21 <= w_sys_tmp92;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy8_j_22 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h5)) begin
										r_run_copy8_j_22 <= w_sys_tmp93;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy9_j_23 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h2) || (r_sys_run_step==7'hd) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2e) || (r_sys_run_step==7'h39)) begin
										r_run_copy9_j_23 <= w_sys_tmp94;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy10_j_24 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h1) || (r_sys_run_step==7'hc) || (r_sys_run_step==7'h17) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h38)) begin
										r_run_copy10_j_24 <= w_sys_tmp33;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy11_j_25 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h5)) begin
										r_run_copy11_j_25 <= w_sys_tmp96;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy12_j_26 <= r_run_j_5;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h37)) begin
										r_run_copy12_j_26 <= w_sys_tmp97;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'hb)) begin
										r_sys_tmp0_float <= w_ip_MultFloat_product_0;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h8) || (r_sys_run_step==7'h14)) begin
										r_sys_tmp1_float <= w_ip_MultFloat_product_0;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h6)) begin
										r_sys_tmp2_float <= w_fld_V_1_dataout_1;

									end
									else
									if((r_sys_run_step==7'h12)) begin
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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h4)) begin
										r_sys_tmp3_float <= w_fld_V_1_dataout_1;

									end
									else
									if((r_sys_run_step==7'he)) begin
										r_sys_tmp3_float <= w_ip_MultFloat_product_0;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'hc) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h1c)) begin
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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h27)) begin
										r_sys_tmp5_float <= w_ip_MultFloat_product_0;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h2) || (r_sys_run_step==7'h7)) begin
										r_sys_tmp6_float <= w_fld_V_1_dataout_1;

									end
									else
									if((r_sys_run_step==7'h15)) begin
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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h5)) begin
										r_sys_tmp7_float <= w_fld_V_1_dataout_1;

									end
									else
									if((r_sys_run_step==7'h13)) begin
										r_sys_tmp7_float <= w_ip_MultFloat_product_0;

									end
									else
									if((r_sys_run_step==7'he)) begin
										r_sys_tmp7_float <= w_fld_T_0_dataout_1;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'ha) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h41)) begin
										r_sys_tmp8_float <= w_fld_T_0_dataout_1;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h2a) || (r_sys_run_step==7'h35) || (r_sys_run_step==7'h40)) begin
										r_sys_tmp9_float <= w_fld_T_0_dataout_1;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h3)) begin
										r_sys_tmp10_float <= w_fld_V_1_dataout_1;

									end
									else
									if((r_sys_run_step==7'hc) || (r_sys_run_step==7'h17) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h38) || (r_sys_run_step==7'h43)) begin
										r_sys_tmp10_float <= w_fld_T_0_dataout_1;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h7) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'h2a) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h35) || (r_sys_run_step==7'h3d) || (r_sys_run_step==7'h40) || (r_sys_run_step==7'h48) || (r_sys_run_step==7'h4b) || (r_sys_run_step==7'h56)) begin
										r_sys_tmp11_float <= w_ip_MultFloat_product_0;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h2) || (r_sys_run_step==7'h10) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h24) || (r_sys_run_step==7'h26) || (r_sys_run_step==7'h28) || (r_sys_run_step==7'h2e) || (r_sys_run_step==7'h3a) || (r_sys_run_step==7'h3c) || (r_sys_run_step==7'h3e)) begin
										r_sys_tmp12_float <= w_fld_T_0_dataout_1;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h3) || (r_sys_run_step==7'h5) || (r_sys_run_step==7'h7) || (r_sys_run_step==7'hd) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2f) || (r_sys_run_step==7'h31) || (r_sys_run_step==7'h33) || (r_sys_run_step==7'h39)) begin
										r_sys_tmp13_float <= w_fld_T_0_dataout_1;

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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'hb) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h37) || (r_sys_run_step==7'h42)) begin
										r_sys_tmp14_float <= w_ip_AddFloat_result_1;

									end
									else
									if((r_sys_run_step==7'h7)) begin
										r_sys_tmp14_float <= w_fld_U_2_dataout_1;

									end
									else
									if((r_sys_run_step==7'h17) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h38) || (r_sys_run_step==7'h43)) begin
										r_sys_tmp14_float <= w_ip_AddFloat_result_5;

									end
									else
									if((r_sys_run_step==7'h9)) begin
										r_sys_tmp14_float <= w_ip_AddFloat_result_0;

									end
									else
									if((r_sys_run_step==7'h1b) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2e) || (r_sys_run_step==7'h39) || (r_sys_run_step==7'h44) || (r_sys_run_step==7'h4f)) begin
										r_sys_tmp14_float <= w_ip_AddFloat_result_7;

									end
									else
									if((r_sys_run_step==7'h14)) begin
										r_sys_tmp14_float <= w_ip_AddFloat_result_3;

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
