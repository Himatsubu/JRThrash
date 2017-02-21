/*
TimeStamp:	2017/2/21		15:4
*/


module mandelbrot(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy	
);

	reg         [31:0] r_ip_AddFloat_portA_0;
	reg         [31:0] r_ip_AddFloat_portB_0;
	wire        [31:0] w_ip_AddFloat_result_0;
	reg         [31:0] r_ip_MultFloat_multiplicand_0;
	reg         [31:0] r_ip_MultFloat_multiplier_0;
	wire        [31:0] w_ip_MultFloat_product_0;
	reg         [31:0] r_ip_DivFloat_dividend_0;
	reg         [31:0] r_ip_DivFloat_divisor_0;
	wire        [31:0] w_ip_DivFloat_quotient_0;
	reg         [31:0] r_ip_CompareFloatLT_portA_0;
	reg         [31:0] r_ip_CompareFloatLT_portB_0;
	wire               w_ip_CompareFloatLT_result_0;
	reg  signed [31:0] r_ip_FixedToFloat_fixed_0;
	wire        [31:0] w_ip_FixedToFloat_floating_0;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [31:0] r_sys_mandelbrot_return;
	reg         [ 1:0] r_sys_mandelbrot_caller;
	reg                r_sys_mandelbrot_req;
	reg         [ 4:0] r_sys_mandelbrot_phase;
	reg         [ 1:0] r_sys_mandelbrot_stage;
	reg         [ 4:0] r_sys_mandelbrot_step;
	reg                r_sys_mandelbrot_busy;
	wire        [ 1:0] w_sys_mandelbrot_stage_p1;
	wire        [ 4:0] w_sys_mandelbrot_step_p1;
	reg         [ 1:0] r_sys_run_caller;
	reg                r_sys_run_req;
	reg         [ 3:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 5:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 5:0] w_sys_run_step_p1;
	reg         [31:0] r_mandelbrot_a_0;
	reg         [31:0] r_mandelbrot_b_1;
	reg         [31:0] r_mandelbrot_x_2;
	reg         [31:0] r_mandelbrot_y_3;
	reg         [31:0] r_mandelbrot_x1_4;
	reg         [31:0] r_mandelbrot_y1_5;
	reg  signed [31:0] r_mandelbrot_n_6;
	reg         [31:0] r_run_a_7;
	reg         [31:0] r_run_b_8;
	reg         [31:0] r_run_C0r_9;
	reg         [31:0] r_run_C0i_10;
	reg         [31:0] r_run_VS_11;
	reg  signed [31:0] r_run_STEP_12;
	reg         [31:0] r_run_result_13;
	reg         [31:0] r_sys_tmp0_float;
	wire        [31:0] w_sys_tmp1;
	wire               w_sys_tmp3;
	wire signed [31:0] w_sys_tmp4;
	wire        [31:0] w_sys_tmp6;
	wire        [31:0] w_sys_tmp8;
	wire        [31:0] w_sys_tmp12;
	wire               w_sys_tmp13;
	wire        [31:0] w_sys_tmp14;
	wire        [31:0] w_sys_tmp15;
	wire        [31:0] w_sys_tmp16;
	wire        [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire        [31:0] w_sys_tmp19;
	wire        [31:0] w_sys_tmp20;
	wire        [31:0] w_sys_tmp21;
	wire        [31:0] w_sys_tmp22;
	wire signed [31:0] w_sys_tmp23;
	wire        [31:0] w_sys_tmp24;
	wire               w_sys_tmp25;
	wire        [31:0] w_sys_tmp26;
	wire        [31:0] w_sys_tmp27;
	wire        [31:0] w_sys_tmp28;
	wire        [31:0] w_sys_tmp29;
	wire        [31:0] w_sys_tmp30;
	wire        [31:0] w_sys_tmp31;
	wire               w_sys_tmp32;
	wire        [31:0] w_sys_tmp33;
	wire        [31:0] w_sys_tmp38;
	wire        [31:0] w_sys_tmp39;
	wire        [31:0] w_sys_tmp40;
	wire        [31:0] w_sys_tmp41;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign w_sys_mandelbrot_stage_p1 = (r_sys_mandelbrot_stage + 2'h1);
	assign w_sys_mandelbrot_step_p1 = (r_sys_mandelbrot_step + 5'h1);
	assign o_run_busy = r_sys_run_busy;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 6'h1);
	assign w_sys_tmp1 = 32'h0;
	assign w_sys_tmp3 = (r_mandelbrot_n_6 < w_sys_tmp4);
	assign w_sys_tmp4 = 32'sh00000064;
	assign w_sys_tmp6 = w_ip_AddFloat_result_0;
	assign w_sys_tmp8 = w_ip_MultFloat_product_0;
	assign w_sys_tmp12 = 32'h40000000;
	assign w_sys_tmp13 = w_ip_CompareFloatLT_result_0;
	assign w_sys_tmp14 = 32'h40800000;
	assign w_sys_tmp15 = w_ip_AddFloat_result_0;
	assign w_sys_tmp16 = w_ip_MultFloat_product_0;
	assign w_sys_tmp17 = w_ip_FixedToFloat_floating_0;
	assign w_sys_tmp18 = (r_mandelbrot_n_6 + w_sys_intOne);
	assign w_sys_tmp19 = 32'h0;
	assign w_sys_tmp20 = 32'hbf3e353f;
	assign w_sys_tmp21 = 32'h3dea7efa;
	assign w_sys_tmp22 = 32'h3b449ba6;
	assign w_sys_tmp23 = 32'sh00000320;
	assign w_sys_tmp24 = w_ip_AddFloat_result_0;
	assign w_sys_tmp25 = w_ip_CompareFloatLT_result_0;
	assign w_sys_tmp26 = w_ip_AddFloat_result_0;
	assign w_sys_tmp27 = w_ip_AddFloat_result_0;
	assign w_sys_tmp28 = w_ip_DivFloat_quotient_0;
	assign w_sys_tmp29 = 32'h40000000;
	assign w_sys_tmp30 = w_ip_FixedToFloat_floating_0;
	assign w_sys_tmp31 = w_ip_AddFloat_result_0;
	assign w_sys_tmp32 = w_ip_CompareFloatLT_result_0;
	assign w_sys_tmp33 = w_ip_AddFloat_result_0;
	assign w_sys_tmp38 = w_ip_AddFloat_result_0;
	assign w_sys_tmp39 = w_ip_DivFloat_quotient_0;
	assign w_sys_tmp40 = 32'h40000000;
	assign w_sys_tmp41 = w_ip_FixedToFloat_floating_0;


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

	DivFloat
		DivFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_DivFloat_dividend_0),
			.b (r_ip_DivFloat_divisor_0),
			.result (w_ip_DivFloat_quotient_0)
		);

	CompareFloatLT
		CompareFloatLT_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_CompareFloatLT_portA_0),
			.b (r_ip_CompareFloatLT_portB_0),
			.result (w_ip_CompareFloatLT_result_0)
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

					case(r_sys_mandelbrot_phase) 
						5'h8: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'hb)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp6;

									end
									else
									if((r_sys_mandelbrot_step==5'hc)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp8;

									end
									else
									if((r_sys_mandelbrot_step==5'h6)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp0_float;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h6)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp0_float;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_run_phase) 
						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_AddFloat_portA_0 <= r_run_C0r_9;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_AddFloat_portA_0 <= r_run_C0r_9;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h25)) begin
										r_ip_AddFloat_portA_0 <= r_run_a_7;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_AddFloat_portA_0 <= r_run_C0i_10;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_AddFloat_portA_0 <= r_run_C0i_10;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h25)) begin
										r_ip_AddFloat_portA_0 <= r_run_b_8;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h8: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'hc)) begin
										r_ip_AddFloat_portB_0 <= r_mandelbrot_b_1;

									end
									else
									if((r_sys_mandelbrot_step==5'hb)) begin
										r_ip_AddFloat_portB_0 <= r_mandelbrot_a_0;

									end
									else
									if((r_sys_mandelbrot_step==5'h6)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp8[31], w_sys_tmp8[30:0] };

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h6)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp16;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_run_phase) 
						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_AddFloat_portB_0 <= { ~r_run_VS_11[31], r_run_VS_11[30:0] };

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_AddFloat_portB_0 <= r_run_VS_11;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h25)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp28;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_AddFloat_portB_0 <= { ~r_run_VS_11[31], r_run_VS_11[30:0] };

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_AddFloat_portB_0 <= r_run_VS_11;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h25)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp39;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h8: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_ip_MultFloat_multiplicand_0 <= r_mandelbrot_x_2;

									end
									else
									if((r_sys_mandelbrot_step==5'h1)) begin
										r_ip_MultFloat_multiplicand_0 <= r_mandelbrot_y_3;

									end
									else
									if((r_sys_mandelbrot_step==5'h7)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp8;

									end
									else
									if((r_sys_mandelbrot_step==5'h2)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp12;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_ip_MultFloat_multiplicand_0 <= r_mandelbrot_x1_4;

									end
									else
									if((r_sys_mandelbrot_step==5'h1)) begin
										r_ip_MultFloat_multiplicand_0 <= r_mandelbrot_y1_5;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_run_phase) 
						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp29;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp40;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h8: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0) || (r_sys_mandelbrot_step==5'h2)) begin
										r_ip_MultFloat_multiplier_0 <= r_mandelbrot_x_2;

									end
									else
									if((r_sys_mandelbrot_step==5'h1) || (r_sys_mandelbrot_step==5'h7)) begin
										r_ip_MultFloat_multiplier_0 <= r_mandelbrot_y_3;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_ip_MultFloat_multiplier_0 <= r_mandelbrot_x1_4;

									end
									else
									if((r_sys_mandelbrot_step==5'h1)) begin
										r_ip_MultFloat_multiplier_0 <= r_mandelbrot_y1_5;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_run_phase) 
						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_VS_11;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_VS_11;

									end
								end

							endcase
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

					case(r_sys_run_phase) 
						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h7)) begin
										r_ip_DivFloat_dividend_0 <= r_sys_tmp0_float;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h7)) begin
										r_ip_DivFloat_dividend_0 <= r_sys_tmp0_float;

									end
								end

							endcase
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

					case(r_sys_run_phase) 
						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h7)) begin
										r_ip_DivFloat_divisor_0 <= w_sys_tmp30;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h7)) begin
										r_ip_DivFloat_divisor_0 <= w_sys_tmp41;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'ha: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'hb)) begin
										r_ip_CompareFloatLT_portA_0 <= w_sys_tmp14;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_run_phase) 
						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_ip_CompareFloatLT_portA_0 <= r_run_a_7;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_ip_CompareFloatLT_portA_0 <= r_run_b_8;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'ha: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'hb)) begin
										r_ip_CompareFloatLT_portB_0 <= w_sys_tmp15;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_run_phase) 
						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_ip_CompareFloatLT_portB_0 <= w_sys_tmp26;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_ip_CompareFloatLT_portB_0 <= w_sys_tmp33;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'hc: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_ip_FixedToFloat_fixed_0 <= r_mandelbrot_n_6;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_run_phase) 
						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_FixedToFloat_fixed_0 <= r_run_STEP_12;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h0)) begin
										r_ip_FixedToFloat_fixed_0 <= r_run_STEP_12;

									end
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
					r_sys_processing_methodID <= ((i_run_req) ? 2'h2 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h11: begin
							r_sys_processing_methodID <= r_sys_mandelbrot_caller;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_processing_methodID <= 2'h1;

									end
								end

							endcase
						end

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
			r_sys_mandelbrot_return <= 32'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'hb: begin
							r_sys_mandelbrot_return <= w_sys_tmp17;
						end

						5'he: begin
							r_sys_mandelbrot_return <= w_sys_tmp19;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_mandelbrot_caller <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_sys_mandelbrot_caller <= r_sys_processing_methodID;

									end
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
			r_sys_mandelbrot_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_mandelbrot_phase <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h0: begin
							r_sys_mandelbrot_phase <= 5'h2;
						end

						5'h2: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_phase <= ((w_sys_tmp3) ? 5'h8 : 5'hf);

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h11)) begin
										r_sys_mandelbrot_phase <= 5'ha;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'he)) begin
										r_sys_mandelbrot_phase <= ((w_sys_tmp13) ? 5'hc : 5'hd);

									end
								end

							endcase
						end

						5'hb: begin
							r_sys_mandelbrot_phase <= 5'h11;
						end

						5'hc: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h7)) begin
										r_sys_mandelbrot_phase <= 5'hb;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_phase <= 5'h5;

									end
								end

							endcase
						end

						5'he: begin
							r_sys_mandelbrot_phase <= 5'h11;
						end

						5'hf: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_phase <= 5'he;

									end
								end

							endcase
						end

						5'h11: begin
							r_sys_mandelbrot_phase <= 5'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_mandelbrot_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h2: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h11)) begin
										r_sys_mandelbrot_stage <= 2'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'he)) begin
										r_sys_mandelbrot_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h7)) begin
										r_sys_mandelbrot_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_stage <= 2'h0;

									end
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
			r_sys_mandelbrot_step <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h2: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_step <= 5'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_step <= 5'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_step <= 5'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((5'h0<=r_sys_mandelbrot_step && r_sys_mandelbrot_step<=5'h10)) begin
										r_sys_mandelbrot_step <= w_sys_mandelbrot_step_p1;

									end
									else
									if((r_sys_mandelbrot_step==5'h11)) begin
										r_sys_mandelbrot_step <= 5'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'he)) begin
										r_sys_mandelbrot_step <= 5'h0;

									end
									else
									if((5'h0<=r_sys_mandelbrot_step && r_sys_mandelbrot_step<=5'hd)) begin
										r_sys_mandelbrot_step <= w_sys_mandelbrot_step_p1;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((5'h0<=r_sys_mandelbrot_step && r_sys_mandelbrot_step<=5'h6)) begin
										r_sys_mandelbrot_step <= w_sys_mandelbrot_step_p1;

									end
									else
									if((r_sys_mandelbrot_step==5'h7)) begin
										r_sys_mandelbrot_step <= 5'h0;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_step <= 5'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_sys_mandelbrot_step <= 5'h0;

									end
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
			r_sys_mandelbrot_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h0: begin
							r_sys_mandelbrot_busy <= w_sys_boolTrue;
						end

						5'h11: begin
							r_sys_mandelbrot_busy <= w_sys_boolFalse;
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
				2'h2: begin

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
									if((r_sys_run_step==6'h5)) begin
										r_sys_run_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h8)) begin
										r_sys_run_phase <= ((w_sys_tmp25) ? 4'h9 : 4'hf);

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2a)) begin
										r_sys_run_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_sys_run_phase <= 4'ha;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h8)) begin
										r_sys_run_phase <= ((w_sys_tmp32) ? 4'hd : 4'h6);

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h2a)) begin
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
				2'h2: begin

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
									if((r_sys_run_step==6'h5)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h8)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2a)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h8)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h1)) begin
										r_sys_run_stage <= w_sys_run_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_run_step==6'h2a)) begin
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
				2'h2: begin

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

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h7)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==6'h8)) begin
										r_sys_run_step <= 6'h0;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2a)) begin
										r_sys_run_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h29)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
								end

							endcase
						end

						4'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_sys_run_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h4)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h8)) begin
										r_sys_run_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h7)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
								end

							endcase
						end

						4'hd: begin

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

								2'h1: begin
									if((6'h0<=r_sys_run_step && r_sys_run_step<=6'h29)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==6'h2a)) begin
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

				2'h2: begin

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

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_mandelbrot_a_0 <= r_run_a_7;

									end
								end

							endcase
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

					case(r_sys_run_phase) 
						4'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_mandelbrot_b_1 <= r_run_b_8;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h2: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_mandelbrot_x_2 <= w_sys_tmp1;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_mandelbrot_x_2 <= r_mandelbrot_x1_4;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h2: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_mandelbrot_y_3 <= w_sys_tmp1;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_mandelbrot_y_3 <= r_mandelbrot_y1_5;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h8: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h10)) begin
										r_mandelbrot_x1_4 <= w_sys_tmp6;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h8: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h11)) begin
										r_mandelbrot_y1_5 <= w_sys_tmp6;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h4: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_mandelbrot_n_6 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h0)) begin
										r_mandelbrot_n_6 <= w_sys_tmp18;

									end
								end

							endcase
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

					case(r_sys_run_phase) 
						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_run_a_7 <= w_sys_tmp24;

									end
								end

							endcase
						end

						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h2a)) begin
										r_run_a_7 <= w_sys_tmp27;

									end
								end

							endcase
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

					case(r_sys_run_phase) 
						4'h9: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_run_b_8 <= w_sys_tmp31;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h2a)) begin
										r_run_b_8 <= w_sys_tmp38;

									end
								end

							endcase
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

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_C0r_9 <= w_sys_tmp20;

									end
								end

							endcase
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

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_C0i_10 <= w_sys_tmp21;

									end
								end

							endcase
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

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_VS_11 <= w_sys_tmp22;

									end
								end

							endcase
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

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h0)) begin
										r_run_STEP_12 <= w_sys_tmp23;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_mandelbrot_phase) 
						5'h8: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h5)) begin
										r_sys_tmp0_float <= w_ip_MultFloat_product_0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_mandelbrot_stage) 
								2'h0: begin
									if((r_sys_mandelbrot_step==5'h5)) begin
										r_sys_tmp0_float <= w_ip_MultFloat_product_0;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_run_phase) 
						4'h6: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==6'h5)) begin
										r_sys_tmp0_float <= w_ip_MultFloat_product_0;

									end
								end

							endcase
						end

						4'hd: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==6'h5)) begin
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


endmodule
