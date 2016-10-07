/*
TimeStamp:	2016/10/5		20:33
*/


module sub03(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	input  signed  [12:0] i_fld_u_0_addr_0,	
	input          [31:0] i_fld_u_0_datain_0,	
	output         [31:0] o_fld_u_0_dataout_0,	
	input                 i_fld_u_0_r_w_0,	
	input  signed  [12:0] i_fld_result_1_addr_0,	
	input          [31:0] i_fld_result_1_datain_0,	
	output         [31:0] o_fld_result_1_dataout_0,	
	input                 i_fld_result_1_r_w_0	
);

	reg         [31:0] r_ip_AddFloat_portA_0;
	reg         [31:0] r_ip_AddFloat_portB_0;
	wire        [31:0] w_ip_AddFloat_result_0;
	reg         [31:0] r_ip_MultFloat_multiplicand_0;
	reg         [31:0] r_ip_MultFloat_multiplier_0;
	wire        [31:0] w_ip_MultFloat_product_0;
	reg  signed [31:0] r_ip_FixedToFloat_fixed_0;
	wire        [31:0] w_ip_FixedToFloat_floating_0;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 1:0] r_sys_run_caller;
	reg                r_sys_run_req;
	reg         [ 5:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 5:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 5:0] w_sys_run_step_p1;
	wire signed [12:0] w_fld_u_0_addr_0;
	wire        [31:0] w_fld_u_0_datain_0;
	wire        [31:0] w_fld_u_0_dataout_0;
	wire               w_fld_u_0_r_w_0;
	wire               w_fld_u_0_ce_0;
	reg  signed [12:0] r_fld_u_0_addr_1;
	reg         [31:0] r_fld_u_0_datain_1;
	wire        [31:0] w_fld_u_0_dataout_1;
	reg                r_fld_u_0_r_w_1;
	wire               w_fld_u_0_ce_1;
	wire signed [12:0] w_fld_result_1_addr_0;
	wire        [31:0] w_fld_result_1_datain_0;
	wire        [31:0] w_fld_result_1_dataout_0;
	wire               w_fld_result_1_r_w_0;
	wire               w_fld_result_1_ce_0;
	reg  signed [12:0] r_fld_result_1_addr_1;
	reg         [31:0] r_fld_result_1_datain_1;
	wire        [31:0] w_fld_result_1_dataout_1;
	reg                r_fld_result_1_r_w_1;
	wire               w_fld_result_1_ce_1;
	reg  signed [31:0] r_run_k_2;
	reg  signed [31:0] r_run_j_3;
	reg         [31:0] r_run_r1_4;
	reg         [31:0] r_run_r2_5;
	reg         [31:0] r_run_dt_6;
	reg         [31:0] r_run_dx_7;
	reg         [31:0] r_run_dy_8;
	reg         [31:0] r_run_q_9;
	reg  signed [31:0] r_run_copy0_j_10;
	reg  signed [31:0] r_run_copy0_j_11;
	reg  signed [31:0] r_run_copy1_j_12;
	reg  signed [31:0] r_run_copy2_j_13;
	reg  signed [31:0] r_run_copy3_j_14;
	reg  signed [31:0] r_run_copy4_j_15;
	reg  signed [31:0] r_run_copy5_j_16;
	reg  signed [31:0] r_run_copy6_j_17;
	reg  signed [31:0] r_run_copy7_j_18;
	reg  signed [31:0] r_run_copy0_j_19;
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
	wire        [31:0] w_sys_tmp3;
	wire        [31:0] w_sys_tmp4;
	wire               w_sys_tmp6;
	wire               w_sys_tmp7;
	wire signed [31:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp11;
	wire signed [31:0] w_sys_tmp12;
	wire        [31:0] w_sys_tmp13;
	wire signed [31:0] w_sys_tmp15;
	wire signed [31:0] w_sys_tmp16;
	wire        [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire signed [31:0] w_sys_tmp19;
	wire               w_sys_tmp20;
	wire               w_sys_tmp21;
	wire signed [31:0] w_sys_tmp22;
	wire signed [31:0] w_sys_tmp25;
	wire signed [31:0] w_sys_tmp26;
	wire signed [31:0] w_sys_tmp27;
	wire        [31:0] w_sys_tmp28;
	wire signed [31:0] w_sys_tmp30;
	wire signed [31:0] w_sys_tmp31;
	wire        [31:0] w_sys_tmp34;
	wire signed [31:0] w_sys_tmp35;
	wire signed [31:0] w_sys_tmp36;
	wire signed [31:0] w_sys_tmp76;
	wire               w_sys_tmp77;
	wire               w_sys_tmp78;
	wire signed [31:0] w_sys_tmp79;
	wire signed [31:0] w_sys_tmp80;
	wire signed [31:0] w_sys_tmp81;
	wire               w_sys_tmp82;
	wire               w_sys_tmp83;
	wire signed [31:0] w_sys_tmp84;
	wire signed [31:0] w_sys_tmp87;
	wire signed [31:0] w_sys_tmp88;
	wire signed [31:0] w_sys_tmp89;
	wire        [31:0] w_sys_tmp90;
	wire signed [31:0] w_sys_tmp91;
	wire signed [31:0] w_sys_tmp92;
	wire signed [31:0] w_sys_tmp96;
	wire signed [31:0] w_sys_tmp97;
	wire signed [31:0] w_sys_tmp98;
	wire        [31:0] w_sys_tmp100;
	wire        [31:0] w_sys_tmp101;
	wire        [31:0] w_sys_tmp102;
	wire signed [31:0] w_sys_tmp103;
	wire signed [31:0] w_sys_tmp104;
	wire signed [31:0] w_sys_tmp106;
	wire signed [31:0] w_sys_tmp107;
	wire signed [31:0] w_sys_tmp108;
	wire signed [31:0] w_sys_tmp112;
	wire signed [31:0] w_sys_tmp113;
	wire signed [31:0] w_sys_tmp114;
	wire signed [31:0] w_sys_tmp119;
	wire signed [31:0] w_sys_tmp120;
	wire signed [31:0] w_sys_tmp122;
	wire signed [31:0] w_sys_tmp123;
	wire signed [31:0] w_sys_tmp124;
	wire        [31:0] w_sys_tmp128;
	wire signed [31:0] w_sys_tmp129;
	wire signed [31:0] w_sys_tmp130;
	wire signed [31:0] w_sys_tmp131;
	wire signed [31:0] w_sys_tmp132;
	wire signed [31:0] w_sys_tmp133;
	wire signed [31:0] w_sys_tmp134;
	wire signed [31:0] w_sys_tmp135;
	wire signed [31:0] w_sys_tmp136;
	wire signed [31:0] w_sys_tmp138;
	wire signed [31:0] w_sys_tmp139;
	wire signed [31:0] w_sys_tmp306;
	wire               w_sys_tmp307;
	wire               w_sys_tmp308;
	wire signed [31:0] w_sys_tmp309;
	wire signed [31:0] w_sys_tmp310;
	wire signed [31:0] w_sys_tmp311;
	wire               w_sys_tmp312;
	wire               w_sys_tmp313;
	wire signed [31:0] w_sys_tmp314;
	wire signed [31:0] w_sys_tmp317;
	wire signed [31:0] w_sys_tmp318;
	wire signed [31:0] w_sys_tmp319;
	wire        [31:0] w_sys_tmp320;
	wire signed [31:0] w_sys_tmp321;
	wire signed [31:0] w_sys_tmp322;
	wire signed [31:0] w_sys_tmp324;
	wire signed [31:0] w_sys_tmp325;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 6'h1);
	assign o_fld_u_0_dataout_0 = w_fld_u_0_dataout_0;
	assign w_fld_u_0_addr_0 = i_fld_u_0_addr_0;
	assign w_fld_u_0_datain_0 = i_fld_u_0_datain_0;
	assign w_fld_u_0_r_w_0 = i_fld_u_0_r_w_0;
	assign w_fld_u_0_ce_0 = w_sys_ce;
	assign w_fld_u_0_ce_1 = w_sys_ce;
	assign o_fld_result_1_dataout_0 = w_fld_result_1_dataout_0;
	assign w_fld_result_1_addr_0 = i_fld_result_1_addr_0;
	assign w_fld_result_1_datain_0 = i_fld_result_1_datain_0;
	assign w_fld_result_1_r_w_0 = i_fld_result_1_r_w_0;
	assign w_fld_result_1_ce_0 = w_sys_ce;
	assign w_fld_result_1_ce_1 = w_sys_ce;
	assign w_sys_tmp1 = 32'h3e4ccccd;
	assign w_sys_tmp3 = 32'h3a03126f;
	assign w_sys_tmp4 = 32'h3d4ccccd;
	assign w_sys_tmp6 = ( !w_sys_tmp7 );
	assign w_sys_tmp7 = (w_sys_tmp8 < r_run_k_2);
	assign w_sys_tmp8 = 32'sh00000021;
	assign w_sys_tmp11 = (w_sys_tmp12 + r_run_k_2);
	assign w_sys_tmp12 = 32'sh00000081;
	assign w_sys_tmp13 = 32'h3f000000;
	assign w_sys_tmp15 = (w_sys_tmp16 + r_run_k_2);
	assign w_sys_tmp16 = 32'sh00004101;
	assign w_sys_tmp17 = 32'h0;
	assign w_sys_tmp18 = (r_run_k_2 + w_sys_intOne);
	assign w_sys_tmp19 = 32'sh00000060;
	assign w_sys_tmp20 = ( !w_sys_tmp21 );
	assign w_sys_tmp21 = (w_sys_tmp22 < r_run_j_3);
	assign w_sys_tmp22 = 32'sh00000081;
	assign w_sys_tmp25 = (w_sys_tmp26 + w_sys_intOne);
	assign w_sys_tmp26 = (r_run_j_3 * w_sys_tmp27);
	assign w_sys_tmp27 = 32'sh00000081;
	assign w_sys_tmp28 = 32'h3f800000;
	assign w_sys_tmp30 = (w_sys_tmp31 + w_sys_tmp27);
	assign w_sys_tmp31 = (r_run_copy0_j_10 * w_sys_tmp27);
	assign w_sys_tmp34 = 32'h0;
	assign w_sys_tmp35 = (r_run_copy0_j_10 + w_sys_intOne);
	assign w_sys_tmp36 = (r_run_j_3 + w_sys_intOne);
	assign w_sys_tmp76 = 32'sh00000002;
	assign w_sys_tmp77 = ( !w_sys_tmp78 );
	assign w_sys_tmp78 = (w_sys_tmp79 < r_run_k_2);
	assign w_sys_tmp79 = 32'sh00000020;
	assign w_sys_tmp80 = (r_run_k_2 + w_sys_intOne);
	assign w_sys_tmp81 = 32'sh00000061;
	assign w_sys_tmp82 = ( !w_sys_tmp83 );
	assign w_sys_tmp83 = (w_sys_tmp84 < r_run_j_3);
	assign w_sys_tmp84 = 32'sh00000080;
	assign w_sys_tmp87 = (w_sys_tmp88 + r_run_k_2);
	assign w_sys_tmp88 = (r_run_j_3 * w_sys_tmp89);
	assign w_sys_tmp89 = 32'sh00000081;
	assign w_sys_tmp90 = w_ip_AddFloat_result_0;
	assign w_sys_tmp91 = (w_sys_tmp92 + r_run_k_2);
	assign w_sys_tmp92 = (r_run_copy7_j_18 * w_sys_tmp89);
	assign w_sys_tmp96 = (w_sys_tmp97 + r_run_k_2);
	assign w_sys_tmp97 = (w_sys_tmp98 * w_sys_tmp89);
	assign w_sys_tmp98 = (r_run_copy6_j_17 + w_sys_intOne);
	assign w_sys_tmp100 = w_ip_MultFloat_product_0;
	assign w_sys_tmp101 = 32'h40000000;
	assign w_sys_tmp102 = w_fld_u_0_dataout_1;
	assign w_sys_tmp103 = (w_sys_tmp104 + r_run_k_2);
	assign w_sys_tmp104 = (r_run_copy5_j_16 * w_sys_tmp89);
	assign w_sys_tmp106 = (w_sys_tmp107 + r_run_k_2);
	assign w_sys_tmp107 = (w_sys_tmp108 * w_sys_tmp89);
	assign w_sys_tmp108 = (r_run_copy4_j_15 - w_sys_intOne);
	assign w_sys_tmp112 = (w_sys_tmp113 + w_sys_intOne);
	assign w_sys_tmp113 = (w_sys_tmp114 + r_run_k_2);
	assign w_sys_tmp114 = (r_run_copy3_j_14 * w_sys_tmp89);
	assign w_sys_tmp119 = (w_sys_tmp120 + r_run_k_2);
	assign w_sys_tmp120 = (r_run_copy2_j_13 * w_sys_tmp89);
	assign w_sys_tmp122 = (w_sys_tmp123 - w_sys_intOne);
	assign w_sys_tmp123 = (w_sys_tmp124 + r_run_k_2);
	assign w_sys_tmp124 = (r_run_copy1_j_12 * w_sys_tmp89);
	assign w_sys_tmp128 = 32'h42c80000;
	assign w_sys_tmp129 = (r_run_copy0_j_11 - w_sys_intOne);
	assign w_sys_tmp130 = (r_run_k_2 - w_sys_intOne);
	assign w_sys_tmp131 = (r_run_copy0_j_11 + w_sys_intOne);
	assign w_sys_tmp132 = (r_run_copy1_j_12 + w_sys_intOne);
	assign w_sys_tmp133 = (r_run_copy2_j_13 + w_sys_intOne);
	assign w_sys_tmp134 = (r_run_copy3_j_14 + w_sys_intOne);
	assign w_sys_tmp135 = (r_run_copy4_j_15 + w_sys_intOne);
	assign w_sys_tmp136 = (r_run_copy5_j_16 + w_sys_intOne);
	assign w_sys_tmp138 = (r_run_copy7_j_18 + w_sys_intOne);
	assign w_sys_tmp139 = (r_run_j_3 + w_sys_intOne);
	assign w_sys_tmp306 = 32'sh00000002;
	assign w_sys_tmp307 = ( !w_sys_tmp308 );
	assign w_sys_tmp308 = (w_sys_tmp309 < r_run_k_2);
	assign w_sys_tmp309 = 32'sh00000020;
	assign w_sys_tmp310 = (r_run_k_2 + w_sys_intOne);
	assign w_sys_tmp311 = 32'sh00000061;
	assign w_sys_tmp312 = ( !w_sys_tmp313 );
	assign w_sys_tmp313 = (w_sys_tmp314 < r_run_j_3);
	assign w_sys_tmp314 = 32'sh00000080;
	assign w_sys_tmp317 = (w_sys_tmp318 + r_run_k_2);
	assign w_sys_tmp318 = (r_run_j_3 * w_sys_tmp319);
	assign w_sys_tmp319 = 32'sh00000081;
	assign w_sys_tmp320 = w_fld_result_1_dataout_1;
	assign w_sys_tmp321 = (w_sys_tmp322 + r_run_k_2);
	assign w_sys_tmp322 = (r_run_copy0_j_19 * w_sys_tmp319);
	assign w_sys_tmp324 = (r_run_copy0_j_19 + w_sys_intOne);
	assign w_sys_tmp325 = (r_run_j_3 + w_sys_intOne);


	DualPortRAM #(.DWIDTH(32), .AWIDTH(13), .WORDS(4515) )
		dpram_u_0(
			.clk (clock),
			.ce_0 (w_fld_u_0_ce_0),
			.addr_0 (w_fld_u_0_addr_0),
			.datain_0 (w_fld_u_0_datain_0),
			.dataout_0 (w_fld_u_0_dataout_0),
			.r_w_0 (w_fld_u_0_r_w_0),
			.ce_1 (w_fld_u_0_ce_1),
			.addr_1 (r_fld_u_0_addr_1),
			.datain_1 (r_fld_u_0_datain_1),
			.dataout_1 (w_fld_u_0_dataout_1),
			.r_w_1 (r_fld_u_0_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(13), .WORDS(4515) )
		dpram_result_1(
			.clk (clock),
			.ce_0 (w_fld_result_1_ce_0),
			.addr_0 (w_fld_result_1_addr_0),
			.datain_0 (w_fld_result_1_datain_0),
			.dataout_0 (w_fld_result_1_dataout_0),
			.r_w_0 (w_fld_result_1_r_w_0),
			.ce_1 (w_fld_result_1_ce_1),
			.addr_1 (r_fld_result_1_addr_1),
			.datain_1 (r_fld_result_1_datain_1),
			.dataout_1 (w_fld_result_1_dataout_1),
			.r_w_1 (r_fld_result_1_r_w_1)
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

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h9) || (r_sys_run_step==6'h20)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_run_step==6'h10) || (r_sys_run_step==6'h27)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_run_step==6'hc)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp11_float;

									end
									else
									if((r_sys_run_step==6'h1a) || (r_sys_run_step==6'h21)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp2_float;

									end
									else
									if((r_sys_run_step==6'h1e) || (r_sys_run_step==6'h22) || (r_sys_run_step==6'h28)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp12_float;

									end
									else
									if((r_sys_run_step==6'h17) || (r_sys_run_step==6'h2d)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp9_float;

									end
									else
									if((r_sys_run_step==6'h19)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp6_float;

									end
									else
									if((r_sys_run_step==6'h13)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp8_float;

									end
									else
									if((r_sys_run_step==6'he) || (r_sys_run_step==6'h11) || (r_sys_run_step==6'h15) || (r_sys_run_step==6'h18) || (r_sys_run_step==6'h1c) || (r_sys_run_step==6'h1f) || (r_sys_run_step==6'h23) || (r_sys_run_step==6'h25) || (r_sys_run_step==6'h26) || (r_sys_run_step==6'h2a) || (r_sys_run_step==6'h2c) || (r_sys_run_step==6'h31) || (r_sys_run_step==6'h32) || (r_sys_run_step==6'h37)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp90;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h13)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp100[31], w_sys_tmp100[30:0] };

									end
									else
									if((r_sys_run_step==6'h19) || (r_sys_run_step==6'h20) || (r_sys_run_step==6'h2a) || (r_sys_run_step==6'h32)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp14_float;

									end
									else
									if((r_sys_run_step==6'h2d)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp100;

									end
									else
									if((r_sys_run_step==6'h22) || (r_sys_run_step==6'h25) || (r_sys_run_step==6'h27) || (r_sys_run_step==6'h2c)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp13_float;

									end
									else
									if((r_sys_run_step==6'h15) || (r_sys_run_step==6'h1f) || (r_sys_run_step==6'h37)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp11_float;

									end
									else
									if((r_sys_run_step==6'h9)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp100[31], w_sys_tmp100[30:0] };

									end
									else
									if((r_sys_run_step==6'hc)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp100[31], w_sys_tmp100[30:0] };

									end
									else
									if((r_sys_run_step==6'he) || (r_sys_run_step==6'h18)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp12_float;

									end
									else
									if((r_sys_run_step==6'h10)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp100[31], w_sys_tmp100[30:0] };

									end
									else
									if((r_sys_run_step==6'h23)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp6_float;

									end
									else
									if((r_sys_run_step==6'h1c) || (r_sys_run_step==6'h26)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp8_float;

									end
									else
									if((r_sys_run_step==6'h28)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp10_float;

									end
									else
									if((r_sys_run_step==6'h1a)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp100[31], w_sys_tmp100[30:0] };

									end
									else
									if((r_sys_run_step==6'h21)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp100[31], w_sys_tmp100[30:0] };

									end
									else
									if((r_sys_run_step==6'h11)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp9_float;

									end
									else
									if((r_sys_run_step==6'h1e)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp100[31], w_sys_tmp100[30:0] };

									end
									else
									if((r_sys_run_step==6'h17)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp100[31], w_sys_tmp100[30:0] };

									end
									else
									if((r_sys_run_step==6'h31)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp7_float;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h8) || (r_sys_run_step==6'h9) || (r_sys_run_step==6'hc) || (r_sys_run_step==6'hf) || (r_sys_run_step==6'h10) || (r_sys_run_step==6'h14) || (r_sys_run_step==6'h17) || (r_sys_run_step==6'h1e)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp14_float;

									end
									else
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_dt_6;

									end
									else
									if((r_sys_run_step==6'h18)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp13_float;

									end
									else
									if((r_sys_run_step==6'h5) || (r_sys_run_step==6'h6) || (r_sys_run_step==6'ha) || (r_sys_run_step==6'hd) || (r_sys_run_step==6'h11)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp100;

									end
									else
									if((r_sys_run_step==6'h13) || (r_sys_run_step==6'h1a) || (r_sys_run_step==6'h21) || (r_sys_run_step==6'h28)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r1_4;

									end
									else
									if((r_sys_run_step==6'h4) || (r_sys_run_step==6'h7) || (r_sys_run_step==6'hb) || (r_sys_run_step==6'he) || (r_sys_run_step==6'h12) || (r_sys_run_step==6'h15) || (r_sys_run_step==6'h19) || (r_sys_run_step==6'h1c)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp101;

									end
									else
									if((r_sys_run_step==6'h16) || (r_sys_run_step==6'h1d) || (r_sys_run_step==6'h24) || (r_sys_run_step==6'h2b)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r2_5;

									end
									else
									if((r_sys_run_step==6'h1b) || (r_sys_run_step==6'h1f)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp7_float;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5) || (r_sys_run_step==6'h6) || (r_sys_run_step==6'h8) || (r_sys_run_step==6'h9)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_dx_7;

									end
									else
									if((r_sys_run_step==6'h18)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_run_step==6'h1f)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp0_float;

									end
									else
									if((r_sys_run_step==6'ha) || (r_sys_run_step==6'hf)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp13_float;

									end
									else
									if((r_sys_run_step==6'hc) || (r_sys_run_step==6'h1b)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp10_float;

									end
									else
									if((r_sys_run_step==6'h10) || (r_sys_run_step==6'h11) || (r_sys_run_step==6'h14) || (r_sys_run_step==6'h17)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_dy_8;

									end
									else
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp128;

									end
									else
									if((r_sys_run_step==6'h4) || (r_sys_run_step==6'h7) || (r_sys_run_step==6'hb) || (r_sys_run_step==6'he) || (r_sys_run_step==6'h12) || (r_sys_run_step==6'h15) || (r_sys_run_step==6'h19) || (r_sys_run_step==6'h1c)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp102;

									end
									else
									if((r_sys_run_step==6'hd) || (r_sys_run_step==6'h1e)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_run_step==6'h13) || (r_sys_run_step==6'h16) || (r_sys_run_step==6'h1a) || (r_sys_run_step==6'h1d) || (r_sys_run_step==6'h21) || (r_sys_run_step==6'h24) || (r_sys_run_step==6'h28) || (r_sys_run_step==6'h2b)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp90;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp129;

									end
									else
									if((6'h4<=r_sys_run_step && r_sys_run_step<=6'h7)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp130;

									end
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
						6'h26: begin
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
			r_sys_run_phase <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						6'h0: begin
							r_sys_run_phase <= 6'h2;
						end

						6'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 6'h4;

									end
								end

							endcase
						end

						6'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 6'h5;

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp6) ? 6'h8 : 6'ha);

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1)) begin
										r_sys_run_phase <= 6'h5;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 6'hb;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp20) ? 6'he : 6'h10);

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h7)) begin
										r_sys_run_phase <= 6'hb;

									end
								end

							endcase
						end

						6'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 6'h11;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp77) ? 6'h15 : 6'h1b);

									end
								end

							endcase
						end

						6'h12: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 6'h11;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 6'h16;

									end
								end

							endcase
						end

						6'h16: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp82) ? 6'h19 : 6'h12);

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h3c)) begin
										r_sys_run_phase <= 6'h16;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 6'h1c;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp307) ? 6'h20 : 6'h26);

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 6'h1c;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 6'h21;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp312) ? 6'h24 : 6'h1d);

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_sys_run_phase <= 6'h21;

									end
								end

							endcase
						end

						6'h26: begin
							r_sys_run_phase <= 6'h0;
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
						6'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= w_sys_run_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h7)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h12: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= w_sys_run_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h16: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h3c)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= w_sys_run_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
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
			r_sys_run_step <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						6'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1)) begin
										r_sys_run_step <= 6'h0;

									end
									else
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h6)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==6'h7)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h12: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h16: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h3c)) begin
										r_sys_run_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3b)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h4)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==6'h5)) begin
										r_sys_run_step <= 6'h0;

									end
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
						6'h0: begin
							r_sys_run_busy <= w_sys_boolTrue;
						end

						6'h26: begin
							r_sys_run_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_u_0_addr_1 <= 13'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp15[12:0] );

									end
									else
									if((r_sys_run_step==6'h0)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp11[12:0] );

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0) || (r_sys_run_step==6'h2) || (r_sys_run_step==6'h4) || (r_sys_run_step==6'h6)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp25[12:0] );

									end
									else
									if((r_sys_run_step==6'h1) || (r_sys_run_step==6'h3) || (r_sys_run_step==6'h5) || (r_sys_run_step==6'h7)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp30[12:0] );

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h3) || (r_sys_run_step==6'ha) || (r_sys_run_step==6'h11) || (r_sys_run_step==6'h18)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp106[12:0] );

									end
									else
									if((r_sys_run_step==6'h6) || (r_sys_run_step==6'hd) || (r_sys_run_step==6'h14) || (r_sys_run_step==6'h1b)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp122[12:0] );

									end
									else
									if((r_sys_run_step==6'h1) || (r_sys_run_step==6'h8) || (r_sys_run_step==6'hf) || (r_sys_run_step==6'h16)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp96[12:0] );

									end
									else
									if((r_sys_run_step==6'h4) || (r_sys_run_step==6'hb) || (r_sys_run_step==6'h12) || (r_sys_run_step==6'h19)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp112[12:0] );

									end
									else
									if((r_sys_run_step==6'h5) || (r_sys_run_step==6'hc) || (r_sys_run_step==6'h13) || (r_sys_run_step==6'h1a)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp119[12:0] );

									end
									else
									if((r_sys_run_step==6'h2) || (r_sys_run_step==6'h9) || (r_sys_run_step==6'h10) || (r_sys_run_step==6'h17)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp103[12:0] );

									end
									else
									if((r_sys_run_step==6'h0) || (r_sys_run_step==6'h7) || (r_sys_run_step==6'he) || (r_sys_run_step==6'h15)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp91[12:0] );

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h2<=r_sys_run_step && r_sys_run_step<=6'h5)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp317[12:0] );

									end
								end

							endcase
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
						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_fld_u_0_datain_1 <= w_sys_tmp13;

									end
									else
									if((r_sys_run_step==6'h1)) begin
										r_fld_u_0_datain_1 <= w_sys_tmp17;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1) || (r_sys_run_step==6'h3) || (r_sys_run_step==6'h5) || (r_sys_run_step==6'h7)) begin
										r_fld_u_0_datain_1 <= w_sys_tmp34;

									end
									else
									if((r_sys_run_step==6'h0) || (r_sys_run_step==6'h2) || (r_sys_run_step==6'h4) || (r_sys_run_step==6'h6)) begin
										r_fld_u_0_datain_1 <= w_sys_tmp28;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h2<=r_sys_run_step && r_sys_run_step<=6'h5)) begin
										r_fld_u_0_datain_1 <= w_sys_tmp320;

									end
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
			r_fld_u_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0) || (r_sys_run_step==6'h1)) begin
										r_fld_u_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h7)) begin
										r_fld_u_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h1b)) begin
										r_fld_u_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h2<=r_sys_run_step && r_sys_run_step<=6'h5)) begin
										r_fld_u_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						6'h26: begin
							r_fld_u_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_result_1_addr_1 <= 13'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2d) || (r_sys_run_step==6'h2f) || (r_sys_run_step==6'h36) || (r_sys_run_step==6'h3c)) begin
										r_fld_result_1_addr_1 <= $signed( w_sys_tmp87[12:0] );

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3)) begin
										r_fld_result_1_addr_1 <= $signed( w_sys_tmp321[12:0] );

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2d) || (r_sys_run_step==6'h2f) || (r_sys_run_step==6'h36) || (r_sys_run_step==6'h3c)) begin
										r_fld_result_1_datain_1 <= w_sys_tmp90;

									end
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
			r_fld_result_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2d) || (r_sys_run_step==6'h2f) || (r_sys_run_step==6'h36) || (r_sys_run_step==6'h3c)) begin
										r_fld_result_1_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3)) begin
										r_fld_result_1_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						6'h26: begin
							r_fld_result_1_r_w_1 <= w_sys_boolFalse;
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
						6'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_k_2 <= w_sys_intOne;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1)) begin
										r_run_k_2 <= w_sys_tmp18;

									end
								end

							endcase
						end

						6'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_k_2 <= w_sys_tmp76;

									end
								end

							endcase
						end

						6'h12: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_k_2 <= w_sys_tmp80;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_k_2 <= w_sys_tmp306;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_k_2 <= w_sys_tmp310;

									end
								end

							endcase
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
						6'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_j_3 <= w_sys_tmp19;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0) || (r_sys_run_step==6'h2) || (r_sys_run_step==6'h4) || (r_sys_run_step==6'h6)) begin
										r_run_j_3 <= w_sys_tmp36;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_j_3 <= w_sys_tmp81;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2d) || (r_sys_run_step==6'h2f) || (r_sys_run_step==6'h36) || (r_sys_run_step==6'h3c)) begin
										r_run_j_3 <= w_sys_tmp139;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_j_3 <= w_sys_tmp311;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h2<=r_sys_run_step && r_sys_run_step<=6'h5)) begin
										r_run_j_3 <= w_sys_tmp325;

									end
								end

							endcase
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
						6'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_r1_4 <= w_sys_tmp1;

									end
								end

							endcase
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
						6'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_r2_5 <= w_sys_tmp1;

									end
								end

							endcase
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
						6'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_dt_6 <= w_sys_tmp3;

									end
								end

							endcase
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
						6'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_dx_7 <= w_sys_tmp4;

									end
								end

							endcase
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
						6'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_dy_8 <= w_sys_tmp4;

									end
								end

							endcase
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
						6'ha: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy0_j_10 <= r_run_j_3;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1) || (r_sys_run_step==6'h3) || (r_sys_run_step==6'h5) || (r_sys_run_step==6'h7)) begin
										r_run_copy0_j_10 <= w_sys_tmp35;

									end
								end

							endcase
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
						6'h15: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy0_j_11 <= r_run_j_3;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3)) begin
										r_run_copy0_j_11 <= w_sys_tmp131;

									end
								end

							endcase
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
						6'h15: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy1_j_12 <= r_run_j_3;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h6) || (r_sys_run_step==6'hd) || (r_sys_run_step==6'h14) || (r_sys_run_step==6'h1b)) begin
										r_run_copy1_j_12 <= w_sys_tmp132;

									end
								end

							endcase
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
						6'h15: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy2_j_13 <= r_run_j_3;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5) || (r_sys_run_step==6'hc) || (r_sys_run_step==6'h13) || (r_sys_run_step==6'h1a)) begin
										r_run_copy2_j_13 <= w_sys_tmp133;

									end
								end

							endcase
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
						6'h15: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy3_j_14 <= r_run_j_3;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h4) || (r_sys_run_step==6'hb) || (r_sys_run_step==6'h12) || (r_sys_run_step==6'h19)) begin
										r_run_copy3_j_14 <= w_sys_tmp134;

									end
								end

							endcase
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
						6'h15: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy4_j_15 <= r_run_j_3;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h3) || (r_sys_run_step==6'ha) || (r_sys_run_step==6'h11) || (r_sys_run_step==6'h18)) begin
										r_run_copy4_j_15 <= w_sys_tmp135;

									end
								end

							endcase
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
						6'h15: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy5_j_16 <= r_run_j_3;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2) || (r_sys_run_step==6'h9) || (r_sys_run_step==6'h10) || (r_sys_run_step==6'h17)) begin
										r_run_copy5_j_16 <= w_sys_tmp136;

									end
								end

							endcase
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
						6'h15: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy6_j_17 <= r_run_j_3;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1) || (r_sys_run_step==6'h8) || (r_sys_run_step==6'hf) || (r_sys_run_step==6'h16)) begin
										r_run_copy6_j_17 <= w_sys_tmp98;

									end
								end

							endcase
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
						6'h15: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy7_j_18 <= r_run_j_3;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0) || (r_sys_run_step==6'h7) || (r_sys_run_step==6'he) || (r_sys_run_step==6'h15)) begin
										r_run_copy7_j_18 <= w_sys_tmp138;

									end
								end

							endcase
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
						6'h20: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy0_j_19 <= r_run_j_3;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3)) begin
										r_run_copy0_j_19 <= w_sys_tmp324;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'he)) begin
										r_sys_tmp0_float <= w_ip_FixedToFloat_floating_0;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'hb)) begin
										r_sys_tmp1_float <= w_ip_FixedToFloat_floating_0;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h14) || (r_sys_run_step==6'h1b)) begin
										r_sys_tmp2_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'ha) || (r_sys_run_step==6'h10)) begin
										r_sys_tmp3_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h9) || (r_sys_run_step==6'hd)) begin
										r_sys_tmp4_float <= w_ip_FixedToFloat_floating_0;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h3) || (r_sys_run_step==6'h9)) begin
										r_sys_tmp5_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2) || (r_sys_run_step==6'h1a)) begin
										r_sys_tmp6_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h16) || (r_sys_run_step==6'h1c) || (r_sys_run_step==6'h23)) begin
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


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'hd) || (r_sys_run_step==6'h13) || (r_sys_run_step==6'h1d)) begin
										r_sys_tmp8_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h8) || (r_sys_run_step==6'h11) || (r_sys_run_step==6'h17)) begin
										r_sys_tmp9_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1d)) begin
										r_sys_tmp10_float <= w_ip_MultFloat_product_0;

									end
									else
									if((r_sys_run_step==6'h8) || (r_sys_run_step==6'hc)) begin
										r_sys_tmp10_float <= w_ip_FixedToFloat_floating_0;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h24)) begin
										r_sys_tmp11_float <= w_ip_MultFloat_product_0;

									end
									else
									if((r_sys_run_step==6'h6) || (r_sys_run_step==6'hc) || (r_sys_run_step==6'h16)) begin
										r_sys_tmp11_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1e) || (r_sys_run_step==6'h27)) begin
										r_sys_tmp12_float <= w_ip_AddFloat_result_0;

									end
									else
									if((r_sys_run_step==6'h5) || (r_sys_run_step==6'hf) || (r_sys_run_step==6'h18)) begin
										r_sys_tmp12_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h15) || (r_sys_run_step==6'h1b) || (r_sys_run_step==6'h22) || (r_sys_run_step==6'h26) || (r_sys_run_step==6'h29)) begin
										r_sys_tmp13_float <= w_ip_MultFloat_product_0;

									end
									else
									if((r_sys_run_step==6'h7) || (r_sys_run_step==6'ha)) begin
										r_sys_tmp13_float <= w_ip_FixedToFloat_floating_0;

									end
								end

							endcase
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h7) || (r_sys_run_step==6'h8) || (r_sys_run_step==6'hb) || (r_sys_run_step==6'he) || (r_sys_run_step==6'hf) || (r_sys_run_step==6'h12) || (r_sys_run_step==6'h14) || (r_sys_run_step==6'h18) || (r_sys_run_step==6'h19) || (r_sys_run_step==6'h1f) || (r_sys_run_step==6'h20) || (r_sys_run_step==6'h30)) begin
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


endmodule
