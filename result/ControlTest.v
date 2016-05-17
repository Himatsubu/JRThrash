/*
TimeStamp:	2013/12/16		12:59
*/


module ControlTest(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_controlTest_req,	
	output                o_controlTest_busy,	
	output signed  [31:0] o_controlTest_return	
);

	reg  signed [31:0] r_sys_controlTest_switchCond_43;
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
	reg  signed [31:0] r_sys_controlTest_return;
	reg         [ 1:0] r_sys_controlTest_caller;
	reg                r_sys_controlTest_req;
	reg         [ 6:0] r_sys_controlTest_phase;
	reg         [ 1:0] r_sys_controlTest_stage;
	reg         [ 5:0] r_sys_controlTest_step;
	reg                r_sys_controlTest_busy;
	wire        [ 1:0] w_sys_controlTest_stage_p1;
	wire        [ 5:0] w_sys_controlTest_step_p1;
	reg  signed [31:0] r_fld_ret_0;
	reg  signed [31:0] r_controlTest_i_1;
	reg  signed [31:0] r_controlTest_j_2;
	reg  signed [31:0] r_controlTest_k_3;
	wire signed [31:0] w_sys_tmp1;
	wire               w_sys_tmp2;
	wire signed [31:0] w_sys_tmp3;
	wire signed [31:0] w_sys_tmp4;
	wire               w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire signed [31:0] w_sys_tmp8;
	wire               w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp11;
	wire               w_sys_tmp12;
	wire               w_sys_tmp13;
	wire signed [31:0] w_sys_tmp14;
	wire               w_sys_tmp15;
	wire signed [31:0] w_sys_tmp16;
	wire signed [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire               w_sys_tmp19;
	wire               w_sys_tmp20;
	wire signed [31:0] w_sys_tmp21;
	wire               w_sys_tmp22;
	wire signed [31:0] w_sys_tmp23;
	wire signed [31:0] w_sys_tmp24;
	wire signed [31:0] w_sys_tmp25;
	wire               w_sys_tmp26;
	wire signed [31:0] w_sys_tmp27;
	wire signed [31:0] w_sys_tmp28;
	wire signed [31:0] w_sys_tmp29;
	wire signed [31:0] w_sys_tmp30;
	wire signed [31:0] w_sys_tmp31;
	wire               w_sys_tmp32;
	wire signed [31:0] w_sys_tmp33;
	wire signed [31:0] w_sys_tmp34;
	wire signed [31:0] w_sys_tmp35;
	wire               w_sys_tmp36;
	wire signed [31:0] w_sys_tmp37;
	wire               w_sys_tmp38;
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
	wire               w_sys_tmp51;
	wire signed [31:0] w_sys_tmp52;
	wire               w_sys_tmp53;
	wire signed [31:0] w_sys_tmp54;
	wire signed [31:0] w_sys_tmp55;
	wire signed [31:0] w_sys_tmp56;
	wire signed [31:0] w_sys_tmp57;
	wire signed [31:0] w_sys_tmp58;
	wire signed [31:0] w_sys_tmp59;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_controlTest_busy = r_sys_controlTest_busy;
	assign o_controlTest_return = r_sys_controlTest_return;
	assign w_sys_controlTest_stage_p1 = (r_sys_controlTest_stage + 2'h1);
	assign w_sys_controlTest_step_p1 = (r_sys_controlTest_step + 6'h1);
	assign w_sys_tmp1 = (r_controlTest_i_1 + w_sys_intOne);
	assign w_sys_tmp2 = (w_sys_tmp3 == w_sys_intOne);
	assign w_sys_tmp3 = w_ip_DivInt_fractional_0;
	assign w_sys_tmp4 = 32'sh00000002;
	assign w_sys_tmp5 = (r_controlTest_j_2 < w_sys_tmp6);
	assign w_sys_tmp6 = 32'sh0000000b;
	assign w_sys_tmp8 = 32'shfffffffe;
	assign w_sys_tmp9 = (r_controlTest_k_3 < w_sys_tmp10);
	assign w_sys_tmp10 = 32'sh00000009;
	assign w_sys_tmp11 = (r_controlTest_k_3 + w_sys_intOne);
	assign w_sys_tmp12 = (w_sys_tmp13 && w_sys_tmp15);
	assign w_sys_tmp13 = (r_controlTest_k_3 < w_sys_tmp14);
	assign w_sys_tmp14 = 32'sh00000004;
	assign w_sys_tmp15 = (r_controlTest_j_2 < w_sys_tmp16);
	assign w_sys_tmp16 = 32'sh00000005;
	assign w_sys_tmp17 = (r_fld_ret_0 + w_sys_tmp18);
	assign w_sys_tmp18 = 32'sh00000020;
	assign w_sys_tmp19 = (w_sys_tmp20 || w_sys_tmp22);
	assign w_sys_tmp20 = (r_controlTest_k_3 == w_sys_tmp21);
	assign w_sys_tmp21 = 32'shfffffffe;
	assign w_sys_tmp22 = (r_controlTest_j_2 == w_sys_tmp23);
	assign w_sys_tmp23 = 32'sh0000000a;
	assign w_sys_tmp24 = (r_fld_ret_0 + w_sys_tmp25);
	assign w_sys_tmp25 = 32'sh000003e8;
	assign w_sys_tmp26 = (w_sys_tmp27 < r_controlTest_i_1);
	assign w_sys_tmp27 = 32'sh0000000a;
	assign w_sys_tmp28 = (r_fld_ret_0 + w_sys_tmp29);
	assign w_sys_tmp29 = (r_controlTest_i_1 + r_controlTest_k_3);
	assign w_sys_tmp30 = (r_fld_ret_0 + w_sys_tmp31);
	assign w_sys_tmp31 = (r_controlTest_k_3 + r_controlTest_j_2);
	assign w_sys_tmp32 = (r_controlTest_j_2 == w_sys_tmp33);
	assign w_sys_tmp33 = 32'sh0000000a;
	assign w_sys_tmp34 = (r_fld_ret_0 + w_sys_intOne);
	assign w_sys_tmp35 = (r_controlTest_j_2 + w_sys_intOne);
	assign w_sys_tmp36 = (r_controlTest_j_2 < w_sys_tmp37);
	assign w_sys_tmp37 = 32'sh0000000d;
	assign w_sys_tmp38 = (w_sys_tmp39 < r_controlTest_j_2);
	assign w_sys_tmp39 = 32'sh00000005;
	assign w_sys_tmp40 = (r_fld_ret_0 + w_sys_tmp41);
	assign w_sys_tmp41 = 32'sh00000021;
	assign w_sys_tmp42 = w_ip_DivInt_fractional_1;
	assign w_sys_tmp43 = 32'sh00000005;
	assign w_sys_tmp44 = (r_fld_ret_0 + w_sys_tmp45);
	assign w_sys_tmp45 = 32'sh00000003;
	assign w_sys_tmp46 = (r_fld_ret_0 + w_sys_tmp47);
	assign w_sys_tmp47 = 32'sh00000029;
	assign w_sys_tmp48 = (r_fld_ret_0 + w_sys_tmp49);
	assign w_sys_tmp49 = 32'sh00000085;
	assign w_sys_tmp50 = (r_controlTest_j_2 + w_sys_intOne);
	assign w_sys_tmp51 = (w_sys_tmp52 < r_controlTest_i_1);
	assign w_sys_tmp52 = 32'sh00000010;
	assign w_sys_tmp53 = (w_sys_tmp54 == w_sys_intZero);
	assign w_sys_tmp54 = w_ip_DivInt_fractional_1;
	assign w_sys_tmp55 = 32'sh00000003;
	assign w_sys_tmp56 = (r_fld_ret_0 + w_sys_tmp57);
	assign w_sys_tmp57 = 32'sh000000c8;
	assign w_sys_tmp58 = w_sys_tmp59;
	assign w_sys_tmp59 = (r_fld_ret_0 + w_sys_intOne);


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

					case(r_sys_controlTest_phase) 
						7'h2b: begin
							r_sys_controlTest_switchCond_43 <= w_sys_tmp42;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h7: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_ip_DivInt_dividend_0 <= r_controlTest_i_1;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h7: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_ip_DivInt_divisor_0 <= w_sys_tmp4;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h2c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_ip_DivInt_dividend_1 <= r_controlTest_j_2;

									end
								end

							endcase
						end

						7'h3c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_ip_DivInt_dividend_1 <= r_controlTest_i_1;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h2c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_ip_DivInt_divisor_1 <= w_sys_tmp43;

									end
								end

							endcase
						end

						7'h3c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_ip_DivInt_divisor_1 <= w_sys_tmp55;

									end
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
					r_sys_processing_methodID <= ((i_controlTest_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h43: begin
							r_sys_processing_methodID <= r_sys_controlTest_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_controlTest_return <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h40: begin
							r_sys_controlTest_return <= w_sys_tmp58;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_controlTest_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_controlTest_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_controlTest_phase <= 7'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h0: begin
							r_sys_controlTest_phase <= 7'h2;
						end

						7'h2: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h7;

									end
								end

							endcase
						end

						7'h4: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h7;

									end
								end

							endcase
						end

						7'h7: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h25)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp2) ? 7'ha : 7'h28);

									end
								end

							endcase
						end

						7'ha: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'hb;

									end
								end

							endcase
						end

						7'hb: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp5) ? 7'he : 7'h39);

									end
								end

							endcase
						end

						7'he: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h10;

									end
								end

							endcase
						end

						7'h10: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp9) ? 7'h12 : 7'h21);

									end
								end

							endcase
						end

						7'h12: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h14;

									end
								end

							endcase
						end

						7'h14: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp12) ? 7'h16 : 7'h18);

									end
								end

							endcase
						end

						7'h16: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h1f;

									end
								end

							endcase
						end

						7'h18: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp19) ? 7'h1a : 7'h1c);

									end
								end

							endcase
						end

						7'h1a: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h1f;

									end
								end

							endcase
						end

						7'h1c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp26) ? 7'h1e : 7'h1f);

									end
								end

							endcase
						end

						7'h1e: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h1f;

									end
								end

							endcase
						end

						7'h1f: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h10;

									end
								end

							endcase
						end

						7'h21: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp32) ? 7'h22 : 7'h23);

									end
								end

							endcase
						end

						7'h22: begin
							r_sys_controlTest_phase <= 7'h39;
						end

						7'h23: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'hb;

									end
								end

							endcase
						end

						7'h25: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp36) ? 7'h28 : 7'h39);

									end
								end

							endcase
						end

						7'h28: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp38) ? 7'h2a : 7'h37);

									end
								end

							endcase
						end

						7'h2a: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h2c;

									end
								end

							endcase
						end

						7'h2b: begin
							r_sys_controlTest_phase <= 7'h2d;
						end

						7'h2c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h25)) begin
										r_sys_controlTest_phase <= 7'h2b;

									end
								end

							endcase
						end

						7'h2d: begin
							r_sys_controlTest_phase <= ((r_sys_controlTest_switchCond_43==32'sh1) ? 7'h2e : 7'h30);
						end

						7'h2e: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h2f;

									end
								end

							endcase
						end

						7'h2f: begin
							r_sys_controlTest_phase <= 7'h37;
						end

						7'h30: begin
							r_sys_controlTest_phase <= ((r_sys_controlTest_switchCond_43==32'sh2) ? 7'h31 : 7'h33);
						end

						7'h31: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h32;

									end
								end

							endcase
						end

						7'h32: begin
							r_sys_controlTest_phase <= 7'h37;
						end

						7'h33: begin
							r_sys_controlTest_phase <= ((r_sys_controlTest_switchCond_43==32'sh3) ? 7'h36 : 7'h35);
						end

						7'h35: begin
							r_sys_controlTest_phase <= 7'h36;
						end

						7'h36: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h37;

									end
								end

							endcase
						end

						7'h37: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h25;

									end
								end

							endcase
						end

						7'h39: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp51) ? 7'h3a : 7'h3c);

									end
								end

							endcase
						end

						7'h3a: begin
							r_sys_controlTest_phase <= 7'h41;
						end

						7'h3c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h25)) begin
										r_sys_controlTest_phase <= ((w_sys_tmp53) ? 7'h3e : 7'h3f);

									end
								end

							endcase
						end

						7'h3e: begin
							r_sys_controlTest_phase <= 7'h4;
						end

						7'h3f: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h4;

									end
								end

							endcase
						end

						7'h40: begin
							r_sys_controlTest_phase <= 7'h43;
						end

						7'h41: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_phase <= 7'h40;

									end
								end

							endcase
						end

						7'h43: begin
							r_sys_controlTest_phase <= 7'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_controlTest_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h2: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h4: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h7: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h25)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'ha: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'hb: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'he: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h10: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h12: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h14: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h16: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h18: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h1a: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h1c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h1e: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h1f: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h21: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h23: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h25: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h28: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h2a: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h2c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h25)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h2e: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h31: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h36: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h37: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h39: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h3c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h25)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h3f: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
								end

							endcase
						end

						7'h41: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_stage <= 2'h0;

									end
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
			r_sys_controlTest_step <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h2: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h4: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h7: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((6'h0<=r_sys_controlTest_step && r_sys_controlTest_step<=6'h24)) begin
										r_sys_controlTest_step <= w_sys_controlTest_step_p1;

									end
									else
									if((r_sys_controlTest_step==6'h25)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'ha: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'hb: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'he: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h10: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h12: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h14: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h16: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h18: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h1a: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h1c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h1e: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h1f: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h21: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h23: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h25: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h28: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h2a: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h2c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h25)) begin
										r_sys_controlTest_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_controlTest_step && r_sys_controlTest_step<=6'h24)) begin
										r_sys_controlTest_step <= w_sys_controlTest_step_p1;

									end
								end

							endcase
						end

						7'h2e: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h31: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h36: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h37: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h39: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h3c: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h25)) begin
										r_sys_controlTest_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_controlTest_step && r_sys_controlTest_step<=6'h24)) begin
										r_sys_controlTest_step <= w_sys_controlTest_step_p1;

									end
								end

							endcase
						end

						7'h3f: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
								end

							endcase
						end

						7'h41: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_sys_controlTest_step <= 6'h0;

									end
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
			r_sys_controlTest_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_controlTest_busy <= ((i_controlTest_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h0: begin
							r_sys_controlTest_busy <= w_sys_boolTrue;
						end

						7'h43: begin
							r_sys_controlTest_busy <= w_sys_boolFalse;
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

					case(r_sys_controlTest_phase) 
						7'h16: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp17;

									end
								end

							endcase
						end

						7'h1a: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp24;

									end
								end

							endcase
						end

						7'h1e: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp28;

									end
								end

							endcase
						end

						7'h1f: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp30;

									end
								end

							endcase
						end

						7'h23: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp34;

									end
								end

							endcase
						end

						7'h2a: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp40;

									end
								end

							endcase
						end

						7'h2e: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp44;

									end
								end

							endcase
						end

						7'h31: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp46;

									end
								end

							endcase
						end

						7'h36: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp48;

									end
								end

							endcase
						end

						7'h3f: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp56;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h2: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_controlTest_i_1 <= w_sys_intZero;

									end
								end

							endcase
						end

						7'h4: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_controlTest_i_1 <= w_sys_tmp1;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h2: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_controlTest_j_2 <= w_sys_intZero;

									end
								end

							endcase
						end

						7'ha: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_controlTest_j_2 <= w_sys_intZero;

									end
								end

							endcase
						end

						7'h23: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_controlTest_j_2 <= w_sys_tmp35;

									end
								end

							endcase
						end

						7'h37: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_controlTest_j_2 <= w_sys_tmp50;

									end
								end

							endcase
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_controlTest_phase) 
						7'h2: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_controlTest_k_3 <= w_sys_intZero;

									end
								end

							endcase
						end

						7'he: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_controlTest_k_3 <= w_sys_tmp8;

									end
								end

							endcase
						end

						7'h12: begin

							case(r_sys_controlTest_stage) 
								2'h0: begin
									if((r_sys_controlTest_step==6'h0)) begin
										r_controlTest_k_3 <= w_sys_tmp11;

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
