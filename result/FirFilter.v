/*
TimeStamp:	2013/12/16		12:59
*/


module FirFilter(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_firFilter_req,	
	output                o_firFilter_busy,	
	input  signed  [10:0] i_fld_dataRe0_0_addr_0,	
	input          [63:0] i_fld_dataRe0_0_datain_0,	
	output         [63:0] o_fld_dataRe0_0_dataout_0,	
	input                 i_fld_dataRe0_0_r_w_0,	
	input  signed  [10:0] i_fld_dataReFiltered0_1_addr_0,	
	input          [63:0] i_fld_dataReFiltered0_1_datain_0,	
	output         [63:0] o_fld_dataReFiltered0_1_dataout_0,	
	input                 i_fld_dataReFiltered0_1_r_w_0,	
	input          [63:0] i_fld_ff0_3,	
	input          [63:0] i_fld_ff1_4,	
	input          [63:0] i_fld_ff2_5,	
	input          [63:0] i_fld_ff3_6,	
	input          [63:0] i_fld_ff4_7,	
	input          [63:0] i_fld_ff5_8,	
	input          [63:0] i_fld_ff6_9,	
	input          [63:0] i_fld_ff7_10,	
	input          [63:0] i_fld_ff8_11,	
	input          [63:0] i_fld_ff9_12,	
	input          [63:0] i_fld_ff10_13,	
	input          [63:0] i_fld_ff11_14,	
	input          [63:0] i_fld_ff12_15,	
	input          [63:0] i_fld_ff13_16,	
	input          [63:0] i_fld_ff14_17,	
	input          [63:0] i_fld_ff15_18,	
	input          [63:0] i_fld_ff16_19,	
	input          [63:0] i_fld_ff17_20,	
	input          [63:0] i_fld_ff18_21,	
	input          [63:0] i_fld_ff19_22,	
	input          [63:0] i_fld_ff20_23,	
	input          [63:0] i_fld_ff21_24,	
	input          [63:0] i_fld_ff22_25,	
	input          [63:0] i_fld_ff23_26,	
	input          [63:0] i_fld_ff24_27,	
	input          [63:0] i_fld_ff25_28,	
	input          [63:0] i_fld_ff26_29,	
	input          [63:0] i_fld_ff27_30,	
	input          [63:0] i_fld_ff28_31,	
	input          [63:0] i_fld_ff29_32,	
	input          [63:0] i_fld_ff30_33,	
	input          [63:0] i_fld_ff31_34,	
	input          [63:0] i_fld_ff32_35,	
	input          [63:0] i_fld_ff33_36,	
	input          [63:0] i_fld_ff34_37,	
	input          [63:0] i_fld_ff35_38,	
	input          [63:0] i_fld_ff36_39,	
	input          [63:0] i_fld_ff37_40,	
	input          [63:0] i_fld_ff38_41,	
	input          [63:0] i_fld_ff39_42,	
	input          [63:0] i_fld_ff40_43,	
	input          [63:0] i_fld_ff41_44,	
	input          [63:0] i_fld_ff42_45,	
	input          [63:0] i_fld_ff43_46,	
	input          [63:0] i_fld_ff44_47,	
	input          [63:0] i_fld_ff45_48,	
	input          [63:0] i_fld_ff46_49,	
	input          [63:0] i_fld_ff47_50,	
	input          [63:0] i_fld_ff48_51,	
	input          [63:0] i_fld_ff49_52,	
	input          [63:0] i_fld_ff50_53,	
	input          [63:0] i_fld_ff51_54,	
	input          [63:0] i_fld_ff52_55	
);

	reg         [63:0] r_ip_AddFloat_portA_0;
	reg         [63:0] r_ip_AddFloat_portB_0;
	wire        [63:0] w_ip_AddFloat_result_0;
	reg         [63:0] r_ip_MultFloat_multiplicand_0;
	reg         [63:0] r_ip_MultFloat_multiplier_0;
	wire        [63:0] w_ip_MultFloat_product_0;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 1:0] r_sys_firFilter_caller;
	reg                r_sys_firFilter_req;
	reg         [ 3:0] r_sys_firFilter_phase;
	reg         [ 1:0] r_sys_firFilter_stage;
	reg         [ 7:0] r_sys_firFilter_step;
	reg                r_sys_firFilter_busy;
	wire        [ 1:0] w_sys_firFilter_stage_p1;
	wire        [ 7:0] w_sys_firFilter_step_p1;
	wire signed [10:0] w_fld_dataRe0_0_addr_0;
	wire        [63:0] w_fld_dataRe0_0_datain_0;
	wire        [63:0] w_fld_dataRe0_0_dataout_0;
	wire               w_fld_dataRe0_0_r_w_0;
	wire               w_fld_dataRe0_0_ce_0;
	reg  signed [10:0] r_fld_dataRe0_0_addr_1;
	reg         [63:0] r_fld_dataRe0_0_datain_1;
	wire        [63:0] w_fld_dataRe0_0_dataout_1;
	reg                r_fld_dataRe0_0_r_w_1;
	wire               w_fld_dataRe0_0_ce_1;
	wire signed [10:0] w_fld_dataReFiltered0_1_addr_0;
	wire        [63:0] w_fld_dataReFiltered0_1_datain_0;
	wire        [63:0] w_fld_dataReFiltered0_1_dataout_0;
	wire               w_fld_dataReFiltered0_1_r_w_0;
	wire               w_fld_dataReFiltered0_1_ce_0;
	reg  signed [10:0] r_fld_dataReFiltered0_1_addr_1;
	reg         [63:0] r_fld_dataReFiltered0_1_datain_1;
	wire        [63:0] w_fld_dataReFiltered0_1_dataout_1;
	reg                r_fld_dataReFiltered0_1_r_w_1;
	wire               w_fld_dataReFiltered0_1_ce_1;
	reg  signed [15:0] r_fld_filterFactorNum_2;
	reg  signed [15:0] r_firFilter_n_56;
	reg         [63:0] r_sys_tmp0_float;
	reg         [63:0] r_sys_tmp1_float;
	reg         [63:0] r_sys_tmp2_float;
	reg         [63:0] r_sys_tmp3_float;
	reg         [63:0] r_sys_tmp4_float;
	reg         [63:0] r_sys_tmp5_float;
	reg         [63:0] r_sys_tmp6_float;
	reg         [63:0] r_sys_tmp7_float;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp3;
	wire signed [31:0] w_sys_tmp4;
	wire        [63:0] w_sys_tmp6;
	wire        [63:0] w_sys_tmp7;
	wire        [63:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp13;
	wire signed [31:0] w_sys_tmp14;
	wire signed [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire signed [31:0] w_sys_tmp20;
	wire signed [31:0] w_sys_tmp21;
	wire signed [31:0] w_sys_tmp24;
	wire signed [31:0] w_sys_tmp25;
	wire signed [31:0] w_sys_tmp28;
	wire signed [31:0] w_sys_tmp29;
	wire signed [31:0] w_sys_tmp32;
	wire signed [31:0] w_sys_tmp33;
	wire signed [31:0] w_sys_tmp35;
	wire signed [31:0] w_sys_tmp36;
	wire signed [31:0] w_sys_tmp39;
	wire signed [31:0] w_sys_tmp40;
	wire signed [31:0] w_sys_tmp43;
	wire signed [31:0] w_sys_tmp44;
	wire signed [31:0] w_sys_tmp47;
	wire signed [31:0] w_sys_tmp48;
	wire signed [31:0] w_sys_tmp50;
	wire signed [31:0] w_sys_tmp51;
	wire signed [31:0] w_sys_tmp54;
	wire signed [31:0] w_sys_tmp55;
	wire signed [31:0] w_sys_tmp58;
	wire signed [31:0] w_sys_tmp59;
	wire signed [31:0] w_sys_tmp62;
	wire signed [31:0] w_sys_tmp63;
	wire signed [31:0] w_sys_tmp66;
	wire signed [31:0] w_sys_tmp67;
	wire signed [31:0] w_sys_tmp70;
	wire signed [31:0] w_sys_tmp71;
	wire signed [31:0] w_sys_tmp74;
	wire signed [31:0] w_sys_tmp75;
	wire signed [31:0] w_sys_tmp78;
	wire signed [31:0] w_sys_tmp79;
	wire signed [31:0] w_sys_tmp81;
	wire signed [31:0] w_sys_tmp82;
	wire signed [31:0] w_sys_tmp85;
	wire signed [31:0] w_sys_tmp86;
	wire signed [31:0] w_sys_tmp89;
	wire signed [31:0] w_sys_tmp90;
	wire signed [31:0] w_sys_tmp93;
	wire signed [31:0] w_sys_tmp94;
	wire signed [31:0] w_sys_tmp96;
	wire signed [31:0] w_sys_tmp97;
	wire signed [31:0] w_sys_tmp100;
	wire signed [31:0] w_sys_tmp101;
	wire signed [31:0] w_sys_tmp104;
	wire signed [31:0] w_sys_tmp105;
	wire signed [31:0] w_sys_tmp108;
	wire signed [31:0] w_sys_tmp109;
	wire signed [31:0] w_sys_tmp111;
	wire signed [31:0] w_sys_tmp112;
	wire signed [31:0] w_sys_tmp115;
	wire signed [31:0] w_sys_tmp116;
	wire signed [31:0] w_sys_tmp119;
	wire signed [31:0] w_sys_tmp120;
	wire signed [31:0] w_sys_tmp123;
	wire signed [31:0] w_sys_tmp124;
	wire signed [31:0] w_sys_tmp126;
	wire signed [31:0] w_sys_tmp127;
	wire signed [31:0] w_sys_tmp130;
	wire signed [31:0] w_sys_tmp131;
	wire signed [31:0] w_sys_tmp134;
	wire signed [31:0] w_sys_tmp135;
	wire signed [31:0] w_sys_tmp138;
	wire signed [31:0] w_sys_tmp139;
	wire signed [31:0] w_sys_tmp141;
	wire signed [31:0] w_sys_tmp142;
	wire signed [31:0] w_sys_tmp145;
	wire signed [31:0] w_sys_tmp146;
	wire signed [31:0] w_sys_tmp149;
	wire signed [31:0] w_sys_tmp150;
	wire signed [31:0] w_sys_tmp153;
	wire signed [31:0] w_sys_tmp154;
	wire signed [31:0] w_sys_tmp156;
	wire signed [31:0] w_sys_tmp157;
	wire signed [31:0] w_sys_tmp160;
	wire signed [31:0] w_sys_tmp161;
	wire signed [31:0] w_sys_tmp164;
	wire signed [31:0] w_sys_tmp165;
	wire signed [31:0] w_sys_tmp168;
	wire signed [31:0] w_sys_tmp169;
	wire signed [31:0] w_sys_tmp171;
	wire signed [31:0] w_sys_tmp172;
	wire signed [31:0] w_sys_tmp175;
	wire signed [31:0] w_sys_tmp176;
	wire signed [31:0] w_sys_tmp179;
	wire signed [31:0] w_sys_tmp180;
	wire signed [31:0] w_sys_tmp183;
	wire signed [31:0] w_sys_tmp184;
	wire signed [31:0] w_sys_tmp186;
	wire signed [31:0] w_sys_tmp187;
	wire signed [31:0] w_sys_tmp190;
	wire signed [31:0] w_sys_tmp191;
	wire signed [31:0] w_sys_tmp193;
	wire signed [31:0] w_sys_tmp194;
	wire signed [31:0] w_sys_tmp197;
	wire signed [31:0] w_sys_tmp198;
	wire signed [31:0] w_sys_tmp200;
	wire signed [31:0] w_sys_tmp201;
	wire signed [31:0] w_sys_tmp203;
	wire signed [31:0] w_sys_tmp209;
	wire signed [31:0] w_sys_tmp212;
	wire signed [31:0] w_sys_tmp213;
	wire signed [31:0] w_sys_tmp216;
	wire signed [31:0] w_sys_tmp217;
	wire signed [31:0] w_sys_tmp219;
	wire signed [31:0] w_sys_tmp220;
	wire signed [31:0] w_sys_tmp223;
	wire signed [31:0] w_sys_tmp224;
	wire signed [31:0] w_sys_tmp227;
	wire signed [31:0] w_sys_tmp228;
	wire signed [31:0] w_sys_tmp231;
	wire signed [31:0] w_sys_tmp232;
	wire signed [31:0] w_sys_tmp234;
	wire signed [31:0] w_sys_tmp235;
	wire signed [31:0] w_sys_tmp238;
	wire signed [31:0] w_sys_tmp239;
	wire signed [31:0] w_sys_tmp242;
	wire signed [31:0] w_sys_tmp243;
	wire signed [31:0] w_sys_tmp246;
	wire signed [31:0] w_sys_tmp247;
	wire signed [31:0] w_sys_tmp249;
	wire signed [31:0] w_sys_tmp250;
	wire signed [31:0] w_sys_tmp253;
	wire signed [31:0] w_sys_tmp254;
	wire signed [31:0] w_sys_tmp257;
	wire signed [31:0] w_sys_tmp258;
	wire signed [31:0] w_sys_tmp261;
	wire signed [31:0] w_sys_tmp262;
	wire signed [31:0] w_sys_tmp265;
	wire signed [31:0] w_sys_tmp266;
	wire signed [31:0] w_sys_tmp269;
	wire signed [31:0] w_sys_tmp270;
	wire signed [31:0] w_sys_tmp273;
	wire signed [31:0] w_sys_tmp274;
	wire signed [31:0] w_sys_tmp277;
	wire signed [31:0] w_sys_tmp278;
	wire signed [31:0] w_sys_tmp280;
	wire signed [31:0] w_sys_tmp281;
	wire signed [31:0] w_sys_tmp284;
	wire signed [31:0] w_sys_tmp285;
	wire signed [31:0] w_sys_tmp288;
	wire signed [31:0] w_sys_tmp289;
	wire signed [31:0] w_sys_tmp292;
	wire signed [31:0] w_sys_tmp293;
	wire signed [31:0] w_sys_tmp295;
	wire signed [31:0] w_sys_tmp296;
	wire signed [31:0] w_sys_tmp299;
	wire signed [31:0] w_sys_tmp300;
	wire signed [31:0] w_sys_tmp303;
	wire signed [31:0] w_sys_tmp304;
	wire signed [31:0] w_sys_tmp307;
	wire signed [31:0] w_sys_tmp308;
	wire signed [31:0] w_sys_tmp310;
	wire signed [31:0] w_sys_tmp311;
	wire signed [31:0] w_sys_tmp314;
	wire signed [31:0] w_sys_tmp315;
	wire signed [31:0] w_sys_tmp318;
	wire signed [31:0] w_sys_tmp319;
	wire signed [31:0] w_sys_tmp322;
	wire signed [31:0] w_sys_tmp323;
	wire signed [31:0] w_sys_tmp325;
	wire signed [31:0] w_sys_tmp326;
	wire signed [31:0] w_sys_tmp329;
	wire signed [31:0] w_sys_tmp330;
	wire signed [31:0] w_sys_tmp333;
	wire signed [31:0] w_sys_tmp334;
	wire signed [31:0] w_sys_tmp337;
	wire signed [31:0] w_sys_tmp338;
	wire signed [31:0] w_sys_tmp340;
	wire signed [31:0] w_sys_tmp341;
	wire signed [31:0] w_sys_tmp344;
	wire signed [31:0] w_sys_tmp345;
	wire signed [31:0] w_sys_tmp348;
	wire signed [31:0] w_sys_tmp349;
	wire signed [31:0] w_sys_tmp352;
	wire signed [31:0] w_sys_tmp353;
	wire signed [31:0] w_sys_tmp355;
	wire signed [31:0] w_sys_tmp356;
	wire signed [31:0] w_sys_tmp359;
	wire signed [31:0] w_sys_tmp360;
	wire signed [31:0] w_sys_tmp363;
	wire signed [31:0] w_sys_tmp364;
	wire signed [31:0] w_sys_tmp367;
	wire signed [31:0] w_sys_tmp368;
	wire signed [31:0] w_sys_tmp370;
	wire signed [31:0] w_sys_tmp371;
	wire signed [31:0] w_sys_tmp374;
	wire signed [31:0] w_sys_tmp375;
	wire signed [31:0] w_sys_tmp378;
	wire signed [31:0] w_sys_tmp379;
	wire signed [31:0] w_sys_tmp382;
	wire signed [31:0] w_sys_tmp383;
	wire signed [31:0] w_sys_tmp385;
	wire signed [31:0] w_sys_tmp386;
	wire signed [31:0] w_sys_tmp389;
	wire signed [31:0] w_sys_tmp390;
	wire signed [31:0] w_sys_tmp392;
	wire signed [31:0] w_sys_tmp393;
	wire signed [31:0] w_sys_tmp396;
	wire signed [31:0] w_sys_tmp397;
	wire signed [31:0] w_sys_tmp399;
	wire signed [31:0] w_sys_tmp400;
	wire signed [31:0] w_sys_tmp402;
	wire signed [31:0] w_sys_tmp602;
	wire signed [31:0] w_sys_tmp807;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_firFilter_busy = r_sys_firFilter_busy;
	assign w_sys_firFilter_stage_p1 = (r_sys_firFilter_stage + 2'h1);
	assign w_sys_firFilter_step_p1 = (r_sys_firFilter_step + 8'h1);
	assign o_fld_dataRe0_0_dataout_0 = w_fld_dataRe0_0_dataout_0;
	assign w_fld_dataRe0_0_addr_0 = i_fld_dataRe0_0_addr_0;
	assign w_fld_dataRe0_0_datain_0 = i_fld_dataRe0_0_datain_0;
	assign w_fld_dataRe0_0_r_w_0 = i_fld_dataRe0_0_r_w_0;
	assign w_fld_dataRe0_0_ce_0 = w_sys_ce;
	assign w_fld_dataRe0_0_ce_1 = w_sys_ce;
	assign o_fld_dataReFiltered0_1_dataout_0 = w_fld_dataReFiltered0_1_dataout_0;
	assign w_fld_dataReFiltered0_1_addr_0 = i_fld_dataReFiltered0_1_addr_0;
	assign w_fld_dataReFiltered0_1_datain_0 = i_fld_dataReFiltered0_1_datain_0;
	assign w_fld_dataReFiltered0_1_r_w_0 = i_fld_dataReFiltered0_1_r_w_0;
	assign w_fld_dataReFiltered0_1_ce_0 = w_sys_ce;
	assign w_fld_dataReFiltered0_1_ce_1 = w_sys_ce;
	assign w_sys_tmp1 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) < w_sys_tmp2);
	assign w_sys_tmp2 = 32'sh00000800;
	assign w_sys_tmp3 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp4);
	assign w_sys_tmp4 = 32'sh00000004;
	assign w_sys_tmp6 = w_ip_AddFloat_result_0;
	assign w_sys_tmp7 = w_fld_dataRe0_0_dataout_1;
	assign w_sys_tmp8 = w_ip_MultFloat_product_0;
	assign w_sys_tmp10 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_intOne);
	assign w_sys_tmp13 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp14);
	assign w_sys_tmp14 = 32'sh00000002;
	assign w_sys_tmp17 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp18);
	assign w_sys_tmp18 = 32'sh00000003;
	assign w_sys_tmp20 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp21);
	assign w_sys_tmp21 = 32'sh00000004;
	assign w_sys_tmp24 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp25);
	assign w_sys_tmp25 = 32'sh00000005;
	assign w_sys_tmp28 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp29);
	assign w_sys_tmp29 = 32'sh00000006;
	assign w_sys_tmp32 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp33);
	assign w_sys_tmp33 = 32'sh00000007;
	assign w_sys_tmp35 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp36);
	assign w_sys_tmp36 = 32'sh00000008;
	assign w_sys_tmp39 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp40);
	assign w_sys_tmp40 = 32'sh00000009;
	assign w_sys_tmp43 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp44);
	assign w_sys_tmp44 = 32'sh0000000a;
	assign w_sys_tmp47 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp48);
	assign w_sys_tmp48 = 32'sh0000000b;
	assign w_sys_tmp50 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp51);
	assign w_sys_tmp51 = 32'sh0000000c;
	assign w_sys_tmp54 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp55);
	assign w_sys_tmp55 = 32'sh0000000d;
	assign w_sys_tmp58 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp59);
	assign w_sys_tmp59 = 32'sh0000000e;
	assign w_sys_tmp62 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp63);
	assign w_sys_tmp63 = 32'sh0000000f;
	assign w_sys_tmp66 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp67);
	assign w_sys_tmp67 = 32'sh00000010;
	assign w_sys_tmp70 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp71);
	assign w_sys_tmp71 = 32'sh00000011;
	assign w_sys_tmp74 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp75);
	assign w_sys_tmp75 = 32'sh00000012;
	assign w_sys_tmp78 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp79);
	assign w_sys_tmp79 = 32'sh00000013;
	assign w_sys_tmp81 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp82);
	assign w_sys_tmp82 = 32'sh00000014;
	assign w_sys_tmp85 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp86);
	assign w_sys_tmp86 = 32'sh00000015;
	assign w_sys_tmp89 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp90);
	assign w_sys_tmp90 = 32'sh00000016;
	assign w_sys_tmp93 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp94);
	assign w_sys_tmp94 = 32'sh00000017;
	assign w_sys_tmp96 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp97);
	assign w_sys_tmp97 = 32'sh00000018;
	assign w_sys_tmp100 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp101);
	assign w_sys_tmp101 = 32'sh00000019;
	assign w_sys_tmp104 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp105);
	assign w_sys_tmp105 = 32'sh0000001a;
	assign w_sys_tmp108 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp109);
	assign w_sys_tmp109 = 32'sh0000001b;
	assign w_sys_tmp111 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp112);
	assign w_sys_tmp112 = 32'sh0000001c;
	assign w_sys_tmp115 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp116);
	assign w_sys_tmp116 = 32'sh0000001d;
	assign w_sys_tmp119 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp120);
	assign w_sys_tmp120 = 32'sh0000001e;
	assign w_sys_tmp123 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp124);
	assign w_sys_tmp124 = 32'sh0000001f;
	assign w_sys_tmp126 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp127);
	assign w_sys_tmp127 = 32'sh00000020;
	assign w_sys_tmp130 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp131);
	assign w_sys_tmp131 = 32'sh00000021;
	assign w_sys_tmp134 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp135);
	assign w_sys_tmp135 = 32'sh00000022;
	assign w_sys_tmp138 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp139);
	assign w_sys_tmp139 = 32'sh00000023;
	assign w_sys_tmp141 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp142);
	assign w_sys_tmp142 = 32'sh00000024;
	assign w_sys_tmp145 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp146);
	assign w_sys_tmp146 = 32'sh00000025;
	assign w_sys_tmp149 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp150);
	assign w_sys_tmp150 = 32'sh00000026;
	assign w_sys_tmp153 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp154);
	assign w_sys_tmp154 = 32'sh00000027;
	assign w_sys_tmp156 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp157);
	assign w_sys_tmp157 = 32'sh00000028;
	assign w_sys_tmp160 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp161);
	assign w_sys_tmp161 = 32'sh00000029;
	assign w_sys_tmp164 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp165);
	assign w_sys_tmp165 = 32'sh0000002a;
	assign w_sys_tmp168 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp169);
	assign w_sys_tmp169 = 32'sh0000002b;
	assign w_sys_tmp171 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp172);
	assign w_sys_tmp172 = 32'sh0000002c;
	assign w_sys_tmp175 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp176);
	assign w_sys_tmp176 = 32'sh0000002d;
	assign w_sys_tmp179 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp180);
	assign w_sys_tmp180 = 32'sh0000002e;
	assign w_sys_tmp183 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp184);
	assign w_sys_tmp184 = 32'sh0000002f;
	assign w_sys_tmp186 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp187);
	assign w_sys_tmp187 = 32'sh00000030;
	assign w_sys_tmp190 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp191);
	assign w_sys_tmp191 = 32'sh00000031;
	assign w_sys_tmp193 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp194);
	assign w_sys_tmp194 = 32'sh00000032;
	assign w_sys_tmp197 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp198);
	assign w_sys_tmp198 = 32'sh00000033;
	assign w_sys_tmp200 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) - w_sys_tmp201);
	assign w_sys_tmp201 = 32'sh00000034;
	assign w_sys_tmp203 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_intOne);
	assign w_sys_tmp209 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_intZero);
	assign w_sys_tmp212 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp213);
	assign w_sys_tmp213 = 32'shffffffff;
	assign w_sys_tmp216 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp217);
	assign w_sys_tmp217 = 32'shfffffffe;
	assign w_sys_tmp219 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp220);
	assign w_sys_tmp220 = 32'shfffffffd;
	assign w_sys_tmp223 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp224);
	assign w_sys_tmp224 = 32'shfffffffc;
	assign w_sys_tmp227 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp228);
	assign w_sys_tmp228 = 32'shfffffffb;
	assign w_sys_tmp231 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp232);
	assign w_sys_tmp232 = 32'shfffffffa;
	assign w_sys_tmp234 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp235);
	assign w_sys_tmp235 = 32'shfffffff9;
	assign w_sys_tmp238 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp239);
	assign w_sys_tmp239 = 32'shfffffff8;
	assign w_sys_tmp242 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp243);
	assign w_sys_tmp243 = 32'shfffffff7;
	assign w_sys_tmp246 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp247);
	assign w_sys_tmp247 = 32'shfffffff6;
	assign w_sys_tmp249 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp250);
	assign w_sys_tmp250 = 32'shfffffff5;
	assign w_sys_tmp253 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp254);
	assign w_sys_tmp254 = 32'shfffffff4;
	assign w_sys_tmp257 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp258);
	assign w_sys_tmp258 = 32'shfffffff3;
	assign w_sys_tmp261 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp262);
	assign w_sys_tmp262 = 32'shfffffff2;
	assign w_sys_tmp265 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp266);
	assign w_sys_tmp266 = 32'shfffffff1;
	assign w_sys_tmp269 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp270);
	assign w_sys_tmp270 = 32'shfffffff0;
	assign w_sys_tmp273 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp274);
	assign w_sys_tmp274 = 32'shffffffef;
	assign w_sys_tmp277 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp278);
	assign w_sys_tmp278 = 32'shffffffee;
	assign w_sys_tmp280 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp281);
	assign w_sys_tmp281 = 32'shffffffed;
	assign w_sys_tmp284 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp285);
	assign w_sys_tmp285 = 32'shffffffec;
	assign w_sys_tmp288 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp289);
	assign w_sys_tmp289 = 32'shffffffeb;
	assign w_sys_tmp292 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp293);
	assign w_sys_tmp293 = 32'shffffffea;
	assign w_sys_tmp295 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp296);
	assign w_sys_tmp296 = 32'shffffffe9;
	assign w_sys_tmp299 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp300);
	assign w_sys_tmp300 = 32'shffffffe8;
	assign w_sys_tmp303 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp304);
	assign w_sys_tmp304 = 32'shffffffe7;
	assign w_sys_tmp307 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp308);
	assign w_sys_tmp308 = 32'shffffffe6;
	assign w_sys_tmp310 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp311);
	assign w_sys_tmp311 = 32'shffffffe5;
	assign w_sys_tmp314 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp315);
	assign w_sys_tmp315 = 32'shffffffe4;
	assign w_sys_tmp318 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp319);
	assign w_sys_tmp319 = 32'shffffffe3;
	assign w_sys_tmp322 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp323);
	assign w_sys_tmp323 = 32'shffffffe2;
	assign w_sys_tmp325 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp326);
	assign w_sys_tmp326 = 32'shffffffe1;
	assign w_sys_tmp329 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp330);
	assign w_sys_tmp330 = 32'shffffffe0;
	assign w_sys_tmp333 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp334);
	assign w_sys_tmp334 = 32'shffffffdf;
	assign w_sys_tmp337 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp338);
	assign w_sys_tmp338 = 32'shffffffde;
	assign w_sys_tmp340 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp341);
	assign w_sys_tmp341 = 32'shffffffdd;
	assign w_sys_tmp344 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp345);
	assign w_sys_tmp345 = 32'shffffffdc;
	assign w_sys_tmp348 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp349);
	assign w_sys_tmp349 = 32'shffffffdb;
	assign w_sys_tmp352 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp353);
	assign w_sys_tmp353 = 32'shffffffda;
	assign w_sys_tmp355 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp356);
	assign w_sys_tmp356 = 32'shffffffd9;
	assign w_sys_tmp359 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp360);
	assign w_sys_tmp360 = 32'shffffffd8;
	assign w_sys_tmp363 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp364);
	assign w_sys_tmp364 = 32'shffffffd7;
	assign w_sys_tmp367 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp368);
	assign w_sys_tmp368 = 32'shffffffd6;
	assign w_sys_tmp370 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp371);
	assign w_sys_tmp371 = 32'shffffffd5;
	assign w_sys_tmp374 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp375);
	assign w_sys_tmp375 = 32'shffffffd4;
	assign w_sys_tmp378 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp379);
	assign w_sys_tmp379 = 32'shffffffd3;
	assign w_sys_tmp382 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp383);
	assign w_sys_tmp383 = 32'shffffffd2;
	assign w_sys_tmp385 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp386);
	assign w_sys_tmp386 = 32'shffffffd1;
	assign w_sys_tmp389 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp390);
	assign w_sys_tmp390 = 32'shffffffd0;
	assign w_sys_tmp392 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp393);
	assign w_sys_tmp393 = 32'shffffffcf;
	assign w_sys_tmp396 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp397);
	assign w_sys_tmp397 = 32'shffffffce;
	assign w_sys_tmp399 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp400);
	assign w_sys_tmp400 = 32'shffffffcd;
	assign w_sys_tmp402 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp14);
	assign w_sys_tmp602 = ($signed( {{16{r_firFilter_n_56[15]}}, r_firFilter_n_56} ) + w_sys_tmp18);
	assign w_sys_tmp807 = 32'sh00000035;


	DualPortRAM #(.DWIDTH(64), .AWIDTH(11), .WORDS(2048) )
		dpram_dataRe0_0(
			.clk (clock),
			.ce_0 (w_fld_dataRe0_0_ce_0),
			.addr_0 (w_fld_dataRe0_0_addr_0),
			.datain_0 (w_fld_dataRe0_0_datain_0),
			.dataout_0 (w_fld_dataRe0_0_dataout_0),
			.r_w_0 (w_fld_dataRe0_0_r_w_0),
			.ce_1 (w_fld_dataRe0_0_ce_1),
			.addr_1 (r_fld_dataRe0_0_addr_1),
			.datain_1 (r_fld_dataRe0_0_datain_1),
			.dataout_1 (w_fld_dataRe0_0_dataout_1),
			.r_w_1 (r_fld_dataRe0_0_r_w_1)
		);

	DualPortRAM #(.DWIDTH(64), .AWIDTH(11), .WORDS(2048) )
		dpram_dataReFiltered0_1(
			.clk (clock),
			.ce_0 (w_fld_dataReFiltered0_1_ce_0),
			.addr_0 (w_fld_dataReFiltered0_1_addr_0),
			.datain_0 (w_fld_dataReFiltered0_1_datain_0),
			.dataout_0 (w_fld_dataReFiltered0_1_dataout_0),
			.r_w_0 (w_fld_dataReFiltered0_1_r_w_0),
			.ce_1 (w_fld_dataReFiltered0_1_ce_1),
			.addr_1 (r_fld_dataReFiltered0_1_addr_1),
			.datain_1 (r_fld_dataReFiltered0_1_datain_1),
			.dataout_1 (w_fld_dataReFiltered0_1_dataout_1),
			.r_w_1 (r_fld_dataReFiltered0_1_r_w_1)
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

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h8) || (r_sys_firFilter_step==8'ha) || (r_sys_firFilter_step==8'hc) || (r_sys_firFilter_step==8'he) || (r_sys_firFilter_step==8'h10) || (r_sys_firFilter_step==8'h12) || (r_sys_firFilter_step==8'h14) || (r_sys_firFilter_step==8'h16) || (r_sys_firFilter_step==8'h18) || (r_sys_firFilter_step==8'h1a) || (r_sys_firFilter_step==8'h1c) || (r_sys_firFilter_step==8'h1e) || (r_sys_firFilter_step==8'h20) || (r_sys_firFilter_step==8'h22) || (r_sys_firFilter_step==8'h24) || (r_sys_firFilter_step==8'h26) || (r_sys_firFilter_step==8'h28) || (r_sys_firFilter_step==8'h2a) || (r_sys_firFilter_step==8'h2c) || (r_sys_firFilter_step==8'h2e) || (r_sys_firFilter_step==8'h30) || (r_sys_firFilter_step==8'h32) || (r_sys_firFilter_step==8'h34) || (r_sys_firFilter_step==8'h36) || (r_sys_firFilter_step==8'h38) || (r_sys_firFilter_step==8'h3a) || (r_sys_firFilter_step==8'h41) || (r_sys_firFilter_step==8'h43) || (r_sys_firFilter_step==8'h45) || (r_sys_firFilter_step==8'h47) || (r_sys_firFilter_step==8'h49) || (r_sys_firFilter_step==8'h4b) || (r_sys_firFilter_step==8'h4d) || (r_sys_firFilter_step==8'h4f) || (r_sys_firFilter_step==8'h51) || (r_sys_firFilter_step==8'h53) || (r_sys_firFilter_step==8'h55) || (r_sys_firFilter_step==8'h57) || (r_sys_firFilter_step==8'h59) || (r_sys_firFilter_step==8'h5b) || (r_sys_firFilter_step==8'h5d) || (r_sys_firFilter_step==8'h5f) || (r_sys_firFilter_step==8'h61) || (r_sys_firFilter_step==8'h63) || (r_sys_firFilter_step==8'h65) || (r_sys_firFilter_step==8'h67) || (r_sys_firFilter_step==8'h69) || (r_sys_firFilter_step==8'h6b) || (r_sys_firFilter_step==8'h6d) || (r_sys_firFilter_step==8'h6f) || (r_sys_firFilter_step==8'h76) || (r_sys_firFilter_step==8'h78) || (r_sys_firFilter_step==8'h7a) || (r_sys_firFilter_step==8'h7c) || (r_sys_firFilter_step==8'h7e) || (r_sys_firFilter_step==8'h80) || (r_sys_firFilter_step==8'h82) || (r_sys_firFilter_step==8'h84) || (r_sys_firFilter_step==8'h86) || (r_sys_firFilter_step==8'h88) || (r_sys_firFilter_step==8'h8a) || (r_sys_firFilter_step==8'h8c) || (r_sys_firFilter_step==8'h8e) || (r_sys_firFilter_step==8'h90) || (r_sys_firFilter_step==8'h92) || (r_sys_firFilter_step==8'h94) || (r_sys_firFilter_step==8'h96) || (r_sys_firFilter_step==8'h98) || (r_sys_firFilter_step==8'h9a) || (r_sys_firFilter_step==8'h9c) || (r_sys_firFilter_step==8'h9e) || (r_sys_firFilter_step==8'ha0) || (r_sys_firFilter_step==8'ha2) || (r_sys_firFilter_step==8'ha4)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp7_float;

									end
									else
									if((r_sys_firFilter_step==8'h2d) || (r_sys_firFilter_step==8'h39) || (r_sys_firFilter_step==8'h3b) || (r_sys_firFilter_step==8'h46) || (r_sys_firFilter_step==8'h52) || (r_sys_firFilter_step==8'h54) || (r_sys_firFilter_step==8'h5c) || (r_sys_firFilter_step==8'h70) || (r_sys_firFilter_step==8'h75) || (r_sys_firFilter_step==8'h9f) || (r_sys_firFilter_step==8'ha5) || (r_sys_firFilter_step==8'haa) || (r_sys_firFilter_step==8'hd4) || (r_sys_firFilter_step==8'hda) || (r_sys_firFilter_step==8'hf2)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_firFilter_step==8'h37) || (r_sys_firFilter_step==8'h5a) || (r_sys_firFilter_step==8'h64) || (r_sys_firFilter_step==8'h73) || (r_sys_firFilter_step==8'h8f) || (r_sys_firFilter_step==8'h99) || (r_sys_firFilter_step==8'ha8) || (r_sys_firFilter_step==8'hc4) || (r_sys_firFilter_step==8'hce) || (r_sys_firFilter_step==8'hdd)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp2_float;

									end
									else
									if((r_sys_firFilter_step==8'h4c) || (r_sys_firFilter_step==8'h62) || (r_sys_firFilter_step==8'h6e) || (r_sys_firFilter_step==8'h81) || (r_sys_firFilter_step==8'h97) || (r_sys_firFilter_step==8'ha3) || (r_sys_firFilter_step==8'hb6) || (r_sys_firFilter_step==8'hcc) || (r_sys_firFilter_step==8'hd8)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_firFilter_step==8'hde)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp6;

									end
									else
									if((r_sys_firFilter_step==8'h3d) || (r_sys_firFilter_step==8'h3f) || (r_sys_firFilter_step==8'h72) || (r_sys_firFilter_step==8'h74) || (r_sys_firFilter_step==8'ha7) || (r_sys_firFilter_step==8'ha9) || (r_sys_firFilter_step==8'hab) || (r_sys_firFilter_step==8'had) || (r_sys_firFilter_step==8'haf) || (r_sys_firFilter_step==8'hb1) || (r_sys_firFilter_step==8'hb3) || (r_sys_firFilter_step==8'hb5) || (r_sys_firFilter_step==8'hb7) || (r_sys_firFilter_step==8'hb9) || (r_sys_firFilter_step==8'hbb) || (r_sys_firFilter_step==8'hbd) || (r_sys_firFilter_step==8'hbf) || (r_sys_firFilter_step==8'hc1) || (r_sys_firFilter_step==8'hc3) || (r_sys_firFilter_step==8'hc5) || (r_sys_firFilter_step==8'hc7) || (r_sys_firFilter_step==8'hc9) || (r_sys_firFilter_step==8'hcb) || (r_sys_firFilter_step==8'hcd) || (r_sys_firFilter_step==8'hcf) || (r_sys_firFilter_step==8'hd1) || (r_sys_firFilter_step==8'hd3) || (r_sys_firFilter_step==8'hd5) || (r_sys_firFilter_step==8'hd7) || (r_sys_firFilter_step==8'hd9)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_firFilter_step==8'h17) || (r_sys_firFilter_step==8'h1f) || (r_sys_firFilter_step==8'h27) || (r_sys_firFilter_step==8'h2f) || (r_sys_firFilter_step==8'h3e) || (r_sys_firFilter_step==8'h40) || (r_sys_firFilter_step==8'h6a) || (r_sys_firFilter_step==8'h6c) || (r_sys_firFilter_step==8'h7b) || (r_sys_firFilter_step==8'h87) || (r_sys_firFilter_step==8'h89) || (r_sys_firFilter_step==8'h91) || (r_sys_firFilter_step==8'ha1) || (r_sys_firFilter_step==8'hb0) || (r_sys_firFilter_step==8'hbc) || (r_sys_firFilter_step==8'hbe) || (r_sys_firFilter_step==8'hc6) || (r_sys_firFilter_step==8'hd6) || (r_sys_firFilter_step==8'he3) || (r_sys_firFilter_step==8'he8)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_firFilter_step==8'hf) || (r_sys_firFilter_step==8'h13) || (r_sys_firFilter_step==8'h19) || (r_sys_firFilter_step==8'h1b) || (r_sys_firFilter_step==8'h21) || (r_sys_firFilter_step==8'h23) || (r_sys_firFilter_step==8'h29) || (r_sys_firFilter_step==8'h2b) || (r_sys_firFilter_step==8'h31) || (r_sys_firFilter_step==8'h33) || (r_sys_firFilter_step==8'h3c) || (r_sys_firFilter_step==8'h42) || (r_sys_firFilter_step==8'h44) || (r_sys_firFilter_step==8'h48) || (r_sys_firFilter_step==8'h4e) || (r_sys_firFilter_step==8'h50) || (r_sys_firFilter_step==8'h56) || (r_sys_firFilter_step==8'h58) || (r_sys_firFilter_step==8'h5e) || (r_sys_firFilter_step==8'h60) || (r_sys_firFilter_step==8'h66) || (r_sys_firFilter_step==8'h68) || (r_sys_firFilter_step==8'h71) || (r_sys_firFilter_step==8'h77) || (r_sys_firFilter_step==8'h79) || (r_sys_firFilter_step==8'h7d) || (r_sys_firFilter_step==8'h83) || (r_sys_firFilter_step==8'h85) || (r_sys_firFilter_step==8'h8b) || (r_sys_firFilter_step==8'h8d) || (r_sys_firFilter_step==8'h93) || (r_sys_firFilter_step==8'h95) || (r_sys_firFilter_step==8'h9b) || (r_sys_firFilter_step==8'h9d) || (r_sys_firFilter_step==8'ha6) || (r_sys_firFilter_step==8'hac) || (r_sys_firFilter_step==8'hae) || (r_sys_firFilter_step==8'hb2) || (r_sys_firFilter_step==8'hb8) || (r_sys_firFilter_step==8'hba) || (r_sys_firFilter_step==8'hc0) || (r_sys_firFilter_step==8'hc2) || (r_sys_firFilter_step==8'hc8) || (r_sys_firFilter_step==8'hca) || (r_sys_firFilter_step==8'hd0) || (r_sys_firFilter_step==8'hd2) || (r_sys_firFilter_step==8'hdb) || (r_sys_firFilter_step==8'hdf) || (r_sys_firFilter_step==8'hed)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp6_float;

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

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h8) || (r_sys_firFilter_step==8'ha) || (r_sys_firFilter_step==8'hc) || (r_sys_firFilter_step==8'he) || (r_sys_firFilter_step==8'h10) || (r_sys_firFilter_step==8'h12) || (r_sys_firFilter_step==8'h14) || (r_sys_firFilter_step==8'h16) || (r_sys_firFilter_step==8'h18) || (r_sys_firFilter_step==8'h1a) || (r_sys_firFilter_step==8'h1c) || (r_sys_firFilter_step==8'h1e) || (r_sys_firFilter_step==8'h20) || (r_sys_firFilter_step==8'h22) || (r_sys_firFilter_step==8'h24) || (r_sys_firFilter_step==8'h26) || (r_sys_firFilter_step==8'h28) || (r_sys_firFilter_step==8'h2a) || (r_sys_firFilter_step==8'h2c) || (r_sys_firFilter_step==8'h2e) || (r_sys_firFilter_step==8'h30) || (r_sys_firFilter_step==8'h32) || (r_sys_firFilter_step==8'h34) || (r_sys_firFilter_step==8'h36) || (r_sys_firFilter_step==8'h38) || (r_sys_firFilter_step==8'h3a) || (r_sys_firFilter_step==8'h3d) || (r_sys_firFilter_step==8'h3f) || (r_sys_firFilter_step==8'h41) || (r_sys_firFilter_step==8'h43) || (r_sys_firFilter_step==8'h45) || (r_sys_firFilter_step==8'h47) || (r_sys_firFilter_step==8'h49) || (r_sys_firFilter_step==8'h4b) || (r_sys_firFilter_step==8'h4d) || (r_sys_firFilter_step==8'h4f) || (r_sys_firFilter_step==8'h51) || (r_sys_firFilter_step==8'h53) || (r_sys_firFilter_step==8'h55) || (r_sys_firFilter_step==8'h57) || (r_sys_firFilter_step==8'h59) || (r_sys_firFilter_step==8'h5b) || (r_sys_firFilter_step==8'h5d) || (r_sys_firFilter_step==8'h5f) || (r_sys_firFilter_step==8'h61) || (r_sys_firFilter_step==8'h63) || (r_sys_firFilter_step==8'h65) || (r_sys_firFilter_step==8'h67) || (r_sys_firFilter_step==8'h69) || (r_sys_firFilter_step==8'h6b) || (r_sys_firFilter_step==8'h6d) || (r_sys_firFilter_step==8'h6f) || (r_sys_firFilter_step==8'h72) || (r_sys_firFilter_step==8'h74) || (r_sys_firFilter_step==8'h76) || (r_sys_firFilter_step==8'h78) || (r_sys_firFilter_step==8'h7a) || (r_sys_firFilter_step==8'h7c) || (r_sys_firFilter_step==8'h7e) || (r_sys_firFilter_step==8'h80) || (r_sys_firFilter_step==8'h82) || (r_sys_firFilter_step==8'h84) || (r_sys_firFilter_step==8'h86) || (r_sys_firFilter_step==8'h88) || (r_sys_firFilter_step==8'h8a) || (r_sys_firFilter_step==8'h8c) || (r_sys_firFilter_step==8'h8e) || (r_sys_firFilter_step==8'h90) || (r_sys_firFilter_step==8'h92) || (r_sys_firFilter_step==8'h94) || (r_sys_firFilter_step==8'h96) || (r_sys_firFilter_step==8'h98) || (r_sys_firFilter_step==8'h9a) || (r_sys_firFilter_step==8'h9c) || (r_sys_firFilter_step==8'h9e) || (r_sys_firFilter_step==8'ha0) || (r_sys_firFilter_step==8'ha2) || (r_sys_firFilter_step==8'ha4) || (r_sys_firFilter_step==8'ha7) || (r_sys_firFilter_step==8'ha9) || (r_sys_firFilter_step==8'hab) || (r_sys_firFilter_step==8'had) || (r_sys_firFilter_step==8'haf) || (r_sys_firFilter_step==8'hb1) || (r_sys_firFilter_step==8'hb3) || (r_sys_firFilter_step==8'hb5) || (r_sys_firFilter_step==8'hb7) || (r_sys_firFilter_step==8'hb9) || (r_sys_firFilter_step==8'hbb) || (r_sys_firFilter_step==8'hbd) || (r_sys_firFilter_step==8'hbf) || (r_sys_firFilter_step==8'hc1) || (r_sys_firFilter_step==8'hc3) || (r_sys_firFilter_step==8'hc5) || (r_sys_firFilter_step==8'hc7) || (r_sys_firFilter_step==8'hc9) || (r_sys_firFilter_step==8'hcb) || (r_sys_firFilter_step==8'hcd) || (r_sys_firFilter_step==8'hcf) || (r_sys_firFilter_step==8'hd1) || (r_sys_firFilter_step==8'hd3) || (r_sys_firFilter_step==8'hd5) || (r_sys_firFilter_step==8'hd7) || (r_sys_firFilter_step==8'hd9)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp8;

									end
									else
									if((r_sys_firFilter_step==8'h40) || (r_sys_firFilter_step==8'h75) || (r_sys_firFilter_step==8'haa)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp7_float;

									end
									else
									if((r_sys_firFilter_step==8'h56) || (r_sys_firFilter_step==8'h5a) || (r_sys_firFilter_step==8'h5e) || (r_sys_firFilter_step==8'h6a) || (r_sys_firFilter_step==8'h6e) || (r_sys_firFilter_step==8'h77) || (r_sys_firFilter_step==8'ha3) || (r_sys_firFilter_step==8'hac) || (r_sys_firFilter_step==8'hd8)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_firFilter_step==8'h52) || (r_sys_firFilter_step==8'h87) || (r_sys_firFilter_step==8'hbc)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp0_float;

									end
									else
									if((r_sys_firFilter_step==8'h2d) || (r_sys_firFilter_step==8'h3c) || (r_sys_firFilter_step==8'h62) || (r_sys_firFilter_step==8'h66) || (r_sys_firFilter_step==8'h97) || (r_sys_firFilter_step==8'h9b) || (r_sys_firFilter_step==8'hcc) || (r_sys_firFilter_step==8'hd0)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp2_float;

									end
									else
									if((r_sys_firFilter_step==8'h39) || (r_sys_firFilter_step==8'h4e) || (r_sys_firFilter_step==8'h83) || (r_sys_firFilter_step==8'hb8)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_firFilter_step==8'hde)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_firFilter_step==8'h46) || (r_sys_firFilter_step==8'h7b) || (r_sys_firFilter_step==8'hb0)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp6_float;

									end
									else
									if((r_sys_firFilter_step==8'h19) || (r_sys_firFilter_step==8'h21) || (r_sys_firFilter_step==8'h29) || (r_sys_firFilter_step==8'h31) || (r_sys_firFilter_step==8'h42) || (r_sys_firFilter_step==8'h71) || (r_sys_firFilter_step==8'h8b) || (r_sys_firFilter_step==8'h8f) || (r_sys_firFilter_step==8'h93) || (r_sys_firFilter_step==8'h9f) || (r_sys_firFilter_step==8'ha6) || (r_sys_firFilter_step==8'hc0) || (r_sys_firFilter_step==8'hc4) || (r_sys_firFilter_step==8'hc8) || (r_sys_firFilter_step==8'hd4) || (r_sys_firFilter_step==8'hdb)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_firFilter_step==8'hf) || (r_sys_firFilter_step==8'h13) || (r_sys_firFilter_step==8'h17) || (r_sys_firFilter_step==8'h1b) || (r_sys_firFilter_step==8'h1f) || (r_sys_firFilter_step==8'h23) || (r_sys_firFilter_step==8'h27) || (r_sys_firFilter_step==8'h2b) || (r_sys_firFilter_step==8'h2f) || (r_sys_firFilter_step==8'h33) || (r_sys_firFilter_step==8'h37) || (r_sys_firFilter_step==8'h3b) || (r_sys_firFilter_step==8'h3e) || (r_sys_firFilter_step==8'h44) || (r_sys_firFilter_step==8'h48) || (r_sys_firFilter_step==8'h4c) || (r_sys_firFilter_step==8'h50) || (r_sys_firFilter_step==8'h54) || (r_sys_firFilter_step==8'h58) || (r_sys_firFilter_step==8'h5c) || (r_sys_firFilter_step==8'h60) || (r_sys_firFilter_step==8'h64) || (r_sys_firFilter_step==8'h68) || (r_sys_firFilter_step==8'h6c) || (r_sys_firFilter_step==8'h70) || (r_sys_firFilter_step==8'h73) || (r_sys_firFilter_step==8'h79) || (r_sys_firFilter_step==8'h7d) || (r_sys_firFilter_step==8'h81) || (r_sys_firFilter_step==8'h85) || (r_sys_firFilter_step==8'h89) || (r_sys_firFilter_step==8'h8d) || (r_sys_firFilter_step==8'h91) || (r_sys_firFilter_step==8'h95) || (r_sys_firFilter_step==8'h99) || (r_sys_firFilter_step==8'h9d) || (r_sys_firFilter_step==8'ha1) || (r_sys_firFilter_step==8'ha5) || (r_sys_firFilter_step==8'ha8) || (r_sys_firFilter_step==8'hae) || (r_sys_firFilter_step==8'hb2) || (r_sys_firFilter_step==8'hb6) || (r_sys_firFilter_step==8'hba) || (r_sys_firFilter_step==8'hbe) || (r_sys_firFilter_step==8'hc2) || (r_sys_firFilter_step==8'hc6) || (r_sys_firFilter_step==8'hca) || (r_sys_firFilter_step==8'hce) || (r_sys_firFilter_step==8'hd2) || (r_sys_firFilter_step==8'hd6) || (r_sys_firFilter_step==8'hda) || (r_sys_firFilter_step==8'hdd) || (r_sys_firFilter_step==8'hdf) || (r_sys_firFilter_step==8'he3) || (r_sys_firFilter_step==8'he8) || (r_sys_firFilter_step==8'hed) || (r_sys_firFilter_step==8'hf2)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp6;

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

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h13) || (r_sys_firFilter_step==8'h48) || (r_sys_firFilter_step==8'h7d) || (r_sys_firFilter_step==8'hb2)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff17_20;

									end
									else
									if((r_sys_firFilter_step==8'h14) || (r_sys_firFilter_step==8'h49) || (r_sys_firFilter_step==8'h7e) || (r_sys_firFilter_step==8'hb3)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff18_21;

									end
									else
									if((r_sys_firFilter_step==8'h2d) || (r_sys_firFilter_step==8'h62) || (r_sys_firFilter_step==8'h97) || (r_sys_firFilter_step==8'hcc)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff43_46;

									end
									else
									if((r_sys_firFilter_step==8'h1b) || (r_sys_firFilter_step==8'h50) || (r_sys_firFilter_step==8'h85) || (r_sys_firFilter_step==8'hba)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff25_28;

									end
									else
									if((r_sys_firFilter_step==8'h22) || (r_sys_firFilter_step==8'h57) || (r_sys_firFilter_step==8'h8c) || (r_sys_firFilter_step==8'hc1)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff32_35;

									end
									else
									if((r_sys_firFilter_step==8'h11) || (r_sys_firFilter_step==8'h46) || (r_sys_firFilter_step==8'h7b) || (r_sys_firFilter_step==8'hb0)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff15_18;

									end
									else
									if((r_sys_firFilter_step==8'h19) || (r_sys_firFilter_step==8'h4e) || (r_sys_firFilter_step==8'h83) || (r_sys_firFilter_step==8'hb8)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff23_26;

									end
									else
									if((r_sys_firFilter_step==8'h24) || (r_sys_firFilter_step==8'h59) || (r_sys_firFilter_step==8'h8e) || (r_sys_firFilter_step==8'hc3)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff34_37;

									end
									else
									if((r_sys_firFilter_step==8'h2b) || (r_sys_firFilter_step==8'h60) || (r_sys_firFilter_step==8'h95) || (r_sys_firFilter_step==8'hca)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff41_44;

									end
									else
									if((r_sys_firFilter_step==8'h18) || (r_sys_firFilter_step==8'h4d) || (r_sys_firFilter_step==8'h82) || (r_sys_firFilter_step==8'hb7)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff22_25;

									end
									else
									if((r_sys_firFilter_step==8'hc) || (r_sys_firFilter_step==8'h41) || (r_sys_firFilter_step==8'h76) || (r_sys_firFilter_step==8'hab)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff10_13;

									end
									else
									if((r_sys_firFilter_step==8'h2a) || (r_sys_firFilter_step==8'h5f) || (r_sys_firFilter_step==8'h94) || (r_sys_firFilter_step==8'hc9)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff40_43;

									end
									else
									if((r_sys_firFilter_step==8'h32) || (r_sys_firFilter_step==8'h67) || (r_sys_firFilter_step==8'h9c) || (r_sys_firFilter_step==8'hd1)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff48_51;

									end
									else
									if((r_sys_firFilter_step==8'h2f) || (r_sys_firFilter_step==8'h64) || (r_sys_firFilter_step==8'h99) || (r_sys_firFilter_step==8'hce)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff45_48;

									end
									else
									if((r_sys_firFilter_step==8'h1c) || (r_sys_firFilter_step==8'h51) || (r_sys_firFilter_step==8'h86) || (r_sys_firFilter_step==8'hbb)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff26_29;

									end
									else
									if((r_sys_firFilter_step==8'h23) || (r_sys_firFilter_step==8'h58) || (r_sys_firFilter_step==8'h8d) || (r_sys_firFilter_step==8'hc2)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff33_36;

									end
									else
									if((r_sys_firFilter_step==8'h2) || (r_sys_firFilter_step==8'h37) || (r_sys_firFilter_step==8'h6c) || (r_sys_firFilter_step==8'ha1)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff0_3;

									end
									else
									if((r_sys_firFilter_step==8'he) || (r_sys_firFilter_step==8'h43) || (r_sys_firFilter_step==8'h78) || (r_sys_firFilter_step==8'had)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff12_15;

									end
									else
									if((r_sys_firFilter_step==8'h7) || (r_sys_firFilter_step==8'h3c) || (r_sys_firFilter_step==8'h71) || (r_sys_firFilter_step==8'ha6)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff5_8;

									end
									else
									if((r_sys_firFilter_step==8'h5) || (r_sys_firFilter_step==8'h3a) || (r_sys_firFilter_step==8'h6f) || (r_sys_firFilter_step==8'ha4)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff3_6;

									end
									else
									if((r_sys_firFilter_step==8'h1e) || (r_sys_firFilter_step==8'h53) || (r_sys_firFilter_step==8'h88) || (r_sys_firFilter_step==8'hbd)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff28_31;

									end
									else
									if((r_sys_firFilter_step==8'h25) || (r_sys_firFilter_step==8'h5a) || (r_sys_firFilter_step==8'h8f) || (r_sys_firFilter_step==8'hc4)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff35_38;

									end
									else
									if((r_sys_firFilter_step==8'h12) || (r_sys_firFilter_step==8'h47) || (r_sys_firFilter_step==8'h7c) || (r_sys_firFilter_step==8'hb1)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff16_19;

									end
									else
									if((r_sys_firFilter_step==8'h36) || (r_sys_firFilter_step==8'h6b) || (r_sys_firFilter_step==8'ha0) || (r_sys_firFilter_step==8'hd5)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff52_55;

									end
									else
									if((r_sys_firFilter_step==8'h4) || (r_sys_firFilter_step==8'h39) || (r_sys_firFilter_step==8'h6e) || (r_sys_firFilter_step==8'ha3)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff2_5;

									end
									else
									if((r_sys_firFilter_step==8'h35) || (r_sys_firFilter_step==8'h6a) || (r_sys_firFilter_step==8'h9f) || (r_sys_firFilter_step==8'hd4)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff51_54;

									end
									else
									if((r_sys_firFilter_step==8'h30) || (r_sys_firFilter_step==8'h65) || (r_sys_firFilter_step==8'h9a) || (r_sys_firFilter_step==8'hcf)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff46_49;

									end
									else
									if((r_sys_firFilter_step==8'h1d) || (r_sys_firFilter_step==8'h52) || (r_sys_firFilter_step==8'h87) || (r_sys_firFilter_step==8'hbc)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff27_30;

									end
									else
									if((r_sys_firFilter_step==8'h8) || (r_sys_firFilter_step==8'h3d) || (r_sys_firFilter_step==8'h72) || (r_sys_firFilter_step==8'ha7)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff6_9;

									end
									else
									if((r_sys_firFilter_step==8'h15) || (r_sys_firFilter_step==8'h4a) || (r_sys_firFilter_step==8'h7f) || (r_sys_firFilter_step==8'hb4)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff19_22;

									end
									else
									if((r_sys_firFilter_step==8'hb) || (r_sys_firFilter_step==8'h40) || (r_sys_firFilter_step==8'h75) || (r_sys_firFilter_step==8'haa)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff9_12;

									end
									else
									if((r_sys_firFilter_step==8'h26) || (r_sys_firFilter_step==8'h5b) || (r_sys_firFilter_step==8'h90) || (r_sys_firFilter_step==8'hc5)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff36_39;

									end
									else
									if((r_sys_firFilter_step==8'h1f) || (r_sys_firFilter_step==8'h54) || (r_sys_firFilter_step==8'h89) || (r_sys_firFilter_step==8'hbe)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff29_32;

									end
									else
									if((r_sys_firFilter_step==8'h21) || (r_sys_firFilter_step==8'h56) || (r_sys_firFilter_step==8'h8b) || (r_sys_firFilter_step==8'hc0)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff31_34;

									end
									else
									if((r_sys_firFilter_step==8'ha) || (r_sys_firFilter_step==8'h3f) || (r_sys_firFilter_step==8'h74) || (r_sys_firFilter_step==8'ha9)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff8_11;

									end
									else
									if((r_sys_firFilter_step==8'h29) || (r_sys_firFilter_step==8'h5e) || (r_sys_firFilter_step==8'h93) || (r_sys_firFilter_step==8'hc8)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff39_42;

									end
									else
									if((r_sys_firFilter_step==8'h33) || (r_sys_firFilter_step==8'h68) || (r_sys_firFilter_step==8'h9d) || (r_sys_firFilter_step==8'hd2)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff49_52;

									end
									else
									if((r_sys_firFilter_step==8'h31) || (r_sys_firFilter_step==8'h66) || (r_sys_firFilter_step==8'h9b) || (r_sys_firFilter_step==8'hd0)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff47_50;

									end
									else
									if((r_sys_firFilter_step==8'h1a) || (r_sys_firFilter_step==8'h4f) || (r_sys_firFilter_step==8'h84) || (r_sys_firFilter_step==8'hb9)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff24_27;

									end
									else
									if((r_sys_firFilter_step==8'h2e) || (r_sys_firFilter_step==8'h63) || (r_sys_firFilter_step==8'h98) || (r_sys_firFilter_step==8'hcd)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff44_47;

									end
									else
									if((r_sys_firFilter_step==8'h27) || (r_sys_firFilter_step==8'h5c) || (r_sys_firFilter_step==8'h91) || (r_sys_firFilter_step==8'hc6)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff37_40;

									end
									else
									if((r_sys_firFilter_step==8'h6) || (r_sys_firFilter_step==8'h3b) || (r_sys_firFilter_step==8'h70) || (r_sys_firFilter_step==8'ha5)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff4_7;

									end
									else
									if((r_sys_firFilter_step==8'h3) || (r_sys_firFilter_step==8'h38) || (r_sys_firFilter_step==8'h6d) || (r_sys_firFilter_step==8'ha2)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff1_4;

									end
									else
									if((r_sys_firFilter_step==8'hf) || (r_sys_firFilter_step==8'h44) || (r_sys_firFilter_step==8'h79) || (r_sys_firFilter_step==8'hae)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff13_16;

									end
									else
									if((r_sys_firFilter_step==8'h16) || (r_sys_firFilter_step==8'h4b) || (r_sys_firFilter_step==8'h80) || (r_sys_firFilter_step==8'hb5)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff20_23;

									end
									else
									if((r_sys_firFilter_step==8'h34) || (r_sys_firFilter_step==8'h69) || (r_sys_firFilter_step==8'h9e) || (r_sys_firFilter_step==8'hd3)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff50_53;

									end
									else
									if((r_sys_firFilter_step==8'h20) || (r_sys_firFilter_step==8'h55) || (r_sys_firFilter_step==8'h8a) || (r_sys_firFilter_step==8'hbf)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff30_33;

									end
									else
									if((r_sys_firFilter_step==8'h10) || (r_sys_firFilter_step==8'h45) || (r_sys_firFilter_step==8'h7a) || (r_sys_firFilter_step==8'haf)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff14_17;

									end
									else
									if((r_sys_firFilter_step==8'h2c) || (r_sys_firFilter_step==8'h61) || (r_sys_firFilter_step==8'h96) || (r_sys_firFilter_step==8'hcb)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff42_45;

									end
									else
									if((r_sys_firFilter_step==8'h17) || (r_sys_firFilter_step==8'h4c) || (r_sys_firFilter_step==8'h81) || (r_sys_firFilter_step==8'hb6)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff21_24;

									end
									else
									if((r_sys_firFilter_step==8'h9) || (r_sys_firFilter_step==8'h3e) || (r_sys_firFilter_step==8'h73) || (r_sys_firFilter_step==8'ha8)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff7_10;

									end
									else
									if((r_sys_firFilter_step==8'h28) || (r_sys_firFilter_step==8'h5d) || (r_sys_firFilter_step==8'h92) || (r_sys_firFilter_step==8'hc7)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff38_41;

									end
									else
									if((r_sys_firFilter_step==8'hd) || (r_sys_firFilter_step==8'h42) || (r_sys_firFilter_step==8'h77) || (r_sys_firFilter_step==8'hac)) begin
										r_ip_MultFloat_multiplicand_0 <= i_fld_ff11_14;

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

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((8'h2<=r_sys_firFilter_step && r_sys_firFilter_step<=8'hd5)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp7;

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
					r_sys_processing_methodID <= ((i_firFilter_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h9: begin
							r_sys_processing_methodID <= r_sys_firFilter_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_firFilter_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_firFilter_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_firFilter_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h0: begin
							r_sys_firFilter_phase <= 4'h3;
						end

						4'h3: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_sys_firFilter_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_sys_firFilter_phase <= ((w_sys_tmp1) ? 4'h7 : 4'h9);

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_sys_firFilter_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'hf7)) begin
										r_sys_firFilter_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin
							r_sys_firFilter_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_firFilter_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h3: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_sys_firFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_sys_firFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_sys_firFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'hf7)) begin
										r_sys_firFilter_stage <= 2'h0;

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
			r_sys_firFilter_step <= 8'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h3: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_sys_firFilter_step <= 8'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_sys_firFilter_step <= 8'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_sys_firFilter_step <= 8'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((8'h0<=r_sys_firFilter_step && r_sys_firFilter_step<=8'hf6)) begin
										r_sys_firFilter_step <= w_sys_firFilter_step_p1;

									end
									else
									if((r_sys_firFilter_step==8'hf7)) begin
										r_sys_firFilter_step <= 8'h0;

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
			r_sys_firFilter_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_firFilter_busy <= ((i_firFilter_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h0: begin
							r_sys_firFilter_busy <= w_sys_boolTrue;
						end

						4'h9: begin
							r_sys_firFilter_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_dataRe0_0_addr_1 <= 11'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h26)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp149[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h24)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp141[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h3b) || (r_sys_firFilter_step==8'h71) || (r_sys_firFilter_step==8'ha7)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp227[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h13)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp78[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h9f)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp602[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h18)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp96[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h50) || (r_sys_firFilter_step==8'h86) || (r_sys_firFilter_step==8'hbc)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp307[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h0)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( r_firFilter_n_56[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h11)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp70[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h33)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp197[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h62) || (r_sys_firFilter_step==8'h98) || (r_sys_firFilter_step==8'hce)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp374[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h4a) || (r_sys_firFilter_step==8'h80) || (r_sys_firFilter_step==8'hb6)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp284[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h1)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp10[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h7)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp32[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h39) || (r_sys_firFilter_step==8'h6f) || (r_sys_firFilter_step==8'ha5)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp219[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h30)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp186[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h40) || (r_sys_firFilter_step==8'h76) || (r_sys_firFilter_step==8'hac)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp246[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'hc)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp50[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h3a) || (r_sys_firFilter_step==8'h70) || (r_sys_firFilter_step==8'ha6)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp223[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h55) || (r_sys_firFilter_step==8'h8b) || (r_sys_firFilter_step==8'hc1)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp325[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h5e) || (r_sys_firFilter_step==8'h94) || (r_sys_firFilter_step==8'hca)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp359[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h59) || (r_sys_firFilter_step==8'h8f) || (r_sys_firFilter_step==8'hc5)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp340[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h8)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp35[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h2e)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp179[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h67) || (r_sys_firFilter_step==8'h9d) || (r_sys_firFilter_step==8'hd3)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp392[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h41) || (r_sys_firFilter_step==8'h77) || (r_sys_firFilter_step==8'had)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp249[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h54) || (r_sys_firFilter_step==8'h8a) || (r_sys_firFilter_step==8'hc0)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp322[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h66) || (r_sys_firFilter_step==8'h9c) || (r_sys_firFilter_step==8'hd2)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp389[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h15)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp85[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h17)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp93[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h20)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp126[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'he)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp58[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h52) || (r_sys_firFilter_step==8'h88) || (r_sys_firFilter_step==8'hbe)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp314[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h60) || (r_sys_firFilter_step==8'h96) || (r_sys_firFilter_step==8'hcc)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp367[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h1e)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp119[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h1f)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp123[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'hf)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp62[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h32)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp193[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h2d)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp175[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h4b) || (r_sys_firFilter_step==8'h81) || (r_sys_firFilter_step==8'hb7)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp288[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h2f)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp183[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h25)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp145[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h51) || (r_sys_firFilter_step==8'h87) || (r_sys_firFilter_step==8'hbd)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp310[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h6a) || (r_sys_firFilter_step==8'ha0)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp402[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h4)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp20[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h38) || (r_sys_firFilter_step==8'h6e) || (r_sys_firFilter_step==8'ha4)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp216[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h3d) || (r_sys_firFilter_step==8'h73) || (r_sys_firFilter_step==8'ha9)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp234[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h1c)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp111[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h4f) || (r_sys_firFilter_step==8'h85) || (r_sys_firFilter_step==8'hbb)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp303[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h21)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp130[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h43) || (r_sys_firFilter_step==8'h79) || (r_sys_firFilter_step==8'haf)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp257[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h64) || (r_sys_firFilter_step==8'h9a) || (r_sys_firFilter_step==8'hd0)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp382[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h44) || (r_sys_firFilter_step==8'h7a) || (r_sys_firFilter_step==8'hb0)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp261[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h48) || (r_sys_firFilter_step==8'h7e) || (r_sys_firFilter_step==8'hb4)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp277[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h46) || (r_sys_firFilter_step==8'h7c) || (r_sys_firFilter_step==8'hb2)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp269[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'hb)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp47[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h61) || (r_sys_firFilter_step==8'h97) || (r_sys_firFilter_step==8'hcd)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp370[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h23)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp138[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h56) || (r_sys_firFilter_step==8'h8c) || (r_sys_firFilter_step==8'hc2)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp329[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h4d) || (r_sys_firFilter_step==8'h83) || (r_sys_firFilter_step==8'hb9)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp295[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h5f) || (r_sys_firFilter_step==8'h95) || (r_sys_firFilter_step==8'hcb)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp363[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h45) || (r_sys_firFilter_step==8'h7b) || (r_sys_firFilter_step==8'hb1)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp265[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h57) || (r_sys_firFilter_step==8'h8d) || (r_sys_firFilter_step==8'hc3)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp333[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h3)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp17[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h5a) || (r_sys_firFilter_step==8'h90) || (r_sys_firFilter_step==8'hc6)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp344[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h6)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp28[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h2a)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp164[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h2b)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp168[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h5b) || (r_sys_firFilter_step==8'h91) || (r_sys_firFilter_step==8'hc7)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp348[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h10)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp66[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h1b)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp108[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h1d)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp115[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h2)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp13[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h2c)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp171[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h27)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp153[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h69)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp399[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h34)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp200[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h3f) || (r_sys_firFilter_step==8'h75) || (r_sys_firFilter_step==8'hab)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp242[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h63) || (r_sys_firFilter_step==8'h99) || (r_sys_firFilter_step==8'hcf)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp378[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h58) || (r_sys_firFilter_step==8'h8e) || (r_sys_firFilter_step==8'hc4)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp337[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h35) || (r_sys_firFilter_step==8'h6b) || (r_sys_firFilter_step==8'ha1)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp203[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h22)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp134[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h47) || (r_sys_firFilter_step==8'h7d) || (r_sys_firFilter_step==8'hb3)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp273[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h3c) || (r_sys_firFilter_step==8'h72) || (r_sys_firFilter_step==8'ha8)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp231[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h14)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp81[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h31)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp190[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h19)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp100[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h29)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp160[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h3e) || (r_sys_firFilter_step==8'h74) || (r_sys_firFilter_step==8'haa)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp238[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h4e) || (r_sys_firFilter_step==8'h84) || (r_sys_firFilter_step==8'hba)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp299[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h5c) || (r_sys_firFilter_step==8'h92) || (r_sys_firFilter_step==8'hc8)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp352[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h42) || (r_sys_firFilter_step==8'h78) || (r_sys_firFilter_step==8'hae)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp253[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h4c) || (r_sys_firFilter_step==8'h82) || (r_sys_firFilter_step==8'hb8)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp292[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h12)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp74[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h5d) || (r_sys_firFilter_step==8'h93) || (r_sys_firFilter_step==8'hc9)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp355[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'ha)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp43[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h36) || (r_sys_firFilter_step==8'h6c) || (r_sys_firFilter_step==8'ha2)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp209[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h53) || (r_sys_firFilter_step==8'h89) || (r_sys_firFilter_step==8'hbf)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp318[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h1a)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp104[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'hd)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp54[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h16)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp89[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h49) || (r_sys_firFilter_step==8'h7f) || (r_sys_firFilter_step==8'hb5)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp280[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h37) || (r_sys_firFilter_step==8'h6d) || (r_sys_firFilter_step==8'ha3)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp212[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h68) || (r_sys_firFilter_step==8'h9e)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp396[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h9)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp39[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h5)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp24[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h28)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp156[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'h65) || (r_sys_firFilter_step==8'h9b) || (r_sys_firFilter_step==8'hd1)) begin
										r_fld_dataRe0_0_addr_1 <= $signed( w_sys_tmp385[10:0] );

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
			r_fld_dataRe0_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((8'h0<=r_sys_firFilter_step && r_sys_firFilter_step<=8'hd3)) begin
										r_fld_dataRe0_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'h9: begin
							r_fld_dataRe0_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_dataReFiltered0_1_addr_1 <= 11'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h6f)) begin
										r_fld_dataReFiltered0_1_addr_1 <= $signed( r_firFilter_n_56[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'hd9)) begin
										r_fld_dataReFiltered0_1_addr_1 <= $signed( w_sys_tmp402[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'ha4)) begin
										r_fld_dataReFiltered0_1_addr_1 <= $signed( w_sys_tmp203[10:0] );

									end
									else
									if((r_sys_firFilter_step==8'hf7)) begin
										r_fld_dataReFiltered0_1_addr_1 <= $signed( w_sys_tmp602[10:0] );

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

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h6f) || (r_sys_firFilter_step==8'ha4) || (r_sys_firFilter_step==8'hd9) || (r_sys_firFilter_step==8'hf7)) begin
										r_fld_dataReFiltered0_1_datain_1 <= w_sys_tmp6;

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
			r_fld_dataReFiltered0_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h6f) || (r_sys_firFilter_step==8'ha4) || (r_sys_firFilter_step==8'hd9) || (r_sys_firFilter_step==8'hf7)) begin
										r_fld_dataReFiltered0_1_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'h9: begin
							r_fld_dataReFiltered0_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_filterFactorNum_2 <= $signed( w_sys_tmp807[15:0] );

		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h3: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_firFilter_n_56 <= $signed( w_sys_intZero[15:0] );

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h0)) begin
										r_firFilter_n_56 <= $signed( w_sys_tmp3[15:0] );

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

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h4b) || (r_sys_firFilter_step==8'h80) || (r_sys_firFilter_step==8'hb5)) begin
										r_sys_tmp0_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h36) || (r_sys_firFilter_step==8'h4a) || (r_sys_firFilter_step==8'h4d) || (r_sys_firFilter_step==8'h53) || (r_sys_firFilter_step==8'h63) || (r_sys_firFilter_step==8'h7f) || (r_sys_firFilter_step==8'h82) || (r_sys_firFilter_step==8'h88) || (r_sys_firFilter_step==8'h98) || (r_sys_firFilter_step==8'hb4) || (r_sys_firFilter_step==8'hb7) || (r_sys_firFilter_step==8'hbd) || (r_sys_firFilter_step==8'hcd)) begin
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
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h26) || (r_sys_firFilter_step==8'h35) || (r_sys_firFilter_step==8'h38) || (r_sys_firFilter_step==8'h41) || (r_sys_firFilter_step==8'h5b) || (r_sys_firFilter_step==8'h62) || (r_sys_firFilter_step==8'h65) || (r_sys_firFilter_step==8'h67) || (r_sys_firFilter_step==8'h76) || (r_sys_firFilter_step==8'h90) || (r_sys_firFilter_step==8'h97) || (r_sys_firFilter_step==8'h9a) || (r_sys_firFilter_step==8'h9c) || (r_sys_firFilter_step==8'hab) || (r_sys_firFilter_step==8'hc5) || (r_sys_firFilter_step==8'hcc) || (r_sys_firFilter_step==8'hcf) || (r_sys_firFilter_step==8'hd1)) begin
										r_sys_tmp2_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h1e) || (r_sys_firFilter_step==8'h2e) || (r_sys_firFilter_step==8'h39) || (r_sys_firFilter_step==8'h3d) || (r_sys_firFilter_step==8'h47) || (r_sys_firFilter_step==8'h52) || (r_sys_firFilter_step==8'h55) || (r_sys_firFilter_step==8'h57) || (r_sys_firFilter_step==8'h5a) || (r_sys_firFilter_step==8'h5d) || (r_sys_firFilter_step==8'h5f) || (r_sys_firFilter_step==8'h6b) || (r_sys_firFilter_step==8'h6e) || (r_sys_firFilter_step==8'h74) || (r_sys_firFilter_step==8'h75) || (r_sys_firFilter_step==8'h78) || (r_sys_firFilter_step==8'ha0) || (r_sys_firFilter_step==8'ha3) || (r_sys_firFilter_step==8'ha9) || (r_sys_firFilter_step==8'haa) || (r_sys_firFilter_step==8'had) || (r_sys_firFilter_step==8'hd5) || (r_sys_firFilter_step==8'hd8) || (r_sys_firFilter_step==8'he2)) begin
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
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h3c) || (r_sys_firFilter_step==8'h3e) || (r_sys_firFilter_step==8'h71) || (r_sys_firFilter_step==8'h73) || (r_sys_firFilter_step==8'ha6) || (r_sys_firFilter_step==8'ha8) || (r_sys_firFilter_step==8'haa) || (r_sys_firFilter_step==8'hac) || (r_sys_firFilter_step==8'hae) || (r_sys_firFilter_step==8'hb0) || (r_sys_firFilter_step==8'hb2) || (r_sys_firFilter_step==8'hb4) || (r_sys_firFilter_step==8'hb6) || (r_sys_firFilter_step==8'hb8) || (r_sys_firFilter_step==8'hba) || (r_sys_firFilter_step==8'hbc) || (r_sys_firFilter_step==8'hbe) || (r_sys_firFilter_step==8'hc0) || (r_sys_firFilter_step==8'hc2) || (r_sys_firFilter_step==8'hc4) || (r_sys_firFilter_step==8'hc6) || (r_sys_firFilter_step==8'hc8) || (r_sys_firFilter_step==8'hca) || (r_sys_firFilter_step==8'hcc) || (r_sys_firFilter_step==8'hce) || (r_sys_firFilter_step==8'hd0) || (r_sys_firFilter_step==8'hd2) || (r_sys_firFilter_step==8'hd4) || (r_sys_firFilter_step==8'hd6) || (r_sys_firFilter_step==8'hd8) || (r_sys_firFilter_step==8'hda)) begin
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

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h15) || (r_sys_firFilter_step==8'h18) || (r_sys_firFilter_step==8'h1d) || (r_sys_firFilter_step==8'h20) || (r_sys_firFilter_step==8'h25) || (r_sys_firFilter_step==8'h28) || (r_sys_firFilter_step==8'h2d) || (r_sys_firFilter_step==8'h30) || (r_sys_firFilter_step==8'h32) || (r_sys_firFilter_step==8'h3f) || (r_sys_firFilter_step==8'h40) || (r_sys_firFilter_step==8'h43) || (r_sys_firFilter_step==8'h6a) || (r_sys_firFilter_step==8'h6d) || (r_sys_firFilter_step==8'h72) || (r_sys_firFilter_step==8'h7c) || (r_sys_firFilter_step==8'h87) || (r_sys_firFilter_step==8'h8a) || (r_sys_firFilter_step==8'h8c) || (r_sys_firFilter_step==8'h8f) || (r_sys_firFilter_step==8'h92) || (r_sys_firFilter_step==8'h94) || (r_sys_firFilter_step==8'h9f) || (r_sys_firFilter_step==8'ha2) || (r_sys_firFilter_step==8'ha7) || (r_sys_firFilter_step==8'hb1) || (r_sys_firFilter_step==8'hbc) || (r_sys_firFilter_step==8'hbf) || (r_sys_firFilter_step==8'hc1) || (r_sys_firFilter_step==8'hc4) || (r_sys_firFilter_step==8'hc7) || (r_sys_firFilter_step==8'hc9) || (r_sys_firFilter_step==8'hd4) || (r_sys_firFilter_step==8'hd7) || (r_sys_firFilter_step==8'hdc) || (r_sys_firFilter_step==8'he4)) begin
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
				2'h1: begin

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'hd) || (r_sys_firFilter_step==8'h11) || (r_sys_firFilter_step==8'h14) || (r_sys_firFilter_step==8'h19) || (r_sys_firFilter_step==8'h1c) || (r_sys_firFilter_step==8'h21) || (r_sys_firFilter_step==8'h24) || (r_sys_firFilter_step==8'h29) || (r_sys_firFilter_step==8'h2c) || (r_sys_firFilter_step==8'h31) || (r_sys_firFilter_step==8'h34) || (r_sys_firFilter_step==8'h3c) || (r_sys_firFilter_step==8'h42) || (r_sys_firFilter_step==8'h45) || (r_sys_firFilter_step==8'h46) || (r_sys_firFilter_step==8'h49) || (r_sys_firFilter_step==8'h4e) || (r_sys_firFilter_step==8'h51) || (r_sys_firFilter_step==8'h56) || (r_sys_firFilter_step==8'h59) || (r_sys_firFilter_step==8'h5e) || (r_sys_firFilter_step==8'h61) || (r_sys_firFilter_step==8'h66) || (r_sys_firFilter_step==8'h69) || (r_sys_firFilter_step==8'h71) || (r_sys_firFilter_step==8'h77) || (r_sys_firFilter_step==8'h7a) || (r_sys_firFilter_step==8'h7b) || (r_sys_firFilter_step==8'h7e) || (r_sys_firFilter_step==8'h83) || (r_sys_firFilter_step==8'h86) || (r_sys_firFilter_step==8'h8b) || (r_sys_firFilter_step==8'h8e) || (r_sys_firFilter_step==8'h93) || (r_sys_firFilter_step==8'h96) || (r_sys_firFilter_step==8'h9b) || (r_sys_firFilter_step==8'h9e) || (r_sys_firFilter_step==8'ha6) || (r_sys_firFilter_step==8'hac) || (r_sys_firFilter_step==8'haf) || (r_sys_firFilter_step==8'hb0) || (r_sys_firFilter_step==8'hb3) || (r_sys_firFilter_step==8'hb8) || (r_sys_firFilter_step==8'hbb) || (r_sys_firFilter_step==8'hc0) || (r_sys_firFilter_step==8'hc3) || (r_sys_firFilter_step==8'hc8) || (r_sys_firFilter_step==8'hcb) || (r_sys_firFilter_step==8'hd0) || (r_sys_firFilter_step==8'hd3) || (r_sys_firFilter_step==8'hdb) || (r_sys_firFilter_step==8'he0)) begin
										r_sys_tmp6_float <= w_ip_AddFloat_result_0;

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

					case(r_sys_firFilter_phase) 
						4'h7: begin

							case(r_sys_firFilter_stage) 
								2'h0: begin
									if((r_sys_firFilter_step==8'h7) || (r_sys_firFilter_step==8'h9) || (r_sys_firFilter_step==8'hb) || (r_sys_firFilter_step==8'hd) || (r_sys_firFilter_step==8'hf) || (r_sys_firFilter_step==8'h11) || (r_sys_firFilter_step==8'h13) || (r_sys_firFilter_step==8'h15) || (r_sys_firFilter_step==8'h17) || (r_sys_firFilter_step==8'h19) || (r_sys_firFilter_step==8'h1b) || (r_sys_firFilter_step==8'h1d) || (r_sys_firFilter_step==8'h1f) || (r_sys_firFilter_step==8'h21) || (r_sys_firFilter_step==8'h23) || (r_sys_firFilter_step==8'h25) || (r_sys_firFilter_step==8'h27) || (r_sys_firFilter_step==8'h29) || (r_sys_firFilter_step==8'h2b) || (r_sys_firFilter_step==8'h2d) || (r_sys_firFilter_step==8'h2f) || (r_sys_firFilter_step==8'h31) || (r_sys_firFilter_step==8'h33) || (r_sys_firFilter_step==8'h35) || (r_sys_firFilter_step==8'h37) || (r_sys_firFilter_step==8'h39) || (r_sys_firFilter_step==8'h3b) || (r_sys_firFilter_step==8'h40) || (r_sys_firFilter_step==8'h42) || (r_sys_firFilter_step==8'h44) || (r_sys_firFilter_step==8'h46) || (r_sys_firFilter_step==8'h48) || (r_sys_firFilter_step==8'h4a) || (r_sys_firFilter_step==8'h4c) || (r_sys_firFilter_step==8'h4e) || (r_sys_firFilter_step==8'h50) || (r_sys_firFilter_step==8'h52) || (r_sys_firFilter_step==8'h54) || (r_sys_firFilter_step==8'h56) || (r_sys_firFilter_step==8'h58) || (r_sys_firFilter_step==8'h5a) || (r_sys_firFilter_step==8'h5c) || (r_sys_firFilter_step==8'h5e) || (r_sys_firFilter_step==8'h60) || (r_sys_firFilter_step==8'h62) || (r_sys_firFilter_step==8'h64) || (r_sys_firFilter_step==8'h66) || (r_sys_firFilter_step==8'h68) || (r_sys_firFilter_step==8'h6a) || (r_sys_firFilter_step==8'h6c) || (r_sys_firFilter_step==8'h6e) || (r_sys_firFilter_step==8'h70) || (r_sys_firFilter_step==8'h75) || (r_sys_firFilter_step==8'h77) || (r_sys_firFilter_step==8'h79) || (r_sys_firFilter_step==8'h7b) || (r_sys_firFilter_step==8'h7d) || (r_sys_firFilter_step==8'h7f) || (r_sys_firFilter_step==8'h81) || (r_sys_firFilter_step==8'h83) || (r_sys_firFilter_step==8'h85) || (r_sys_firFilter_step==8'h87) || (r_sys_firFilter_step==8'h89) || (r_sys_firFilter_step==8'h8b) || (r_sys_firFilter_step==8'h8d) || (r_sys_firFilter_step==8'h8f) || (r_sys_firFilter_step==8'h91) || (r_sys_firFilter_step==8'h93) || (r_sys_firFilter_step==8'h95) || (r_sys_firFilter_step==8'h97) || (r_sys_firFilter_step==8'h99) || (r_sys_firFilter_step==8'h9b) || (r_sys_firFilter_step==8'h9d) || (r_sys_firFilter_step==8'h9f) || (r_sys_firFilter_step==8'ha1) || (r_sys_firFilter_step==8'ha3) || (r_sys_firFilter_step==8'ha5)) begin
										r_sys_tmp7_float <= w_ip_MultFloat_product_0;

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
