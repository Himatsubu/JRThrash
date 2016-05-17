/*
TimeStamp:	2013/12/16		12:59
*/


module FixedFilter(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_fixedFilter_req,	
	output                o_fixedFilter_busy,	
	input  signed  [15:0] i_fld_filterCoef0_0,	
	input  signed  [15:0] i_fld_filterCoef1_1,	
	input  signed  [15:0] i_fld_filterCoef2_2,	
	input  signed  [15:0] i_fld_filterCoef3_3,	
	input  signed  [15:0] i_fld_filterCoef4_4,	
	input  signed  [15:0] i_fld_filterCoef5_5,	
	input  signed  [15:0] i_fld_filterCoef6_6,	
	input  signed  [15:0] i_fld_filterCoef7_7,	
	input  signed  [15:0] i_fld_filterCoef8_8,	
	input  signed  [15:0] i_fld_filterCoef9_9,	
	input  signed  [15:0] i_fld_filterCoef10_10,	
	input  signed  [15:0] i_fld_filterCoef11_11,	
	input  signed  [15:0] i_fld_filterCoef12_12,	
	input  signed  [15:0] i_fld_filterCoef13_13,	
	input  signed  [15:0] i_fld_filterCoef14_14,	
	input  signed  [15:0] i_fld_filterCoef15_15,	
	input  signed  [15:0] i_fld_filterCoef16_16,	
	input  signed  [15:0] i_fld_filterCoef17_17,	
	input  signed  [15:0] i_fld_filterCoef18_18,	
	input  signed  [15:0] i_fld_filterCoef19_19,	
	input  signed  [15:0] i_fld_filterCoef20_20,	
	input  signed  [15:0] i_fld_filterCoef21_21,	
	input  signed  [15:0] i_fld_filterCoef22_22,	
	input  signed  [15:0] i_fld_filterCoef23_23,	
	input  signed  [15:0] i_fld_filterCoef24_24,	
	input  signed  [15:0] i_fld_filterCoef25_25,	
	input  signed  [15:0] i_fld_filterCoef26_26,	
	input  signed  [15:0] i_fld_filterCoef27_27,	
	input  signed  [15:0] i_fld_filterCoef28_28,	
	input  signed  [15:0] i_fld_filterCoef29_29,	
	input  signed  [15:0] i_fld_filterCoef30_30,	
	input  signed  [15:0] i_fld_filterCoef31_31,	
	input  signed  [15:0] i_fld_filterCoef32_32,	
	input  signed  [15:0] i_fld_filterCoef33_33,	
	input  signed  [15:0] i_fld_filterCoef34_34,	
	input  signed  [15:0] i_fld_filterCoef35_35,	
	input  signed  [15:0] i_fld_filterCoef36_36,	
	input  signed  [15:0] i_fld_filterCoef37_37,	
	input  signed  [15:0] i_fld_filterCoef38_38,	
	input  signed  [15:0] i_fld_filterCoef39_39,	
	input  signed  [15:0] i_fld_filterCoef40_40,	
	input  signed  [15:0] i_fld_filterCoef41_41,	
	input  signed  [15:0] i_fld_filterCoef42_42,	
	input  signed  [15:0] i_fld_filterCoef43_43,	
	input  signed  [15:0] i_fld_filterCoef44_44,	
	input  signed  [31:0] i_fixedFilter_pointNum_90,	
	output signed  [31:0] o_fixedFilter_dataRe_91_addr,	
	output signed  [15:0] o_fixedFilter_dataRe_91_datain,	
	input  signed  [15:0] i_fixedFilter_dataRe_91_dataout,	
	output                o_fixedFilter_dataRe_91_r_w,	
	output                o_fixedFilter_dataRe_91_ce,	
	output signed  [31:0] o_fixedFilter_dataReFiltered_92_addr,	
	output signed  [31:0] o_fixedFilter_dataReFiltered_92_datain,	
	input  signed  [31:0] i_fixedFilter_dataReFiltered_92_dataout,	
	output                o_fixedFilter_dataReFiltered_92_r_w,	
	output                o_fixedFilter_dataReFiltered_92_ce	
);

	reg  signed [15:0] r_ip_MultInt_multiplicand_0;
	reg  signed [15:0] r_ip_MultInt_multiplier_0;
	wire signed [31:0] w_ip_MultInt_product_0;
	reg  signed [15:0] r_ip_MultInt_multiplicand_1;
	reg  signed [15:0] r_ip_MultInt_multiplier_1;
	wire signed [31:0] w_ip_MultInt_product_1;
	reg  signed [15:0] r_ip_MultInt_multiplicand_2;
	reg  signed [15:0] r_ip_MultInt_multiplier_2;
	wire signed [31:0] w_ip_MultInt_product_2;
	reg  signed [15:0] r_ip_MultInt_multiplicand_3;
	reg  signed [15:0] r_ip_MultInt_multiplier_3;
	wire signed [31:0] w_ip_MultInt_product_3;
	reg  signed [15:0] r_ip_MultInt_multiplicand_4;
	reg  signed [15:0] r_ip_MultInt_multiplier_4;
	wire signed [31:0] w_ip_MultInt_product_4;
	reg  signed [15:0] r_ip_MultInt_multiplicand_5;
	reg  signed [15:0] r_ip_MultInt_multiplier_5;
	wire signed [31:0] w_ip_MultInt_product_5;
	reg  signed [15:0] r_ip_MultInt_multiplicand_6;
	reg  signed [15:0] r_ip_MultInt_multiplier_6;
	wire signed [31:0] w_ip_MultInt_product_6;
	reg  signed [15:0] r_ip_MultInt_multiplicand_7;
	reg  signed [15:0] r_ip_MultInt_multiplier_7;
	wire signed [31:0] w_ip_MultInt_product_7;
	reg  signed [15:0] r_ip_MultInt_multiplicand_8;
	reg  signed [15:0] r_ip_MultInt_multiplier_8;
	wire signed [31:0] w_ip_MultInt_product_8;
	reg  signed [15:0] r_ip_MultInt_multiplicand_9;
	reg  signed [15:0] r_ip_MultInt_multiplier_9;
	wire signed [31:0] w_ip_MultInt_product_9;
	reg  signed [15:0] r_ip_MultInt_multiplicand_10;
	reg  signed [15:0] r_ip_MultInt_multiplier_10;
	wire signed [31:0] w_ip_MultInt_product_10;
	reg  signed [15:0] r_ip_MultInt_multiplicand_11;
	reg  signed [15:0] r_ip_MultInt_multiplier_11;
	wire signed [31:0] w_ip_MultInt_product_11;
	reg  signed [15:0] r_ip_MultInt_multiplicand_12;
	reg  signed [15:0] r_ip_MultInt_multiplier_12;
	wire signed [31:0] w_ip_MultInt_product_12;
	reg  signed [15:0] r_ip_MultInt_multiplicand_13;
	reg  signed [15:0] r_ip_MultInt_multiplier_13;
	wire signed [31:0] w_ip_MultInt_product_13;
	reg  signed [15:0] r_ip_MultInt_multiplicand_14;
	reg  signed [15:0] r_ip_MultInt_multiplier_14;
	wire signed [31:0] w_ip_MultInt_product_14;
	reg  signed [15:0] r_ip_MultInt_multiplicand_15;
	reg  signed [15:0] r_ip_MultInt_multiplier_15;
	wire signed [31:0] w_ip_MultInt_product_15;
	reg  signed [15:0] r_ip_MultInt_multiplicand_16;
	reg  signed [15:0] r_ip_MultInt_multiplier_16;
	wire signed [31:0] w_ip_MultInt_product_16;
	reg  signed [15:0] r_ip_MultInt_multiplicand_17;
	reg  signed [15:0] r_ip_MultInt_multiplier_17;
	wire signed [31:0] w_ip_MultInt_product_17;
	reg  signed [15:0] r_ip_MultInt_multiplicand_18;
	reg  signed [15:0] r_ip_MultInt_multiplier_18;
	wire signed [31:0] w_ip_MultInt_product_18;
	reg  signed [15:0] r_ip_MultInt_multiplicand_19;
	reg  signed [15:0] r_ip_MultInt_multiplier_19;
	wire signed [31:0] w_ip_MultInt_product_19;
	reg  signed [15:0] r_ip_MultInt_multiplicand_20;
	reg  signed [15:0] r_ip_MultInt_multiplier_20;
	wire signed [31:0] w_ip_MultInt_product_20;
	reg  signed [15:0] r_ip_MultInt_multiplicand_21;
	reg  signed [15:0] r_ip_MultInt_multiplier_21;
	wire signed [31:0] w_ip_MultInt_product_21;
	reg  signed [15:0] r_ip_MultInt_multiplicand_22;
	reg  signed [15:0] r_ip_MultInt_multiplier_22;
	wire signed [31:0] w_ip_MultInt_product_22;
	reg  signed [15:0] r_ip_MultInt_multiplicand_23;
	reg  signed [15:0] r_ip_MultInt_multiplier_23;
	wire signed [31:0] w_ip_MultInt_product_23;
	reg  signed [15:0] r_ip_MultInt_multiplicand_24;
	reg  signed [15:0] r_ip_MultInt_multiplier_24;
	wire signed [31:0] w_ip_MultInt_product_24;
	reg  signed [15:0] r_ip_MultInt_multiplicand_25;
	reg  signed [15:0] r_ip_MultInt_multiplier_25;
	wire signed [31:0] w_ip_MultInt_product_25;
	reg  signed [15:0] r_ip_MultInt_multiplicand_26;
	reg  signed [15:0] r_ip_MultInt_multiplier_26;
	wire signed [31:0] w_ip_MultInt_product_26;
	reg  signed [15:0] r_ip_MultInt_multiplicand_27;
	reg  signed [15:0] r_ip_MultInt_multiplier_27;
	wire signed [31:0] w_ip_MultInt_product_27;
	reg  signed [15:0] r_ip_MultInt_multiplicand_28;
	reg  signed [15:0] r_ip_MultInt_multiplier_28;
	wire signed [31:0] w_ip_MultInt_product_28;
	reg  signed [15:0] r_ip_MultInt_multiplicand_29;
	reg  signed [15:0] r_ip_MultInt_multiplier_29;
	wire signed [31:0] w_ip_MultInt_product_29;
	reg  signed [15:0] r_ip_MultInt_multiplicand_30;
	reg  signed [15:0] r_ip_MultInt_multiplier_30;
	wire signed [31:0] w_ip_MultInt_product_30;
	reg  signed [15:0] r_ip_MultInt_multiplicand_31;
	reg  signed [15:0] r_ip_MultInt_multiplier_31;
	wire signed [31:0] w_ip_MultInt_product_31;
	reg  signed [15:0] r_ip_MultInt_multiplicand_32;
	reg  signed [15:0] r_ip_MultInt_multiplier_32;
	wire signed [31:0] w_ip_MultInt_product_32;
	reg  signed [15:0] r_ip_MultInt_multiplicand_33;
	reg  signed [15:0] r_ip_MultInt_multiplier_33;
	wire signed [31:0] w_ip_MultInt_product_33;
	reg  signed [15:0] r_ip_MultInt_multiplicand_34;
	reg  signed [15:0] r_ip_MultInt_multiplier_34;
	wire signed [31:0] w_ip_MultInt_product_34;
	reg  signed [15:0] r_ip_MultInt_multiplicand_35;
	reg  signed [15:0] r_ip_MultInt_multiplier_35;
	wire signed [31:0] w_ip_MultInt_product_35;
	reg  signed [15:0] r_ip_MultInt_multiplicand_36;
	reg  signed [15:0] r_ip_MultInt_multiplier_36;
	wire signed [31:0] w_ip_MultInt_product_36;
	reg  signed [15:0] r_ip_MultInt_multiplicand_37;
	reg  signed [15:0] r_ip_MultInt_multiplier_37;
	wire signed [31:0] w_ip_MultInt_product_37;
	reg  signed [15:0] r_ip_MultInt_multiplicand_38;
	reg  signed [15:0] r_ip_MultInt_multiplier_38;
	wire signed [31:0] w_ip_MultInt_product_38;
	reg  signed [15:0] r_ip_MultInt_multiplicand_39;
	reg  signed [15:0] r_ip_MultInt_multiplier_39;
	wire signed [31:0] w_ip_MultInt_product_39;
	reg  signed [15:0] r_ip_MultInt_multiplicand_40;
	reg  signed [15:0] r_ip_MultInt_multiplier_40;
	wire signed [31:0] w_ip_MultInt_product_40;
	reg  signed [15:0] r_ip_MultInt_multiplicand_41;
	reg  signed [15:0] r_ip_MultInt_multiplier_41;
	wire signed [31:0] w_ip_MultInt_product_41;
	reg  signed [15:0] r_ip_MultInt_multiplicand_42;
	reg  signed [15:0] r_ip_MultInt_multiplier_42;
	wire signed [31:0] w_ip_MultInt_product_42;
	reg  signed [15:0] r_ip_MultInt_multiplicand_43;
	reg  signed [15:0] r_ip_MultInt_multiplier_43;
	wire signed [31:0] w_ip_MultInt_product_43;
	reg  signed [15:0] r_ip_MultInt_multiplicand_44;
	reg  signed [15:0] r_ip_MultInt_multiplier_44;
	wire signed [31:0] w_ip_MultInt_product_44;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 1:0] r_sys_fixedFilter_caller;
	reg                r_sys_fixedFilter_req;
	reg         [ 3:0] r_sys_fixedFilter_phase;
	reg         [ 1:0] r_sys_fixedFilter_stage;
	reg         [ 2:0] r_sys_fixedFilter_step;
	reg                r_sys_fixedFilter_busy;
	wire        [ 1:0] w_sys_fixedFilter_stage_p1;
	wire        [ 2:0] w_sys_fixedFilter_step_p1;
	reg  signed [31:0] r_fld_bufRegister0_45;
	reg  signed [31:0] r_fld_bufRegister1_46;
	reg  signed [31:0] r_fld_bufRegister2_47;
	reg  signed [31:0] r_fld_bufRegister3_48;
	reg  signed [31:0] r_fld_bufRegister4_49;
	reg  signed [31:0] r_fld_bufRegister5_50;
	reg  signed [31:0] r_fld_bufRegister6_51;
	reg  signed [31:0] r_fld_bufRegister7_52;
	reg  signed [31:0] r_fld_bufRegister8_53;
	reg  signed [31:0] r_fld_bufRegister9_54;
	reg  signed [31:0] r_fld_bufRegister10_55;
	reg  signed [31:0] r_fld_bufRegister11_56;
	reg  signed [31:0] r_fld_bufRegister12_57;
	reg  signed [31:0] r_fld_bufRegister13_58;
	reg  signed [31:0] r_fld_bufRegister14_59;
	reg  signed [31:0] r_fld_bufRegister15_60;
	reg  signed [31:0] r_fld_bufRegister16_61;
	reg  signed [31:0] r_fld_bufRegister17_62;
	reg  signed [31:0] r_fld_bufRegister18_63;
	reg  signed [31:0] r_fld_bufRegister19_64;
	reg  signed [31:0] r_fld_bufRegister20_65;
	reg  signed [31:0] r_fld_bufRegister21_66;
	reg  signed [31:0] r_fld_bufRegister22_67;
	reg  signed [31:0] r_fld_bufRegister23_68;
	reg  signed [31:0] r_fld_bufRegister24_69;
	reg  signed [31:0] r_fld_bufRegister25_70;
	reg  signed [31:0] r_fld_bufRegister26_71;
	reg  signed [31:0] r_fld_bufRegister27_72;
	reg  signed [31:0] r_fld_bufRegister28_73;
	reg  signed [31:0] r_fld_bufRegister29_74;
	reg  signed [31:0] r_fld_bufRegister30_75;
	reg  signed [31:0] r_fld_bufRegister31_76;
	reg  signed [31:0] r_fld_bufRegister32_77;
	reg  signed [31:0] r_fld_bufRegister33_78;
	reg  signed [31:0] r_fld_bufRegister34_79;
	reg  signed [31:0] r_fld_bufRegister35_80;
	reg  signed [31:0] r_fld_bufRegister36_81;
	reg  signed [31:0] r_fld_bufRegister37_82;
	reg  signed [31:0] r_fld_bufRegister38_83;
	reg  signed [31:0] r_fld_bufRegister39_84;
	reg  signed [31:0] r_fld_bufRegister40_85;
	reg  signed [31:0] r_fld_bufRegister41_86;
	reg  signed [31:0] r_fld_bufRegister42_87;
	reg  signed [31:0] r_fld_bufRegister43_88;
	reg  signed [31:0] r_fld_bufRegister44_89;
	reg  signed [31:0] r_fixedFilter_pointNum_90;
	reg  signed [31:0] r_fixedFilter_dataRe_91_addr;
	reg  signed [15:0] r_fixedFilter_dataRe_91_datain;
	wire signed [15:0] w_fixedFilter_dataRe_91_dataout;
	reg                r_fixedFilter_dataRe_91_r_w;
	wire signed [31:0] w_fixedFilter_dataRe_91_addr;
	wire signed [15:0] w_fixedFilter_dataRe_91_datain;
	wire               w_fixedFilter_dataRe_91_r_w;
	wire               w_fixedFilter_dataRe_91_ce;
	wire               w_fixedFilter_dataRe_91_cacheHit;
	reg  signed [31:0] r_fixedFilter_dataReFiltered_92_addr;
	reg  signed [31:0] r_fixedFilter_dataReFiltered_92_datain;
	wire signed [31:0] w_fixedFilter_dataReFiltered_92_dataout;
	reg                r_fixedFilter_dataReFiltered_92_r_w;
	wire signed [31:0] w_fixedFilter_dataReFiltered_92_addr;
	wire signed [31:0] w_fixedFilter_dataReFiltered_92_datain;
	wire               w_fixedFilter_dataReFiltered_92_r_w;
	wire               w_fixedFilter_dataReFiltered_92_ce;
	wire               w_fixedFilter_dataReFiltered_92_cacheHit;
	reg  signed [15:0] r_fixedFilter_xn_93;
	reg  signed [31:0] r_fixedFilter_n_94;
	wire signed [31:0] w_sys_tmp1;
	wire               w_sys_tmp2;
	wire signed [31:0] w_sys_tmp6;
	wire signed [31:0] w_sys_tmp7;
	wire signed [31:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp11;
	wire signed [31:0] w_sys_tmp12;
	wire signed [31:0] w_sys_tmp13;
	wire signed [31:0] w_sys_tmp14;
	wire signed [31:0] w_sys_tmp15;
	wire signed [31:0] w_sys_tmp16;
	wire signed [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire signed [31:0] w_sys_tmp19;
	wire signed [31:0] w_sys_tmp20;
	wire signed [31:0] w_sys_tmp21;
	wire signed [31:0] w_sys_tmp22;
	wire signed [31:0] w_sys_tmp23;
	wire signed [31:0] w_sys_tmp24;
	wire signed [31:0] w_sys_tmp25;
	wire signed [31:0] w_sys_tmp26;
	wire signed [31:0] w_sys_tmp27;
	wire signed [31:0] w_sys_tmp28;
	wire signed [31:0] w_sys_tmp29;
	wire signed [31:0] w_sys_tmp30;
	wire signed [31:0] w_sys_tmp31;
	wire signed [31:0] w_sys_tmp32;
	wire signed [31:0] w_sys_tmp33;
	wire signed [31:0] w_sys_tmp34;
	wire signed [31:0] w_sys_tmp35;
	wire signed [31:0] w_sys_tmp36;
	wire signed [31:0] w_sys_tmp37;
	wire signed [31:0] w_sys_tmp38;
	wire signed [31:0] w_sys_tmp39;
	wire signed [31:0] w_sys_tmp40;
	wire signed [31:0] w_sys_tmp41;
	wire signed [31:0] w_sys_tmp42;
	wire signed [31:0] w_sys_tmp43;
	wire signed [31:0] w_sys_tmp44;
	wire signed [31:0] w_sys_tmp45;
	wire signed [31:0] w_sys_tmp46;
	wire signed [31:0] w_sys_tmp47;
	wire signed [31:0] w_sys_tmp48;
	wire signed [31:0] w_sys_tmp49;
	wire signed [31:0] w_sys_tmp50;
	wire signed [31:0] w_sys_tmp51;
	wire signed [31:0] w_sys_tmp52;
	wire signed [31:0] w_sys_tmp53;
	wire signed [31:0] w_sys_tmp54;
	wire signed [31:0] w_sys_tmp55;
	wire signed [31:0] w_sys_tmp56;
	wire signed [31:0] w_sys_tmp57;
	wire signed [31:0] w_sys_tmp58;
	wire signed [31:0] w_sys_tmp59;
	wire signed [31:0] w_sys_tmp60;
	wire signed [31:0] w_sys_tmp61;
	wire signed [31:0] w_sys_tmp62;
	wire signed [31:0] w_sys_tmp63;
	wire signed [31:0] w_sys_tmp64;
	wire signed [31:0] w_sys_tmp65;
	wire signed [31:0] w_sys_tmp66;
	wire signed [31:0] w_sys_tmp67;
	wire signed [31:0] w_sys_tmp68;
	wire signed [31:0] w_sys_tmp69;
	wire signed [31:0] w_sys_tmp70;
	wire signed [31:0] w_sys_tmp71;
	wire signed [31:0] w_sys_tmp72;
	wire signed [31:0] w_sys_tmp73;
	wire signed [31:0] w_sys_tmp74;
	wire signed [31:0] w_sys_tmp75;
	wire signed [31:0] w_sys_tmp76;
	wire signed [31:0] w_sys_tmp77;
	wire signed [31:0] w_sys_tmp78;
	wire signed [31:0] w_sys_tmp79;
	wire signed [31:0] w_sys_tmp80;
	wire signed [31:0] w_sys_tmp81;
	wire signed [31:0] w_sys_tmp82;
	wire signed [31:0] w_sys_tmp83;
	wire signed [31:0] w_sys_tmp84;
	wire signed [31:0] w_sys_tmp85;
	wire signed [31:0] w_sys_tmp86;
	wire signed [31:0] w_sys_tmp87;
	wire signed [31:0] w_sys_tmp88;
	wire signed [31:0] w_sys_tmp89;
	wire signed [31:0] w_sys_tmp90;
	wire signed [31:0] w_sys_tmp91;
	wire signed [31:0] w_sys_tmp92;
	wire signed [31:0] w_sys_tmp93;
	wire signed [31:0] w_sys_tmp94;
	wire signed [31:0] w_sys_tmp95;
	wire signed [31:0] w_sys_tmp96;
	wire signed [31:0] w_sys_tmp101;
	wire signed [31:0] w_sys_tmp234;
	wire signed [31:0] w_sys_tmp235;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_fixedFilter_dataRe_91_cacheHit & w_fixedFilter_dataReFiltered_92_cacheHit;
	assign o_fixedFilter_busy = r_sys_fixedFilter_busy;
	assign w_sys_fixedFilter_stage_p1 = (r_sys_fixedFilter_stage + 2'h1);
	assign w_sys_fixedFilter_step_p1 = (r_sys_fixedFilter_step + 3'h1);
	assign w_fixedFilter_dataRe_91_dataout = i_fixedFilter_dataRe_91_dataout;
	assign w_fixedFilter_dataRe_91_addr = r_fixedFilter_dataRe_91_addr;
	assign w_fixedFilter_dataRe_91_datain = r_fixedFilter_dataRe_91_datain;
	assign w_fixedFilter_dataRe_91_r_w = r_fixedFilter_dataRe_91_r_w;
	assign w_fixedFilter_dataRe_91_ce = w_sys_ce;
	assign w_fixedFilter_dataRe_91_cacheHit = w_sys_boolTrue;
	assign o_fixedFilter_dataRe_91_addr = w_fixedFilter_dataRe_91_addr;
	assign o_fixedFilter_dataRe_91_datain = w_fixedFilter_dataRe_91_datain;
	assign o_fixedFilter_dataRe_91_r_w = w_fixedFilter_dataRe_91_r_w;
	assign o_fixedFilter_dataRe_91_ce = w_fixedFilter_dataRe_91_ce;
	assign w_fixedFilter_dataReFiltered_92_dataout = i_fixedFilter_dataReFiltered_92_dataout;
	assign w_fixedFilter_dataReFiltered_92_addr = r_fixedFilter_dataReFiltered_92_addr;
	assign w_fixedFilter_dataReFiltered_92_datain = r_fixedFilter_dataReFiltered_92_datain;
	assign w_fixedFilter_dataReFiltered_92_r_w = r_fixedFilter_dataReFiltered_92_r_w;
	assign w_fixedFilter_dataReFiltered_92_ce = w_sys_ce;
	assign w_fixedFilter_dataReFiltered_92_cacheHit = w_sys_boolTrue;
	assign o_fixedFilter_dataReFiltered_92_addr = w_fixedFilter_dataReFiltered_92_addr;
	assign o_fixedFilter_dataReFiltered_92_datain = w_fixedFilter_dataReFiltered_92_datain;
	assign o_fixedFilter_dataReFiltered_92_r_w = w_fixedFilter_dataReFiltered_92_r_w;
	assign o_fixedFilter_dataReFiltered_92_ce = w_fixedFilter_dataReFiltered_92_ce;
	assign w_sys_tmp1 = $signed( {{16{w_fixedFilter_dataRe_91_dataout[15]}}, w_fixedFilter_dataRe_91_dataout} );
	assign w_sys_tmp2 = (r_fixedFilter_n_94 < r_fixedFilter_pointNum_90);
	assign w_sys_tmp6 = (w_sys_tmp7 + r_fld_bufRegister1_46);
	assign w_sys_tmp7 = w_ip_MultInt_product_0;
	assign w_sys_tmp8 = (w_sys_tmp9 + r_fld_bufRegister2_47);
	assign w_sys_tmp9 = w_ip_MultInt_product_1;
	assign w_sys_tmp10 = (w_sys_tmp11 + r_fld_bufRegister3_48);
	assign w_sys_tmp11 = w_ip_MultInt_product_2;
	assign w_sys_tmp12 = (w_sys_tmp13 + r_fld_bufRegister4_49);
	assign w_sys_tmp13 = w_ip_MultInt_product_3;
	assign w_sys_tmp14 = (w_sys_tmp15 + r_fld_bufRegister5_50);
	assign w_sys_tmp15 = w_ip_MultInt_product_4;
	assign w_sys_tmp16 = (w_sys_tmp17 + r_fld_bufRegister6_51);
	assign w_sys_tmp17 = w_ip_MultInt_product_5;
	assign w_sys_tmp18 = (w_sys_tmp19 + r_fld_bufRegister7_52);
	assign w_sys_tmp19 = w_ip_MultInt_product_6;
	assign w_sys_tmp20 = (w_sys_tmp21 + r_fld_bufRegister8_53);
	assign w_sys_tmp21 = w_ip_MultInt_product_7;
	assign w_sys_tmp22 = (w_sys_tmp23 + r_fld_bufRegister9_54);
	assign w_sys_tmp23 = w_ip_MultInt_product_8;
	assign w_sys_tmp24 = (w_sys_tmp25 + r_fld_bufRegister10_55);
	assign w_sys_tmp25 = w_ip_MultInt_product_9;
	assign w_sys_tmp26 = (w_sys_tmp27 + r_fld_bufRegister11_56);
	assign w_sys_tmp27 = w_ip_MultInt_product_10;
	assign w_sys_tmp28 = (w_sys_tmp29 + r_fld_bufRegister12_57);
	assign w_sys_tmp29 = w_ip_MultInt_product_11;
	assign w_sys_tmp30 = (w_sys_tmp31 + r_fld_bufRegister13_58);
	assign w_sys_tmp31 = w_ip_MultInt_product_12;
	assign w_sys_tmp32 = (w_sys_tmp33 + r_fld_bufRegister14_59);
	assign w_sys_tmp33 = w_ip_MultInt_product_13;
	assign w_sys_tmp34 = (w_sys_tmp35 + r_fld_bufRegister15_60);
	assign w_sys_tmp35 = w_ip_MultInt_product_14;
	assign w_sys_tmp36 = (w_sys_tmp37 + r_fld_bufRegister16_61);
	assign w_sys_tmp37 = w_ip_MultInt_product_15;
	assign w_sys_tmp38 = (w_sys_tmp39 + r_fld_bufRegister17_62);
	assign w_sys_tmp39 = w_ip_MultInt_product_16;
	assign w_sys_tmp40 = (w_sys_tmp41 + r_fld_bufRegister18_63);
	assign w_sys_tmp41 = w_ip_MultInt_product_17;
	assign w_sys_tmp42 = (w_sys_tmp43 + r_fld_bufRegister19_64);
	assign w_sys_tmp43 = w_ip_MultInt_product_18;
	assign w_sys_tmp44 = (w_sys_tmp45 + r_fld_bufRegister20_65);
	assign w_sys_tmp45 = w_ip_MultInt_product_19;
	assign w_sys_tmp46 = (w_sys_tmp47 + r_fld_bufRegister21_66);
	assign w_sys_tmp47 = w_ip_MultInt_product_20;
	assign w_sys_tmp48 = (w_sys_tmp49 + r_fld_bufRegister22_67);
	assign w_sys_tmp49 = w_ip_MultInt_product_21;
	assign w_sys_tmp50 = (w_sys_tmp51 + r_fld_bufRegister23_68);
	assign w_sys_tmp51 = w_ip_MultInt_product_22;
	assign w_sys_tmp52 = (w_sys_tmp53 + r_fld_bufRegister24_69);
	assign w_sys_tmp53 = w_ip_MultInt_product_23;
	assign w_sys_tmp54 = (w_sys_tmp55 + r_fld_bufRegister25_70);
	assign w_sys_tmp55 = w_ip_MultInt_product_24;
	assign w_sys_tmp56 = (w_sys_tmp57 + r_fld_bufRegister26_71);
	assign w_sys_tmp57 = w_ip_MultInt_product_25;
	assign w_sys_tmp58 = (w_sys_tmp59 + r_fld_bufRegister27_72);
	assign w_sys_tmp59 = w_ip_MultInt_product_26;
	assign w_sys_tmp60 = (w_sys_tmp61 + r_fld_bufRegister28_73);
	assign w_sys_tmp61 = w_ip_MultInt_product_27;
	assign w_sys_tmp62 = (w_sys_tmp63 + r_fld_bufRegister29_74);
	assign w_sys_tmp63 = w_ip_MultInt_product_28;
	assign w_sys_tmp64 = (w_sys_tmp65 + r_fld_bufRegister30_75);
	assign w_sys_tmp65 = w_ip_MultInt_product_29;
	assign w_sys_tmp66 = (w_sys_tmp67 + r_fld_bufRegister31_76);
	assign w_sys_tmp67 = w_ip_MultInt_product_30;
	assign w_sys_tmp68 = (w_sys_tmp69 + r_fld_bufRegister32_77);
	assign w_sys_tmp69 = w_ip_MultInt_product_31;
	assign w_sys_tmp70 = (w_sys_tmp71 + r_fld_bufRegister33_78);
	assign w_sys_tmp71 = w_ip_MultInt_product_32;
	assign w_sys_tmp72 = (w_sys_tmp73 + r_fld_bufRegister34_79);
	assign w_sys_tmp73 = w_ip_MultInt_product_33;
	assign w_sys_tmp74 = (w_sys_tmp75 + r_fld_bufRegister35_80);
	assign w_sys_tmp75 = w_ip_MultInt_product_34;
	assign w_sys_tmp76 = (w_sys_tmp77 + r_fld_bufRegister36_81);
	assign w_sys_tmp77 = w_ip_MultInt_product_35;
	assign w_sys_tmp78 = (w_sys_tmp79 + r_fld_bufRegister37_82);
	assign w_sys_tmp79 = w_ip_MultInt_product_36;
	assign w_sys_tmp80 = (w_sys_tmp81 + r_fld_bufRegister38_83);
	assign w_sys_tmp81 = w_ip_MultInt_product_37;
	assign w_sys_tmp82 = (w_sys_tmp83 + r_fld_bufRegister39_84);
	assign w_sys_tmp83 = w_ip_MultInt_product_38;
	assign w_sys_tmp84 = (w_sys_tmp85 + r_fld_bufRegister40_85);
	assign w_sys_tmp85 = w_ip_MultInt_product_39;
	assign w_sys_tmp86 = (w_sys_tmp87 + r_fld_bufRegister41_86);
	assign w_sys_tmp87 = w_ip_MultInt_product_40;
	assign w_sys_tmp88 = (w_sys_tmp89 + r_fld_bufRegister42_87);
	assign w_sys_tmp89 = w_ip_MultInt_product_41;
	assign w_sys_tmp90 = (w_sys_tmp91 + r_fld_bufRegister43_88);
	assign w_sys_tmp91 = w_ip_MultInt_product_42;
	assign w_sys_tmp92 = (w_sys_tmp93 + r_fld_bufRegister44_89);
	assign w_sys_tmp93 = w_ip_MultInt_product_43;
	assign w_sys_tmp94 = w_ip_MultInt_product_44;
	assign w_sys_tmp95 = $signed( {{16{w_fixedFilter_dataRe_91_dataout[15]}}, w_fixedFilter_dataRe_91_dataout} );
	assign w_sys_tmp96 = (r_fixedFilter_n_94 + w_sys_intOne);
	assign w_sys_tmp101 = w_sys_tmp95;
	assign w_sys_tmp234 = (r_fixedFilter_n_94 + w_sys_tmp235);
	assign w_sys_tmp235 = 32'sh00000002;


	MultInt
		MultInt_inst_0(
			.a (r_ip_MultInt_multiplicand_0),
			.b (r_ip_MultInt_multiplier_0),
			.p (w_ip_MultInt_product_0)
		);

	MultInt
		MultInt_inst_1(
			.a (r_ip_MultInt_multiplicand_1),
			.b (r_ip_MultInt_multiplier_1),
			.p (w_ip_MultInt_product_1)
		);

	MultInt
		MultInt_inst_2(
			.a (r_ip_MultInt_multiplicand_2),
			.b (r_ip_MultInt_multiplier_2),
			.p (w_ip_MultInt_product_2)
		);

	MultInt
		MultInt_inst_3(
			.a (r_ip_MultInt_multiplicand_3),
			.b (r_ip_MultInt_multiplier_3),
			.p (w_ip_MultInt_product_3)
		);

	MultInt
		MultInt_inst_4(
			.a (r_ip_MultInt_multiplicand_4),
			.b (r_ip_MultInt_multiplier_4),
			.p (w_ip_MultInt_product_4)
		);

	MultInt
		MultInt_inst_5(
			.a (r_ip_MultInt_multiplicand_5),
			.b (r_ip_MultInt_multiplier_5),
			.p (w_ip_MultInt_product_5)
		);

	MultInt
		MultInt_inst_6(
			.a (r_ip_MultInt_multiplicand_6),
			.b (r_ip_MultInt_multiplier_6),
			.p (w_ip_MultInt_product_6)
		);

	MultInt
		MultInt_inst_7(
			.a (r_ip_MultInt_multiplicand_7),
			.b (r_ip_MultInt_multiplier_7),
			.p (w_ip_MultInt_product_7)
		);

	MultInt
		MultInt_inst_8(
			.a (r_ip_MultInt_multiplicand_8),
			.b (r_ip_MultInt_multiplier_8),
			.p (w_ip_MultInt_product_8)
		);

	MultInt
		MultInt_inst_9(
			.a (r_ip_MultInt_multiplicand_9),
			.b (r_ip_MultInt_multiplier_9),
			.p (w_ip_MultInt_product_9)
		);

	MultInt
		MultInt_inst_10(
			.a (r_ip_MultInt_multiplicand_10),
			.b (r_ip_MultInt_multiplier_10),
			.p (w_ip_MultInt_product_10)
		);

	MultInt
		MultInt_inst_11(
			.a (r_ip_MultInt_multiplicand_11),
			.b (r_ip_MultInt_multiplier_11),
			.p (w_ip_MultInt_product_11)
		);

	MultInt
		MultInt_inst_12(
			.a (r_ip_MultInt_multiplicand_12),
			.b (r_ip_MultInt_multiplier_12),
			.p (w_ip_MultInt_product_12)
		);

	MultInt
		MultInt_inst_13(
			.a (r_ip_MultInt_multiplicand_13),
			.b (r_ip_MultInt_multiplier_13),
			.p (w_ip_MultInt_product_13)
		);

	MultInt
		MultInt_inst_14(
			.a (r_ip_MultInt_multiplicand_14),
			.b (r_ip_MultInt_multiplier_14),
			.p (w_ip_MultInt_product_14)
		);

	MultInt
		MultInt_inst_15(
			.a (r_ip_MultInt_multiplicand_15),
			.b (r_ip_MultInt_multiplier_15),
			.p (w_ip_MultInt_product_15)
		);

	MultInt
		MultInt_inst_16(
			.a (r_ip_MultInt_multiplicand_16),
			.b (r_ip_MultInt_multiplier_16),
			.p (w_ip_MultInt_product_16)
		);

	MultInt
		MultInt_inst_17(
			.a (r_ip_MultInt_multiplicand_17),
			.b (r_ip_MultInt_multiplier_17),
			.p (w_ip_MultInt_product_17)
		);

	MultInt
		MultInt_inst_18(
			.a (r_ip_MultInt_multiplicand_18),
			.b (r_ip_MultInt_multiplier_18),
			.p (w_ip_MultInt_product_18)
		);

	MultInt
		MultInt_inst_19(
			.a (r_ip_MultInt_multiplicand_19),
			.b (r_ip_MultInt_multiplier_19),
			.p (w_ip_MultInt_product_19)
		);

	MultInt
		MultInt_inst_20(
			.a (r_ip_MultInt_multiplicand_20),
			.b (r_ip_MultInt_multiplier_20),
			.p (w_ip_MultInt_product_20)
		);

	MultInt
		MultInt_inst_21(
			.a (r_ip_MultInt_multiplicand_21),
			.b (r_ip_MultInt_multiplier_21),
			.p (w_ip_MultInt_product_21)
		);

	MultInt
		MultInt_inst_22(
			.a (r_ip_MultInt_multiplicand_22),
			.b (r_ip_MultInt_multiplier_22),
			.p (w_ip_MultInt_product_22)
		);

	MultInt
		MultInt_inst_23(
			.a (r_ip_MultInt_multiplicand_23),
			.b (r_ip_MultInt_multiplier_23),
			.p (w_ip_MultInt_product_23)
		);

	MultInt
		MultInt_inst_24(
			.a (r_ip_MultInt_multiplicand_24),
			.b (r_ip_MultInt_multiplier_24),
			.p (w_ip_MultInt_product_24)
		);

	MultInt
		MultInt_inst_25(
			.a (r_ip_MultInt_multiplicand_25),
			.b (r_ip_MultInt_multiplier_25),
			.p (w_ip_MultInt_product_25)
		);

	MultInt
		MultInt_inst_26(
			.a (r_ip_MultInt_multiplicand_26),
			.b (r_ip_MultInt_multiplier_26),
			.p (w_ip_MultInt_product_26)
		);

	MultInt
		MultInt_inst_27(
			.a (r_ip_MultInt_multiplicand_27),
			.b (r_ip_MultInt_multiplier_27),
			.p (w_ip_MultInt_product_27)
		);

	MultInt
		MultInt_inst_28(
			.a (r_ip_MultInt_multiplicand_28),
			.b (r_ip_MultInt_multiplier_28),
			.p (w_ip_MultInt_product_28)
		);

	MultInt
		MultInt_inst_29(
			.a (r_ip_MultInt_multiplicand_29),
			.b (r_ip_MultInt_multiplier_29),
			.p (w_ip_MultInt_product_29)
		);

	MultInt
		MultInt_inst_30(
			.a (r_ip_MultInt_multiplicand_30),
			.b (r_ip_MultInt_multiplier_30),
			.p (w_ip_MultInt_product_30)
		);

	MultInt
		MultInt_inst_31(
			.a (r_ip_MultInt_multiplicand_31),
			.b (r_ip_MultInt_multiplier_31),
			.p (w_ip_MultInt_product_31)
		);

	MultInt
		MultInt_inst_32(
			.a (r_ip_MultInt_multiplicand_32),
			.b (r_ip_MultInt_multiplier_32),
			.p (w_ip_MultInt_product_32)
		);

	MultInt
		MultInt_inst_33(
			.a (r_ip_MultInt_multiplicand_33),
			.b (r_ip_MultInt_multiplier_33),
			.p (w_ip_MultInt_product_33)
		);

	MultInt
		MultInt_inst_34(
			.a (r_ip_MultInt_multiplicand_34),
			.b (r_ip_MultInt_multiplier_34),
			.p (w_ip_MultInt_product_34)
		);

	MultInt
		MultInt_inst_35(
			.a (r_ip_MultInt_multiplicand_35),
			.b (r_ip_MultInt_multiplier_35),
			.p (w_ip_MultInt_product_35)
		);

	MultInt
		MultInt_inst_36(
			.a (r_ip_MultInt_multiplicand_36),
			.b (r_ip_MultInt_multiplier_36),
			.p (w_ip_MultInt_product_36)
		);

	MultInt
		MultInt_inst_37(
			.a (r_ip_MultInt_multiplicand_37),
			.b (r_ip_MultInt_multiplier_37),
			.p (w_ip_MultInt_product_37)
		);

	MultInt
		MultInt_inst_38(
			.a (r_ip_MultInt_multiplicand_38),
			.b (r_ip_MultInt_multiplier_38),
			.p (w_ip_MultInt_product_38)
		);

	MultInt
		MultInt_inst_39(
			.a (r_ip_MultInt_multiplicand_39),
			.b (r_ip_MultInt_multiplier_39),
			.p (w_ip_MultInt_product_39)
		);

	MultInt
		MultInt_inst_40(
			.a (r_ip_MultInt_multiplicand_40),
			.b (r_ip_MultInt_multiplier_40),
			.p (w_ip_MultInt_product_40)
		);

	MultInt
		MultInt_inst_41(
			.a (r_ip_MultInt_multiplicand_41),
			.b (r_ip_MultInt_multiplier_41),
			.p (w_ip_MultInt_product_41)
		);

	MultInt
		MultInt_inst_42(
			.a (r_ip_MultInt_multiplicand_42),
			.b (r_ip_MultInt_multiplier_42),
			.p (w_ip_MultInt_product_42)
		);

	MultInt
		MultInt_inst_43(
			.a (r_ip_MultInt_multiplicand_43),
			.b (r_ip_MultInt_multiplier_43),
			.p (w_ip_MultInt_product_43)
		);

	MultInt
		MultInt_inst_44(
			.a (r_ip_MultInt_multiplicand_44),
			.b (r_ip_MultInt_multiplier_44),
			.p (w_ip_MultInt_product_44)
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_0 <= i_fld_filterCoef0_0;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_0 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_0 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_1 <= i_fld_filterCoef1_1;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_1 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_1 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_2 <= i_fld_filterCoef2_2;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_2 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_2 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_3 <= i_fld_filterCoef3_3;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_3 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_3 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_4 <= i_fld_filterCoef4_4;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_4 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_4 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_5 <= i_fld_filterCoef5_5;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_5 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_5 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_6 <= i_fld_filterCoef6_6;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_6 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_6 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_7 <= i_fld_filterCoef7_7;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_7 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_7 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_8 <= i_fld_filterCoef8_8;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_8 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_8 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_9 <= i_fld_filterCoef9_9;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_9 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_9 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_10 <= i_fld_filterCoef10_10;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_10 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_10 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_11 <= i_fld_filterCoef11_11;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_11 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_11 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_12 <= i_fld_filterCoef12_12;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_12 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_12 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_13 <= i_fld_filterCoef13_13;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_13 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_13 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_14 <= i_fld_filterCoef14_14;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_14 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_14 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_15 <= i_fld_filterCoef15_15;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_15 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_15 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_16 <= i_fld_filterCoef16_16;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_16 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_16 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_17 <= i_fld_filterCoef17_17;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_17 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_17 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_18 <= i_fld_filterCoef18_18;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_18 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_18 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_19 <= i_fld_filterCoef19_19;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_19 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_19 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_20 <= i_fld_filterCoef20_20;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_20 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_20 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_21 <= i_fld_filterCoef21_21;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_21 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_21 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_22 <= i_fld_filterCoef22_22;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_22 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_22 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_23 <= i_fld_filterCoef23_23;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_23 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_23 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_24 <= i_fld_filterCoef24_24;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_24 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_24 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_25 <= i_fld_filterCoef25_25;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_25 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_25 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_26 <= i_fld_filterCoef26_26;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_26 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_26 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_27 <= i_fld_filterCoef27_27;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_27 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_27 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_28 <= i_fld_filterCoef28_28;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_28 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_28 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_29 <= i_fld_filterCoef29_29;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_29 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_29 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_30 <= i_fld_filterCoef30_30;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_30 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_30 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_31 <= i_fld_filterCoef31_31;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_31 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_31 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_32 <= i_fld_filterCoef32_32;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_32 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_32 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_33 <= i_fld_filterCoef33_33;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_33 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_33 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_34 <= i_fld_filterCoef34_34;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_34 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_34 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_35 <= i_fld_filterCoef35_35;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_35 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_35 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_36 <= i_fld_filterCoef36_36;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_36 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_36 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_37 <= i_fld_filterCoef37_37;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_37 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_37 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_38 <= i_fld_filterCoef38_38;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_38 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_38 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_39 <= i_fld_filterCoef39_39;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_39 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_39 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_40 <= i_fld_filterCoef40_40;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_40 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_40 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_41 <= i_fld_filterCoef41_41;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_41 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_41 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_42 <= i_fld_filterCoef42_42;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_42 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_42 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_43 <= i_fld_filterCoef43_43;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_43 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_43 <= $signed( w_sys_tmp101[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplicand_44 <= i_fld_filterCoef44_44;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_ip_MultInt_multiplier_44 <= r_fixedFilter_xn_93;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_ip_MultInt_multiplier_44 <= $signed( w_sys_tmp101[15:0] );

									end
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
					r_sys_processing_methodID <= ((i_fixedFilter_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'ha: begin
							r_sys_processing_methodID <= r_sys_fixedFilter_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedFilter_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedFilter_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedFilter_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h0: begin
							r_sys_fixedFilter_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_sys_fixedFilter_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_sys_fixedFilter_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_sys_fixedFilter_phase <= ((w_sys_tmp2) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h3)) begin
										r_sys_fixedFilter_phase <= 4'h5;

									end
								end

							endcase
						end

						4'ha: begin
							r_sys_fixedFilter_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedFilter_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_sys_fixedFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_sys_fixedFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_sys_fixedFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h3)) begin
										r_sys_fixedFilter_stage <= 2'h0;

									end
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
			r_sys_fixedFilter_step <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h1)) begin
										r_sys_fixedFilter_step <= w_sys_fixedFilter_step_p1;

									end
									else
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_sys_fixedFilter_step <= 3'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_sys_fixedFilter_step <= 3'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_sys_fixedFilter_step <= 3'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h3)) begin
										r_sys_fixedFilter_step <= 3'h0;

									end
									else
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h2)) begin
										r_sys_fixedFilter_step <= w_sys_fixedFilter_step_p1;

									end
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
			r_sys_fixedFilter_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_fixedFilter_busy <= ((i_fixedFilter_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h0: begin
							r_sys_fixedFilter_busy <= w_sys_boolTrue;
						end

						4'ha: begin
							r_sys_fixedFilter_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bufRegister0_45 <= w_sys_intZero;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bufRegister1_46 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister1_46 <= w_sys_tmp8;

									end
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
			r_fld_bufRegister2_47 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister2_47 <= w_sys_tmp10;

									end
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
			r_fld_bufRegister3_48 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister3_48 <= w_sys_tmp12;

									end
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
			r_fld_bufRegister4_49 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister4_49 <= w_sys_tmp14;

									end
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
			r_fld_bufRegister5_50 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister5_50 <= w_sys_tmp16;

									end
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
			r_fld_bufRegister6_51 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister6_51 <= w_sys_tmp18;

									end
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
			r_fld_bufRegister7_52 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister7_52 <= w_sys_tmp20;

									end
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
			r_fld_bufRegister8_53 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister8_53 <= w_sys_tmp22;

									end
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
			r_fld_bufRegister9_54 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister9_54 <= w_sys_tmp24;

									end
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
			r_fld_bufRegister10_55 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister10_55 <= w_sys_tmp26;

									end
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
			r_fld_bufRegister11_56 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister11_56 <= w_sys_tmp28;

									end
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
			r_fld_bufRegister12_57 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister12_57 <= w_sys_tmp30;

									end
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
			r_fld_bufRegister13_58 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister13_58 <= w_sys_tmp32;

									end
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
			r_fld_bufRegister14_59 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister14_59 <= w_sys_tmp34;

									end
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
			r_fld_bufRegister15_60 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister15_60 <= w_sys_tmp36;

									end
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
			r_fld_bufRegister16_61 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister16_61 <= w_sys_tmp38;

									end
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
			r_fld_bufRegister17_62 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister17_62 <= w_sys_tmp40;

									end
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
			r_fld_bufRegister18_63 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister18_63 <= w_sys_tmp42;

									end
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
			r_fld_bufRegister19_64 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister19_64 <= w_sys_tmp44;

									end
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
			r_fld_bufRegister20_65 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister20_65 <= w_sys_tmp46;

									end
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
			r_fld_bufRegister21_66 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister21_66 <= w_sys_tmp48;

									end
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
			r_fld_bufRegister22_67 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister22_67 <= w_sys_tmp50;

									end
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
			r_fld_bufRegister23_68 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister23_68 <= w_sys_tmp52;

									end
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
			r_fld_bufRegister24_69 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister24_69 <= w_sys_tmp54;

									end
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
			r_fld_bufRegister25_70 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister25_70 <= w_sys_tmp56;

									end
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
			r_fld_bufRegister26_71 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister26_71 <= w_sys_tmp58;

									end
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
			r_fld_bufRegister27_72 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister27_72 <= w_sys_tmp60;

									end
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
			r_fld_bufRegister28_73 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister28_73 <= w_sys_tmp62;

									end
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
			r_fld_bufRegister29_74 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister29_74 <= w_sys_tmp64;

									end
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
			r_fld_bufRegister30_75 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister30_75 <= w_sys_tmp66;

									end
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
			r_fld_bufRegister31_76 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister31_76 <= w_sys_tmp68;

									end
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
			r_fld_bufRegister32_77 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister32_77 <= w_sys_tmp70;

									end
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
			r_fld_bufRegister33_78 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister33_78 <= w_sys_tmp72;

									end
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
			r_fld_bufRegister34_79 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister34_79 <= w_sys_tmp74;

									end
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
			r_fld_bufRegister35_80 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister35_80 <= w_sys_tmp76;

									end
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
			r_fld_bufRegister36_81 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister36_81 <= w_sys_tmp78;

									end
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
			r_fld_bufRegister37_82 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister37_82 <= w_sys_tmp80;

									end
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
			r_fld_bufRegister38_83 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister38_83 <= w_sys_tmp82;

									end
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
			r_fld_bufRegister39_84 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister39_84 <= w_sys_tmp84;

									end
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
			r_fld_bufRegister40_85 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister40_85 <= w_sys_tmp86;

									end
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
			r_fld_bufRegister41_86 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister41_86 <= w_sys_tmp88;

									end
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
			r_fld_bufRegister42_87 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister42_87 <= w_sys_tmp90;

									end
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
			r_fld_bufRegister43_88 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister43_88 <= w_sys_tmp92;

									end
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
			r_fld_bufRegister44_89 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fld_bufRegister44_89 <= w_sys_tmp94;

									end
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
				2'h0: begin
					r_fixedFilter_pointNum_90 <= ((i_fixedFilter_req) ? i_fixedFilter_pointNum_90 : r_fixedFilter_pointNum_90);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fixedFilter_dataRe_91_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_fixedFilter_dataRe_91_addr <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_fixedFilter_dataRe_91_addr <= w_sys_tmp96;

									end
									else
									if((r_sys_fixedFilter_step==3'h1)) begin
										r_fixedFilter_dataRe_91_addr <= w_sys_tmp234;

									end
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
			r_fixedFilter_dataRe_91_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_fixedFilter_dataRe_91_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0) || (r_sys_fixedFilter_step==3'h1)) begin
										r_fixedFilter_dataRe_91_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_fixedFilter_dataRe_91_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fixedFilter_dataReFiltered_92_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1)) begin
										r_fixedFilter_dataReFiltered_92_addr <= r_fixedFilter_n_94;

									end
									else
									if((r_sys_fixedFilter_step==3'h3)) begin
										r_fixedFilter_dataReFiltered_92_addr <= w_sys_tmp96;

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fixedFilter_dataReFiltered_92_datain <= w_sys_tmp6;

									end
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
			r_fixedFilter_dataReFiltered_92_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fixedFilter_phase) 
						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h1) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fixedFilter_dataReFiltered_92_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'ha: begin
							r_fixedFilter_dataReFiltered_92_r_w <= w_sys_boolFalse;
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

					case(r_sys_fixedFilter_phase) 
						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h2)) begin
										r_fixedFilter_xn_93 <= $signed( w_sys_tmp1[15:0] );

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h2) || (r_sys_fixedFilter_step==3'h3)) begin
										r_fixedFilter_xn_93 <= $signed( w_sys_tmp95[15:0] );

									end
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

					case(r_sys_fixedFilter_phase) 
						4'h4: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h0)) begin
										r_fixedFilter_n_94 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==3'h3)) begin
										r_fixedFilter_n_94 <= w_sys_tmp234;

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
