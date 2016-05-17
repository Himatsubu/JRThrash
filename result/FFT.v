/*
TimeStamp:	2016/2/29		14:29
*/


module FFT(
	input                 clock,	
	input                 reset_n,	
	input                 i_fft_start_req,	
	output                o_fft_start_busy,	
	input  signed  [ 9:0] i_fld_dataRe_0_addr_0,	
	input          [31:0] i_fld_dataRe_0_datain_0,	
	output         [31:0] o_fld_dataRe_0_dataout_0,	
	input                 i_fld_dataRe_0_r_w_0,	
	input  signed  [ 9:0] i_fld_dataIm_1_addr_0,	
	input          [31:0] i_fld_dataIm_1_datain_0,	
	output         [31:0] o_fld_dataIm_1_dataout_0,	
	input                 i_fld_dataIm_1_r_w_0,	
	input  signed  [ 8:0] i_fld_wRe_2_addr_0,	
	input          [31:0] i_fld_wRe_2_datain_0,	
	output         [31:0] o_fld_wRe_2_dataout_0,	
	input                 i_fld_wRe_2_r_w_0,	
	input  signed  [ 8:0] i_fld_wIm_3_addr_0,	
	input          [31:0] i_fld_wIm_3_datain_0,	
	output         [31:0] o_fld_wIm_3_dataout_0,	
	input                 i_fld_wIm_3_r_w_0	
);

	reg                r_sys_fft_arbiter0;
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
	reg         [31:0] r_ip_MultFloat_multiplicand_0;
	reg         [31:0] r_ip_MultFloat_multiplier_0;
	wire        [31:0] w_ip_MultFloat_product_0;
	reg         [31:0] r_ip_MultFloat_multiplicand_1;
	reg         [31:0] r_ip_MultFloat_multiplier_1;
	wire        [31:0] w_ip_MultFloat_product_1;
	reg         [31:0] r_ip_MultFloat_multiplicand_2;
	reg         [31:0] r_ip_MultFloat_multiplier_2;
	wire        [31:0] w_ip_MultFloat_product_2;
	reg         [31:0] r_ip_MultFloat_multiplicand_3;
	reg         [31:0] r_ip_MultFloat_multiplier_3;
	wire        [31:0] w_ip_MultFloat_product_3;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 1:0] r_sys_fft_start_caller;
	reg                r_sys_fft_start_req;
	reg         [ 2:0] r_sys_fft_start_phase;
	reg         [ 1:0] r_sys_fft_start_stage;
	reg         [ 1:0] r_sys_fft_start_step;
	reg                r_sys_fft_start_busy;
	wire        [ 1:0] w_sys_fft_start_stage_p1;
	wire        [ 1:0] w_sys_fft_start_step_p1;
	reg         [ 1:0] r_sys_fft_caller;
	reg                r_sys_fft_req;
	reg         [ 3:0] r_sys_fft_phase;
	reg         [ 1:0] r_sys_fft_stage;
	reg         [ 5:0] r_sys_fft_step;
	reg                r_sys_fft_busy;
	wire        [ 1:0] w_sys_fft_stage_p1;
	wire        [ 5:0] w_sys_fft_step_p1;
	wire signed [ 9:0] w_fld_dataRe_0_addr_0;
	wire        [31:0] w_fld_dataRe_0_datain_0;
	wire        [31:0] w_fld_dataRe_0_dataout_0;
	wire               w_fld_dataRe_0_r_w_0;
	wire               w_fld_dataRe_0_ce_0;
	reg  signed [ 9:0] r_fld_dataRe_0_addr_1;
	reg         [31:0] r_fld_dataRe_0_datain_1;
	wire        [31:0] w_fld_dataRe_0_dataout_1;
	reg                r_fld_dataRe_0_r_w_1;
	wire               w_fld_dataRe_0_ce_1;
	wire signed [ 9:0] w_fld_dataIm_1_addr_0;
	wire        [31:0] w_fld_dataIm_1_datain_0;
	wire        [31:0] w_fld_dataIm_1_dataout_0;
	wire               w_fld_dataIm_1_r_w_0;
	wire               w_fld_dataIm_1_ce_0;
	reg  signed [ 9:0] r_fld_dataIm_1_addr_1;
	reg         [31:0] r_fld_dataIm_1_datain_1;
	wire        [31:0] w_fld_dataIm_1_dataout_1;
	reg                r_fld_dataIm_1_r_w_1;
	wire               w_fld_dataIm_1_ce_1;
	wire signed [ 8:0] w_fld_wRe_2_addr_0;
	wire        [31:0] w_fld_wRe_2_datain_0;
	wire        [31:0] w_fld_wRe_2_dataout_0;
	wire               w_fld_wRe_2_r_w_0;
	wire               w_fld_wRe_2_ce_0;
	reg  signed [ 8:0] r_fld_wRe_2_addr_1;
	reg         [31:0] r_fld_wRe_2_datain_1;
	wire        [31:0] w_fld_wRe_2_dataout_1;
	reg                r_fld_wRe_2_r_w_1;
	wire               w_fld_wRe_2_ce_1;
	wire signed [ 8:0] w_fld_wIm_3_addr_0;
	wire        [31:0] w_fld_wIm_3_datain_0;
	wire        [31:0] w_fld_wIm_3_dataout_0;
	wire               w_fld_wIm_3_r_w_0;
	wire               w_fld_wIm_3_ce_0;
	reg  signed [ 8:0] r_fld_wIm_3_addr_1;
	reg         [31:0] r_fld_wIm_3_datain_1;
	wire        [31:0] w_fld_wIm_3_dataout_1;
	reg                r_fld_wIm_3_r_w_1;
	wire               w_fld_wIm_3_ce_1;
	reg  signed [15:0] r_fld_dataNum_4;
	reg  signed [31:0] r_fft_dataRe_5_addr;
	reg         [31:0] r_fft_dataRe_5_datain;
	wire        [31:0] w_fft_dataRe_5_dataout;
	reg                r_fft_dataRe_5_r_w;
	wire signed [31:0] w_fft_dataRe_5_addr;
	wire        [31:0] w_fft_dataRe_5_datain;
	wire               w_fft_dataRe_5_r_w;
	wire               w_fft_dataRe_5_ce;
	wire               w_fft_dataRe_5_cacheHit;
	reg  signed [31:0] r_fft_dataIm_6_addr;
	reg         [31:0] r_fft_dataIm_6_datain;
	wire        [31:0] w_fft_dataIm_6_dataout;
	reg                r_fft_dataIm_6_r_w;
	wire signed [31:0] w_fft_dataIm_6_addr;
	wire        [31:0] w_fft_dataIm_6_datain;
	wire               w_fft_dataIm_6_r_w;
	wire               w_fft_dataIm_6_ce;
	wire               w_fft_dataIm_6_cacheHit;
	reg  signed [15:0] r_fft_i_7;
	reg  signed [15:0] r_fft_j_8;
	reg  signed [15:0] r_fft_k_rd_9;
	reg  signed [15:0] r_fft_k_wr_10;
	reg         [31:0] r_fft_data_Re_11;
	reg         [31:0] r_fft_data_Im_12;
	reg         [31:0] r_fft_data_wRe_13;
	reg         [31:0] r_fft_data_wIm_14;
	reg         [31:0] r_fft_dataRe_N_15;
	reg         [31:0] r_fft_dataIm_N_16;
	reg         [31:0] r_fft_tmpRe_17;
	reg         [31:0] r_fft_tmpIm_18;
	reg  signed [15:0] r_fft_m_19;
	reg  signed [15:0] r_fft_rd_20;
	reg  signed [15:0] r_fft_wr_21;
	reg  signed [15:0] r_fft_wrx_22;
	reg  signed [15:0] r_fft_rdx_23;
	reg                r_fft_gotoNextStageRd_24;
	reg                r_fft_gotoNextStageWr_25;
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
	wire signed [15:0] w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire               w_sys_tmp3;
	wire signed [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire               w_sys_tmp6;
	wire signed [15:0] w_sys_tmp7;
	wire signed [31:0] w_sys_tmp8;
	wire signed [15:0] w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire        [31:0] w_sys_tmp11;
	wire        [31:0] w_sys_tmp12;
	wire        [31:0] w_sys_tmp13;
	wire        [31:0] w_sys_tmp14;
	wire        [31:0] w_sys_tmp17;
	wire        [31:0] w_sys_tmp18;
	wire        [31:0] w_sys_tmp19;
	wire        [31:0] w_sys_tmp20;
	wire        [31:0] w_sys_tmp21;
	wire        [31:0] w_sys_tmp22;
	wire        [31:0] w_sys_tmp23;
	wire        [31:0] w_sys_tmp25;
	wire        [31:0] w_sys_tmp28;
	wire        [31:0] w_sys_tmp29;
	wire        [31:0] w_sys_tmp31;
	wire        [31:0] w_sys_tmp32;
	wire signed [31:0] w_sys_tmp37;
	wire signed [31:0] w_sys_tmp38;
	wire signed [31:0] w_sys_tmp39;
	wire               w_sys_tmp41;
	wire               w_sys_tmp42;
	wire signed [31:0] w_sys_tmp43;
	wire               w_sys_tmp44;
	wire               w_sys_tmp45;
	wire signed [31:0] w_sys_tmp46;
	wire signed [15:0] w_sys_tmp47;
	wire signed [31:0] w_sys_tmp48;
	wire signed [31:0] w_sys_tmp49;
	wire               w_sys_tmp50;
	wire signed [15:0] w_sys_tmp51;
	wire signed [31:0] w_sys_tmp52;
	wire signed [31:0] w_sys_tmp53;
	wire               w_sys_tmp54;
	wire signed [15:0] w_sys_tmp55;
	wire signed [31:0] w_sys_tmp56;
	wire signed [31:0] w_sys_tmp57;
	wire signed [15:0] w_sys_tmp59;
	wire signed [31:0] w_sys_tmp60;
	wire signed [15:0] w_sys_tmp61;
	wire signed [31:0] w_sys_tmp62;
	wire signed [15:0] w_sys_tmp63;
	wire signed [31:0] w_sys_tmp64;
	wire signed [31:0] w_sys_tmp65;
	wire signed [15:0] w_sys_tmp66;
	wire signed [31:0] w_sys_tmp67;
	wire signed [31:0] w_sys_tmp68;
	wire signed [31:0] w_sys_tmp84;
	wire        [31:0] w_sys_tmp90;
	wire        [31:0] w_sys_tmp148;
	wire signed [31:0] w_sys_tmp933;
	wire signed [15:0] w_sys_tmp934;
	wire signed [15:0] w_sys_tmp935;
	wire signed [15:0] w_sys_tmp967;
	wire signed [15:0] w_sys_tmp968;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & w_fft_dataRe_5_cacheHit & w_fft_dataIm_6_cacheHit;
	assign o_fft_start_busy = r_sys_fft_start_busy;
	assign w_sys_fft_start_stage_p1 = (r_sys_fft_start_stage + 2'h1);
	assign w_sys_fft_start_step_p1 = (r_sys_fft_start_step + 2'h1);
	assign w_sys_fft_stage_p1 = (r_sys_fft_stage + 2'h1);
	assign w_sys_fft_step_p1 = (r_sys_fft_step + 6'h1);
	assign o_fld_dataRe_0_dataout_0 = w_fld_dataRe_0_dataout_0;
	assign w_fld_dataRe_0_addr_0 = ( r_sys_fft_arbiter0 ? $signed( w_fft_dataRe_5_addr[9:0] ) : i_fld_dataRe_0_addr_0 ) ;
	assign w_fld_dataRe_0_datain_0 = ( r_sys_fft_arbiter0 ? w_fft_dataRe_5_datain : i_fld_dataRe_0_datain_0 ) ;
	assign w_fld_dataRe_0_r_w_0 = ( r_sys_fft_arbiter0 ? w_fft_dataRe_5_r_w : i_fld_dataRe_0_r_w_0 ) ;
	assign w_fld_dataRe_0_ce_0 = w_sys_ce;
	assign w_fld_dataRe_0_ce_1 = w_sys_ce;
	assign o_fld_dataIm_1_dataout_0 = w_fld_dataIm_1_dataout_0;
	assign w_fld_dataIm_1_addr_0 = ( r_sys_fft_arbiter0 ? $signed( w_fft_dataIm_6_addr[9:0] ) : i_fld_dataIm_1_addr_0 ) ;
	assign w_fld_dataIm_1_datain_0 = ( r_sys_fft_arbiter0 ? w_fft_dataIm_6_datain : i_fld_dataIm_1_datain_0 ) ;
	assign w_fld_dataIm_1_r_w_0 = ( r_sys_fft_arbiter0 ? w_fft_dataIm_6_r_w : i_fld_dataIm_1_r_w_0 ) ;
	assign w_fld_dataIm_1_ce_0 = w_sys_ce;
	assign w_fld_dataIm_1_ce_1 = w_sys_ce;
	assign o_fld_wRe_2_dataout_0 = w_fld_wRe_2_dataout_0;
	assign w_fld_wRe_2_addr_0 = i_fld_wRe_2_addr_0;
	assign w_fld_wRe_2_datain_0 = i_fld_wRe_2_datain_0;
	assign w_fld_wRe_2_r_w_0 = i_fld_wRe_2_r_w_0;
	assign w_fld_wRe_2_ce_0 = w_sys_ce;
	assign w_fld_wRe_2_ce_1 = w_sys_ce;
	assign o_fld_wIm_3_dataout_0 = w_fld_wIm_3_dataout_0;
	assign w_fld_wIm_3_addr_0 = i_fld_wIm_3_addr_0;
	assign w_fld_wIm_3_datain_0 = i_fld_wIm_3_datain_0;
	assign w_fld_wIm_3_r_w_0 = i_fld_wIm_3_r_w_0;
	assign w_fld_wIm_3_ce_0 = w_sys_ce;
	assign w_fld_wIm_3_ce_1 = w_sys_ce;
	assign w_fft_dataRe_5_dataout = ( r_sys_fft_arbiter0 ? w_fld_dataRe_0_dataout_0 : 32'h0 ) ;
	assign w_fft_dataRe_5_addr = r_fft_dataRe_5_addr;
	assign w_fft_dataRe_5_datain = r_fft_dataRe_5_datain;
	assign w_fft_dataRe_5_r_w = r_fft_dataRe_5_r_w;
	assign w_fft_dataRe_5_ce = w_sys_ce;
	assign w_fft_dataRe_5_cacheHit = ( r_sys_fft_arbiter0 ? w_sys_boolTrue : w_sys_boolTrue ) ;
	assign w_fft_dataIm_6_dataout = ( r_sys_fft_arbiter0 ? w_fld_dataIm_1_dataout_0 : 32'h0 ) ;
	assign w_fft_dataIm_6_addr = r_fft_dataIm_6_addr;
	assign w_fft_dataIm_6_datain = r_fft_dataIm_6_datain;
	assign w_fft_dataIm_6_r_w = r_fft_dataIm_6_r_w;
	assign w_fft_dataIm_6_ce = w_sys_ce;
	assign w_fft_dataIm_6_cacheHit = ( r_sys_fft_arbiter0 ? w_sys_boolTrue : w_sys_boolTrue ) ;
	assign w_sys_tmp1 = $signed( w_sys_tmp2[15:0] );
	assign w_sys_tmp2 = $signed( {{16{w_sys_tmp934[15]}}, w_sys_tmp934} );
	assign w_sys_tmp3 = (r_fft_i_7 < r_fld_dataNum_4);
	assign w_sys_tmp4 = $signed( {{16{w_sys_tmp967[15]}}, w_sys_tmp967} );
	assign w_sys_tmp5 = $signed( {{16{w_sys_tmp968[15]}}, w_sys_tmp968} );
	assign w_sys_tmp6 = (r_fft_k_rd_9 < r_fft_i_7);
	assign w_sys_tmp7 = $signed( w_sys_tmp8[15:0] );
	assign w_sys_tmp8 = ($signed( {{16{r_fft_rd_20[15]}}, r_fft_rd_20} ) + $signed( {{16{r_fft_i_7[15]}}, r_fft_i_7} ));
	assign w_sys_tmp9 = $signed( w_sys_tmp10[15:0] );
	assign w_sys_tmp10 = ($signed( {{16{r_fft_wr_21[15]}}, r_fft_wr_21} ) + $signed( {{16{r_fft_i_7[15]}}, r_fft_i_7} ));
	assign w_sys_tmp11 = w_fld_wRe_2_dataout_1;
	assign w_sys_tmp12 = w_fld_wIm_3_dataout_1;
	assign w_sys_tmp13 = w_fft_dataRe_5_dataout;
	assign w_sys_tmp14 = w_fft_dataIm_6_dataout;
	assign w_sys_tmp17 = w_ip_AddFloat_result_0;
	assign w_sys_tmp18 = w_ip_MultFloat_product_0;
	assign w_sys_tmp19 = w_sys_tmp13;
	assign w_sys_tmp20 = w_ip_MultFloat_product_1;
	assign w_sys_tmp21 = w_sys_tmp14;
	assign w_sys_tmp22 = w_ip_AddFloat_result_1;
	assign w_sys_tmp23 = w_ip_MultFloat_product_2;
	assign w_sys_tmp25 = w_ip_MultFloat_product_3;
	assign w_sys_tmp28 = w_ip_AddFloat_result_3;
	assign w_sys_tmp29 = w_sys_tmp17;
	assign w_sys_tmp31 = w_ip_AddFloat_result_2;
	assign w_sys_tmp32 = w_sys_tmp22;
	assign w_sys_tmp37 = ($signed( {{16{r_fft_rd_20[15]}}, r_fft_rd_20} ) + w_sys_tmp38);
	assign w_sys_tmp38 = $signed( {{16{w_sys_tmp935[15]}}, w_sys_tmp935} );
	assign w_sys_tmp39 = ($signed( {{16{r_fft_wr_21[15]}}, r_fft_wr_21} ) + w_sys_tmp38);
	assign w_sys_tmp41 = ( !w_sys_tmp42 );
	assign w_sys_tmp42 = (w_sys_tmp43 < $signed( {{16{r_fld_dataNum_4[15]}}, r_fld_dataNum_4} ));
	assign w_sys_tmp43 = w_sys_tmp37;
	assign w_sys_tmp44 = ( !w_sys_tmp45 );
	assign w_sys_tmp45 = (w_sys_tmp46 < $signed( {{16{r_fld_dataNum_4[15]}}, r_fld_dataNum_4} ));
	assign w_sys_tmp46 = w_sys_tmp39;
	assign w_sys_tmp47 = $signed( w_sys_tmp48[15:0] );
	assign w_sys_tmp48 = ((w_sys_tmp50) ? w_sys_tmp49 : $signed( {{16{r_fft_k_rd_9[15]}}, r_fft_k_rd_9} ));
	assign w_sys_tmp49 = ($signed( {{16{r_fft_k_rd_9[15]}}, r_fft_k_rd_9} ) + w_sys_intOne);
	assign w_sys_tmp50 = w_sys_tmp41;
	assign w_sys_tmp51 = $signed( w_sys_tmp52[15:0] );
	assign w_sys_tmp52 = ((w_sys_tmp54) ? w_sys_tmp53 : $signed( {{16{r_fft_k_wr_10[15]}}, r_fft_k_wr_10} ));
	assign w_sys_tmp53 = ($signed( {{16{r_fft_k_wr_10[15]}}, r_fft_k_wr_10} ) + w_sys_intOne);
	assign w_sys_tmp54 = w_sys_tmp44;
	assign w_sys_tmp55 = $signed( w_sys_tmp56[15:0] );
	assign w_sys_tmp56 = ((w_sys_tmp50) ? w_sys_tmp57 : $signed( {{16{r_fft_m_19[15]}}, r_fft_m_19} ));
	assign w_sys_tmp57 = ($signed( {{16{r_fft_m_19[15]}}, r_fft_m_19} ) + $signed( {{16{r_fft_j_8[15]}}, r_fft_j_8} ));
	assign w_sys_tmp59 = $signed( w_sys_tmp60[15:0] );
	assign w_sys_tmp60 = ((r_fft_gotoNextStageRd_24) ? $signed( {{16{r_fft_k_rd_9[15]}}, r_fft_k_rd_9} ) : $signed( {{16{r_fft_rd_20[15]}}, r_fft_rd_20} ));
	assign w_sys_tmp61 = $signed( w_sys_tmp62[15:0] );
	assign w_sys_tmp62 = ((r_fft_gotoNextStageWr_25) ? $signed( {{16{r_fft_k_wr_10[15]}}, r_fft_k_wr_10} ) : $signed( {{16{r_fft_wr_21[15]}}, r_fft_wr_21} ));
	assign w_sys_tmp63 = $signed( w_sys_tmp64[15:0] );
	assign w_sys_tmp64 = (w_sys_tmp65 + $signed( {{16{r_fft_i_7[15]}}, r_fft_i_7} ));
	assign w_sys_tmp65 = $signed( {{16{w_sys_tmp59[15]}}, w_sys_tmp59} );
	assign w_sys_tmp66 = $signed( w_sys_tmp67[15:0] );
	assign w_sys_tmp67 = (w_sys_tmp68 + $signed( {{16{r_fft_i_7[15]}}, r_fft_i_7} ));
	assign w_sys_tmp68 = $signed( {{16{w_sys_tmp61[15]}}, w_sys_tmp61} );
	assign w_sys_tmp84 = $signed( {{16{w_sys_tmp66[15]}}, w_sys_tmp66} );
	assign w_sys_tmp90 = w_sys_tmp31;
	assign w_sys_tmp148 = w_sys_tmp28;
	assign w_sys_tmp933 = 32'sh00000400;
	assign w_sys_tmp934 = { { 15{r_fld_dataNum_4[15]} }, r_fld_dataNum_4[15 : 1] };
	assign w_sys_tmp935 = { r_fft_i_7[14 : 0], 1'sh0 };
	assign w_sys_tmp967 = { r_fft_i_7[14 : 0], 1'sh0 };
	assign w_sys_tmp968 = { { 15{r_fft_j_8[15]} }, r_fft_j_8[15 : 1] };


	DualPortRAM #(.DWIDTH(32), .AWIDTH(10), .WORDS(1024) )
		dpram_dataRe_0(
			.clk (clock),
			.ce_0 (w_fld_dataRe_0_ce_0),
			.addr_0 (w_fld_dataRe_0_addr_0),
			.datain_0 (w_fld_dataRe_0_datain_0),
			.dataout_0 (w_fld_dataRe_0_dataout_0),
			.r_w_0 (w_fld_dataRe_0_r_w_0),
			.ce_1 (w_fld_dataRe_0_ce_1),
			.addr_1 (r_fld_dataRe_0_addr_1),
			.datain_1 (r_fld_dataRe_0_datain_1),
			.dataout_1 (w_fld_dataRe_0_dataout_1),
			.r_w_1 (r_fld_dataRe_0_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(10), .WORDS(1024) )
		dpram_dataIm_1(
			.clk (clock),
			.ce_0 (w_fld_dataIm_1_ce_0),
			.addr_0 (w_fld_dataIm_1_addr_0),
			.datain_0 (w_fld_dataIm_1_datain_0),
			.dataout_0 (w_fld_dataIm_1_dataout_0),
			.r_w_0 (w_fld_dataIm_1_r_w_0),
			.ce_1 (w_fld_dataIm_1_ce_1),
			.addr_1 (r_fld_dataIm_1_addr_1),
			.datain_1 (r_fld_dataIm_1_datain_1),
			.dataout_1 (w_fld_dataIm_1_dataout_1),
			.r_w_1 (r_fld_dataIm_1_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(9), .WORDS(512) )
		dpram_wRe_2(
			.clk (clock),
			.ce_0 (w_fld_wRe_2_ce_0),
			.addr_0 (w_fld_wRe_2_addr_0),
			.datain_0 (w_fld_wRe_2_datain_0),
			.dataout_0 (w_fld_wRe_2_dataout_0),
			.r_w_0 (w_fld_wRe_2_r_w_0),
			.ce_1 (w_fld_wRe_2_ce_1),
			.addr_1 (r_fld_wRe_2_addr_1),
			.datain_1 (r_fld_wRe_2_datain_1),
			.dataout_1 (w_fld_wRe_2_dataout_1),
			.r_w_1 (r_fld_wRe_2_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(9), .WORDS(512) )
		dpram_wIm_3(
			.clk (clock),
			.ce_0 (w_fld_wIm_3_ce_0),
			.addr_0 (w_fld_wIm_3_addr_0),
			.datain_0 (w_fld_wIm_3_datain_0),
			.dataout_0 (w_fld_wIm_3_dataout_0),
			.r_w_0 (w_fld_wIm_3_r_w_0),
			.ce_1 (w_fld_wIm_3_ce_1),
			.addr_1 (r_fld_wIm_3_addr_1),
			.datain_1 (r_fld_wIm_3_datain_1),
			.dataout_1 (w_fld_wIm_3_dataout_1),
			.r_w_1 (r_fld_wIm_3_r_w_1)
		);

	AddFloat
		AddFloat_inst_0(
			.clk (clock),
			.a (r_ip_AddFloat_portA_0),
			.b (r_ip_AddFloat_portB_0),
			.result (w_ip_AddFloat_result_0)
		);

	AddFloat
		AddFloat_inst_1(
			.clk (clock),
			.a (r_ip_AddFloat_portA_1),
			.b (r_ip_AddFloat_portB_1),
			.result (w_ip_AddFloat_result_1)
		);

	AddFloat
		AddFloat_inst_2(
			.clk (clock),
			.a (r_ip_AddFloat_portA_2),
			.b (r_ip_AddFloat_portB_2),
			.result (w_ip_AddFloat_result_2)
		);

	AddFloat
		AddFloat_inst_3(
			.clk (clock),
			.a (r_ip_AddFloat_portA_3),
			.b (r_ip_AddFloat_portB_3),
			.result (w_ip_AddFloat_result_3)
		);

	MultFloat
		MultFloat_inst_0(
			.clk (clock),
			.a (r_ip_MultFloat_multiplicand_0),
			.b (r_ip_MultFloat_multiplier_0),
			.result (w_ip_MultFloat_product_0)
		);

	MultFloat
		MultFloat_inst_1(
			.clk (clock),
			.a (r_ip_MultFloat_multiplicand_1),
			.b (r_ip_MultFloat_multiplier_1),
			.result (w_ip_MultFloat_product_1)
		);

	MultFloat
		MultFloat_inst_2(
			.clk (clock),
			.a (r_ip_MultFloat_multiplicand_2),
			.b (r_ip_MultFloat_multiplier_2),
			.result (w_ip_MultFloat_product_2)
		);

	MultFloat
		MultFloat_inst_3(
			.clk (clock),
			.a (r_ip_MultFloat_multiplicand_3),
			.b (r_ip_MultFloat_multiplier_3),
			.result (w_ip_MultFloat_product_3)
		);

	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fft_arbiter0 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h2: begin

							case(r_sys_fft_start_stage) 
								2'h0: begin
									if((r_sys_fft_start_step==2'h0)) begin
										r_sys_fft_arbiter0 <= w_sys_boolTrue;

									end
									else
									if((r_sys_fft_start_step==2'h1)) begin
										r_sys_fft_arbiter0 <= w_sys_boolFalse;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((6'h1b<=r_sys_fft_step && r_sys_fft_step<=6'h1e) || (r_sys_fft_step==6'h27) || (r_sys_fft_step==6'h28) || (r_sys_fft_step==6'h29) || (r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2d)) begin
										r_ip_AddFloat_portA_0 <= r_fft_dataIm_N_16;

									end
									else
									if((r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21) || (r_sys_fft_step==6'h23)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp23;

									end
									else
									if((r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h25)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp18;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h2d)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp90[31], w_sys_tmp90[30:0] };

									end
									else
									if((r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e) || (r_sys_fft_step==6'h28)) begin
										r_ip_AddFloat_portB_0 <= r_fft_tmpIm_18;

									end
									else
									if((r_sys_fft_step==6'h23)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h27)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'hf)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h21)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h13)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h1b)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h29)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h17)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h1d)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h11)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h1f)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h2b)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp90[31], w_sys_tmp90[30:0] };

									end
									else
									if((r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h25)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp20;

									end
									else
									if((r_sys_fft_step==6'h15)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((6'h11<=r_sys_fft_step && r_sys_fft_step<=6'h14) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h25) || (r_sys_fft_step==6'h26)) begin
										r_ip_AddFloat_portA_1 <= r_fft_dataIm_N_16;

									end
									else
									if((r_sys_fft_step==6'h29) || (r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2d)) begin
										r_ip_AddFloat_portA_1 <= r_fft_dataRe_N_15;

									end
									else
									if((r_sys_fft_step==6'h9)) begin
										r_ip_AddFloat_portA_1 <= w_sys_tmp23;

									end
									else
									if((r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h21) || (r_sys_fft_step==6'h23) || (r_sys_fft_step==6'h27)) begin
										r_ip_AddFloat_portA_1 <= w_sys_tmp18;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h2b)) begin
										r_ip_AddFloat_portB_1 <= w_sys_tmp29;

									end
									else
									if((r_sys_fft_step==6'h25)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h1f)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp90[31], w_sys_tmp90[30:0] };

									end
									else
									if((r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h26)) begin
										r_ip_AddFloat_portB_1 <= r_fft_tmpIm_18;

									end
									else
									if((r_sys_fft_step==6'h19)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h29) || (r_sys_fft_step==6'h2d)) begin
										r_ip_AddFloat_portB_1 <= w_sys_tmp32;

									end
									else
									if((r_sys_fft_step==6'h13)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp148[31], w_sys_tmp148[30:0] };

									end
									else
									if((r_sys_fft_step==6'h11)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp90[31], w_sys_tmp90[30:0] };

									end
									else
									if((r_sys_fft_step==6'h9)) begin
										r_ip_AddFloat_portB_1 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h21) || (r_sys_fft_step==6'h23) || (r_sys_fft_step==6'h27)) begin
										r_ip_AddFloat_portB_1 <= w_sys_tmp20;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h10) || (6'h15<=r_sys_fft_step && r_sys_fft_step<=6'h18) || (6'h21<=r_sys_fft_step && r_sys_fft_step<=6'h24) || (r_sys_fft_step==6'h29) || (r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2d)) begin
										r_ip_AddFloat_portA_2 <= r_fft_dataIm_N_16;

									end
									else
									if((r_sys_fft_step==6'hb) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h25) || (r_sys_fft_step==6'h27)) begin
										r_ip_AddFloat_portA_2 <= w_sys_tmp23;

									end
									else
									if((r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h1f)) begin
										r_ip_AddFloat_portA_2 <= w_sys_tmp18;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'hf)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp32[31], w_sys_tmp32[30:0] };

									end
									else
									if((r_sys_fft_step==6'h25)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'hb)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h23)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp90[31], w_sys_tmp90[30:0] };

									end
									else
									if((r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h22) || (r_sys_fft_step==6'h24)) begin
										r_ip_AddFloat_portB_2 <= r_fft_tmpIm_18;

									end
									else
									if((r_sys_fft_step==6'h27)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h17)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h1d)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2d)) begin
										r_ip_AddFloat_portB_2 <= w_sys_tmp90;

									end
									else
									if((r_sys_fft_step==6'h19)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h29)) begin
										r_ip_AddFloat_portB_2 <= w_sys_tmp29;

									end
									else
									if((r_sys_fft_step==6'h1b)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h15)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h21)) begin
										r_ip_AddFloat_portB_2 <= { ~w_sys_tmp90[31], w_sys_tmp90[30:0] };

									end
									else
									if((r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h1f)) begin
										r_ip_AddFloat_portB_2 <= w_sys_tmp20;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((6'hf<=r_sys_fft_step && r_sys_fft_step<=6'h29) || (r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2d)) begin
										r_ip_AddFloat_portA_3 <= r_fft_dataRe_N_15;

									end
									else
									if((r_sys_fft_step==6'hd)) begin
										r_ip_AddFloat_portA_3 <= w_sys_tmp23;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h19)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp90[31], w_sys_tmp90[30:0] };

									end
									else
									if((r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h22) || (r_sys_fft_step==6'h24) || (r_sys_fft_step==6'h26) || (r_sys_fft_step==6'h28)) begin
										r_ip_AddFloat_portB_3 <= r_fft_tmpRe_17;

									end
									else
									if((r_sys_fft_step==6'h29)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp32[31], w_sys_tmp32[30:0] };

									end
									else
									if((r_sys_fft_step==6'h1d)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp32[31], w_sys_tmp32[30:0] };

									end
									else
									if((r_sys_fft_step==6'h25)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp90[31], w_sys_tmp90[30:0] };

									end
									else
									if((r_sys_fft_step==6'hd)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp25[31], w_sys_tmp25[30:0] };

									end
									else
									if((r_sys_fft_step==6'h11)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h13)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h2d)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp32[31], w_sys_tmp32[30:0] };

									end
									else
									if((r_sys_fft_step==6'h2b)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h27)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp32[31], w_sys_tmp32[30:0] };

									end
									else
									if((r_sys_fft_step==6'h1b)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp32[31], w_sys_tmp32[30:0] };

									end
									else
									if((r_sys_fft_step==6'h17)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp90[31], w_sys_tmp90[30:0] };

									end
									else
									if((r_sys_fft_step==6'h1f)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h23)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp32[31], w_sys_tmp32[30:0] };

									end
									else
									if((r_sys_fft_step==6'h21)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp32[31], w_sys_tmp32[30:0] };

									end
									else
									if((r_sys_fft_step==6'hf)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp29[31], w_sys_tmp29[30:0] };

									end
									else
									if((r_sys_fft_step==6'h15)) begin
										r_ip_AddFloat_portB_3 <= { ~w_sys_tmp32[31], w_sys_tmp32[30:0] };

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp19;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21)) begin
										r_ip_MultFloat_multiplier_0 <= r_fft_data_wRe_13;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21)) begin
										r_ip_MultFloat_multiplicand_1 <= w_sys_tmp21;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21)) begin
										r_ip_MultFloat_multiplier_1 <= r_fft_data_wIm_14;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21)) begin
										r_ip_MultFloat_multiplicand_2 <= w_sys_tmp21;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21)) begin
										r_ip_MultFloat_multiplier_2 <= r_fft_data_wRe_13;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21)) begin
										r_ip_MultFloat_multiplicand_3 <= w_sys_tmp19;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21)) begin
										r_ip_MultFloat_multiplier_3 <= r_fft_data_wIm_14;

									end
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
					r_sys_processing_methodID <= ((i_fft_start_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h2: begin

							case(r_sys_fft_start_stage) 
								2'h0: begin
									if((r_sys_fft_start_step==2'h0)) begin
										r_sys_processing_methodID <= 2'h2;

									end
								end

							endcase
						end

						3'h4: begin
							r_sys_processing_methodID <= r_sys_fft_start_caller;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fft_phase) 
						4'he: begin
							r_sys_processing_methodID <= r_sys_fft_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fft_start_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fft_start_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fft_start_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h0: begin
							r_sys_fft_start_phase <= 3'h2;
						end

						3'h2: begin

							case(r_sys_fft_start_stage) 
								2'h0: begin
									if((r_sys_fft_start_step==2'h1)) begin
										r_sys_fft_start_phase <= 3'h4;

									end
								end

							endcase
						end

						3'h4: begin
							r_sys_fft_start_phase <= 3'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fft_start_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h2: begin

							case(r_sys_fft_start_stage) 
								2'h0: begin
									if((r_sys_fft_start_step==2'h1)) begin
										r_sys_fft_start_stage <= 2'h0;

									end
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
			r_sys_fft_start_step <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h2: begin

							case(r_sys_fft_start_stage) 
								2'h0: begin
									if((r_sys_fft_start_step==2'h1)) begin
										r_sys_fft_start_step <= 2'h0;

									end
									else
									if((r_sys_fft_start_step==2'h0)) begin
										r_sys_fft_start_step <= w_sys_fft_start_step_p1;

									end
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
			r_sys_fft_start_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_fft_start_busy <= ((i_fft_start_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h0: begin
							r_sys_fft_start_busy <= w_sys_boolTrue;
						end

						3'h4: begin
							r_sys_fft_start_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fft_caller <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h2: begin

							case(r_sys_fft_start_stage) 
								2'h0: begin
									if((r_sys_fft_start_step==2'h0)) begin
										r_sys_fft_caller <= r_sys_processing_methodID;

									end
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
			r_sys_fft_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fft_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h0: begin
							r_sys_fft_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_phase <= ((w_sys_tmp3) ? 4'h9 : 4'he);

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_phase <= 4'ha;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_phase <= ((w_sys_tmp6) ? 4'hc : 4'h6);

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h35)) begin
										r_sys_fft_phase <= 4'ha;

									end
								end

							endcase
						end

						4'he: begin
							r_sys_fft_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fft_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h2: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_stage <= 2'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_stage <= 2'h0;

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h35)) begin
										r_sys_fft_stage <= 2'h0;

									end
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
			r_sys_fft_step <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h2: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_step <= 6'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_step <= 6'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_step <= 6'h0;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_step <= 6'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_step <= 6'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_sys_fft_step <= 6'h0;

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h35)) begin
										r_sys_fft_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_fft_step && r_sys_fft_step<=6'h34)) begin
										r_sys_fft_step <= w_sys_fft_step_p1;

									end
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
			r_sys_fft_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h0: begin
							r_sys_fft_busy <= w_sys_boolTrue;
						end

						4'he: begin
							r_sys_fft_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_dataRe_0_addr_1 <= 10'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h22) || (r_sys_fft_step==6'h24) || (r_sys_fft_step==6'h26) || (r_sys_fft_step==6'h28) || (r_sys_fft_step==6'h2a) || (r_sys_fft_step==6'h2c) || (r_sys_fft_step==6'h2e) || (r_sys_fft_step==6'h30) || (r_sys_fft_step==6'h32) || (r_sys_fft_step==6'h34)) begin
										r_fld_dataRe_0_addr_1 <= $signed( r_fft_wr_21[9:0] );

									end
									else
									if((r_sys_fft_step==6'h15)) begin
										r_fld_dataRe_0_addr_1 <= $signed( r_fft_wrx_22[9:0] );

									end
									else
									if((r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21) || (r_sys_fft_step==6'h23) || (r_sys_fft_step==6'h25) || (r_sys_fft_step==6'h27) || (r_sys_fft_step==6'h29) || (r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2d) || (r_sys_fft_step==6'h2f) || (r_sys_fft_step==6'h31) || (r_sys_fft_step==6'h33)) begin
										r_fld_dataRe_0_addr_1 <= $signed( w_sys_tmp84[9:0] );

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h30) || (r_sys_fft_step==6'h32) || (r_sys_fft_step==6'h34)) begin
										r_fld_dataRe_0_datain_1 <= r_sys_tmp10_float;

									end
									else
									if((6'h15<=r_sys_fft_step && r_sys_fft_step<=6'h2f) || (r_sys_fft_step==6'h31) || (r_sys_fft_step==6'h33)) begin
										r_fld_dataRe_0_datain_1 <= w_sys_tmp28;

									end
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
			r_fld_dataRe_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h4: begin
							r_fld_dataRe_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((6'h15<=r_sys_fft_step && r_sys_fft_step<=6'h34)) begin
										r_fld_dataRe_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'he: begin
							r_fld_dataRe_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_dataIm_1_addr_1 <= 10'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h22) || (r_sys_fft_step==6'h24) || (r_sys_fft_step==6'h26) || (r_sys_fft_step==6'h28) || (r_sys_fft_step==6'h2a) || (r_sys_fft_step==6'h2c) || (r_sys_fft_step==6'h2e) || (r_sys_fft_step==6'h30) || (r_sys_fft_step==6'h32) || (r_sys_fft_step==6'h34)) begin
										r_fld_dataIm_1_addr_1 <= $signed( r_fft_wr_21[9:0] );

									end
									else
									if((r_sys_fft_step==6'h15)) begin
										r_fld_dataIm_1_addr_1 <= $signed( r_fft_wrx_22[9:0] );

									end
									else
									if((r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21) || (r_sys_fft_step==6'h23) || (r_sys_fft_step==6'h25) || (r_sys_fft_step==6'h27) || (r_sys_fft_step==6'h29) || (r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2d) || (r_sys_fft_step==6'h2f) || (r_sys_fft_step==6'h31) || (r_sys_fft_step==6'h33)) begin
										r_fld_dataIm_1_addr_1 <= $signed( w_sys_tmp84[9:0] );

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h16) || (6'h1b<=r_sys_fft_step && r_sys_fft_step<=6'h1e) || (6'h27<=r_sys_fft_step && r_sys_fft_step<=6'h2a)) begin
										r_fld_dataIm_1_datain_1 <= w_sys_tmp31;

									end
									else
									if((r_sys_fft_step==6'h30) || (r_sys_fft_step==6'h32) || (r_sys_fft_step==6'h34)) begin
										r_fld_dataIm_1_datain_1 <= r_sys_tmp11_float;

									end
									else
									if((6'h21<=r_sys_fft_step && r_sys_fft_step<=6'h24) || (r_sys_fft_step==6'h2d) || (r_sys_fft_step==6'h2e) || (r_sys_fft_step==6'h2f) || (r_sys_fft_step==6'h31) || (r_sys_fft_step==6'h33)) begin
										r_fld_dataIm_1_datain_1 <= w_sys_tmp17;

									end
									else
									if((6'h17<=r_sys_fft_step && r_sys_fft_step<=6'h1a) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h25) || (r_sys_fft_step==6'h26) || (r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2c)) begin
										r_fld_dataIm_1_datain_1 <= w_sys_tmp22;

									end
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
			r_fld_dataIm_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h4: begin
							r_fld_dataIm_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((6'h15<=r_sys_fft_step && r_sys_fft_step<=6'h34)) begin
										r_fld_dataIm_1_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'he: begin
							r_fld_dataIm_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_wRe_2_addr_1 <= 9'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0) || (r_sys_fft_step==6'h1) || (r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d)) begin
										r_fld_wRe_2_addr_1 <= $signed( r_fft_m_19[8:0] );

									end
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
			r_fld_wRe_2_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h4: begin
							r_fld_wRe_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0) || (r_sys_fft_step==6'h1) || (r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d)) begin
										r_fld_wRe_2_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'he: begin
							r_fld_wRe_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_wIm_3_addr_1 <= 9'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0) || (r_sys_fft_step==6'h1) || (r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d)) begin
										r_fld_wIm_3_addr_1 <= $signed( r_fft_m_19[8:0] );

									end
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
			r_fld_wIm_3_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h4: begin
							r_fld_wIm_3_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0) || (r_sys_fft_step==6'h1) || (r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d)) begin
										r_fld_wIm_3_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'he: begin
							r_fld_wIm_3_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_dataNum_4 <= $signed( w_sys_tmp933[15:0] );

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fft_dataRe_5_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h1) || (r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f)) begin
										r_fft_dataRe_5_addr <= $signed( {{16{r_fft_rdx_23[15]}}, r_fft_rdx_23} );

									end
									else
									if((r_sys_fft_step==6'h0) || (r_sys_fft_step==6'h2) || (r_sys_fft_step==6'h4) || (r_sys_fft_step==6'h6) || (r_sys_fft_step==6'h8) || (r_sys_fft_step==6'ha) || (r_sys_fft_step==6'hc) || (r_sys_fft_step==6'he) || (r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e)) begin
										r_fft_dataRe_5_addr <= $signed( {{16{r_fft_rd_20[15]}}, r_fft_rd_20} );

									end
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
			r_fft_dataRe_5_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h4: begin
							r_fft_dataRe_5_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((6'h0<=r_sys_fft_step && r_sys_fft_step<=6'h1f)) begin
										r_fft_dataRe_5_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'he: begin
							r_fft_dataRe_5_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fft_dataIm_6_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h1) || (r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f)) begin
										r_fft_dataIm_6_addr <= $signed( {{16{r_fft_rdx_23[15]}}, r_fft_rdx_23} );

									end
									else
									if((r_sys_fft_step==6'h0) || (r_sys_fft_step==6'h2) || (r_sys_fft_step==6'h4) || (r_sys_fft_step==6'h6) || (r_sys_fft_step==6'h8) || (r_sys_fft_step==6'ha) || (r_sys_fft_step==6'hc) || (r_sys_fft_step==6'he) || (r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e)) begin
										r_fft_dataIm_6_addr <= $signed( {{16{r_fft_rd_20[15]}}, r_fft_rd_20} );

									end
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
			r_fft_dataIm_6_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_fft_start_phase) 
						3'h4: begin
							r_fft_dataIm_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((6'h0<=r_sys_fft_step && r_sys_fft_step<=6'h1f)) begin
										r_fft_dataIm_6_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'he: begin
							r_fft_dataIm_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h4: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_i_7 <= $signed( w_sys_intOne[15:0] );

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_i_7 <= $signed( w_sys_tmp4[15:0] );

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h2: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_j_8 <= w_sys_tmp1;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_j_8 <= $signed( w_sys_tmp5[15:0] );

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h9: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_k_rd_9 <= $signed( w_sys_intZero[15:0] );

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0) || (r_sys_fft_step==6'h2) || (r_sys_fft_step==6'h4) || (r_sys_fft_step==6'h6) || (r_sys_fft_step==6'h8) || (r_sys_fft_step==6'ha) || (r_sys_fft_step==6'hc) || (r_sys_fft_step==6'he) || (r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e)) begin
										r_fft_k_rd_9 <= w_sys_tmp47;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h9: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_k_wr_10 <= $signed( w_sys_intZero[15:0] );

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h22) || (r_sys_fft_step==6'h24) || (r_sys_fft_step==6'h26) || (r_sys_fft_step==6'h28) || (r_sys_fft_step==6'h2a) || (r_sys_fft_step==6'h2c) || (r_sys_fft_step==6'h2e) || (r_sys_fft_step==6'h30) || (r_sys_fft_step==6'h32) || (r_sys_fft_step==6'h34)) begin
										r_fft_k_wr_10 <= w_sys_tmp51;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21)) begin
										r_fft_data_Re_11 <= w_sys_tmp13;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21)) begin
										r_fft_data_Im_12 <= w_sys_tmp14;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h2) || (r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f)) begin
										r_fft_data_wRe_13 <= w_sys_tmp11;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h2) || (r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f)) begin
										r_fft_data_wIm_14 <= w_sys_tmp12;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h2b)) begin
										r_fft_dataRe_N_15 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h28)) begin
										r_fft_dataRe_N_15 <= r_sys_tmp8_float;

									end
									else
									if((r_sys_fft_step==6'h2)) begin
										r_fft_dataRe_N_15 <= w_sys_tmp13;

									end
									else
									if((r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h26)) begin
										r_fft_dataRe_N_15 <= r_sys_tmp10_float;

									end
									else
									if((r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h22)) begin
										r_fft_dataRe_N_15 <= r_sys_tmp2_float;

									end
									else
									if((r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h24)) begin
										r_fft_dataRe_N_15 <= r_sys_tmp0_float;

									end
									else
									if((r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h1e) || (r_sys_fft_step==6'h29)) begin
										r_fft_dataRe_N_15 <= r_sys_tmp6_float;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h28)) begin
										r_fft_dataIm_N_16 <= r_sys_tmp9_float;

									end
									else
									if((r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h24)) begin
										r_fft_dataIm_N_16 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h26)) begin
										r_fft_dataIm_N_16 <= r_sys_tmp11_float;

									end
									else
									if((r_sys_fft_step==6'h2)) begin
										r_fft_dataIm_N_16 <= w_sys_tmp14;

									end
									else
									if((r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h2b)) begin
										r_fft_dataIm_N_16 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h22)) begin
										r_fft_dataIm_N_16 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h1e) || (r_sys_fft_step==6'h29)) begin
										r_fft_dataIm_N_16 <= r_sys_tmp7_float;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h25)) begin
										r_fft_tmpRe_17 <= w_sys_tmp31;

									end
									else
									if((r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h2b)) begin
										r_fft_tmpRe_17 <= w_sys_tmp17;

									end
									else
									if((r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h21) || (r_sys_fft_step==6'h23) || (r_sys_fft_step==6'h27) || (r_sys_fft_step==6'h29) || (r_sys_fft_step==6'h2d)) begin
										r_fft_tmpRe_17 <= w_sys_tmp22;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21) || (r_sys_fft_step==6'h23) || (r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2d)) begin
										r_fft_tmpIm_18 <= w_sys_tmp31;

									end
									else
									if((r_sys_fft_step==6'h13)) begin
										r_fft_tmpIm_18 <= w_sys_tmp28;

									end
									else
									if((r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h25) || (r_sys_fft_step==6'h27) || (r_sys_fft_step==6'h29)) begin
										r_fft_tmpIm_18 <= w_sys_tmp17;

									end
									else
									if((r_sys_fft_step==6'hf)) begin
										r_fft_tmpIm_18 <= w_sys_tmp22;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h4: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_m_19 <= $signed( w_sys_intZero[15:0] );

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_m_19 <= $signed( w_sys_intZero[15:0] );

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0) || (r_sys_fft_step==6'h2) || (r_sys_fft_step==6'h4) || (r_sys_fft_step==6'h6) || (r_sys_fft_step==6'h8) || (r_sys_fft_step==6'ha) || (r_sys_fft_step==6'hc) || (r_sys_fft_step==6'he) || (r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e)) begin
										r_fft_m_19 <= w_sys_tmp55;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h9: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_rd_20 <= $signed( w_sys_intZero[15:0] );

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h1) || (r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f)) begin
										r_fft_rd_20 <= w_sys_tmp59;

									end
									else
									if((r_sys_fft_step==6'h0) || (r_sys_fft_step==6'h2) || (r_sys_fft_step==6'h4) || (r_sys_fft_step==6'h6) || (r_sys_fft_step==6'h8) || (r_sys_fft_step==6'ha) || (r_sys_fft_step==6'hc) || (r_sys_fft_step==6'he) || (r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e)) begin
										r_fft_rd_20 <= $signed( w_sys_tmp37[15:0] );

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h9: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_wr_21 <= $signed( w_sys_intZero[15:0] );

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h22) || (r_sys_fft_step==6'h24) || (r_sys_fft_step==6'h26) || (r_sys_fft_step==6'h28) || (r_sys_fft_step==6'h2a) || (r_sys_fft_step==6'h2c) || (r_sys_fft_step==6'h2e) || (r_sys_fft_step==6'h30) || (r_sys_fft_step==6'h32) || (r_sys_fft_step==6'h34)) begin
										r_fft_wr_21 <= $signed( w_sys_tmp39[15:0] );

									end
									else
									if((r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21) || (r_sys_fft_step==6'h23) || (r_sys_fft_step==6'h25) || (r_sys_fft_step==6'h27) || (r_sys_fft_step==6'h29) || (r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2d) || (r_sys_fft_step==6'h2f) || (r_sys_fft_step==6'h31) || (r_sys_fft_step==6'h33) || (r_sys_fft_step==6'h35)) begin
										r_fft_wr_21 <= w_sys_tmp61;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d) || (r_sys_fft_step==6'h1f) || (r_sys_fft_step==6'h21) || (r_sys_fft_step==6'h23) || (r_sys_fft_step==6'h25) || (r_sys_fft_step==6'h27) || (r_sys_fft_step==6'h29) || (r_sys_fft_step==6'h2b) || (r_sys_fft_step==6'h2d) || (r_sys_fft_step==6'h2f) || (r_sys_fft_step==6'h31) || (r_sys_fft_step==6'h33)) begin
										r_fft_wrx_22 <= w_sys_tmp66;

									end
									else
									if((r_sys_fft_step==6'h0)) begin
										r_fft_wrx_22 <= w_sys_tmp9;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h1) || (r_sys_fft_step==6'h3) || (r_sys_fft_step==6'h5) || (r_sys_fft_step==6'h7) || (r_sys_fft_step==6'h9) || (r_sys_fft_step==6'hb) || (r_sys_fft_step==6'hd) || (r_sys_fft_step==6'hf) || (r_sys_fft_step==6'h11) || (r_sys_fft_step==6'h13) || (r_sys_fft_step==6'h15) || (r_sys_fft_step==6'h17) || (r_sys_fft_step==6'h19) || (r_sys_fft_step==6'h1b) || (r_sys_fft_step==6'h1d)) begin
										r_fft_rdx_23 <= w_sys_tmp63;

									end
									else
									if((r_sys_fft_step==6'h0)) begin
										r_fft_rdx_23 <= w_sys_tmp7;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h2: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_gotoNextStageRd_24 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0) || (r_sys_fft_step==6'h2) || (r_sys_fft_step==6'h4) || (r_sys_fft_step==6'h6) || (r_sys_fft_step==6'h8) || (r_sys_fft_step==6'ha) || (r_sys_fft_step==6'hc) || (r_sys_fft_step==6'he) || (r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e)) begin
										r_fft_gotoNextStageRd_24 <= w_sys_tmp41;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'h2: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h0)) begin
										r_fft_gotoNextStageWr_25 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h16) || (r_sys_fft_step==6'h18) || (r_sys_fft_step==6'h1a) || (r_sys_fft_step==6'h1c) || (r_sys_fft_step==6'h1e) || (r_sys_fft_step==6'h20) || (r_sys_fft_step==6'h22) || (r_sys_fft_step==6'h24) || (r_sys_fft_step==6'h26) || (r_sys_fft_step==6'h28) || (r_sys_fft_step==6'h2a) || (r_sys_fft_step==6'h2c) || (r_sys_fft_step==6'h2e) || (r_sys_fft_step==6'h30) || (r_sys_fft_step==6'h32) || (r_sys_fft_step==6'h34)) begin
										r_fft_gotoNextStageWr_25 <= w_sys_tmp44;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'hc) || (r_sys_fft_step==6'h18)) begin
										r_sys_tmp0_float <= w_fft_dataRe_5_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'hc) || (r_sys_fft_step==6'h18)) begin
										r_sys_tmp1_float <= w_fft_dataIm_6_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'ha) || (r_sys_fft_step==6'h16)) begin
										r_sys_tmp2_float <= w_fft_dataRe_5_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'ha) || (r_sys_fft_step==6'h16)) begin
										r_sys_tmp3_float <= w_fft_dataIm_6_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h8) || (r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h20)) begin
										r_sys_tmp4_float <= w_fft_dataRe_5_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h8) || (r_sys_fft_step==6'h14) || (r_sys_fft_step==6'h20)) begin
										r_sys_tmp5_float <= w_fft_dataIm_6_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h6) || (r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h1e)) begin
										r_sys_tmp6_float <= w_fft_dataRe_5_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h6) || (r_sys_fft_step==6'h12) || (r_sys_fft_step==6'h1e)) begin
										r_sys_tmp7_float <= w_fft_dataIm_6_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h4) || (r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h1c)) begin
										r_sys_tmp8_float <= w_fft_dataRe_5_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h4) || (r_sys_fft_step==6'h10) || (r_sys_fft_step==6'h1c)) begin
										r_sys_tmp9_float <= w_fft_dataIm_6_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'h2f) || (r_sys_fft_step==6'h31) || (r_sys_fft_step==6'h33)) begin
										r_sys_tmp10_float <= w_ip_AddFloat_result_1;

									end
									else
									if((r_sys_fft_step==6'he) || (r_sys_fft_step==6'h1a)) begin
										r_sys_tmp10_float <= w_fft_dataRe_5_dataout;

									end
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
				2'h2: begin

					case(r_sys_fft_phase) 
						4'hc: begin

							case(r_sys_fft_stage) 
								2'h0: begin
									if((r_sys_fft_step==6'he) || (r_sys_fft_step==6'h1a)) begin
										r_sys_tmp11_float <= w_fft_dataIm_6_dataout;

									end
									else
									if((r_sys_fft_step==6'h2f) || (r_sys_fft_step==6'h31) || (r_sys_fft_step==6'h33)) begin
										r_sys_tmp11_float <= w_ip_AddFloat_result_2;

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
