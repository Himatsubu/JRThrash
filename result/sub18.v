/*
TimeStamp:	2016/6/3		7:21
*/


module sub18(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	input  signed  [ 8:0] i_fld_u_0_addr_0,	
	input          [31:0] i_fld_u_0_datain_0,	
	output         [31:0] o_fld_u_0_dataout_0,	
	input                 i_fld_u_0_r_w_0,	
	input  signed  [ 8:0] i_fld_result_1_addr_0,	
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
	reg         [ 3:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 5:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 5:0] w_sys_run_step_p1;
	wire signed [ 8:0] w_fld_u_0_addr_0;
	wire        [31:0] w_fld_u_0_datain_0;
	wire        [31:0] w_fld_u_0_dataout_0;
	wire               w_fld_u_0_r_w_0;
	wire               w_fld_u_0_ce_0;
	reg  signed [ 8:0] r_fld_u_0_addr_1;
	reg         [31:0] r_fld_u_0_datain_1;
	wire        [31:0] w_fld_u_0_dataout_1;
	reg                r_fld_u_0_r_w_1;
	wire               w_fld_u_0_ce_1;
	wire signed [ 8:0] w_fld_result_1_addr_0;
	wire        [31:0] w_fld_result_1_datain_0;
	wire        [31:0] w_fld_result_1_dataout_0;
	wire               w_fld_result_1_r_w_0;
	wire               w_fld_result_1_ce_0;
	reg  signed [ 8:0] r_fld_result_1_addr_1;
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
	wire signed [31:0] w_sys_tmp42;
	wire signed [31:0] w_sys_tmp43;
	wire signed [31:0] w_sys_tmp49;
	wire signed [31:0] w_sys_tmp52;
	wire signed [31:0] w_sys_tmp53;
	wire        [31:0] w_sys_tmp58;
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
	assign w_sys_tmp6 = 32'sh0000000d;
	assign w_sys_tmp7 = ( !w_sys_tmp8 );
	assign w_sys_tmp8 = (w_sys_tmp9 < r_run_j_3);
	assign w_sys_tmp9 = 32'sh00000010;
	assign w_sys_tmp10 = (r_run_j_3 + w_sys_intOne);
	assign w_sys_tmp11 = 32'sh0000000d;
	assign w_sys_tmp12 = ( !w_sys_tmp13 );
	assign w_sys_tmp13 = (w_sys_tmp14 < r_run_k_2);
	assign w_sys_tmp14 = 32'sh00000010;
	assign w_sys_tmp17 = (w_sys_tmp18 + r_run_k_2);
	assign w_sys_tmp18 = (r_run_j_3 * w_sys_tmp19);
	assign w_sys_tmp19 = 32'sh00000015;
	assign w_sys_tmp20 = w_ip_AddFloat_result_0;
	assign w_sys_tmp21 = (w_sys_tmp18 + r_run_copy7_k_17);
	assign w_sys_tmp26 = (w_sys_tmp27 + r_run_copy6_k_16);
	assign w_sys_tmp27 = (w_sys_tmp28 * w_sys_tmp19);
	assign w_sys_tmp28 = (r_run_j_3 + w_sys_intOne);
	assign w_sys_tmp30 = w_ip_MultFloat_product_0;
	assign w_sys_tmp31 = 32'h40000000;
	assign w_sys_tmp32 = w_fld_u_0_dataout_1;
	assign w_sys_tmp33 = (w_sys_tmp18 + r_run_copy5_k_15);
	assign w_sys_tmp36 = (w_sys_tmp37 + r_run_copy4_k_14);
	assign w_sys_tmp37 = (w_sys_tmp38 * w_sys_tmp19);
	assign w_sys_tmp38 = (r_run_j_3 - w_sys_intOne);
	assign w_sys_tmp42 = (w_sys_tmp43 + w_sys_intOne);
	assign w_sys_tmp43 = (w_sys_tmp18 + r_run_copy3_k_13);
	assign w_sys_tmp49 = (w_sys_tmp18 + r_run_copy2_k_12);
	assign w_sys_tmp52 = (w_sys_tmp53 - w_sys_intOne);
	assign w_sys_tmp53 = (w_sys_tmp18 + r_run_copy1_k_11);
	assign w_sys_tmp58 = 32'h42c80000;
	assign w_sys_tmp60 = (r_run_copy0_k_10 - w_sys_intOne);
	assign w_sys_tmp61 = (r_run_copy0_k_10 + w_sys_intOne);
	assign w_sys_tmp62 = (r_run_copy1_k_11 + w_sys_intOne);
	assign w_sys_tmp63 = (r_run_copy2_k_12 + w_sys_intOne);
	assign w_sys_tmp64 = (r_run_copy3_k_13 + w_sys_intOne);
	assign w_sys_tmp65 = (r_run_copy4_k_14 + w_sys_intOne);
	assign w_sys_tmp66 = (r_run_copy5_k_15 + w_sys_intOne);
	assign w_sys_tmp67 = (r_run_copy6_k_16 + w_sys_intOne);
	assign w_sys_tmp68 = (r_run_copy7_k_17 + w_sys_intOne);
	assign w_sys_tmp69 = (r_run_k_2 + w_sys_intOne);


	DualPortRAM #(.DWIDTH(32), .AWIDTH(9), .WORDS(484) )
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

	DualPortRAM #(.DWIDTH(32), .AWIDTH(9), .WORDS(484) )
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
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
									if((r_sys_run_step==6'h1e) || (r_sys_run_step==6'h22) || (r_sys_run_step==6'h28)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp12_float;

									end
									else
									if((r_sys_run_step==6'h9) || (r_sys_run_step==6'h20)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_run_step==6'he) || (r_sys_run_step==6'h11) || (r_sys_run_step==6'h15) || (r_sys_run_step==6'h18) || (r_sys_run_step==6'h1c) || (r_sys_run_step==6'h1f) || (r_sys_run_step==6'h23) || (r_sys_run_step==6'h25) || (r_sys_run_step==6'h26) || (r_sys_run_step==6'h2a) || (r_sys_run_step==6'h2c) || (r_sys_run_step==6'h31) || (r_sys_run_step==6'h32) || (r_sys_run_step==6'h37)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp20;

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
									if((r_sys_run_step==6'h10) || (r_sys_run_step==6'h27)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp3_float;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h21)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==6'h11)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp9_float;

									end
									else
									if((r_sys_run_step==6'h17)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==6'h1c) || (r_sys_run_step==6'h26)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp8_float;

									end
									else
									if((r_sys_run_step==6'h31)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp7_float;

									end
									else
									if((r_sys_run_step==6'h10)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==6'h19) || (r_sys_run_step==6'h20) || (r_sys_run_step==6'h2a) || (r_sys_run_step==6'h32)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp14_float;

									end
									else
									if((r_sys_run_step==6'h23)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp6_float;

									end
									else
									if((r_sys_run_step==6'hc)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==6'h13)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==6'h22) || (r_sys_run_step==6'h25) || (r_sys_run_step==6'h27) || (r_sys_run_step==6'h2c)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp13_float;

									end
									else
									if((r_sys_run_step==6'he) || (r_sys_run_step==6'h18)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp12_float;

									end
									else
									if((r_sys_run_step==6'h1a)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==6'h15) || (r_sys_run_step==6'h1f) || (r_sys_run_step==6'h37)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp11_float;

									end
									else
									if((r_sys_run_step==6'h28)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp10_float;

									end
									else
									if((r_sys_run_step==6'h1e)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==6'h9)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp30[31], w_sys_tmp30[30:0] };

									end
									else
									if((r_sys_run_step==6'h2d)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp30;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h1b) || (r_sys_run_step==6'h1f)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp7_float;

									end
									else
									if((r_sys_run_step==6'h18)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp13_float;

									end
									else
									if((r_sys_run_step==6'h13) || (r_sys_run_step==6'h1a) || (r_sys_run_step==6'h21) || (r_sys_run_step==6'h28)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r1_4;

									end
									else
									if((r_sys_run_step==6'h8) || (r_sys_run_step==6'h9) || (r_sys_run_step==6'hc) || (r_sys_run_step==6'hf) || (r_sys_run_step==6'h10) || (r_sys_run_step==6'h14) || (r_sys_run_step==6'h17) || (r_sys_run_step==6'h1e)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp14_float;

									end
									else
									if((r_sys_run_step==6'h16) || (r_sys_run_step==6'h1d) || (r_sys_run_step==6'h24) || (r_sys_run_step==6'h2b)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r2_5;

									end
									else
									if((r_sys_run_step==6'h5) || (r_sys_run_step==6'h6) || (r_sys_run_step==6'ha) || (r_sys_run_step==6'hd) || (r_sys_run_step==6'h11)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp30;

									end
									else
									if((r_sys_run_step==6'h4) || (r_sys_run_step==6'h7) || (r_sys_run_step==6'hb) || (r_sys_run_step==6'he) || (r_sys_run_step==6'h12) || (r_sys_run_step==6'h15) || (r_sys_run_step==6'h19) || (r_sys_run_step==6'h1c)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp31;

									end
									else
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_dt_6;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h10) || (r_sys_run_step==6'h11) || (r_sys_run_step==6'h14) || (r_sys_run_step==6'h17)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_dy_8;

									end
									else
									if((r_sys_run_step==6'ha) || (r_sys_run_step==6'hf)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp13_float;

									end
									else
									if((r_sys_run_step==6'h13) || (r_sys_run_step==6'h16) || (r_sys_run_step==6'h1a) || (r_sys_run_step==6'h1d) || (r_sys_run_step==6'h21) || (r_sys_run_step==6'h24) || (r_sys_run_step==6'h28) || (r_sys_run_step==6'h2b)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp20;

									end
									else
									if((r_sys_run_step==6'hc) || (r_sys_run_step==6'h1b)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp10_float;

									end
									else
									if((r_sys_run_step==6'h18)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_run_step==6'hd) || (r_sys_run_step==6'h1e)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_run_step==6'h4) || (r_sys_run_step==6'h7) || (r_sys_run_step==6'hb) || (r_sys_run_step==6'he) || (r_sys_run_step==6'h12) || (r_sys_run_step==6'h15) || (r_sys_run_step==6'h19) || (r_sys_run_step==6'h1c)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp32;

									end
									else
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp58;

									end
									else
									if((r_sys_run_step==6'h5) || (r_sys_run_step==6'h6) || (r_sys_run_step==6'h8) || (r_sys_run_step==6'h9)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_dx_7;

									end
									else
									if((r_sys_run_step==6'h1f)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp0_float;

									end
								end

							endcase
						end

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
									if((6'h4<=r_sys_run_step && r_sys_run_step<=6'h7)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp60;

									end
									else
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp38;

									end
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
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp7) ? 4'h9 : 4'hf);

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= 4'ha;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp12) ? 4'hd : 4'h6);

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h3c)) begin
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
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h9: begin

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

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h3c)) begin
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
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						4'h9: begin

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

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h3b)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==6'h3c)) begin
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
			r_fld_u_0_addr_1 <= 9'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h6) || (r_sys_run_step==6'hd) || (r_sys_run_step==6'h14) || (r_sys_run_step==6'h1b)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp52[8:0] );

									end
									else
									if((r_sys_run_step==6'h1) || (r_sys_run_step==6'h8) || (r_sys_run_step==6'hf) || (r_sys_run_step==6'h16)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp26[8:0] );

									end
									else
									if((r_sys_run_step==6'h5) || (r_sys_run_step==6'hc) || (r_sys_run_step==6'h13) || (r_sys_run_step==6'h1a)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp49[8:0] );

									end
									else
									if((r_sys_run_step==6'h3) || (r_sys_run_step==6'ha) || (r_sys_run_step==6'h11) || (r_sys_run_step==6'h18)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp36[8:0] );

									end
									else
									if((r_sys_run_step==6'h4) || (r_sys_run_step==6'hb) || (r_sys_run_step==6'h12) || (r_sys_run_step==6'h19)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp42[8:0] );

									end
									else
									if((r_sys_run_step==6'h0) || (r_sys_run_step==6'h7) || (r_sys_run_step==6'he) || (r_sys_run_step==6'h15)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp21[8:0] );

									end
									else
									if((r_sys_run_step==6'h2) || (r_sys_run_step==6'h9) || (r_sys_run_step==6'h10) || (r_sys_run_step==6'h17)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp33[8:0] );

									end
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
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h1b)) begin
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
			r_fld_result_1_addr_1 <= 9'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2d) || (r_sys_run_step==6'h2f) || (r_sys_run_step==6'h36) || (r_sys_run_step==6'h3c)) begin
										r_fld_result_1_addr_1 <= $signed( w_sys_tmp17[8:0] );

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h2d) || (r_sys_run_step==6'h2f) || (r_sys_run_step==6'h36) || (r_sys_run_step==6'h3c)) begin
										r_fld_result_1_datain_1 <= w_sys_tmp20;

									end
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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2d) || (r_sys_run_step==6'h2f) || (r_sys_run_step==6'h36) || (r_sys_run_step==6'h3c)) begin
										r_fld_result_1_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'hf: begin
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
						4'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_k_2 <= w_sys_tmp11;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2d) || (r_sys_run_step==6'h2f) || (r_sys_run_step==6'h36) || (r_sys_run_step==6'h3c)) begin
										r_run_k_2 <= w_sys_tmp69;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h0)) begin
										r_run_j_3 <= w_sys_tmp6;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_j_3 <= w_sys_tmp10;

									end
								end

							endcase
						end

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
						4'h2: begin

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
						4'h2: begin

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
						4'h2: begin

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
						4'h2: begin

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
						4'h9: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_copy0_k_10 <= r_run_k_2;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h4<=r_sys_run_step && r_sys_run_step<=6'h7)) begin
										r_run_copy0_k_10 <= w_sys_tmp61;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h0)) begin
										r_run_copy1_k_11 <= r_run_k_2;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h6) || (r_sys_run_step==6'hd) || (r_sys_run_step==6'h14) || (r_sys_run_step==6'h1b)) begin
										r_run_copy1_k_11 <= w_sys_tmp62;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h0)) begin
										r_run_copy2_k_12 <= r_run_k_2;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5) || (r_sys_run_step==6'hc) || (r_sys_run_step==6'h13) || (r_sys_run_step==6'h1a)) begin
										r_run_copy2_k_12 <= w_sys_tmp63;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h0)) begin
										r_run_copy3_k_13 <= r_run_k_2;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h4) || (r_sys_run_step==6'hb) || (r_sys_run_step==6'h12) || (r_sys_run_step==6'h19)) begin
										r_run_copy3_k_13 <= w_sys_tmp64;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h0)) begin
										r_run_copy4_k_14 <= r_run_k_2;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h3) || (r_sys_run_step==6'ha) || (r_sys_run_step==6'h11) || (r_sys_run_step==6'h18)) begin
										r_run_copy4_k_14 <= w_sys_tmp65;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h0)) begin
										r_run_copy5_k_15 <= r_run_k_2;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2) || (r_sys_run_step==6'h9) || (r_sys_run_step==6'h10) || (r_sys_run_step==6'h17)) begin
										r_run_copy5_k_15 <= w_sys_tmp66;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h0)) begin
										r_run_copy6_k_16 <= r_run_k_2;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1) || (r_sys_run_step==6'h8) || (r_sys_run_step==6'hf) || (r_sys_run_step==6'h16)) begin
										r_run_copy6_k_16 <= w_sys_tmp67;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==6'h0)) begin
										r_run_copy7_k_17 <= r_run_k_2;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0) || (r_sys_run_step==6'h7) || (r_sys_run_step==6'he) || (r_sys_run_step==6'h15)) begin
										r_run_copy7_k_17 <= w_sys_tmp68;

									end
								end

							endcase
						end

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
						4'hd: begin

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
						4'hd: begin

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
						4'hd: begin

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
						4'hd: begin

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
						4'hd: begin

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
						4'hd: begin

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
						4'hd: begin

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
						4'hd: begin

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
						4'hd: begin

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
						4'hd: begin

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
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h6) || (r_sys_run_step==6'hc) || (r_sys_run_step==6'h16)) begin
										r_sys_tmp11_float <= w_fld_u_0_dataout_1;

									end
									else
									if((r_sys_run_step==6'h24)) begin
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
									if((r_sys_run_step==6'h5) || (r_sys_run_step==6'hf) || (r_sys_run_step==6'h18)) begin
										r_sys_tmp12_float <= w_fld_u_0_dataout_1;

									end
									else
									if((r_sys_run_step==6'h1e) || (r_sys_run_step==6'h27)) begin
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
						4'hd: begin

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
