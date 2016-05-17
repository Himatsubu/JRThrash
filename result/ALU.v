/*
TimeStamp:	2013/12/16		12:59
*/


module ALU(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_alu_req,	
	output                o_alu_busy,	
	output signed  [31:0] o_alu_return,	
	input  signed  [31:0] i_alu_operandA_1,	
	input  signed  [31:0] i_alu_operandB_2,	
	input  signed  [ 7:0] i_alu_opcode_3	
);

	reg  signed [31:0] r_sys_alu_switchCond_2;
	reg  signed [31:0] r_ip_Multint_multiplicand_0;
	reg  signed [31:0] r_ip_Multint_multiplier_0;
	wire signed [63:0] w_ip_Multint_product_0;
	reg  signed [31:0] r_ip_DivInt_dividend_0;
	reg  signed [31:0] r_ip_DivInt_divisor_0;
	wire signed [31:0] w_ip_DivInt_quotient_0;
	wire signed [31:0] w_ip_DivInt_fractional_0;
	reg  signed [31:0] r_ip_DivInt_dividend_1;
	reg  signed [31:0] r_ip_DivInt_divisor_1;
	wire signed [31:0] w_ip_DivInt_quotient_1;
	wire signed [31:0] w_ip_DivInt_fractional_1;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg  signed [31:0] r_sys_alu_return;
	reg         [ 1:0] r_sys_alu_caller;
	reg                r_sys_alu_req;
	reg         [ 5:0] r_sys_alu_phase;
	reg         [ 1:0] r_sys_alu_stage;
	reg         [ 5:0] r_sys_alu_step;
	reg                r_sys_alu_busy;
	wire        [ 1:0] w_sys_alu_stage_p1;
	wire        [ 5:0] w_sys_alu_step_p1;
	reg  signed [31:0] r_fld_ret_0;
	reg  signed [31:0] r_alu_operandA_1;
	reg  signed [31:0] r_alu_operandB_2;
	reg  signed [ 7:0] r_alu_opcode_3;
	wire signed [31:0] w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp3;
	wire signed [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire signed [31:0] w_sys_tmp7;
	wire signed [31:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;
	wire               w_sys_tmp10;
	wire signed [31:0] w_sys_tmp11;
	wire               w_sys_tmp12;
	wire signed [31:0] w_sys_tmp13;
	wire               w_sys_tmp14;
	wire signed [31:0] w_sys_tmp15;
	wire               w_sys_tmp16;
	wire               w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire               w_sys_tmp19;
	wire signed [31:0] w_sys_tmp20;
	wire               w_sys_tmp21;
	wire               w_sys_tmp22;
	wire signed [31:0] w_sys_tmp23;
	wire signed [31:0] w_sys_tmp24;
	wire signed [31:0] w_sys_tmp25;
	wire signed [31:0] w_sys_tmp26;
	wire signed [31:0] w_sys_tmp27;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_alu_busy = r_sys_alu_busy;
	assign o_alu_return = r_sys_alu_return;
	assign w_sys_alu_stage_p1 = (r_sys_alu_stage + 2'h1);
	assign w_sys_alu_step_p1 = (r_sys_alu_step + 6'h1);
	assign w_sys_tmp1 = (r_alu_operandA_1 + r_alu_operandB_2);
	assign w_sys_tmp2 = (r_alu_operandA_1 - r_alu_operandB_2);
	assign w_sys_tmp3 = $signed( w_ip_Multint_product_0[31:0] );
	assign w_sys_tmp4 = w_ip_DivInt_quotient_0;
	assign w_sys_tmp5 = w_ip_DivInt_fractional_1;
	assign w_sys_tmp6 = (r_alu_operandA_1 << r_alu_operandB_2);
	assign w_sys_tmp7 = (r_alu_operandA_1 >>> r_alu_operandB_2);
	assign w_sys_tmp8 = (r_alu_operandA_1 >> r_alu_operandB_2);
	assign w_sys_tmp9 = ((w_sys_tmp10) ? w_sys_intOne : w_sys_intZero);
	assign w_sys_tmp10 = (r_alu_operandA_1 == r_alu_operandB_2);
	assign w_sys_tmp11 = ((w_sys_tmp12) ? w_sys_intOne : w_sys_intZero);
	assign w_sys_tmp12 = (r_alu_operandA_1 != r_alu_operandB_2);
	assign w_sys_tmp13 = ((w_sys_tmp14) ? w_sys_intOne : w_sys_intZero);
	assign w_sys_tmp14 = (r_alu_operandA_1 < r_alu_operandB_2);
	assign w_sys_tmp15 = ((w_sys_tmp16) ? w_sys_intOne : w_sys_intZero);
	assign w_sys_tmp16 = ( !w_sys_tmp17 );
	assign w_sys_tmp17 = (r_alu_operandB_2 < r_alu_operandA_1);
	assign w_sys_tmp18 = ((w_sys_tmp19) ? w_sys_intOne : w_sys_intZero);
	assign w_sys_tmp19 = (r_alu_operandB_2 < r_alu_operandA_1);
	assign w_sys_tmp20 = ((w_sys_tmp21) ? w_sys_intOne : w_sys_intZero);
	assign w_sys_tmp21 = ( !w_sys_tmp22 );
	assign w_sys_tmp22 = (r_alu_operandA_1 < r_alu_operandB_2);
	assign w_sys_tmp23 = (r_alu_operandA_1 | r_alu_operandB_2);
	assign w_sys_tmp24 = (r_alu_operandA_1 & r_alu_operandB_2);
	assign w_sys_tmp25 = ( ~r_alu_operandA_1 );
	assign w_sys_tmp26 = (r_alu_operandA_1 ^ r_alu_operandB_2);
	assign w_sys_tmp27 = r_fld_ret_0;


	Multint
		Multint_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_Multint_multiplicand_0),
			.b (r_ip_Multint_multiplier_0),
			.p (w_ip_Multint_product_0)
		);

	DivInt
		DivInt_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.dividend (r_ip_DivInt_dividend_0),
			.divisor (r_ip_DivInt_divisor_0),
			.fractional (w_ip_DivInt_fractional_0),
			.quotient (w_ip_DivInt_quotient_0)
		);

	DivInt
		DivInt_inst_1(
			.clk (clock),
			.ce (w_sys_ce),
			.dividend (r_ip_DivInt_dividend_1),
			.divisor (r_ip_DivInt_divisor_1),
			.fractional (w_ip_DivInt_fractional_1),
			.quotient (w_ip_DivInt_quotient_1)
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'h2: begin
							r_sys_alu_switchCond_2 <= $signed( {{24{r_alu_opcode_3[7]}}, r_alu_opcode_3} );
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'hb: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_ip_Multint_multiplicand_0 <= r_alu_operandA_1;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'hb: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_ip_Multint_multiplier_0 <= r_alu_operandB_2;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'he: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_ip_DivInt_dividend_0 <= r_alu_operandA_1;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'he: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_ip_DivInt_divisor_0 <= r_alu_operandB_2;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'h11: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_ip_DivInt_dividend_1 <= r_alu_operandA_1;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'h11: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_ip_DivInt_divisor_1 <= r_alu_operandB_2;

									end
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
					r_sys_processing_methodID <= ((i_alu_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_alu_phase) 
						6'h3d: begin
							r_sys_processing_methodID <= r_sys_alu_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_alu_return <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'h3a: begin
							r_sys_alu_return <= w_sys_tmp27;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_alu_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_alu_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_alu_phase <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'h0: begin
							r_sys_alu_phase <= 6'h3;
						end

						6'h2: begin
							r_sys_alu_phase <= 6'h4;
						end

						6'h3: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h2;

									end
								end

							endcase
						end

						6'h4: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh0) ? 6'h5 : 6'h7);
						end

						6'h5: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h6;

									end
								end

							endcase
						end

						6'h6: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h7: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh1) ? 6'h8 : 6'ha);
						end

						6'h8: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h9;

									end
								end

							endcase
						end

						6'h9: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'ha: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh2) ? 6'hb : 6'hd);
						end

						6'hb: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h5)) begin
										r_sys_alu_phase <= 6'hc;

									end
								end

							endcase
						end

						6'hc: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'hd: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh3) ? 6'he : 6'h10);
						end

						6'he: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h25)) begin
										r_sys_alu_phase <= 6'hf;

									end
								end

							endcase
						end

						6'hf: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h10: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh4) ? 6'h11 : 6'h13);
						end

						6'h11: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h25)) begin
										r_sys_alu_phase <= 6'h12;

									end
								end

							endcase
						end

						6'h12: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h13: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh5) ? 6'h14 : 6'h16);
						end

						6'h14: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h15;

									end
								end

							endcase
						end

						6'h15: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h16: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh6) ? 6'h17 : 6'h19);
						end

						6'h17: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h18;

									end
								end

							endcase
						end

						6'h18: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h19: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh7) ? 6'h1a : 6'h1c);
						end

						6'h1a: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h1b;

									end
								end

							endcase
						end

						6'h1b: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h1c: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh8) ? 6'h1d : 6'h1f);
						end

						6'h1d: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h1e;

									end
								end

							endcase
						end

						6'h1e: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h1f: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh9) ? 6'h20 : 6'h22);
						end

						6'h20: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h21;

									end
								end

							endcase
						end

						6'h21: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h22: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sha) ? 6'h23 : 6'h25);
						end

						6'h23: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h24;

									end
								end

							endcase
						end

						6'h24: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h25: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'shb) ? 6'h26 : 6'h28);
						end

						6'h26: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h27;

									end
								end

							endcase
						end

						6'h27: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h28: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'shc) ? 6'h29 : 6'h2b);
						end

						6'h29: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h2a;

									end
								end

							endcase
						end

						6'h2a: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h2b: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'shd) ? 6'h2c : 6'h2e);
						end

						6'h2c: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h2d;

									end
								end

							endcase
						end

						6'h2d: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h2e: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'she) ? 6'h2f : 6'h31);
						end

						6'h2f: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h30;

									end
								end

							endcase
						end

						6'h30: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h31: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'shf) ? 6'h32 : 6'h34);
						end

						6'h32: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h33;

									end
								end

							endcase
						end

						6'h33: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h34: begin
							r_sys_alu_phase <= 6'h35;
						end

						6'h35: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h36;

									end
								end

							endcase
						end

						6'h36: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h37: begin
							r_sys_alu_phase <= ((r_sys_alu_switchCond_2==32'sh10) ? 6'h38 : 6'h3b);
						end

						6'h38: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h39;

									end
								end

							endcase
						end

						6'h39: begin
							r_sys_alu_phase <= 6'h3b;
						end

						6'h3a: begin
							r_sys_alu_phase <= 6'h3d;
						end

						6'h3b: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_phase <= 6'h3a;

									end
								end

							endcase
						end

						6'h3d: begin
							r_sys_alu_phase <= 6'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_alu_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'h3: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h5)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h25)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h25)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h14: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h17: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1a: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h26: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h29: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h2c: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h2f: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h32: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h35: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h38: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h3b: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_stage <= 2'h0;

									end
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
			r_sys_alu_step <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'h3: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((6'h0<=r_sys_alu_step && r_sys_alu_step<=6'h4)) begin
										r_sys_alu_step <= w_sys_alu_step_p1;

									end
									else
									if((r_sys_alu_step==6'h5)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h25)) begin
										r_sys_alu_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_alu_step && r_sys_alu_step<=6'h24)) begin
										r_sys_alu_step <= w_sys_alu_step_p1;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((6'h0<=r_sys_alu_step && r_sys_alu_step<=6'h24)) begin
										r_sys_alu_step <= w_sys_alu_step_p1;

									end
									else
									if((r_sys_alu_step==6'h25)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h14: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h17: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h1a: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h26: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h29: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h2c: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h2f: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h32: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h35: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h38: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h3b: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_sys_alu_step <= 6'h0;

									end
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
			r_sys_alu_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_alu_busy <= ((i_alu_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_alu_phase) 
						6'h0: begin
							r_sys_alu_busy <= w_sys_boolTrue;
						end

						6'h3d: begin
							r_sys_alu_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_ret_0 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_alu_phase) 
						6'h5: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp1;

									end
								end

							endcase
						end

						6'h8: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp2;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h5)) begin
										r_fld_ret_0 <= w_sys_tmp3;

									end
								end

							endcase
						end

						6'he: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h25)) begin
										r_fld_ret_0 <= w_sys_tmp4;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h25)) begin
										r_fld_ret_0 <= w_sys_tmp5;

									end
								end

							endcase
						end

						6'h14: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp6;

									end
								end

							endcase
						end

						6'h17: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp7;

									end
								end

							endcase
						end

						6'h1a: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp8;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp9;

									end
								end

							endcase
						end

						6'h20: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp11;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp13;

									end
								end

							endcase
						end

						6'h26: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp15;

									end
								end

							endcase
						end

						6'h29: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp18;

									end
								end

							endcase
						end

						6'h2c: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp20;

									end
								end

							endcase
						end

						6'h2f: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp23;

									end
								end

							endcase
						end

						6'h32: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp24;

									end
								end

							endcase
						end

						6'h35: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp25;

									end
								end

							endcase
						end

						6'h38: begin

							case(r_sys_alu_stage) 
								2'h0: begin
									if((r_sys_alu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp26;

									end
								end

							endcase
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
					r_alu_operandA_1 <= ((i_alu_req) ? i_alu_operandA_1 : r_alu_operandA_1);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_alu_operandB_2 <= ((i_alu_req) ? i_alu_operandB_2 : r_alu_operandB_2);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_alu_opcode_3 <= ((i_alu_req) ? i_alu_opcode_3 : r_alu_opcode_3);
				end

			endcase
		end
	end


endmodule
