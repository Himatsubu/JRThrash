/*
TimeStamp:	2016/11/8		19:16
*/


module sub29(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	input  signed  [11:0] i_fld_T_0_addr_0,	
	input          [31:0] i_fld_T_0_datain_0,	
	output         [31:0] o_fld_T_0_dataout_0,	
	input                 i_fld_T_0_r_w_0,	
	input  signed  [11:0] i_fld_U_1_addr_0,	
	input          [31:0] i_fld_U_1_datain_0,	
	output         [31:0] o_fld_U_1_dataout_0,	
	input                 i_fld_U_1_r_w_0,	
	input  signed  [11:0] i_fld_result_2_addr_0,	
	input          [31:0] i_fld_result_2_datain_0,	
	output         [31:0] o_fld_result_2_dataout_0,	
	input                 i_fld_result_2_r_w_0	
);

	reg         [31:0] r_ip_AddFloat_portA_0;
	reg         [31:0] r_ip_AddFloat_portB_0;
	wire        [31:0] w_ip_AddFloat_result_0;
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
	reg         [ 4:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 6:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 6:0] w_sys_run_step_p1;
	wire signed [11:0] w_fld_T_0_addr_0;
	wire        [31:0] w_fld_T_0_datain_0;
	wire        [31:0] w_fld_T_0_dataout_0;
	wire               w_fld_T_0_r_w_0;
	wire               w_fld_T_0_ce_0;
	reg  signed [11:0] r_fld_T_0_addr_1;
	reg         [31:0] r_fld_T_0_datain_1;
	wire        [31:0] w_fld_T_0_dataout_1;
	reg                r_fld_T_0_r_w_1;
	wire               w_fld_T_0_ce_1;
	wire signed [11:0] w_fld_U_1_addr_0;
	wire        [31:0] w_fld_U_1_datain_0;
	wire        [31:0] w_fld_U_1_dataout_0;
	wire               w_fld_U_1_r_w_0;
	wire               w_fld_U_1_ce_0;
	reg  signed [11:0] r_fld_U_1_addr_1;
	reg         [31:0] r_fld_U_1_datain_1;
	wire        [31:0] w_fld_U_1_dataout_1;
	reg                r_fld_U_1_r_w_1;
	wire               w_fld_U_1_ce_1;
	wire signed [11:0] w_fld_result_2_addr_0;
	wire        [31:0] w_fld_result_2_datain_0;
	wire        [31:0] w_fld_result_2_dataout_0;
	wire               w_fld_result_2_r_w_0;
	wire               w_fld_result_2_ce_0;
	reg  signed [11:0] r_fld_result_2_addr_1;
	reg         [31:0] r_fld_result_2_datain_1;
	wire        [31:0] w_fld_result_2_dataout_1;
	reg                r_fld_result_2_r_w_1;
	wire               w_fld_result_2_ce_1;
	reg  signed [31:0] r_run_k_3;
	reg  signed [31:0] r_run_j_4;
	reg  signed [31:0] r_run_kx_5;
	reg  signed [31:0] r_run_ky_6;
	reg  signed [31:0] r_run_mx_7;
	reg  signed [31:0] r_run_my_8;
	reg         [31:0] r_run_dt_9;
	reg         [31:0] r_run_dx_10;
	reg         [31:0] r_run_dy_11;
	reg         [31:0] r_run_r1_12;
	reg         [31:0] r_run_r2_13;
	reg         [31:0] r_run_r3_14;
	reg         [31:0] r_run_r4_15;
	reg         [31:0] r_run_YY_16;
	reg  signed [31:0] r_run_copy0_j_17;
	reg  signed [31:0] r_run_copy1_j_18;
	reg  signed [31:0] r_run_copy2_j_19;
	reg  signed [31:0] r_run_copy3_j_20;
	reg  signed [31:0] r_run_copy4_j_21;
	reg  signed [31:0] r_run_copy5_j_22;
	reg  signed [31:0] r_run_copy6_j_23;
	reg  signed [31:0] r_run_copy7_j_24;
	reg  signed [31:0] r_run_copy8_j_25;
	reg  signed [31:0] r_run_copy9_j_26;
	reg  signed [31:0] r_run_copy10_j_27;
	reg  signed [31:0] r_run_copy11_j_28;
	reg  signed [31:0] r_run_copy0_j_29;
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
	wire signed [31:0] w_sys_tmp1;
	wire signed [31:0] w_sys_tmp3;
	wire        [31:0] w_sys_tmp5;
	wire        [31:0] w_sys_tmp6;
	wire        [31:0] w_sys_tmp7;
	wire        [31:0] w_sys_tmp8;
	wire        [31:0] w_sys_tmp9;
	wire        [31:0] w_sys_tmp10;
	wire        [31:0] w_sys_tmp11;
	wire signed [31:0] w_sys_tmp12;
	wire               w_sys_tmp13;
	wire               w_sys_tmp14;
	wire signed [31:0] w_sys_tmp15;
	wire signed [31:0] w_sys_tmp16;
	wire signed [31:0] w_sys_tmp17;
	wire               w_sys_tmp18;
	wire               w_sys_tmp19;
	wire signed [31:0] w_sys_tmp20;
	wire signed [31:0] w_sys_tmp23;
	wire signed [31:0] w_sys_tmp24;
	wire signed [31:0] w_sys_tmp25;
	wire        [31:0] w_sys_tmp26;
	wire signed [31:0] w_sys_tmp28;
	wire signed [31:0] w_sys_tmp29;
	wire        [31:0] w_sys_tmp31;
	wire        [31:0] w_sys_tmp32;
	wire signed [31:0] w_sys_tmp33;
	wire signed [31:0] w_sys_tmp34;
	wire signed [31:0] w_sys_tmp37;
	wire signed [31:0] w_sys_tmp38;
	wire signed [31:0] w_sys_tmp39;
	wire        [31:0] w_sys_tmp41;
	wire signed [31:0] w_sys_tmp42;
	wire signed [31:0] w_sys_tmp43;
	wire signed [31:0] w_sys_tmp44;
	wire        [31:0] w_sys_tmp46;
	wire signed [31:0] w_sys_tmp50;
	wire signed [31:0] w_sys_tmp51;
	wire signed [31:0] w_sys_tmp52;
	wire        [31:0] w_sys_tmp55;
	wire signed [31:0] w_sys_tmp57;
	wire signed [31:0] w_sys_tmp58;
	wire signed [31:0] w_sys_tmp60;
	wire signed [31:0] w_sys_tmp61;
	wire signed [31:0] w_sys_tmp62;
	wire signed [31:0] w_sys_tmp65;
	wire signed [31:0] w_sys_tmp66;
	wire signed [31:0] w_sys_tmp67;
	wire signed [31:0] w_sys_tmp71;
	wire signed [31:0] w_sys_tmp72;
	wire signed [31:0] w_sys_tmp74;
	wire signed [31:0] w_sys_tmp75;
	wire signed [31:0] w_sys_tmp76;
	wire signed [31:0] w_sys_tmp78;
	wire signed [31:0] w_sys_tmp79;
	wire signed [31:0] w_sys_tmp80;
	wire signed [31:0] w_sys_tmp81;
	wire signed [31:0] w_sys_tmp82;
	wire signed [31:0] w_sys_tmp84;
	wire signed [31:0] w_sys_tmp85;
	wire signed [31:0] w_sys_tmp86;
	wire signed [31:0] w_sys_tmp88;
	wire signed [31:0] w_sys_tmp89;
	wire signed [31:0] w_sys_tmp90;
	wire signed [31:0] w_sys_tmp372;
	wire               w_sys_tmp373;
	wire               w_sys_tmp374;
	wire signed [31:0] w_sys_tmp375;
	wire signed [31:0] w_sys_tmp376;
	wire signed [31:0] w_sys_tmp377;
	wire               w_sys_tmp378;
	wire               w_sys_tmp379;
	wire signed [31:0] w_sys_tmp380;
	wire signed [31:0] w_sys_tmp383;
	wire signed [31:0] w_sys_tmp384;
	wire signed [31:0] w_sys_tmp385;
	wire        [31:0] w_sys_tmp386;
	wire signed [31:0] w_sys_tmp387;
	wire signed [31:0] w_sys_tmp388;
	wire signed [31:0] w_sys_tmp390;
	wire signed [31:0] w_sys_tmp391;

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
	assign o_fld_U_1_dataout_0 = w_fld_U_1_dataout_0;
	assign w_fld_U_1_addr_0 = i_fld_U_1_addr_0;
	assign w_fld_U_1_datain_0 = i_fld_U_1_datain_0;
	assign w_fld_U_1_r_w_0 = i_fld_U_1_r_w_0;
	assign w_fld_U_1_ce_0 = w_sys_ce;
	assign w_fld_U_1_ce_1 = w_sys_ce;
	assign o_fld_result_2_dataout_0 = w_fld_result_2_dataout_0;
	assign w_fld_result_2_addr_0 = i_fld_result_2_addr_0;
	assign w_fld_result_2_datain_0 = i_fld_result_2_datain_0;
	assign w_fld_result_2_r_w_0 = i_fld_result_2_r_w_0;
	assign w_fld_result_2_ce_0 = w_sys_ce;
	assign w_fld_result_2_ce_1 = w_sys_ce;
	assign w_sys_tmp1 = 32'sh00000080;
	assign w_sys_tmp3 = 32'sh00000081;
	assign w_sys_tmp5 = 32'h3a03126f;
	assign w_sys_tmp6 = 32'h3d000000;
	assign w_sys_tmp7 = 32'h3c000000;
	assign w_sys_tmp8 = 32'h3c03126f;
	assign w_sys_tmp9 = 32'h3d03126f;
	assign w_sys_tmp10 = 32'h3f03126f;
	assign w_sys_tmp11 = 32'h4103126f;
	assign w_sys_tmp12 = 32'sh00000061;
	assign w_sys_tmp13 = ( !w_sys_tmp14 );
	assign w_sys_tmp14 = (w_sys_tmp15 < r_run_k_3);
	assign w_sys_tmp15 = 32'sh00000080;
	assign w_sys_tmp16 = (r_run_k_3 + w_sys_intOne);
	assign w_sys_tmp17 = 32'sh00000002;
	assign w_sys_tmp18 = ( !w_sys_tmp19 );
	assign w_sys_tmp19 = (w_sys_tmp20 < r_run_j_4);
	assign w_sys_tmp20 = 32'sh00000011;
	assign w_sys_tmp23 = (w_sys_tmp24 + r_run_k_3);
	assign w_sys_tmp24 = (r_run_j_4 * w_sys_tmp25);
	assign w_sys_tmp25 = 32'sh00000081;
	assign w_sys_tmp26 = w_ip_AddFloat_result_0;
	assign w_sys_tmp28 = (w_sys_tmp29 + r_run_k_3);
	assign w_sys_tmp29 = (r_run_copy11_j_28 * w_sys_tmp25);
	assign w_sys_tmp31 = w_ip_MultFloat_product_0;
	assign w_sys_tmp32 = w_fld_U_1_dataout_1;
	assign w_sys_tmp33 = (w_sys_tmp34 + r_run_k_3);
	assign w_sys_tmp34 = (r_run_copy10_j_27 * w_sys_tmp25);
	assign w_sys_tmp37 = (w_sys_tmp38 + r_run_k_3);
	assign w_sys_tmp38 = (w_sys_tmp39 * w_sys_tmp25);
	assign w_sys_tmp39 = (r_run_copy9_j_26 + w_sys_intOne);
	assign w_sys_tmp41 = w_fld_T_0_dataout_1;
	assign w_sys_tmp42 = (w_sys_tmp43 + r_run_k_3);
	assign w_sys_tmp43 = (w_sys_tmp44 * w_sys_tmp25);
	assign w_sys_tmp44 = (r_run_copy8_j_25 - w_sys_intOne);
	assign w_sys_tmp46 = 32'h0;
	assign w_sys_tmp50 = (w_sys_tmp51 + r_run_k_3);
	assign w_sys_tmp51 = (w_sys_tmp52 * w_sys_tmp25);
	assign w_sys_tmp52 = (r_run_copy5_j_22 + w_sys_intOne);
	assign w_sys_tmp55 = 32'h40000000;
	assign w_sys_tmp57 = (w_sys_tmp58 + r_run_k_3);
	assign w_sys_tmp58 = (r_run_copy4_j_21 * w_sys_tmp25);
	assign w_sys_tmp60 = (w_sys_tmp61 + r_run_k_3);
	assign w_sys_tmp61 = (w_sys_tmp62 * w_sys_tmp25);
	assign w_sys_tmp62 = (r_run_copy3_j_20 - w_sys_intOne);
	assign w_sys_tmp65 = (w_sys_tmp66 + w_sys_intOne);
	assign w_sys_tmp66 = (w_sys_tmp67 + r_run_k_3);
	assign w_sys_tmp67 = (r_run_copy2_j_19 * w_sys_tmp25);
	assign w_sys_tmp71 = (w_sys_tmp72 + r_run_k_3);
	assign w_sys_tmp72 = (r_run_copy1_j_18 * w_sys_tmp25);
	assign w_sys_tmp74 = (w_sys_tmp75 - w_sys_intOne);
	assign w_sys_tmp75 = (w_sys_tmp76 + r_run_k_3);
	assign w_sys_tmp76 = (r_run_copy0_j_17 * w_sys_tmp25);
	assign w_sys_tmp78 = (r_run_copy0_j_17 + w_sys_intOne);
	assign w_sys_tmp79 = (r_run_copy1_j_18 + w_sys_intOne);
	assign w_sys_tmp80 = (r_run_copy2_j_19 + w_sys_intOne);
	assign w_sys_tmp81 = (r_run_copy3_j_20 + w_sys_intOne);
	assign w_sys_tmp82 = (r_run_copy4_j_21 + w_sys_intOne);
	assign w_sys_tmp84 = (r_run_copy6_j_23 + w_sys_intOne);
	assign w_sys_tmp85 = (r_run_copy7_j_24 + w_sys_intOne);
	assign w_sys_tmp86 = (r_run_copy8_j_25 + w_sys_intOne);
	assign w_sys_tmp88 = (r_run_copy10_j_27 + w_sys_intOne);
	assign w_sys_tmp89 = (r_run_copy11_j_28 + w_sys_intOne);
	assign w_sys_tmp90 = (r_run_j_4 + w_sys_intOne);
	assign w_sys_tmp372 = 32'sh00000061;
	assign w_sys_tmp373 = ( !w_sys_tmp374 );
	assign w_sys_tmp374 = (w_sys_tmp375 < r_run_k_3);
	assign w_sys_tmp375 = 32'sh00000080;
	assign w_sys_tmp376 = (r_run_k_3 + w_sys_intOne);
	assign w_sys_tmp377 = 32'sh00000002;
	assign w_sys_tmp378 = ( !w_sys_tmp379 );
	assign w_sys_tmp379 = (w_sys_tmp380 < r_run_j_4);
	assign w_sys_tmp380 = 32'sh00000011;
	assign w_sys_tmp383 = (w_sys_tmp384 + r_run_k_3);
	assign w_sys_tmp384 = (r_run_j_4 * w_sys_tmp385);
	assign w_sys_tmp385 = 32'sh00000081;
	assign w_sys_tmp386 = w_fld_result_2_dataout_1;
	assign w_sys_tmp387 = (w_sys_tmp388 + r_run_k_3);
	assign w_sys_tmp388 = (r_run_copy0_j_29 * w_sys_tmp385);
	assign w_sys_tmp390 = (r_run_copy0_j_29 + w_sys_intOne);
	assign w_sys_tmp391 = (r_run_j_4 + w_sys_intOne);


	DualPortRAM #(.DWIDTH(32), .AWIDTH(12), .WORDS(2451) )
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

	DualPortRAM #(.DWIDTH(32), .AWIDTH(12), .WORDS(2451) )
		dpram_U_1(
			.clk (clock),
			.ce_0 (w_fld_U_1_ce_0),
			.addr_0 (w_fld_U_1_addr_0),
			.datain_0 (w_fld_U_1_datain_0),
			.dataout_0 (w_fld_U_1_dataout_0),
			.r_w_0 (w_fld_U_1_r_w_0),
			.ce_1 (w_fld_U_1_ce_1),
			.addr_1 (r_fld_U_1_addr_1),
			.datain_1 (r_fld_U_1_datain_1),
			.dataout_1 (w_fld_U_1_dataout_1),
			.r_w_1 (r_fld_U_1_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(12), .WORDS(2451) )
		dpram_result_2(
			.clk (clock),
			.ce_0 (w_fld_result_2_ce_0),
			.addr_0 (w_fld_result_2_addr_0),
			.datain_0 (w_fld_result_2_datain_0),
			.dataout_0 (w_fld_result_2_dataout_0),
			.r_w_0 (w_fld_result_2_r_w_0),
			.ce_1 (w_fld_result_2_ce_1),
			.addr_1 (r_fld_result_2_addr_1),
			.datain_1 (r_fld_result_2_datain_1),
			.dataout_1 (w_fld_result_2_dataout_1),
			.r_w_1 (r_fld_result_2_r_w_1)
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

					case(r_sys_run_phase) 
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'he) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h26) || (r_sys_run_step==7'h32)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_run_step==7'h4) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'h17) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h29) || (r_sys_run_step==7'h2f)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp6_float;

									end
									else
									if((r_sys_run_step==7'h15) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h24) || (r_sys_run_step==7'h27) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h30) || (r_sys_run_step==7'h35) || (r_sys_run_step==7'h3e)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp9_float;

									end
									else
									if((r_sys_run_step==7'hf) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2a) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h33)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp7_float;

									end
									else
									if((r_sys_run_step==7'hd) || (r_sys_run_step==7'h1f)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_run_step==7'h16) || (r_sys_run_step==7'h28)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp8_float;

									end
									else
									if((r_sys_run_step==7'h10) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h25) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h2e) || (r_sys_run_step==7'h31) || (r_sys_run_step==7'h34) || (r_sys_run_step==7'h37) || (r_sys_run_step==7'h38) || (r_sys_run_step==7'h3a) || (r_sys_run_step==7'h43)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp26;

									end
								end

							endcase
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h14)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h13)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp46[31], w_sys_tmp46[30:0] };

									end
									else
									if((r_sys_run_step==7'h1d)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h24) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h43)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_run_step==7'h1a) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h31) || (r_sys_run_step==7'h35) || (r_sys_run_step==7'h3a) || (r_sys_run_step==7'h3e)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp31;

									end
									else
									if((r_sys_run_step==7'h1c)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp46[31], w_sys_tmp46[30:0] };

									end
									else
									if((r_sys_run_step==7'h4)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp41[31], w_sys_tmp41[30:0] };

									end
									else
									if((r_sys_run_step==7'h37)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp46[31], w_sys_tmp46[30:0] };

									end
									else
									if((r_sys_run_step==7'h10) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h34)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp2_float;

									end
									else
									if((r_sys_run_step==7'hd)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp41[31], w_sys_tmp41[30:0] };

									end
									else
									if((r_sys_run_step==7'h33)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'he)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h1e) || (r_sys_run_step==7'h30)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_run_step==7'h15) || (r_sys_run_step==7'h27) || (r_sys_run_step==7'h38)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp8_float;

									end
									else
									if((r_sys_run_step==7'h25)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp46[31], w_sys_tmp46[30:0] };

									end
									else
									if((r_sys_run_step==7'h32)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h26)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h20)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h29)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h1f)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp41[31], w_sys_tmp41[30:0] };

									end
									else
									if((r_sys_run_step==7'h17)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h2e)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp46[31], w_sys_tmp46[30:0] };

									end
									else
									if((r_sys_run_step==7'h16)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp41[31], w_sys_tmp41[30:0] };

									end
									else
									if((r_sys_run_step==7'h18)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h21)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'hf)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'hb)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h2a)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
									else
									if((r_sys_run_step==7'h28)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp41[31], w_sys_tmp41[30:0] };

									end
									else
									if((r_sys_run_step==7'h2f)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp31[31], w_sys_tmp31[30:0] };

									end
								end

							endcase
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h15) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h27) || (r_sys_run_step==7'h30) || (r_sys_run_step==7'h39)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r3_14;

									end
									else
									if((r_sys_run_step==7'h1a) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h35) || (r_sys_run_step==7'h3d)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r4_15;

									end
									else
									if((r_sys_run_step==7'h2d)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp0_float;

									end
									else
									if((r_sys_run_step==7'h24)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_run_step==7'h12)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp9_float;

									end
									else
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'h1b)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h25) || (r_sys_run_step==7'h2a) || (r_sys_run_step==7'h2e)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp55;

									end
									else
									if((7'h2<=r_sys_run_step && r_sys_run_step<=7'h5) || (r_sys_run_step==7'h7)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r1_12;

									end
								end

							endcase
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h2<=r_sys_run_step && r_sys_run_step<=7'h5)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp32;

									end
									else
									if((r_sys_run_step==7'h13) || (r_sys_run_step==7'h25)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_run_step==7'h7)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp9_float;

									end
									else
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h2a)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp41;

									end
									else
									if((r_sys_run_step==7'ha) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h2e)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp8_float;

									end
									else
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h24) || (r_sys_run_step==7'h27) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h30) || (r_sys_run_step==7'h35) || (r_sys_run_step==7'h39) || (r_sys_run_step==7'h3d)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp26;

									end
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
						5'h1a: begin
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
			r_sys_run_phase <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'h0: begin
							r_sys_run_phase <= 5'h2;
						end

						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp13) ? 5'h9 : 5'hf);

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 5'ha;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp18) ? 5'hd : 5'h6);

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h48)) begin
										r_sys_run_phase <= 5'ha;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 5'h10;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp373) ? 5'h14 : 5'h1a);

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 5'h10;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= 5'h15;

									end
								end

							endcase
						end

						5'h15: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp378) ? 5'h18 : 5'h11);

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h6)) begin
										r_sys_run_phase <= 5'h15;

									end
								end

							endcase
						end

						5'h1a: begin
							r_sys_run_phase <= 5'h0;
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h9: begin

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

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h48)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h14: begin

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

						5'h15: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h6)) begin
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						5'h9: begin

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

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h47)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==7'h48)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						5'h14: begin

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

						5'h15: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_sys_run_step <= 7'h0;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h5)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==7'h6)) begin
										r_sys_run_step <= 7'h0;

									end
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
						5'h0: begin
							r_sys_run_busy <= w_sys_boolTrue;
						end

						5'h1a: begin
							r_sys_run_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_T_0_addr_1 <= 12'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h1) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h25)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp37[11:0] );

									end
									else
									if((r_sys_run_step==7'h0) || (r_sys_run_step==7'h9) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h24)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp28[11:0] );

									end
									else
									if((r_sys_run_step==7'h2) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h26)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp42[11:0] );

									end
									else
									if((r_sys_run_step==7'h7) || (r_sys_run_step==7'h10) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h2b)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp71[11:0] );

									end
									else
									if((r_sys_run_step==7'h5) || (r_sys_run_step==7'he) || (r_sys_run_step==7'h17) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h29)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp60[11:0] );

									end
									else
									if((r_sys_run_step==7'h3) || (r_sys_run_step==7'hc) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h27)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp50[11:0] );

									end
									else
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h2a)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp65[11:0] );

									end
									else
									if((r_sys_run_step==7'h8) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2c)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp74[11:0] );

									end
									else
									if((r_sys_run_step==7'h4) || (r_sys_run_step==7'hd) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h28)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp57[11:0] );

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h2<=r_sys_run_step && r_sys_run_step<=7'h6)) begin
										r_fld_T_0_addr_1 <= $signed( w_sys_tmp383[11:0] );

									end
								end

							endcase
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
						5'h18: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h2<=r_sys_run_step && r_sys_run_step<=7'h6)) begin
										r_fld_T_0_datain_1 <= w_sys_tmp386;

									end
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h2c)) begin
										r_fld_T_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h2<=r_sys_run_step && r_sys_run_step<=7'h6)) begin
										r_fld_T_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'h1a: begin
							r_fld_T_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_U_1_addr_1 <= 12'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h4)) begin
										r_fld_U_1_addr_1 <= $signed( w_sys_tmp33[11:0] );

									end
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
			r_fld_U_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h4)) begin
										r_fld_U_1_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h1a: begin
							r_fld_U_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_result_2_addr_1 <= 12'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h29) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h3f) || (r_sys_run_step==7'h48)) begin
										r_fld_result_2_addr_1 <= $signed( w_sys_tmp23[11:0] );

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h4)) begin
										r_fld_result_2_addr_1 <= $signed( w_sys_tmp387[11:0] );

									end
								end

							endcase
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h29) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h3f) || (r_sys_run_step==7'h48)) begin
										r_fld_result_2_datain_1 <= w_sys_tmp26;

									end
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
			r_fld_result_2_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h29) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h3f) || (r_sys_run_step==7'h48)) begin
										r_fld_result_2_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h4)) begin
										r_fld_result_2_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h1a: begin
							r_fld_result_2_r_w_1 <= w_sys_boolFalse;
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
						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_k_3 <= w_sys_tmp12;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_k_3 <= w_sys_tmp16;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_k_3 <= w_sys_tmp372;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_k_3 <= w_sys_tmp376;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_j_4 <= w_sys_tmp17;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h29) || (r_sys_run_step==7'h32) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h3f) || (r_sys_run_step==7'h48)) begin
										r_run_j_4 <= w_sys_tmp90;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_j_4 <= w_sys_tmp377;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h2<=r_sys_run_step && r_sys_run_step<=7'h6)) begin
										r_run_j_4 <= w_sys_tmp391;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_kx_5 <= w_sys_tmp1;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_ky_6 <= w_sys_tmp1;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_mx_7 <= w_sys_tmp3;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_my_8 <= w_sys_tmp3;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_dt_9 <= w_sys_tmp5;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_dx_10 <= w_sys_tmp6;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_dy_11 <= w_sys_tmp7;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_r1_12 <= w_sys_tmp8;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_r2_13 <= w_sys_tmp9;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_r3_14 <= w_sys_tmp10;

									end
								end

							endcase
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_r4_15 <= w_sys_tmp11;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy0_j_17 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h8) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2c)) begin
										r_run_copy0_j_17 <= w_sys_tmp78;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy1_j_18 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h7) || (r_sys_run_step==7'h10) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h2b)) begin
										r_run_copy1_j_18 <= w_sys_tmp79;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy2_j_19 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h2a)) begin
										r_run_copy2_j_19 <= w_sys_tmp80;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy3_j_20 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h5) || (r_sys_run_step==7'he) || (r_sys_run_step==7'h17) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h29)) begin
										r_run_copy3_j_20 <= w_sys_tmp81;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy4_j_21 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h4) || (r_sys_run_step==7'hd) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h28)) begin
										r_run_copy4_j_21 <= w_sys_tmp82;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy5_j_22 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h3) || (r_sys_run_step==7'hc) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h27)) begin
										r_run_copy5_j_22 <= w_sys_tmp52;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy6_j_23 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h4)) begin
										r_run_copy6_j_23 <= w_sys_tmp84;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy7_j_24 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h4)) begin
										r_run_copy7_j_24 <= w_sys_tmp85;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy8_j_25 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h2) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h26)) begin
										r_run_copy8_j_25 <= w_sys_tmp86;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy9_j_26 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h1) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h25)) begin
										r_run_copy9_j_26 <= w_sys_tmp39;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy10_j_27 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h4)) begin
										r_run_copy10_j_27 <= w_sys_tmp88;

									end
								end

							endcase
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
						5'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy11_j_28 <= r_run_j_4;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0) || (r_sys_run_step==7'h9) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h24)) begin
										r_run_copy11_j_28 <= w_sys_tmp89;

									end
								end

							endcase
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
						5'h14: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_copy0_j_29 <= r_run_j_4;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h4)) begin
										r_run_copy0_j_29 <= w_sys_tmp390;

									end
								end

							endcase
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'hc)) begin
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'ha)) begin
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h7) || (r_sys_run_step==7'h10) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h2b)) begin
										r_sys_tmp2_float <= w_fld_T_0_dataout_1;

									end
								end

							endcase
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h7) || (r_sys_run_step==7'h9) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h28) || (r_sys_run_step==7'h42)) begin
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h2) || (r_sys_run_step==7'he) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h26)) begin
										r_sys_tmp4_float <= w_fld_T_0_dataout_1;

									end
								end

							endcase
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'hc) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h24) || (r_sys_run_step==7'h25)) begin
										r_sys_tmp5_float <= w_fld_T_0_dataout_1;

									end
								end

							endcase
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h3) || (r_sys_run_step==7'h5) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'h17) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h29)) begin
										r_sys_tmp6_float <= w_fld_T_0_dataout_1;

									end
								end

							endcase
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h8) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2c)) begin
										r_sys_tmp7_float <= w_fld_T_0_dataout_1;

									end
									else
									if((r_sys_run_step==7'h21) || (r_sys_run_step==7'h2a)) begin
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
				2'h1: begin

					case(r_sys_run_phase) 
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h27) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h2e)) begin
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
						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h8)) begin
										r_sys_tmp9_float <= w_ip_MultFloat_product_0;

									end
									else
									if((r_sys_run_step==7'h6)) begin
										r_sys_tmp9_float <= w_fld_U_1_dataout_1;

									end
									else
									if((r_sys_run_step==7'h14) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h26) || (r_sys_run_step==7'h28) || (r_sys_run_step==7'h2f) || (r_sys_run_step==7'h33) || (r_sys_run_step==7'h3c)) begin
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


endmodule
