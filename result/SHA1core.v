/*
TimeStamp:	2013/12/16		12:59
*/


module SHA1core(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_sha_transform_req,	
	output                o_sha_transform_busy,	
	output signed  [31:0] o_fld_SHA1_H0_0,	
	output signed  [31:0] o_fld_SHA1_H1_1,	
	output signed  [31:0] o_fld_SHA1_H2_2,	
	output signed  [31:0] o_fld_SHA1_H3_3,	
	output signed  [31:0] o_fld_SHA1_H4_4,	
	output signed  [31:0] o_sha_transform_data_30_addr,	
	output signed  [31:0] o_sha_transform_data_30_datain,	
	input  signed  [31:0] i_sha_transform_data_30_dataout,	
	output                o_sha_transform_data_30_r_w,	
	output                o_sha_transform_data_30_ce	
);

	reg  signed [31:0] r_ip_Rotate1_num_0;
	wire signed [31:0] w_ip_Rotate1_result_0;
	reg  signed [31:0] r_ip_Rotate5_num_0;
	wire signed [31:0] w_ip_Rotate5_result_0;
	reg  signed [31:0] r_ip_Rotate30_num_0;
	wire signed [31:0] w_ip_Rotate30_result_0;
	reg  signed [31:0] r_ip_F0_x_0;
	reg  signed [31:0] r_ip_F0_y_0;
	reg  signed [31:0] r_ip_F0_z_0;
	wire signed [31:0] w_ip_F0_result_0;
	reg  signed [31:0] r_ip_F1_x_0;
	reg  signed [31:0] r_ip_F1_y_0;
	reg  signed [31:0] r_ip_F1_z_0;
	wire signed [31:0] w_ip_F1_result_0;
	reg  signed [31:0] r_ip_F2_x_0;
	reg  signed [31:0] r_ip_F2_y_0;
	reg  signed [31:0] r_ip_F2_z_0;
	wire signed [31:0] w_ip_F2_result_0;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 1:0] r_sys_sha_transform_caller;
	reg                r_sys_sha_transform_req;
	reg         [ 3:0] r_sys_sha_transform_phase;
	reg         [ 1:0] r_sys_sha_transform_stage;
	reg         [ 6:0] r_sys_sha_transform_step;
	reg                r_sys_sha_transform_busy;
	wire        [ 1:0] w_sys_sha_transform_stage_p1;
	wire        [ 6:0] w_sys_sha_transform_step_p1;
	reg  signed [31:0] r_fld_SHA1_H0_0;
	reg  signed [31:0] r_fld_SHA1_H1_1;
	reg  signed [31:0] r_fld_SHA1_H2_2;
	reg  signed [31:0] r_fld_SHA1_H3_3;
	reg  signed [31:0] r_fld_SHA1_H4_4;
	reg  signed [31:0] r_fld_SHA1_K0_5;
	reg  signed [31:0] r_fld_SHA1_K1_6;
	reg  signed [31:0] r_fld_SHA1_K2_7;
	reg  signed [31:0] r_fld_SHA1_K3_8;
	reg  signed [31:0] r_fld_w0_9;
	reg  signed [31:0] r_fld_w1_10;
	reg  signed [31:0] r_fld_w2_11;
	reg  signed [31:0] r_fld_w3_12;
	reg  signed [31:0] r_fld_w4_13;
	reg  signed [31:0] r_fld_w5_14;
	reg  signed [31:0] r_fld_w6_15;
	reg  signed [31:0] r_fld_w7_16;
	reg  signed [31:0] r_fld_w8_17;
	reg  signed [31:0] r_fld_w9_18;
	reg  signed [31:0] r_fld_w10_19;
	reg  signed [31:0] r_fld_w11_20;
	reg  signed [31:0] r_fld_w12_21;
	reg  signed [31:0] r_fld_w13_22;
	reg  signed [31:0] r_fld_w14_23;
	reg  signed [31:0] r_fld_w15_24;
	reg  signed [31:0] r_fld_a_25;
	reg  signed [31:0] r_fld_b_26;
	reg  signed [31:0] r_fld_c_27;
	reg  signed [31:0] r_fld_d_28;
	reg  signed [31:0] r_fld_e_29;
	reg  signed [31:0] r_sha_transform_data_30_addr;
	reg  signed [31:0] r_sha_transform_data_30_datain;
	wire signed [31:0] w_sha_transform_data_30_dataout;
	reg                r_sha_transform_data_30_r_w;
	wire signed [31:0] w_sha_transform_data_30_addr;
	wire signed [31:0] w_sha_transform_data_30_datain;
	wire               w_sha_transform_data_30_r_w;
	wire               w_sha_transform_data_30_ce;
	wire               w_sha_transform_data_30_cacheHit;
	reg  signed [31:0] r_sha_transform_nextW15_31;
	reg  signed [31:0] r_sha_transform_tempA_32;
	reg  signed [31:0] r_sha_transform_tempB_33;
	reg  signed [31:0] r_sha_transform_SHA1_K_34;
	reg  signed [31:0] r_sha_transform_f0_35;
	reg  signed [31:0] r_sha_transform_f1_36;
	reg  signed [31:0] r_sha_transform_f2_37;
	reg  signed [31:0] r_sha_transform_function_38;
	reg  signed [ 7:0] r_sha_transform_i_39;
	reg  signed [ 7:0] r_sha_transform_copy0_i_56;
	reg  signed [ 7:0] r_sha_transform_copy1_i_57;
	reg  signed [ 7:0] r_sha_transform_copy2_i_58;
	reg  signed [ 7:0] r_sha_transform_copy3_i_59;
	reg  signed [ 7:0] r_sha_transform_copy4_i_60;
	reg  signed [ 7:0] r_sha_transform_copy5_i_61;
	reg  signed [ 7:0] r_sha_transform_copy6_i_62;
	reg  signed [31:0] r_sys_tmp0_int;
	reg  signed [31:0] r_sys_tmp1_int;
	reg  signed [31:0] r_sys_tmp2_int;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire               w_sys_tmp7;
	wire signed [31:0] w_sys_tmp8;
	wire               w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire               w_sys_tmp11;
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
	wire               w_sys_tmp23;
	wire               w_sys_tmp25;
	wire               w_sys_tmp27;
	wire signed [31:0] w_sys_tmp29;
	wire signed [31:0] w_sys_tmp30;
	wire signed [31:0] w_sys_tmp31;
	wire signed [31:0] w_sys_tmp32;
	wire signed [31:0] w_sys_tmp33;
	wire               w_sys_tmp34;
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
	wire signed [31:0] w_sys_tmp61;
	wire signed [31:0] w_sys_tmp62;
	wire signed [31:0] w_sys_tmp89;
	wire signed [31:0] w_sys_tmp90;
	wire signed [31:0] w_sys_tmp91;
	wire signed [31:0] w_sys_tmp93;
	wire signed [31:0] w_sys_tmp95;
	wire signed [31:0] w_sys_tmp96;
	wire signed [31:0] w_sys_tmp97;
	wire signed [31:0] w_sys_tmp116;
	wire signed [31:0] w_sys_tmp117;
	wire signed [31:0] w_sys_tmp152;
	wire signed [31:0] w_sys_tmp158;
	wire signed [31:0] w_sys_tmp178;
	wire signed [31:0] w_sys_tmp204;
	wire signed [31:0] w_sys_tmp205;
	wire signed [31:0] w_sys_tmp206;
	wire signed [31:0] w_sys_tmp207;
	wire signed [31:0] w_sys_tmp5096;
	wire signed [31:0] w_sys_tmp5097;
	wire signed [31:0] w_sys_tmp5098;
	wire signed [31:0] w_sys_tmp5099;
	wire signed [31:0] w_sys_tmp5100;
	wire signed [31:0] w_sys_tmp5101;
	wire signed [31:0] w_sys_tmp5102;
	wire signed [31:0] w_sys_tmp5103;
	wire signed [31:0] w_sys_tmp5104;
	wire signed [31:0] w_sys_tmp5105;
	wire signed [31:0] w_sys_tmp5106;
	wire signed [31:0] w_sys_tmp5107;
	wire signed [31:0] w_sys_tmp5108;
	wire signed [31:0] w_sys_tmp5109;
	wire signed [31:0] w_sys_tmp5110;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_sha_transform_data_30_cacheHit;
	assign o_sha_transform_busy = r_sys_sha_transform_busy;
	assign w_sys_sha_transform_stage_p1 = (r_sys_sha_transform_stage + 2'h1);
	assign w_sys_sha_transform_step_p1 = (r_sys_sha_transform_step + 7'h1);
	assign o_fld_SHA1_H0_0 = r_fld_SHA1_H0_0;
	assign o_fld_SHA1_H1_1 = r_fld_SHA1_H1_1;
	assign o_fld_SHA1_H2_2 = r_fld_SHA1_H2_2;
	assign o_fld_SHA1_H3_3 = r_fld_SHA1_H3_3;
	assign o_fld_SHA1_H4_4 = r_fld_SHA1_H4_4;
	assign w_sha_transform_data_30_dataout = i_sha_transform_data_30_dataout;
	assign w_sha_transform_data_30_addr = r_sha_transform_data_30_addr;
	assign w_sha_transform_data_30_datain = r_sha_transform_data_30_datain;
	assign w_sha_transform_data_30_r_w = r_sha_transform_data_30_r_w;
	assign w_sha_transform_data_30_ce = w_sys_ce;
	assign w_sha_transform_data_30_cacheHit = w_sys_boolTrue;
	assign o_sha_transform_data_30_addr = w_sha_transform_data_30_addr;
	assign o_sha_transform_data_30_datain = w_sha_transform_data_30_datain;
	assign o_sha_transform_data_30_r_w = w_sha_transform_data_30_r_w;
	assign o_sha_transform_data_30_ce = w_sha_transform_data_30_ce;
	assign w_sys_tmp1 = ($signed( {{24{r_sha_transform_i_39[7]}}, r_sha_transform_i_39} ) < w_sys_tmp2);
	assign w_sys_tmp2 = 32'sh00000050;
	assign w_sys_tmp4 = ((w_sys_tmp11) ? r_fld_SHA1_K0_5 : w_sys_tmp5);
	assign w_sys_tmp5 = ((w_sys_tmp9) ? r_fld_SHA1_K1_6 : w_sys_tmp6);
	assign w_sys_tmp6 = ((w_sys_tmp7) ? r_fld_SHA1_K2_7 : r_fld_SHA1_K3_8);
	assign w_sys_tmp7 = ($signed( {{24{r_sha_transform_i_39[7]}}, r_sha_transform_i_39} ) < w_sys_tmp8);
	assign w_sys_tmp8 = 32'sh0000003c;
	assign w_sys_tmp9 = ($signed( {{24{r_sha_transform_copy6_i_62[7]}}, r_sha_transform_copy6_i_62} ) < w_sys_tmp10);
	assign w_sys_tmp10 = 32'sh00000028;
	assign w_sys_tmp11 = ($signed( {{24{r_sha_transform_copy5_i_61[7]}}, r_sha_transform_copy5_i_61} ) < w_sys_tmp12);
	assign w_sys_tmp12 = 32'sh00000014;
	assign w_sys_tmp13 = w_ip_F0_result_0;
	assign w_sys_tmp14 = w_ip_F1_result_0;
	assign w_sys_tmp15 = w_ip_F2_result_0;
	assign w_sys_tmp16 = ((w_sys_tmp27) ? w_sys_tmp17 : w_sys_tmp18);
	assign w_sys_tmp17 = w_sys_tmp13;
	assign w_sys_tmp18 = ((w_sys_tmp25) ? w_sys_tmp19 : w_sys_tmp20);
	assign w_sys_tmp19 = w_sys_tmp14;
	assign w_sys_tmp20 = ((w_sys_tmp23) ? w_sys_tmp21 : w_sys_tmp19);
	assign w_sys_tmp21 = w_sys_tmp15;
	assign w_sys_tmp23 = ($signed( {{24{r_sha_transform_copy4_i_60[7]}}, r_sha_transform_copy4_i_60} ) < w_sys_tmp8);
	assign w_sys_tmp25 = ($signed( {{24{r_sha_transform_copy3_i_59[7]}}, r_sha_transform_copy3_i_59} ) < w_sys_tmp10);
	assign w_sys_tmp27 = ($signed( {{24{r_sha_transform_copy2_i_58[7]}}, r_sha_transform_copy2_i_58} ) < w_sys_tmp12);
	assign w_sys_tmp29 = ((w_sys_tmp34) ? w_sys_tmp30 : r_sys_tmp2_int);
	assign w_sys_tmp30 = w_sha_transform_data_30_dataout;
	assign w_sys_tmp31 = (w_sys_tmp32 ^ r_fld_w0_9);
	assign w_sys_tmp32 = (w_sys_tmp33 ^ r_fld_w2_11);
	assign w_sys_tmp33 = (r_fld_w13_22 ^ r_fld_w8_17);
	assign w_sys_tmp34 = ($signed( {{24{r_sha_transform_copy0_i_56[7]}}, r_sha_transform_copy0_i_56} ) < w_sys_tmp35);
	assign w_sys_tmp35 = 32'sh00000010;
	assign w_sys_tmp36 = (w_sys_tmp37 + r_fld_e_29);
	assign w_sys_tmp37 = w_sys_tmp16;
	assign w_sys_tmp38 = (r_sys_tmp1_int + r_sha_transform_nextW15_31);
	assign w_sys_tmp39 = w_ip_Rotate5_result_0;
	assign w_sys_tmp40 = w_ip_Rotate30_result_0;
	assign w_sys_tmp41 = (r_sha_transform_tempA_32 + w_sys_tmp42);
	assign w_sys_tmp42 = w_sys_tmp38;
	assign w_sys_tmp43 = ($signed( {{24{r_sha_transform_copy0_i_56[7]}}, r_sha_transform_copy0_i_56} ) + w_sys_intOne);
	assign w_sys_tmp44 = ($signed( {{24{r_sha_transform_copy1_i_57[7]}}, r_sha_transform_copy1_i_57} ) + w_sys_intOne);
	assign w_sys_tmp45 = ($signed( {{24{r_sha_transform_copy2_i_58[7]}}, r_sha_transform_copy2_i_58} ) + w_sys_intOne);
	assign w_sys_tmp46 = ($signed( {{24{r_sha_transform_copy3_i_59[7]}}, r_sha_transform_copy3_i_59} ) + w_sys_intOne);
	assign w_sys_tmp47 = ($signed( {{24{r_sha_transform_copy4_i_60[7]}}, r_sha_transform_copy4_i_60} ) + w_sys_intOne);
	assign w_sys_tmp48 = ($signed( {{24{r_sha_transform_copy5_i_61[7]}}, r_sha_transform_copy5_i_61} ) + w_sys_intOne);
	assign w_sys_tmp49 = ($signed( {{24{r_sha_transform_copy6_i_62[7]}}, r_sha_transform_copy6_i_62} ) + w_sys_intOne);
	assign w_sys_tmp50 = ($signed( {{24{r_sha_transform_i_39[7]}}, r_sha_transform_i_39} ) + w_sys_intOne);
	assign w_sys_tmp61 = w_sys_tmp40;
	assign w_sys_tmp62 = r_fld_c_27;
	assign w_sys_tmp89 = (r_sha_transform_function_38 + r_fld_e_29);
	assign w_sys_tmp90 = (w_sys_tmp91 + r_sha_transform_nextW15_31);
	assign w_sys_tmp91 = (r_sha_transform_SHA1_K_34 + w_sys_tmp39);
	assign w_sys_tmp93 = w_sys_tmp41;
	assign w_sys_tmp95 = (r_sha_transform_tempA_32 + w_sys_tmp96);
	assign w_sys_tmp96 = w_sys_tmp90;
	assign w_sys_tmp97 = r_sha_transform_nextW15_31;
	assign w_sys_tmp116 = w_sys_tmp93;
	assign w_sys_tmp117 = r_sys_tmp0_int;
	assign w_sys_tmp152 = w_sys_tmp95;
	assign w_sys_tmp158 = w_sys_tmp97;
	assign w_sys_tmp178 = w_sys_tmp152;
	assign w_sys_tmp204 = (w_sys_tmp205 ^ r_fld_w0_9);
	assign w_sys_tmp205 = (w_sys_tmp206 ^ r_fld_w2_11);
	assign w_sys_tmp206 = (w_sys_tmp207 ^ r_fld_w8_17);
	assign w_sys_tmp207 = w_sys_tmp158;
	assign w_sys_tmp5096 = (r_fld_SHA1_H0_0 + r_fld_a_25);
	assign w_sys_tmp5097 = (r_fld_SHA1_H1_1 + r_fld_b_26);
	assign w_sys_tmp5098 = (r_fld_SHA1_H2_2 + r_fld_c_27);
	assign w_sys_tmp5099 = (r_fld_SHA1_H3_3 + r_fld_d_28);
	assign w_sys_tmp5100 = (r_fld_SHA1_H4_4 + r_fld_e_29);
	assign w_sys_tmp5101 = 32'sh67452301;
	assign w_sys_tmp5102 = 32'shefcdab89;
	assign w_sys_tmp5103 = 32'sh98badcfe;
	assign w_sys_tmp5104 = 32'sh10325476;
	assign w_sys_tmp5105 = 32'shc3d2e1f0;
	assign w_sys_tmp5106 = 32'sh5a827999;
	assign w_sys_tmp5107 = 32'sh6ed9eba1;
	assign w_sys_tmp5108 = 32'sh8f1bbcdc;
	assign w_sys_tmp5109 = 32'shca62c1d6;
	assign w_sys_tmp5110 = (r_sha_transform_SHA1_K_34 + w_sys_tmp39);


	Rotate1
		Rotate1_inst_0(
			.num (r_ip_Rotate1_num_0),	// in 32bit
			.result (w_ip_Rotate1_result_0)	// out 32bit
		);

	Rotate5
		Rotate5_inst_0(
			.num (r_ip_Rotate5_num_0),	// in 32bit
			.result (w_ip_Rotate5_result_0)	// out 32bit
		);

	Rotate30
		Rotate30_inst_0(
			.num (r_ip_Rotate30_num_0),	// in 32bit
			.result (w_ip_Rotate30_result_0)	// out 32bit
		);

	F0
		F0_inst_0(
			.x (r_ip_F0_x_0),	// in 32bit
			.y (r_ip_F0_y_0),	// in 32bit
			.z (r_ip_F0_z_0),	// in 32bit
			.result (w_ip_F0_result_0)	// out 32bit
		);

	F1
		F1_inst_0(
			.x (r_ip_F1_x_0),	// in 32bit
			.y (r_ip_F1_y_0),	// in 32bit
			.z (r_ip_F1_z_0),	// in 32bit
			.result (w_ip_F1_result_0)	// out 32bit
		);

	F2
		F2_inst_0(
			.x (r_ip_F2_x_0),	// in 32bit
			.y (r_ip_F2_y_0),	// in 32bit
			.z (r_ip_F2_z_0),	// in 32bit
			.result (w_ip_F2_result_0)	// out 32bit
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0) || (r_sys_sha_transform_step==7'h1) || (r_sys_sha_transform_step==7'h2)) begin
										r_ip_Rotate1_num_0 <= w_sys_tmp31;

									end
									else
									if((7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_ip_Rotate1_num_0 <= w_sys_tmp204;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h3)) begin
										r_ip_Rotate5_num_0 <= w_sys_tmp93;

									end
									else
									if((7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_ip_Rotate5_num_0 <= w_sys_tmp152;

									end
									else
									if((r_sys_sha_transform_step==7'h0)) begin
										r_ip_Rotate5_num_0 <= r_fld_a_25;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h3)) begin
										r_ip_Rotate30_num_0 <= w_sys_tmp116;

									end
									else
									if((r_sys_sha_transform_step==7'h0) || (r_sys_sha_transform_step==7'h1)) begin
										r_ip_Rotate30_num_0 <= r_fld_b_26;

									end
									else
									if((7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_ip_Rotate30_num_0 <= w_sys_tmp178;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h3)) begin
										r_ip_F0_x_0 <= w_sys_tmp116;

									end
									else
									if((r_sys_sha_transform_step==7'h0) || (r_sys_sha_transform_step==7'h1)) begin
										r_ip_F0_x_0 <= r_fld_b_26;

									end
									else
									if((7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_ip_F0_x_0 <= w_sys_tmp178;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_ip_F0_y_0 <= r_fld_c_27;

									end
									else
									if((r_sys_sha_transform_step==7'h3)) begin
										r_ip_F0_y_0 <= w_sys_tmp117;

									end
									else
									if((r_sys_sha_transform_step==7'h1) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_ip_F0_y_0 <= w_sys_tmp61;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_ip_F0_z_0 <= w_sys_tmp62;

									end
									else
									if((r_sys_sha_transform_step==7'h0)) begin
										r_ip_F0_z_0 <= r_fld_d_28;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h3)) begin
										r_ip_F1_x_0 <= w_sys_tmp116;

									end
									else
									if((r_sys_sha_transform_step==7'h0) || (r_sys_sha_transform_step==7'h1)) begin
										r_ip_F1_x_0 <= r_fld_b_26;

									end
									else
									if((7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_ip_F1_x_0 <= w_sys_tmp178;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_ip_F1_y_0 <= r_fld_c_27;

									end
									else
									if((r_sys_sha_transform_step==7'h3)) begin
										r_ip_F1_y_0 <= w_sys_tmp117;

									end
									else
									if((r_sys_sha_transform_step==7'h1) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_ip_F1_y_0 <= w_sys_tmp61;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_ip_F1_z_0 <= w_sys_tmp62;

									end
									else
									if((r_sys_sha_transform_step==7'h0)) begin
										r_ip_F1_z_0 <= r_fld_d_28;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h3)) begin
										r_ip_F2_x_0 <= w_sys_tmp116;

									end
									else
									if((r_sys_sha_transform_step==7'h0) || (r_sys_sha_transform_step==7'h1)) begin
										r_ip_F2_x_0 <= r_fld_b_26;

									end
									else
									if((7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_ip_F2_x_0 <= w_sys_tmp178;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_ip_F2_y_0 <= r_fld_c_27;

									end
									else
									if((r_sys_sha_transform_step==7'h3)) begin
										r_ip_F2_y_0 <= w_sys_tmp117;

									end
									else
									if((r_sys_sha_transform_step==7'h1) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_ip_F2_y_0 <= w_sys_tmp61;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_ip_F2_z_0 <= w_sys_tmp62;

									end
									else
									if((r_sys_sha_transform_step==7'h0)) begin
										r_ip_F2_z_0 <= r_fld_d_28;

									end
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
					r_sys_processing_methodID <= ((i_sha_transform_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'hb: begin
							r_sys_processing_methodID <= r_sys_sha_transform_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sha_transform_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sha_transform_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sha_transform_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h0: begin
							r_sys_sha_transform_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h1: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_phase <= ((w_sys_tmp1) ? 4'h8 : 4'h9);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h52)) begin
										r_sys_sha_transform_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_phase <= 4'hb;

									end
								end

							endcase
						end

						4'hb: begin
							r_sys_sha_transform_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sha_transform_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h2: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_stage <= w_sys_sha_transform_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h52)) begin
										r_sys_sha_transform_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_stage <= 2'h0;

									end
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
			r_sys_sha_transform_step <= 7'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h2: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_step <= 7'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_step <= 7'h0;

									end
								end

								2'h1: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_step <= 7'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_step <= 7'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sys_sha_transform_step <= w_sys_sha_transform_step_p1;

									end
									else
									if((r_sys_sha_transform_step==7'h52)) begin
										r_sys_sha_transform_step <= 7'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sys_sha_transform_step <= 7'h0;

									end
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
			r_sys_sha_transform_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_sha_transform_busy <= ((i_sha_transform_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h0: begin
							r_sys_sha_transform_busy <= w_sys_boolTrue;
						end

						4'hb: begin
							r_sys_sha_transform_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_SHA1_H0_0 <= w_sys_tmp5101;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h9: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_SHA1_H0_0 <= w_sys_tmp5096;

									end
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
			r_fld_SHA1_H1_1 <= w_sys_tmp5102;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h9: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_SHA1_H1_1 <= w_sys_tmp5097;

									end
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
			r_fld_SHA1_H2_2 <= w_sys_tmp5103;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h9: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_SHA1_H2_2 <= w_sys_tmp5098;

									end
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
			r_fld_SHA1_H3_3 <= w_sys_tmp5104;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h9: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_SHA1_H3_3 <= w_sys_tmp5099;

									end
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
			r_fld_SHA1_H4_4 <= w_sys_tmp5105;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h9: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_SHA1_H4_4 <= w_sys_tmp5100;

									end
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
			r_fld_SHA1_K0_5 <= w_sys_tmp5106;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_SHA1_K1_6 <= w_sys_tmp5107;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_SHA1_K2_7 <= w_sys_tmp5108;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_SHA1_K3_8 <= w_sys_tmp5109;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_w0_9 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w0_9 <= r_fld_w1_10;

									end
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
			r_fld_w1_10 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w1_10 <= r_fld_w2_11;

									end
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
			r_fld_w2_11 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w2_11 <= r_fld_w3_12;

									end
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
			r_fld_w3_12 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w3_12 <= r_fld_w4_13;

									end
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
			r_fld_w4_13 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w4_13 <= r_fld_w5_14;

									end
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
			r_fld_w5_14 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w5_14 <= r_fld_w6_15;

									end
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
			r_fld_w6_15 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w6_15 <= r_fld_w7_16;

									end
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
			r_fld_w7_16 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w7_16 <= r_fld_w8_17;

									end
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
			r_fld_w8_17 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w8_17 <= r_fld_w9_18;

									end
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
			r_fld_w9_18 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w9_18 <= r_fld_w10_19;

									end
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
			r_fld_w10_19 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w10_19 <= r_fld_w11_20;

									end
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
			r_fld_w11_20 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w11_20 <= r_fld_w12_21;

									end
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
			r_fld_w12_21 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_fld_w12_21 <= w_sys_tmp207;

									end
									else
									if((r_sys_sha_transform_step==7'h0) || (r_sys_sha_transform_step==7'h1) || (r_sys_sha_transform_step==7'h2)) begin
										r_fld_w12_21 <= r_fld_w13_22;

									end
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
			r_fld_w13_22 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_fld_w13_22 <= w_sys_tmp158;

									end
									else
									if((r_sys_sha_transform_step==7'h0) || (r_sys_sha_transform_step==7'h1)) begin
										r_fld_w13_22 <= r_fld_w14_23;

									end
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
			r_fld_w14_23 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_fld_w14_23 <= w_sys_tmp97;

									end
									else
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_w14_23 <= r_fld_w15_24;

									end
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
			r_fld_w15_24 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h52)) begin
										r_fld_w15_24 <= r_sha_transform_nextW15_31;

									end
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
			r_fld_a_25 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h2: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_a_25 <= r_fld_SHA1_H0_0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h52)) begin
										r_fld_a_25 <= w_sys_tmp95;

									end
									else
									if((r_sys_sha_transform_step==7'h3)) begin
										r_fld_a_25 <= w_sys_tmp41;

									end
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
			r_fld_b_26 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h2: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_b_26 <= r_fld_SHA1_H1_1;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h3)) begin
										r_fld_b_26 <= w_sys_tmp93;

									end
									else
									if((7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_fld_b_26 <= w_sys_tmp152;

									end
									else
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_b_26 <= r_fld_a_25;

									end
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
			r_fld_c_27 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h2: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_c_27 <= r_fld_SHA1_H2_2;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h3)) begin
										r_fld_c_27 <= r_sys_tmp0_int;

									end
									else
									if((r_sys_sha_transform_step==7'h1) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_fld_c_27 <= w_sys_tmp40;

									end
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
			r_fld_d_28 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h2: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_d_28 <= r_fld_SHA1_H3_3;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_fld_d_28 <= r_fld_c_27;

									end
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
			r_fld_e_29 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h2: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_fld_e_29 <= r_fld_SHA1_H4_4;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_fld_e_29 <= r_fld_d_28;

									end
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
			r_sha_transform_data_30_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_sha_transform_data_30_addr <= $signed( {{24{r_sha_transform_copy1_i_57[7]}}, r_sha_transform_copy1_i_57} );

									end
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
			r_sha_transform_data_30_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_sha_transform_data_30_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hb: begin
							r_sha_transform_data_30_r_w <= w_sys_boolFalse;
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h2<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_nextW15_31 <= w_sys_tmp29;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h3)) begin
										r_sha_transform_tempA_32 <= w_sys_tmp89;

									end
									else
									if((r_sys_sha_transform_step==7'h1) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_tempA_32 <= w_sys_tmp36;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h3)) begin
										r_sha_transform_tempB_33 <= w_sys_tmp38;

									end
									else
									if((7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h52)) begin
										r_sha_transform_tempB_33 <= w_sys_tmp90;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0) || (7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_SHA1_K_34 <= w_sys_tmp4;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (r_sys_sha_transform_step==7'h2) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_f0_35 <= w_sys_tmp13;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (r_sys_sha_transform_step==7'h2) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_f1_36 <= w_sys_tmp14;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (r_sys_sha_transform_step==7'h2) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_f2_37 <= w_sys_tmp15;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (r_sys_sha_transform_step==7'h2) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_function_38 <= w_sys_tmp16;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sha_transform_i_39 <= $signed( w_sys_intZero[7:0] );

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0) || (7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_i_39 <= $signed( w_sys_tmp50[7:0] );

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h1: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sha_transform_copy0_i_56 <= r_sha_transform_i_39;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h2<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_copy0_i_56 <= $signed( w_sys_tmp43[7:0] );

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h1: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sha_transform_copy1_i_57 <= r_sha_transform_i_39;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h4f)) begin
										r_sha_transform_copy1_i_57 <= $signed( w_sys_tmp44[7:0] );

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h1: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sha_transform_copy2_i_58 <= r_sha_transform_i_39;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (r_sys_sha_transform_step==7'h2) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_copy2_i_58 <= $signed( w_sys_tmp45[7:0] );

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h1: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sha_transform_copy3_i_59 <= r_sha_transform_i_39;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (r_sys_sha_transform_step==7'h2) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_copy3_i_59 <= $signed( w_sys_tmp46[7:0] );

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h1: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sha_transform_copy4_i_60 <= r_sha_transform_i_39;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1) || (r_sys_sha_transform_step==7'h2) || (7'h4<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_copy4_i_60 <= $signed( w_sys_tmp47[7:0] );

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h1: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sha_transform_copy5_i_61 <= r_sha_transform_i_39;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0) || (7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_copy5_i_61 <= $signed( w_sys_tmp48[7:0] );

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h4: begin

							case(r_sys_sha_transform_stage) 
								2'h1: begin
									if((r_sys_sha_transform_step==7'h0)) begin
										r_sha_transform_copy6_i_62 <= r_sha_transform_i_39;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h0) || (7'h3<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h51)) begin
										r_sha_transform_copy6_i_62 <= $signed( w_sys_tmp49[7:0] );

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h2)) begin
										r_sys_tmp0_int <= w_ip_Rotate30_result_0;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((r_sys_sha_transform_step==7'h1)) begin
										r_sys_tmp1_int <= w_sys_tmp5110;

									end
								end

							endcase
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

					case(r_sys_sha_transform_phase) 
						4'h8: begin

							case(r_sys_sha_transform_stage) 
								2'h0: begin
									if((7'h1<=r_sys_sha_transform_step && r_sys_sha_transform_step<=7'h50)) begin
										r_sys_tmp2_int <= w_ip_Rotate1_result_0;

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
