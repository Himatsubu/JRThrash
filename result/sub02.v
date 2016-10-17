/*
TimeStamp:	2016/10/17		15:28
*/


module sub02(
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
	reg         [ 7:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 7:0] w_sys_run_step_p1;
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
	reg  signed [31:0] r_run_tmpj_4;
	reg         [31:0] r_run_r1_5;
	reg         [31:0] r_run_r2_6;
	reg         [31:0] r_run_dt_7;
	reg         [31:0] r_run_dx_8;
	reg         [31:0] r_run_dy_9;
	reg         [31:0] r_run_q_10;
	reg  signed [31:0] r_run_copy0_j_11;
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
	wire signed [31:0] w_sys_tmp24;
	wire signed [31:0] w_sys_tmp25;
	wire signed [31:0] w_sys_tmp27;
	wire signed [31:0] w_sys_tmp28;
	wire signed [31:0] w_sys_tmp29;
	wire signed [31:0] w_sys_tmp30;
	wire        [31:0] w_sys_tmp31;
	wire signed [31:0] w_sys_tmp33;
	wire signed [31:0] w_sys_tmp34;
	wire        [31:0] w_sys_tmp37;
	wire signed [31:0] w_sys_tmp38;
	wire signed [31:0] w_sys_tmp42;
	wire signed [31:0] w_sys_tmp95;
	wire               w_sys_tmp96;
	wire               w_sys_tmp97;
	wire signed [31:0] w_sys_tmp98;
	wire signed [31:0] w_sys_tmp99;
	wire signed [31:0] w_sys_tmp100;
	wire               w_sys_tmp101;
	wire               w_sys_tmp102;
	wire signed [31:0] w_sys_tmp103;
	wire signed [31:0] w_sys_tmp105;
	wire signed [31:0] w_sys_tmp106;
	wire signed [31:0] w_sys_tmp108;
	wire signed [31:0] w_sys_tmp109;
	wire signed [31:0] w_sys_tmp110;
	wire        [31:0] w_sys_tmp111;
	wire signed [31:0] w_sys_tmp114;
	wire signed [31:0] w_sys_tmp115;
	wire signed [31:0] w_sys_tmp116;
	wire        [31:0] w_sys_tmp118;
	wire signed [31:0] w_sys_tmp121;
	wire signed [31:0] w_sys_tmp122;
	wire signed [31:0] w_sys_tmp123;
	wire        [31:0] w_sys_tmp126;
	wire        [31:0] w_sys_tmp127;
	wire signed [31:0] w_sys_tmp131;
	wire signed [31:0] w_sys_tmp132;
	wire signed [31:0] w_sys_tmp133;
	wire signed [31:0] w_sys_tmp137;
	wire signed [31:0] w_sys_tmp147;
	wire        [31:0] w_sys_tmp152;
	wire signed [31:0] w_sys_tmp153;
	wire signed [31:0] w_sys_tmp154;
	wire signed [31:0] w_sys_tmp155;
	wire signed [31:0] w_sys_tmp156;
	wire signed [31:0] w_sys_tmp367;
	wire               w_sys_tmp368;
	wire               w_sys_tmp369;
	wire signed [31:0] w_sys_tmp370;
	wire signed [31:0] w_sys_tmp371;
	wire signed [31:0] w_sys_tmp372;
	wire               w_sys_tmp373;
	wire               w_sys_tmp374;
	wire signed [31:0] w_sys_tmp375;
	wire signed [31:0] w_sys_tmp377;
	wire signed [31:0] w_sys_tmp378;
	wire signed [31:0] w_sys_tmp380;
	wire signed [31:0] w_sys_tmp381;
	wire signed [31:0] w_sys_tmp382;
	wire        [31:0] w_sys_tmp383;
	wire signed [31:0] w_sys_tmp384;
	wire signed [31:0] w_sys_tmp385;
	wire signed [31:0] w_sys_tmp386;
	wire signed [31:0] w_sys_tmp388;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 8'h1);
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
	assign w_sys_tmp19 = 32'sh00000041;
	assign w_sys_tmp20 = ( !w_sys_tmp21 );
	assign w_sys_tmp21 = (w_sys_tmp22 < r_run_j_3);
	assign w_sys_tmp22 = 32'sh00000060;
	assign w_sys_tmp24 = (r_run_j_3 - w_sys_tmp25);
	assign w_sys_tmp25 = 32'sh0000003f;
	assign w_sys_tmp27 = (w_sys_tmp28 + w_sys_intOne);
	assign w_sys_tmp28 = (w_sys_tmp29 * w_sys_tmp30);
	assign w_sys_tmp29 = w_sys_tmp24;
	assign w_sys_tmp30 = 32'sh00000081;
	assign w_sys_tmp31 = 32'h3f800000;
	assign w_sys_tmp33 = (w_sys_tmp34 + w_sys_tmp30);
	assign w_sys_tmp34 = (r_run_tmpj_4 * w_sys_tmp30);
	assign w_sys_tmp37 = 32'h0;
	assign w_sys_tmp38 = (r_run_j_3 + w_sys_intOne);
	assign w_sys_tmp42 = (w_sys_tmp34 + w_sys_intOne);
	assign w_sys_tmp95 = 32'sh00000002;
	assign w_sys_tmp96 = ( !w_sys_tmp97 );
	assign w_sys_tmp97 = (w_sys_tmp98 < r_run_k_2);
	assign w_sys_tmp98 = 32'sh00000020;
	assign w_sys_tmp99 = (r_run_k_2 + w_sys_intOne);
	assign w_sys_tmp100 = 32'sh00000041;
	assign w_sys_tmp101 = ( !w_sys_tmp102 );
	assign w_sys_tmp102 = (w_sys_tmp103 < r_run_j_3);
	assign w_sys_tmp103 = 32'sh00000060;
	assign w_sys_tmp105 = (r_run_j_3 - w_sys_tmp106);
	assign w_sys_tmp106 = 32'sh0000003f;
	assign w_sys_tmp108 = (w_sys_tmp109 + r_run_k_2);
	assign w_sys_tmp109 = (r_run_tmpj_4 * w_sys_tmp110);
	assign w_sys_tmp110 = 32'sh00000081;
	assign w_sys_tmp111 = w_ip_AddFloat_result_0;
	assign w_sys_tmp114 = (w_sys_tmp115 + r_run_k_2);
	assign w_sys_tmp115 = (w_sys_tmp116 * w_sys_tmp110);
	assign w_sys_tmp116 = w_sys_tmp105;
	assign w_sys_tmp118 = w_ip_MultFloat_product_0;
	assign w_sys_tmp121 = (w_sys_tmp122 + r_run_k_2);
	assign w_sys_tmp122 = (w_sys_tmp123 * w_sys_tmp110);
	assign w_sys_tmp123 = (r_run_tmpj_4 + w_sys_intOne);
	assign w_sys_tmp126 = 32'h40000000;
	assign w_sys_tmp127 = w_fld_u_0_dataout_1;
	assign w_sys_tmp131 = (w_sys_tmp132 + r_run_k_2);
	assign w_sys_tmp132 = (w_sys_tmp133 * w_sys_tmp110);
	assign w_sys_tmp133 = (r_run_tmpj_4 - w_sys_intOne);
	assign w_sys_tmp137 = (w_sys_tmp108 + w_sys_intOne);
	assign w_sys_tmp147 = (w_sys_tmp108 - w_sys_intOne);
	assign w_sys_tmp152 = 32'h42c80000;
	assign w_sys_tmp153 = (r_run_copy0_j_11 - w_sys_intOne);
	assign w_sys_tmp154 = (r_run_k_2 - w_sys_intOne);
	assign w_sys_tmp155 = (r_run_copy0_j_11 + w_sys_intOne);
	assign w_sys_tmp156 = (r_run_j_3 + w_sys_intOne);
	assign w_sys_tmp367 = 32'sh00000002;
	assign w_sys_tmp368 = ( !w_sys_tmp369 );
	assign w_sys_tmp369 = (w_sys_tmp370 < r_run_k_2);
	assign w_sys_tmp370 = 32'sh00000020;
	assign w_sys_tmp371 = (r_run_k_2 + w_sys_intOne);
	assign w_sys_tmp372 = 32'sh00000041;
	assign w_sys_tmp373 = ( !w_sys_tmp374 );
	assign w_sys_tmp374 = (w_sys_tmp375 < r_run_j_3);
	assign w_sys_tmp375 = 32'sh00000060;
	assign w_sys_tmp377 = (r_run_j_3 - w_sys_tmp378);
	assign w_sys_tmp378 = 32'sh0000003f;
	assign w_sys_tmp380 = (w_sys_tmp381 + r_run_k_2);
	assign w_sys_tmp381 = (r_run_tmpj_4 * w_sys_tmp382);
	assign w_sys_tmp382 = 32'sh00000081;
	assign w_sys_tmp383 = w_fld_result_1_dataout_1;
	assign w_sys_tmp384 = (w_sys_tmp385 + r_run_k_2);
	assign w_sys_tmp385 = (w_sys_tmp386 * w_sys_tmp382);
	assign w_sys_tmp386 = w_sys_tmp377;
	assign w_sys_tmp388 = (r_run_j_3 + w_sys_intOne);


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
									if((r_sys_run_step==8'he) || (r_sys_run_step==8'h11) || (r_sys_run_step==8'h1d) || (r_sys_run_step==8'h22) || (r_sys_run_step==8'h35) || (r_sys_run_step==8'h38) || (r_sys_run_step==8'h44) || (r_sys_run_step==8'h49) || (r_sys_run_step==8'h5c) || (r_sys_run_step==8'h5f) || (r_sys_run_step==8'h6b) || (r_sys_run_step==8'h70) || (r_sys_run_step==8'h83) || (r_sys_run_step==8'h86) || (r_sys_run_step==8'h92) || (r_sys_run_step==8'h97) || (r_sys_run_step==8'haa) || (r_sys_run_step==8'had) || (r_sys_run_step==8'hb9) || (r_sys_run_step==8'hbe)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp111;

									end
									else
									if((r_sys_run_step==8'hc) || (r_sys_run_step==8'h33) || (r_sys_run_step==8'h5a) || (r_sys_run_step==8'h81) || (r_sys_run_step==8'ha8)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp6_float;

									end
									else
									if((r_sys_run_step==8'h18) || (r_sys_run_step==8'h3f) || (r_sys_run_step==8'h66) || (r_sys_run_step==8'h8d) || (r_sys_run_step==8'hb4)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp8_float;

									end
									else
									if((r_sys_run_step==8'h9) || (r_sys_run_step==8'h30) || (r_sys_run_step==8'h57) || (r_sys_run_step==8'h7e) || (r_sys_run_step==8'ha5)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp9_float;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h57)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp118[31], w_sys_tmp118[30:0] };

									end
									else
									if((r_sys_run_step==8'hbe)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp2_float;

									end
									else
									if((r_sys_run_step==8'he) || (r_sys_run_step==8'h35) || (r_sys_run_step==8'h5c) || (r_sys_run_step==8'h83) || (r_sys_run_step==8'haa)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp7_float;

									end
									else
									if((r_sys_run_step==8'h49)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_run_step==8'ha5)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp118[31], w_sys_tmp118[30:0] };

									end
									else
									if((r_sys_run_step==8'h70)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_run_step==8'h11) || (r_sys_run_step==8'h38) || (r_sys_run_step==8'h5f) || (r_sys_run_step==8'h86) || (r_sys_run_step==8'had)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_run_step==8'h5a)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp118[31], w_sys_tmp118[30:0] };

									end
									else
									if((r_sys_run_step==8'h97)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_run_step==8'h18) || (r_sys_run_step==8'h3f) || (r_sys_run_step==8'h66) || (r_sys_run_step==8'h8d) || (r_sys_run_step==8'hb4)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp118;

									end
									else
									if((r_sys_run_step==8'h9)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp118[31], w_sys_tmp118[30:0] };

									end
									else
									if((r_sys_run_step==8'h1d) || (r_sys_run_step==8'h22) || (r_sys_run_step==8'h44) || (r_sys_run_step==8'h6b) || (r_sys_run_step==8'h92) || (r_sys_run_step==8'hb9)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp10_float;

									end
									else
									if((r_sys_run_step==8'h81)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp118[31], w_sys_tmp118[30:0] };

									end
									else
									if((r_sys_run_step==8'ha8)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp118[31], w_sys_tmp118[30:0] };

									end
									else
									if((r_sys_run_step==8'hc)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp118[31], w_sys_tmp118[30:0] };

									end
									else
									if((r_sys_run_step==8'h30)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp118[31], w_sys_tmp118[30:0] };

									end
									else
									if((r_sys_run_step==8'h7e)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp118[31], w_sys_tmp118[30:0] };

									end
									else
									if((r_sys_run_step==8'h33)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp118[31], w_sys_tmp118[30:0] };

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h9) || (r_sys_run_step==8'h18)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_run_step==8'h4) || (r_sys_run_step==8'h7) || (r_sys_run_step==8'h2b) || (r_sys_run_step==8'h2e) || (r_sys_run_step==8'h52) || (r_sys_run_step==8'h55) || (r_sys_run_step==8'h79) || (r_sys_run_step==8'h7c) || (r_sys_run_step==8'ha0) || (r_sys_run_step==8'ha3)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp126;

									end
									else
									if((8'hd<=r_sys_run_step && r_sys_run_step<=8'h12) || (r_sys_run_step==8'h1c)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp118;

									end
									else
									if((8'h0<=r_sys_run_step && r_sys_run_step<=8'h3) || (r_sys_run_step==8'h5)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_dt_7;

									end
									else
									if((r_sys_run_step==8'h16) || (r_sys_run_step==8'h3d) || (r_sys_run_step==8'h64) || (r_sys_run_step==8'h8b) || (r_sys_run_step==8'hb2)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r2_6;

									end
									else
									if((r_sys_run_step==8'h6) || (r_sys_run_step==8'h8) || (r_sys_run_step==8'ha) || (r_sys_run_step==8'hb) || (r_sys_run_step==8'hc) || (r_sys_run_step==8'h14) || (r_sys_run_step==8'h15) || (r_sys_run_step==8'h17) || (r_sys_run_step==8'h19) || (r_sys_run_step==8'h1a) || (r_sys_run_step==8'h1b)) begin
										r_ip_MultFloat_multiplicand_0 <= r_sys_tmp10_float;

									end
									else
									if((r_sys_run_step==8'h13) || (r_sys_run_step==8'h3a) || (r_sys_run_step==8'h61) || (r_sys_run_step==8'h88) || (r_sys_run_step==8'haf)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_r1_5;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'hd) || (r_sys_run_step==8'h19)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_run_step==8'h4) || (r_sys_run_step==8'h7) || (r_sys_run_step==8'h2b) || (r_sys_run_step==8'h2e) || (r_sys_run_step==8'h52) || (r_sys_run_step==8'h55) || (r_sys_run_step==8'h79) || (r_sys_run_step==8'h7c) || (r_sys_run_step==8'ha0) || (r_sys_run_step==8'ha3)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp127;

									end
									else
									if((r_sys_run_step==8'h13) || (r_sys_run_step==8'h16) || (r_sys_run_step==8'h3a) || (r_sys_run_step==8'h3d) || (r_sys_run_step==8'h61) || (r_sys_run_step==8'h64) || (r_sys_run_step==8'h88) || (r_sys_run_step==8'h8b) || (r_sys_run_step==8'haf) || (r_sys_run_step==8'hb2)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp111;

									end
									else
									if((r_sys_run_step==8'hc) || (r_sys_run_step==8'h18)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp0_float;

									end
									else
									if((r_sys_run_step==8'he) || (r_sys_run_step==8'h1a)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_run_step==8'h6) || (8'h8<=r_sys_run_step && r_sys_run_step<=8'hb)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_dx_8;

									end
									else
									if((8'h0<=r_sys_run_step && r_sys_run_step<=8'h3) || (r_sys_run_step==8'h5)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp152;

									end
									else
									if((r_sys_run_step==8'hf) || (r_sys_run_step==8'h1b)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp2_float;

									end
									else
									if((r_sys_run_step==8'h10) || (r_sys_run_step==8'h1c)) begin
										r_ip_MultFloat_multiplier_0 <= r_sys_tmp9_float;

									end
									else
									if((r_sys_run_step==8'h11) || (r_sys_run_step==8'h12) || (r_sys_run_step==8'h14) || (r_sys_run_step==8'h15) || (r_sys_run_step==8'h17)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_dy_9;

									end
								end

							endcase
						end

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
									if((8'h0<=r_sys_run_step && r_sys_run_step<=8'h4)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp153;

									end
									else
									if((8'h5<=r_sys_run_step && r_sys_run_step<=8'h9)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp154;

									end
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
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= 6'h4;

									end
								end

							endcase
						end

						6'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= 6'h5;

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp6) ? 6'h8 : 6'ha);

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h1)) begin
										r_sys_run_phase <= 6'h5;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= 6'hb;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp20) ? 6'he : 6'h10);

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h9)) begin
										r_sys_run_phase <= 6'hb;

									end
								end

							endcase
						end

						6'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= 6'h11;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp96) ? 6'h15 : 6'h1b);

									end
								end

							endcase
						end

						6'h12: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= 6'h11;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= 6'h16;

									end
								end

							endcase
						end

						6'h16: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp101) ? 6'h19 : 6'h12);

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'hc3)) begin
										r_sys_run_phase <= 6'h16;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= 6'h1c;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp368) ? 6'h20 : 6'h26);

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= 6'h1c;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= 6'h21;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp373) ? 6'h24 : 6'h1d);

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'ha)) begin
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
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h1)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= w_sys_run_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h9)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h12: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= w_sys_run_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h16: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'hc3)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= w_sys_run_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'ha)) begin
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
			r_sys_run_step <= 8'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						6'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==8'h1)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

								2'h1: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((8'h0<=r_sys_run_step && r_sys_run_step<=8'h8)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==8'h9)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h12: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

								2'h1: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h16: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((8'h0<=r_sys_run_step && r_sys_run_step<=8'hc2)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==8'hc3)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h1c: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

								2'h1: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_sys_run_step <= 8'h0;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((8'h0<=r_sys_run_step && r_sys_run_step<=8'h9)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==8'ha)) begin
										r_sys_run_step <= 8'h0;

									end
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
									if((r_sys_run_step==8'h0)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp11[12:0] );

									end
									else
									if((r_sys_run_step==8'h1)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp15[12:0] );

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h2) || (r_sys_run_step==8'h4) || (r_sys_run_step==8'h6) || (r_sys_run_step==8'h8)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp42[12:0] );

									end
									else
									if((r_sys_run_step==8'h1) || (r_sys_run_step==8'h3) || (r_sys_run_step==8'h5) || (r_sys_run_step==8'h7) || (r_sys_run_step==8'h9)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp33[12:0] );

									end
									else
									if((r_sys_run_step==8'h0)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp27[12:0] );

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h4) || (r_sys_run_step==8'h2b) || (r_sys_run_step==8'h52) || (r_sys_run_step==8'h79) || (r_sys_run_step==8'ha0)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp137[12:0] );

									end
									else
									if((r_sys_run_step==8'h6) || (r_sys_run_step==8'h2d) || (r_sys_run_step==8'h54) || (r_sys_run_step==8'h7b) || (r_sys_run_step==8'ha2)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp147[12:0] );

									end
									else
									if((r_sys_run_step==8'h3) || (r_sys_run_step==8'h2a) || (r_sys_run_step==8'h51) || (r_sys_run_step==8'h78) || (r_sys_run_step==8'h9f)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp131[12:0] );

									end
									else
									if((r_sys_run_step==8'h2) || (r_sys_run_step==8'h5) || (r_sys_run_step==8'h29) || (r_sys_run_step==8'h2c) || (r_sys_run_step==8'h50) || (r_sys_run_step==8'h53) || (r_sys_run_step==8'h77) || (r_sys_run_step==8'h7a) || (r_sys_run_step==8'h9e) || (r_sys_run_step==8'ha1)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp108[12:0] );

									end
									else
									if((r_sys_run_step==8'h1) || (r_sys_run_step==8'h28) || (r_sys_run_step==8'h4f) || (r_sys_run_step==8'h76) || (r_sys_run_step==8'h9d)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp121[12:0] );

									end
									else
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h27) || (r_sys_run_step==8'h4e) || (r_sys_run_step==8'h75) || (r_sys_run_step==8'h9c)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp114[12:0] );

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h2) || (r_sys_run_step==8'h4) || (r_sys_run_step==8'h6) || (r_sys_run_step==8'h8) || (r_sys_run_step==8'ha)) begin
										r_fld_u_0_addr_1 <= $signed( w_sys_tmp380[12:0] );

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h1)) begin
										r_fld_u_0_datain_1 <= w_sys_tmp17;

									end
									else
									if((r_sys_run_step==8'h0)) begin
										r_fld_u_0_datain_1 <= w_sys_tmp13;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h2) || (r_sys_run_step==8'h4) || (r_sys_run_step==8'h6) || (r_sys_run_step==8'h8)) begin
										r_fld_u_0_datain_1 <= w_sys_tmp31;

									end
									else
									if((r_sys_run_step==8'h1) || (r_sys_run_step==8'h3) || (r_sys_run_step==8'h5) || (r_sys_run_step==8'h7) || (r_sys_run_step==8'h9)) begin
										r_fld_u_0_datain_1 <= w_sys_tmp37;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h2) || (r_sys_run_step==8'h4) || (r_sys_run_step==8'h6) || (r_sys_run_step==8'h8) || (r_sys_run_step==8'ha)) begin
										r_fld_u_0_datain_1 <= w_sys_tmp383;

									end
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
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h1)) begin
										r_fld_u_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((8'h0<=r_sys_run_step && r_sys_run_step<=8'h9)) begin
										r_fld_u_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((8'h0<=r_sys_run_step && r_sys_run_step<=8'h6) || (8'h27<=r_sys_run_step && r_sys_run_step<=8'h2d) || (8'h4e<=r_sys_run_step && r_sys_run_step<=8'h54) || (8'h75<=r_sys_run_step && r_sys_run_step<=8'h7b) || (8'h9c<=r_sys_run_step && r_sys_run_step<=8'ha2)) begin
										r_fld_u_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h2) || (r_sys_run_step==8'h4) || (r_sys_run_step==8'h6) || (r_sys_run_step==8'h8) || (r_sys_run_step==8'ha)) begin
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
									if((r_sys_run_step==8'h27) || (r_sys_run_step==8'h4e) || (r_sys_run_step==8'h75) || (r_sys_run_step==8'h9c) || (r_sys_run_step==8'hc3)) begin
										r_fld_result_1_addr_1 <= $signed( w_sys_tmp108[12:0] );

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h2) || (r_sys_run_step==8'h4) || (r_sys_run_step==8'h6) || (r_sys_run_step==8'h8)) begin
										r_fld_result_1_addr_1 <= $signed( w_sys_tmp384[12:0] );

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h27) || (r_sys_run_step==8'h4e) || (r_sys_run_step==8'h75) || (r_sys_run_step==8'h9c) || (r_sys_run_step==8'hc3)) begin
										r_fld_result_1_datain_1 <= w_sys_tmp111;

									end
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
									if((r_sys_run_step==8'h27) || (r_sys_run_step==8'h4e) || (r_sys_run_step==8'h75) || (r_sys_run_step==8'h9c) || (r_sys_run_step==8'hc3)) begin
										r_fld_result_1_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h2) || (r_sys_run_step==8'h4) || (r_sys_run_step==8'h6) || (r_sys_run_step==8'h8)) begin
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
									if((r_sys_run_step==8'h0)) begin
										r_run_k_2 <= w_sys_intOne;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h1)) begin
										r_run_k_2 <= w_sys_tmp18;

									end
								end

							endcase
						end

						6'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_run_k_2 <= w_sys_tmp95;

									end
								end

							endcase
						end

						6'h12: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_run_k_2 <= w_sys_tmp99;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_run_k_2 <= w_sys_tmp367;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_run_k_2 <= w_sys_tmp371;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h0)) begin
										r_run_j_3 <= w_sys_tmp19;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h1) || (r_sys_run_step==8'h3) || (r_sys_run_step==8'h5) || (r_sys_run_step==8'h7)) begin
										r_run_j_3 <= w_sys_tmp38;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_run_j_3 <= w_sys_tmp100;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h27) || (r_sys_run_step==8'h4e) || (r_sys_run_step==8'h75) || (r_sys_run_step==8'h9c)) begin
										r_run_j_3 <= w_sys_tmp156;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0)) begin
										r_run_j_3 <= w_sys_tmp372;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h2) || (r_sys_run_step==8'h4) || (r_sys_run_step==8'h6) || (r_sys_run_step==8'h8)) begin
										r_run_j_3 <= w_sys_tmp388;

									end
								end

							endcase
						end

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
						6'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h1) || (r_sys_run_step==8'h3) || (r_sys_run_step==8'h5) || (r_sys_run_step==8'h7)) begin
										r_run_tmpj_4 <= w_sys_tmp24;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h27) || (r_sys_run_step==8'h4e) || (r_sys_run_step==8'h75) || (r_sys_run_step==8'h9c)) begin
										r_run_tmpj_4 <= w_sys_tmp105;

									end
								end

							endcase
						end

						6'h24: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h0) || (r_sys_run_step==8'h2) || (r_sys_run_step==8'h4) || (r_sys_run_step==8'h6) || (r_sys_run_step==8'h8)) begin
										r_run_tmpj_4 <= w_sys_tmp377;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h0)) begin
										r_run_r1_5 <= w_sys_tmp1;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h0)) begin
										r_run_r2_6 <= w_sys_tmp1;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h0)) begin
										r_run_dt_7 <= w_sys_tmp3;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h0)) begin
										r_run_dx_8 <= w_sys_tmp4;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h0)) begin
										r_run_dy_9 <= w_sys_tmp4;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h0)) begin
										r_run_copy0_j_11 <= r_run_j_3;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((8'h0<=r_sys_run_step && r_sys_run_step<=8'h4)) begin
										r_run_copy0_j_11 <= w_sys_tmp155;

									end
								end

							endcase
						end

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
									if((r_sys_run_step==8'h7) || (r_sys_run_step==8'hc)) begin
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
									if((r_sys_run_step==8'h7) || (r_sys_run_step==8'h16) || (r_sys_run_step==8'h1e)) begin
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'ha) || (r_sys_run_step==8'hf)) begin
										r_sys_tmp2_float <= w_ip_FixedToFloat_floating_0;

									end
									else
									if((r_sys_run_step==8'h21)) begin
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h9) || (r_sys_run_step==8'he)) begin
										r_sys_tmp3_float <= w_ip_FixedToFloat_floating_0;

									end
									else
									if((r_sys_run_step==8'h20)) begin
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h8) || (r_sys_run_step==8'hd)) begin
										r_sys_tmp4_float <= w_ip_FixedToFloat_floating_0;

									end
									else
									if((r_sys_run_step==8'h1f)) begin
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h8) || (r_sys_run_step==8'h2f) || (r_sys_run_step==8'h56) || (r_sys_run_step==8'h7d) || (r_sys_run_step==8'ha4)) begin
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
									if((r_sys_run_step==8'h6) || (r_sys_run_step==8'h2d) || (r_sys_run_step==8'h54) || (r_sys_run_step==8'h7b) || (r_sys_run_step==8'ha2)) begin
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
									if((r_sys_run_step==8'h5) || (r_sys_run_step==8'h2c) || (r_sys_run_step==8'h53) || (r_sys_run_step==8'h7a) || (r_sys_run_step==8'ha1)) begin
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
						6'h19: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==8'h2) || (r_sys_run_step==8'h29) || (r_sys_run_step==8'h50) || (r_sys_run_step==8'h77) || (r_sys_run_step==8'h9e)) begin
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
									if((r_sys_run_step==8'hb) || (r_sys_run_step==8'h10)) begin
										r_sys_tmp9_float <= w_ip_FixedToFloat_floating_0;

									end
									else
									if((r_sys_run_step==8'h3) || (r_sys_run_step==8'h2a) || (r_sys_run_step==8'h51) || (r_sys_run_step==8'h78) || (r_sys_run_step==8'h9f)) begin
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
									if((r_sys_run_step==8'h5) || (r_sys_run_step==8'h6) || (r_sys_run_step==8'h8) || (r_sys_run_step==8'ha) || (r_sys_run_step==8'hb) || (r_sys_run_step==8'h13) || (r_sys_run_step==8'h14) || (r_sys_run_step==8'h15) || (r_sys_run_step==8'h17) || (r_sys_run_step==8'h19) || (r_sys_run_step==8'h1a) || (r_sys_run_step==8'h1b) || (r_sys_run_step==8'h1d) || (r_sys_run_step==8'h42) || (r_sys_run_step==8'h69) || (r_sys_run_step==8'h90) || (r_sys_run_step==8'hb7)) begin
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


endmodule
