/*
TimeStamp:	2016/9/7		18:53
*/


module sub02(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	input  signed  [14:0] i_fld_u_0_addr_0,	
	input          [31:0] i_fld_u_0_datain_0,	
	output         [31:0] o_fld_u_0_dataout_0,	
	input                 i_fld_u_0_r_w_0,	
	input  signed  [14:0] i_fld_q_1_addr_0,	
	input          [31:0] i_fld_q_1_datain_0,	
	output         [31:0] o_fld_q_1_dataout_0,	
	input                 i_fld_q_1_r_w_0,	
	input  signed  [14:0] i_fld_result_2_addr_0,	
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
	reg         [ 3:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 6:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 6:0] w_sys_run_step_p1;
	wire signed [14:0] w_fld_u_0_addr_0;
	wire        [31:0] w_fld_u_0_datain_0;
	wire        [31:0] w_fld_u_0_dataout_0;
	wire               w_fld_u_0_r_w_0;
	wire               w_fld_u_0_ce_0;
	reg  signed [14:0] r_fld_u_0_addr_1;
	reg         [31:0] r_fld_u_0_datain_1;
	wire        [31:0] w_fld_u_0_dataout_1;
	reg                r_fld_u_0_r_w_1;
	wire               w_fld_u_0_ce_1;
	wire signed [14:0] w_fld_q_1_addr_0;
	wire        [31:0] w_fld_q_1_datain_0;
	wire        [31:0] w_fld_q_1_dataout_0;
	wire               w_fld_q_1_r_w_0;
	wire               w_fld_q_1_ce_0;
	reg  signed [14:0] r_fld_q_1_addr_1;
	reg         [31:0] r_fld_q_1_datain_1;
	wire        [31:0] w_fld_q_1_dataout_1;
	reg                r_fld_q_1_r_w_1;
	wire               w_fld_q_1_ce_1;
	wire signed [14:0] w_fld_result_2_addr_0;
	wire        [31:0] w_fld_result_2_datain_0;
	wire        [31:0] w_fld_result_2_dataout_0;
	wire               w_fld_result_2_r_w_0;
	wire               w_fld_result_2_ce_0;
	reg  signed [14:0] r_fld_result_2_addr_1;
	reg         [31:0] r_fld_result_2_datain_1;
	wire        [31:0] w_fld_result_2_dataout_1;
	reg                r_fld_result_2_r_w_1;
	wire               w_fld_result_2_ce_1;
	reg         [31:0] r_fld_dx_3;
	reg         [31:0] r_fld_dy_4;
	reg         [31:0] r_fld_dt_5;
	reg         [31:0] r_fld_r1_6;
	reg         [31:0] r_fld_r2_7;
	reg  signed [31:0] r_run_k_8;
	reg  signed [31:0] r_run_j_9;
	reg  signed [31:0] r_run_copy0_k_10;
	reg  signed [31:0] r_run_copy1_k_11;
	reg  signed [31:0] r_run_copy2_k_12;
	reg  signed [31:0] r_run_copy3_k_13;
	reg  signed [31:0] r_run_copy4_k_14;
	reg  signed [31:0] r_run_copy5_k_15;
	reg  signed [31:0] r_run_copy6_k_16;
	reg  signed [31:0] r_run_copy7_k_17;
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
	reg         [31:0] r_sys_tmp15_float;
	reg         [31:0] r_sys_tmp16_float;
	reg         [31:0] r_sys_tmp17_float;
	reg         [31:0] r_sys_tmp18_float;
	wire        [31:0] w_sys_tmp1;
	wire        [31:0] w_sys_tmp3;
	wire        [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp6;
	wire               w_sys_tmp7;
	wire               w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp11;
	wire               w_sys_tmp12;
	wire               w_sys_tmp13;
	wire signed [31:0] w_sys_tmp14;
	wire signed [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire signed [31:0] w_sys_tmp19;
	wire        [31:0] w_sys_tmp20;
	wire signed [31:0] w_sys_tmp21;
	wire signed [31:0] w_sys_tmp26;
	wire signed [31:0] w_sys_tmp27;
	wire signed [31:0] w_sys_tmp28;
	wire        [31:0] w_sys_tmp30;
	wire        [31:0] w_sys_tmp31;
	wire        [31:0] w_sys_tmp32;
	wire signed [31:0] w_sys_tmp33;
	wire signed [31:0] w_sys_tmp36;
	wire signed [31:0] w_sys_tmp37;
	wire signed [31:0] w_sys_tmp38;
	wire signed [31:0] w_sys_tmp41;
	wire signed [31:0] w_sys_tmp42;
	wire signed [31:0] w_sys_tmp48;
	wire signed [31:0] w_sys_tmp51;
	wire signed [31:0] w_sys_tmp52;
	wire        [31:0] w_sys_tmp55;
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
	wire        [31:0] w_sys_tmp282;
	wire        [31:0] w_sys_tmp283;
	wire        [31:0] w_sys_tmp284;
	wire        [31:0] w_sys_tmp285;
	wire        [31:0] w_sys_tmp286;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 7'h1);
	assign o_fld_u_0_dataout_0 = w_fld_u_0_dataout_0;
	assign w_fld_u_0_addr_0 = i_fld_u_0_addr_0;
	assign w_fld_u_0_datain_0 = i_fld_u_0_datain_0;
	assign w_fld_u_0_r_w_0 = i_fld_u_0_r_w_0;
	assign w_fld_u_0_ce_0 = w_sys_ce;
	assign w_fld_u_0_ce_1 = w_sys_ce;
	assign o_fld_q_1_dataout_0 = w_fld_q_1_dataout_0;
	assign w_fld_q_1_addr_0 = i_fld_q_1_addr_0;
	assign w_fld_q_1_datain_0 = i_fld_q_1_datain_0;
	assign w_fld_q_1_r_w_0 = i_fld_q_1_r_w_0;
	assign w_fld_q_1_ce_0 = w_sys_ce;
	assign w_fld_q_1_ce_1 = w_sys_ce;
	assign o_fld_result_2_dataout_0 = w_fld_result_2_dataout_0;
	assign w_fld_result_2_addr_0 = i_fld_result_2_addr_0;
	assign w_fld_result_2_datain_0 = i_fld_result_2_datain_0;
	assign w_fld_result_2_r_w_0 = i_fld_result_2_r_w_0;
	assign w_fld_result_2_ce_0 = w_sys_ce;
	assign w_fld_result_2_ce_1 = w_sys_ce;
	assign w_sys_tmp1 = 32'h3c000000;
	assign w_sys_tmp3 = 32'h3a03126f;
	assign w_sys_tmp4 = 32'h4103126f;
	assign w_sys_tmp6 = 32'sh00000002;
	assign w_sys_tmp7 = ( !w_sys_tmp8 );
	assign w_sys_tmp8 = (w_sys_tmp9 < r_run_j_9);
	assign w_sys_tmp9 = 32'sh00000040;
	assign w_sys_tmp10 = (r_run_j_9 + w_sys_intOne);
	assign w_sys_tmp11 = 32'sh00000041;
	assign w_sys_tmp12 = ( !w_sys_tmp13 );
	assign w_sys_tmp13 = (w_sys_tmp14 < r_run_k_8);
	assign w_sys_tmp14 = 32'sh00000060;
	assign w_sys_tmp17 = (w_sys_tmp18 + r_run_k_8);
	assign w_sys_tmp18 = (r_run_j_9 * w_sys_tmp19);
	assign w_sys_tmp19 = 32'sh00000081;
	assign w_sys_tmp20 = w_ip_AddFloat_result_0;
	assign w_sys_tmp21 = (w_sys_tmp18 + r_run_copy7_k_17);
	assign w_sys_tmp26 = (w_sys_tmp27 + r_run_copy6_k_16);
	assign w_sys_tmp27 = (w_sys_tmp28 * w_sys_tmp19);
	assign w_sys_tmp28 = (r_run_j_9 + w_sys_intOne);
	assign w_sys_tmp30 = w_ip_MultFloat_product_0;
	assign w_sys_tmp31 = 32'h40000000;
	assign w_sys_tmp32 = w_fld_u_0_dataout_1;
	assign w_sys_tmp33 = (w_sys_tmp18 + r_run_copy5_k_15);
	assign w_sys_tmp36 = (w_sys_tmp37 + r_run_copy4_k_14);
	assign w_sys_tmp37 = (w_sys_tmp38 * w_sys_tmp19);
	assign w_sys_tmp38 = (r_run_j_9 - w_sys_intOne);
	assign w_sys_tmp41 = (w_sys_tmp42 + w_sys_intOne);
	assign w_sys_tmp42 = (w_sys_tmp18 + r_run_copy3_k_13);
	assign w_sys_tmp48 = (w_sys_tmp18 + r_run_copy2_k_12);
	assign w_sys_tmp51 = (w_sys_tmp52 - w_sys_intOne);
	assign w_sys_tmp52 = (w_sys_tmp18 + r_run_copy1_k_11);
	assign w_sys_tmp55 = 32'h42c80000;
	assign w_sys_tmp57 = (r_run_copy0_k_10 - w_sys_intOne);
	assign w_sys_tmp58 = (r_run_copy0_k_10 + w_sys_intOne);
	assign w_sys_tmp59 = (r_run_copy1_k_11 + w_sys_intOne);
	assign w_sys_tmp60 = (r_run_copy2_k_12 + w_sys_intOne);
	assign w_sys_tmp61 = (r_run_copy3_k_13 + w_sys_intOne);
	assign w_sys_tmp62 = (r_run_copy4_k_14 + w_sys_intOne);
	assign w_sys_tmp63 = (r_run_copy5_k_15 + w_sys_intOne);
	assign w_sys_tmp64 = (r_run_copy6_k_16 + w_sys_intOne);
	assign w_sys_tmp65 = (r_run_copy7_k_17 + w_sys_intOne);
	assign w_sys_tmp66 = (r_run_k_8 + w_sys_intOne);
	assign w_sys_tmp282 = 32'h0;
	assign w_sys_tmp283 = 32'h0;
	assign w_sys_tmp284 = 32'h0;
	assign w_sys_tmp285 = 32'h0;
	assign w_sys_tmp286 = 32'h0;


	DualPortRAM #(.DWIDTH(32), .AWIDTH(15), .WORDS(16900) )
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

	DualPortRAM #(.DWIDTH(32), .AWIDTH(15), .WORDS(16900) )
		dpram_q_1(
			.clk (clock),
			.ce_0 (w_fld_q_1_ce_0),
			.addr_0 (w_fld_q_1_addr_0),
			.datain_0 (w_fld_q_1_datain_0),
			.dataout_0 (w_fld_q_1_dataout_0),
			.r_w_0 (w_fld_q_1_r_w_0),
			.ce_1 (w_fld_q_1_ce_1),
			.addr_1 (r_fld_q_1_addr_1),
			.datain_1 (r_fld_q_1_datain_1),
			.dataout_1 (w_fld_q_1_dataout_1),
			.r_w_1 (r_fld_q_1_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(15), .WORDS(16900) )
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h13)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp8_float;

									end
									else
									if((r_sys_run_step==7'he) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h26) || (r_sys_run_step==7'h2a) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h31) || (r_sys_run_step==7'h33) || (r_sys_run_step==7'h38) || (r_sys_run_step==7'h39) || (r_sys_run_step==7'h3e)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp20;

									end
									else
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'h20)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp10_float;

									end
									else
									if((r_sys_run_step==7'h1e) || (r_sys_run_step==7'h34)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp13_float;

									end
									else
									if((r_sys_run_step==7'h17) || (r_sys_run_step==7'h2e)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp9_float;

									end
									else
									if((r_sys_run_step==7'hc) || (r_sys_run_step==7'h25) || (r_sys_run_step==7'h2b)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp15_float;

									end
									else
									if((r_sys_run_step==7'h1a) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h28)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp7_float;

									end
									else
									if((r_sys_run_step==7'h19)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp11_float;

									end
									else
									if((r_sys_run_step==7'h10) || (r_sys_run_step==7'h27)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_run_step==7'h22) || (r_sys_run_step==7'h29) || (r_sys_run_step==7'h2f)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp12_float;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'h2f) || (r_sys_run_step==7'h33)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp16_float;

									end
									else
									if((r_sys_run_step==7'h28)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==7'h25)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==7'h19) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h27) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h31) || (r_sys_run_step==7'h39)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp18_float;

									end
									else
									if((r_sys_run_step==7'h21)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==7'h34)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp30;

									end
									else
									if((r_sys_run_step==7'h22) || (r_sys_run_step==7'h2e) || (r_sys_run_step==7'h3e)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp14_float;

									end
									else
									if((r_sys_run_step==7'hc)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==7'h1c) || (r_sys_run_step==7'h26)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp8_float;

									end
									else
									if((r_sys_run_step==7'h29) || (r_sys_run_step==7'h2c) || (r_sys_run_step==7'h38)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp17_float;

									end
									else
									if((r_sys_run_step==7'h2a)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp10_float;

									end
									else
									if((r_sys_run_step==7'he) || (r_sys_run_step==7'h18)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp13_float;

									end
									else
									if((r_sys_run_step==7'h11)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp9_float;

									end
									else
									if((r_sys_run_step==7'h15) || (r_sys_run_step==7'h1f)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp15_float;

									end
									else
									if((r_sys_run_step==7'h1a)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==7'h17)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==7'h13)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==7'h23) || (r_sys_run_step==7'h2d)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp11_float;

									end
									else
									if((r_sys_run_step==7'h9)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==7'h10)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==7'h1e)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'h4) || (r_sys_run_step==7'h7) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'he) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h23)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp31;

									end
									else
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'hd) || (r_sys_run_step==7'h10) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h1e)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp17_float;

									end
									else
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h3) || (r_sys_run_step==7'h5)) begin
										r_ip_MultFloat_multiplicand_0 <= r_fld_dt_5;

									end
									else
									if((r_sys_run_step==7'h1b) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h27)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp16_float;

									end
									else
									if((r_sys_run_step==7'h25)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp0_float;

									end
									else
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'h8) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'hc) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h26)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp18_float;

									end
									else
									if((r_sys_run_step==7'h17) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h24) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h32)) begin
										r_ip_MultFloat_multiplicand_0 <= r_fld_r2_7;

									end
									else
									if((r_sys_run_step==7'h29)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp14_float;

									end
									else
									if((r_sys_run_step==7'h13) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h28) || (r_sys_run_step==7'h2f)) begin
										r_ip_MultFloat_multiplicand_0 <= r_fld_r1_6;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'h4) || (r_sys_run_step==7'h7) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'he) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h1c) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h23)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp32;

									end
									else
									if((r_sys_run_step==7'h16) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h1f)) begin
										r_ip_MultFloat_multiplier_0 <= r_fld_dy_4;

									end
									else
									if((r_sys_run_step==7'h13) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h1d) || (r_sys_run_step==7'h21) || (r_sys_run_step==7'h24) || (r_sys_run_step==7'h28) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h2f) || (r_sys_run_step==7'h32)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp20;

									end
									else
									if((r_sys_run_step==7'h14)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp16_float;

									end
									else
									if((r_sys_run_step==7'hf) || (r_sys_run_step==7'h27)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_run_step==7'h11)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp14_float;

									end
									else
									if((r_sys_run_step==7'h17)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp12_float;

									end
									else
									if((r_sys_run_step==7'h22)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp2_float;

									end
									else
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h3) || (r_sys_run_step==7'h5)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp55;

									end
									else
									if((r_sys_run_step==7'h10) || (r_sys_run_step==7'h29)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_run_step==7'h26)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'h8) || (r_sys_run_step==7'h9) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'hc)) begin
										r_ip_MultFloat_multiplier_0 <= r_fld_dx_3;

									end
									else
									if((r_sys_run_step==7'hd) || (r_sys_run_step==7'h25)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp6_float;

									end
								end

							endcase
						end

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
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h4)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp38;

									end
									else
									if((7'h5<=r_sys_run_step && r_sys_run_step<=7'h9)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp57;

									end
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
										r_sys_run_phase <= ((w_sys_tmp7) ? 4'h9 : 4'hf);

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
										r_sys_run_phase <= ((w_sys_tmp12) ? 4'hd : 4'h6);

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h43)) begin
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
									if((r_sys_run_step==7'h43)) begin
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
									if((r_sys_run_step==7'h43)) begin
										r_sys_run_step <= 7'h0;

									end
									else
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h42)) begin
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
			r_fld_u_0_addr_1 <= 15'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'hd) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h22)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp51[14:0] );

									end
									else
									if((r_sys_run_step==7'h1) || (r_sys_run_step==7'h8) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h1d)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp26[14:0] );

									end
									else
									if((r_sys_run_step==7'h2) || (r_sys_run_step==7'h9) || (r_sys_run_step==7'h10) || (r_sys_run_step==7'h17) || (r_sys_run_step==7'h1e)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp33[14:0] );

									end
									else
									if((r_sys_run_step==7'h5) || (r_sys_run_step==7'hc) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h21)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp48[14:0] );

									end
									else
									if((r_sys_run_step==7'h0) || (r_sys_run_step==7'h7) || (r_sys_run_step==7'he) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h1c)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp21[14:0] );

									end
									else
									if((r_sys_run_step==7'h4) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h20)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp41[14:0] );

									end
									else
									if((r_sys_run_step==7'h3) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h1f)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp36[14:0] );

									end
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h0<=r_sys_run_step && r_sys_run_step<=7'h22)) begin
										r_fld_u_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hf: begin
							r_fld_u_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_q_1_addr_1 <= 15'sh0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_q_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hf: begin
							r_fld_q_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_result_2_addr_1 <= 15'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h30) || (r_sys_run_step==7'h34) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h3d) || (r_sys_run_step==7'h43)) begin
										r_fld_result_2_addr_1 <= $signed( w_sys_tmp17[14:0] );

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'h30) || (r_sys_run_step==7'h34) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h3d) || (r_sys_run_step==7'h43)) begin
										r_fld_result_2_datain_1 <= w_sys_tmp20;

									end
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h30) || (r_sys_run_step==7'h34) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h3d) || (r_sys_run_step==7'h43)) begin
										r_fld_result_2_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'hf: begin
							r_fld_result_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_dx_3 <= w_sys_tmp282;

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
										r_fld_dx_3 <= w_sys_tmp1;

									end
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
			r_fld_dy_4 <= w_sys_tmp283;

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
										r_fld_dy_4 <= w_sys_tmp1;

									end
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
			r_fld_dt_5 <= w_sys_tmp284;

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
										r_fld_dt_5 <= w_sys_tmp3;

									end
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
			r_fld_r1_6 <= w_sys_tmp285;

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
										r_fld_r1_6 <= w_sys_tmp4;

									end
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
			r_fld_r2_7 <= w_sys_tmp286;

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
										r_fld_r2_7 <= w_sys_tmp4;

									end
								end

							endcase
						end

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
										r_run_k_8 <= w_sys_tmp11;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h30) || (r_sys_run_step==7'h34) || (r_sys_run_step==7'h36) || (r_sys_run_step==7'h3d) || (r_sys_run_step==7'h43)) begin
										r_run_k_8 <= w_sys_tmp66;

									end
								end

							endcase
						end

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
										r_run_j_9 <= w_sys_tmp6;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0)) begin
										r_run_j_9 <= w_sys_tmp10;

									end
								end

							endcase
						end

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
										r_run_copy0_k_10 <= r_run_k_8;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((7'h5<=r_sys_run_step && r_sys_run_step<=7'h9)) begin
										r_run_copy0_k_10 <= w_sys_tmp58;

									end
								end

							endcase
						end

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
										r_run_copy1_k_11 <= r_run_k_8;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'hd) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h22)) begin
										r_run_copy1_k_11 <= w_sys_tmp59;

									end
								end

							endcase
						end

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
										r_run_copy2_k_12 <= r_run_k_8;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h5) || (r_sys_run_step==7'hc) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h21)) begin
										r_run_copy2_k_12 <= w_sys_tmp60;

									end
								end

							endcase
						end

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
										r_run_copy3_k_13 <= r_run_k_8;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h4) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h20)) begin
										r_run_copy3_k_13 <= w_sys_tmp61;

									end
								end

							endcase
						end

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
										r_run_copy4_k_14 <= r_run_k_8;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h3) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h1f)) begin
										r_run_copy4_k_14 <= w_sys_tmp62;

									end
								end

							endcase
						end

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
										r_run_copy5_k_15 <= r_run_k_8;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h2) || (r_sys_run_step==7'h9) || (r_sys_run_step==7'h10) || (r_sys_run_step==7'h17) || (r_sys_run_step==7'h1e)) begin
										r_run_copy5_k_15 <= w_sys_tmp63;

									end
								end

							endcase
						end

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
										r_run_copy6_k_16 <= r_run_k_8;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h1) || (r_sys_run_step==7'h8) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h1d)) begin
										r_run_copy6_k_16 <= w_sys_tmp64;

									end
								end

							endcase
						end

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
										r_run_copy7_k_17 <= r_run_k_8;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h0) || (r_sys_run_step==7'h7) || (r_sys_run_step==7'he) || (r_sys_run_step==7'h15) || (r_sys_run_step==7'h1c)) begin
										r_run_copy7_k_17 <= w_sys_tmp65;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'h1d)) begin
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
									if((r_sys_run_step==7'he)) begin
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'hc)) begin
										r_sys_tmp2_float <= w_ip_FixedToFloat_floating_0;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'ha) || (r_sys_run_step==7'h10)) begin
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h9) || (r_sys_run_step==7'h10)) begin
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h8) || (r_sys_run_step==7'hf)) begin
										r_sys_tmp5_float <= w_ip_FixedToFloat_floating_0;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'h7) || (r_sys_run_step==7'hd)) begin
										r_sys_tmp6_float <= w_ip_FixedToFloat_floating_0;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'h14) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h22)) begin
										r_sys_tmp7_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'hd) || (r_sys_run_step==7'h13) || (r_sys_run_step==7'h1d)) begin
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h8) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h17)) begin
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h3) || (r_sys_run_step==7'h9) || (r_sys_run_step==7'h21)) begin
										r_sys_tmp10_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'h2) || (r_sys_run_step==7'h1a) || (r_sys_run_step==7'h24)) begin
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h16) || (r_sys_run_step==7'h1e) || (r_sys_run_step==7'h25) || (r_sys_run_step==7'h2e)) begin
										r_sys_tmp12_float <= w_ip_AddFloat_result_0;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'h5) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h1e)) begin
										r_sys_tmp13_float <= w_fld_u_0_dataout_1;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'ha)) begin
										r_sys_tmp14_float <= w_ip_FixedToFloat_floating_0;

									end
									else
									if((r_sys_run_step==7'h1c) || (r_sys_run_step==7'h24) || (r_sys_run_step==7'h2d) || (r_sys_run_step==7'h2e)) begin
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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h6) || (r_sys_run_step==7'hc) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h1f)) begin
										r_sys_tmp15_float <= w_fld_u_0_dataout_1;

									end
									else
									if((r_sys_run_step==7'h27)) begin
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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'hb)) begin
										r_sys_tmp16_float <= w_ip_FixedToFloat_floating_0;

									end
									else
									if((r_sys_run_step==7'h15) || (r_sys_run_step==7'h1b) || (r_sys_run_step==7'h23) || (r_sys_run_step==7'h2a) || (r_sys_run_step==7'h30)) begin
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
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==7'h7) || (r_sys_run_step==7'hb) || (r_sys_run_step==7'he) || (r_sys_run_step==7'h12) || (r_sys_run_step==7'h16) || (r_sys_run_step==7'h22) || (r_sys_run_step==7'h29) || (r_sys_run_step==7'h2c)) begin
										r_sys_tmp17_float <= w_ip_MultFloat_product_0;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==7'h5) || (r_sys_run_step==7'h6) || (r_sys_run_step==7'h8) || (r_sys_run_step==7'ha) || (r_sys_run_step==7'hd) || (r_sys_run_step==7'hf) || (r_sys_run_step==7'h11) || (r_sys_run_step==7'h14) || (r_sys_run_step==7'h18) || (r_sys_run_step==7'h19) || (r_sys_run_step==7'h1f) || (r_sys_run_step==7'h20) || (r_sys_run_step==7'h26) || (r_sys_run_step==7'h27) || (r_sys_run_step==7'h2b) || (r_sys_run_step==7'h37)) begin
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


endmodule
