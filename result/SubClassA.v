/*
TimeStamp:	2013/12/16		12:59
*/


module SubClassA(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_subAprocess_req,	
	output                o_subAprocess_busy,	
	output signed  [31:0] o_subAprocess_return,	
	input  signed  [ 4:0] i_fld_arrayA_0_addr_0,	
	input  signed  [31:0] i_fld_arrayA_0_datain_0,	
	output signed  [31:0] o_fld_arrayA_0_dataout_0,	
	input                 i_fld_arrayA_0_r_w_0,	
	output signed  [31:0] o_subAprocess_ax_1_addr,	
	output signed  [31:0] o_subAprocess_ax_1_datain,	
	input  signed  [31:0] i_subAprocess_ax_1_dataout,	
	output                o_subAprocess_ax_1_r_w,	
	output                o_subAprocess_ax_1_ce,	
	output signed  [31:0] o_subAprocess_bx_2_addr,	
	output signed  [31:0] o_subAprocess_bx_2_datain,	
	input  signed  [31:0] i_subAprocess_bx_2_dataout,	
	output                o_subAprocess_bx_2_r_w,	
	output                o_subAprocess_bx_2_ce,	
	input                 i_subAprocess_bx_2_cacheHit,	
	input  signed  [31:0] i_subAprocess_dataNum_3	
);

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
	reg  signed [31:0] r_sys_subAprocess_return;
	reg         [ 1:0] r_sys_subAprocess_caller;
	reg                r_sys_subAprocess_req;
	reg         [ 4:0] r_sys_subAprocess_phase;
	reg         [ 1:0] r_sys_subAprocess_stage;
	reg         [ 7:0] r_sys_subAprocess_step;
	reg                r_sys_subAprocess_busy;
	wire        [ 1:0] w_sys_subAprocess_stage_p1;
	wire        [ 7:0] w_sys_subAprocess_step_p1;
	wire signed [ 4:0] w_fld_arrayA_0_addr_0;
	wire signed [31:0] w_fld_arrayA_0_datain_0;
	wire signed [31:0] w_fld_arrayA_0_dataout_0;
	wire               w_fld_arrayA_0_r_w_0;
	wire               w_fld_arrayA_0_ce_0;
	reg  signed [ 4:0] r_fld_arrayA_0_addr_1;
	reg  signed [31:0] r_fld_arrayA_0_datain_1;
	wire signed [31:0] w_fld_arrayA_0_dataout_1;
	reg                r_fld_arrayA_0_r_w_1;
	wire               w_fld_arrayA_0_ce_1;
	reg  signed [31:0] r_subAprocess_ax_1_addr;
	reg  signed [31:0] r_subAprocess_ax_1_datain;
	wire signed [31:0] w_subAprocess_ax_1_dataout;
	reg                r_subAprocess_ax_1_r_w;
	wire signed [31:0] w_subAprocess_ax_1_addr;
	wire signed [31:0] w_subAprocess_ax_1_datain;
	wire               w_subAprocess_ax_1_r_w;
	wire               w_subAprocess_ax_1_ce;
	wire               w_subAprocess_ax_1_cacheHit;
	reg  signed [31:0] r_subAprocess_bx_2_addr;
	reg  signed [31:0] r_subAprocess_bx_2_datain;
	wire signed [31:0] w_subAprocess_bx_2_dataout;
	reg                r_subAprocess_bx_2_r_w;
	wire signed [31:0] w_subAprocess_bx_2_addr;
	wire signed [31:0] w_subAprocess_bx_2_datain;
	wire               w_subAprocess_bx_2_r_w;
	wire               w_subAprocess_bx_2_ce;
	wire               w_subAprocess_bx_2_cacheHit;
	reg  signed [31:0] r_subAprocess_dataNum_3;
	reg  signed [31:0] r_subAprocess_i_4;
	reg  signed [31:0] r_subAprocess_ret_5;
	reg  signed [31:0] r_subAprocess_copy0_i_6;
	reg  signed [31:0] r_subAprocess_copy1_i_7;
	reg  signed [31:0] r_subAprocess_copy2_i_8;
	reg  signed [31:0] r_subAprocess_copy3_i_9;
	reg  signed [31:0] r_subAprocess_copy4_i_10;
	reg  signed [31:0] r_subAprocess_copy0_i_11;
	reg  signed [31:0] r_subAprocess_copy1_i_12;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire signed [31:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp13;
	wire signed [31:0] w_sys_tmp14;
	wire signed [31:0] w_sys_tmp15;
	wire signed [31:0] w_sys_tmp16;
	wire signed [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire signed [31:0] w_sys_tmp19;
	wire signed [31:0] w_sys_tmp20;
	wire               w_sys_tmp75;
	wire signed [31:0] w_sys_tmp77;
	wire signed [31:0] w_sys_tmp78;
	wire signed [31:0] w_sys_tmp79;
	wire signed [31:0] w_sys_tmp80;
	wire signed [31:0] w_sys_tmp81;
	wire signed [31:0] w_sys_tmp82;
	wire signed [31:0] w_sys_tmp83;
	wire signed [31:0] w_sys_tmp84;
	wire signed [31:0] w_sys_tmp85;
	wire signed [31:0] w_sys_tmp113;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_subAprocess_ax_1_cacheHit & w_subAprocess_bx_2_cacheHit;
	assign o_subAprocess_busy = r_sys_subAprocess_busy;
	assign o_subAprocess_return = r_sys_subAprocess_return;
	assign w_sys_subAprocess_stage_p1 = (r_sys_subAprocess_stage + 2'h1);
	assign w_sys_subAprocess_step_p1 = (r_sys_subAprocess_step + 8'h1);
	assign o_fld_arrayA_0_dataout_0 = w_fld_arrayA_0_dataout_0;
	assign w_fld_arrayA_0_addr_0 = i_fld_arrayA_0_addr_0;
	assign w_fld_arrayA_0_datain_0 = i_fld_arrayA_0_datain_0;
	assign w_fld_arrayA_0_r_w_0 = i_fld_arrayA_0_r_w_0;
	assign w_fld_arrayA_0_ce_0 = w_sys_ce;
	assign w_fld_arrayA_0_ce_1 = w_sys_ce;
	assign w_subAprocess_ax_1_dataout = i_subAprocess_ax_1_dataout;
	assign w_subAprocess_ax_1_addr = r_subAprocess_ax_1_addr;
	assign w_subAprocess_ax_1_datain = r_subAprocess_ax_1_datain;
	assign w_subAprocess_ax_1_r_w = r_subAprocess_ax_1_r_w;
	assign w_subAprocess_ax_1_ce = w_sys_ce;
	assign w_subAprocess_ax_1_cacheHit = w_sys_boolTrue;
	assign o_subAprocess_ax_1_addr = w_subAprocess_ax_1_addr;
	assign o_subAprocess_ax_1_datain = w_subAprocess_ax_1_datain;
	assign o_subAprocess_ax_1_r_w = w_subAprocess_ax_1_r_w;
	assign o_subAprocess_ax_1_ce = w_subAprocess_ax_1_ce;
	assign w_subAprocess_bx_2_dataout = i_subAprocess_bx_2_dataout;
	assign w_subAprocess_bx_2_addr = r_subAprocess_bx_2_addr;
	assign w_subAprocess_bx_2_datain = r_subAprocess_bx_2_datain;
	assign w_subAprocess_bx_2_r_w = r_subAprocess_bx_2_r_w;
	assign w_subAprocess_bx_2_ce = w_sys_ce;
	assign w_subAprocess_bx_2_cacheHit = i_subAprocess_bx_2_cacheHit;
	assign o_subAprocess_bx_2_addr = w_subAprocess_bx_2_addr;
	assign o_subAprocess_bx_2_datain = w_subAprocess_bx_2_datain;
	assign o_subAprocess_bx_2_r_w = w_subAprocess_bx_2_r_w;
	assign o_subAprocess_bx_2_ce = w_subAprocess_bx_2_ce;
	assign w_sys_tmp1 = (r_subAprocess_i_4 < r_subAprocess_dataNum_3);
	assign w_sys_tmp4 = w_ip_DivInt_quotient_0;
	assign w_sys_tmp5 = 32'sh00000299;
	assign w_sys_tmp6 = (r_subAprocess_copy4_i_10 - r_subAprocess_dataNum_3);
	assign w_sys_tmp8 = w_ip_DivInt_quotient_1;
	assign w_sys_tmp9 = 32'sh000001b8;
	assign w_sys_tmp10 = (r_subAprocess_copy2_i_8 - r_subAprocess_dataNum_3);
	assign w_sys_tmp13 = 32'sh00000303;
	assign w_sys_tmp14 = w_fld_arrayA_0_dataout_1;
	assign w_sys_tmp15 = (r_subAprocess_copy0_i_6 + w_sys_intOne);
	assign w_sys_tmp16 = (r_subAprocess_copy1_i_7 + w_sys_intOne);
	assign w_sys_tmp17 = (r_subAprocess_copy2_i_8 + w_sys_intOne);
	assign w_sys_tmp18 = (r_subAprocess_copy3_i_9 + w_sys_intOne);
	assign w_sys_tmp19 = (r_subAprocess_copy4_i_10 + w_sys_intOne);
	assign w_sys_tmp20 = (r_subAprocess_i_4 + w_sys_intOne);
	assign w_sys_tmp75 = (r_subAprocess_i_4 < r_subAprocess_dataNum_3);
	assign w_sys_tmp77 = (r_subAprocess_ret_5 + w_sys_tmp78);
	assign w_sys_tmp78 = (w_sys_tmp79 + w_sys_tmp82);
	assign w_sys_tmp79 = (w_sys_tmp80 + w_sys_tmp81);
	assign w_sys_tmp80 = w_subAprocess_ax_1_dataout;
	assign w_sys_tmp81 = w_subAprocess_bx_2_dataout;
	assign w_sys_tmp82 = w_fld_arrayA_0_dataout_1;
	assign w_sys_tmp83 = (r_subAprocess_copy0_i_11 + w_sys_intOne);
	assign w_sys_tmp84 = (r_subAprocess_copy1_i_12 + w_sys_intOne);
	assign w_sys_tmp85 = (r_subAprocess_i_4 + w_sys_intOne);
	assign w_sys_tmp113 = r_subAprocess_ret_5;


	DualPortRAM #(.DWIDTH(32), .AWIDTH(5), .WORDS(32) )
		dpram_arrayA_0(
			.clk (clock),
			.ce_0 (w_fld_arrayA_0_ce_0),
			.addr_0 (w_fld_arrayA_0_addr_0),
			.datain_0 (w_fld_arrayA_0_datain_0),
			.dataout_0 (w_fld_arrayA_0_dataout_0),
			.r_w_0 (w_fld_arrayA_0_r_w_0),
			.ce_1 (w_fld_arrayA_0_ce_1),
			.addr_1 (r_fld_arrayA_0_addr_1),
			.datain_1 (r_fld_arrayA_0_datain_1),
			.dataout_1 (w_fld_arrayA_0_dataout_1),
			.r_w_1 (r_fld_arrayA_0_r_w_1)
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

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h2) || (r_sys_subAprocess_step==8'h2a) || (r_sys_subAprocess_step==8'h52) || (r_sys_subAprocess_step==8'h7a)) begin
										r_ip_DivInt_dividend_0 <= w_sys_tmp13;

									end
									else
									if((r_sys_subAprocess_step==8'h0) || (r_sys_subAprocess_step==8'h1) || (r_sys_subAprocess_step==8'h3)) begin
										r_ip_DivInt_dividend_0 <= w_sys_tmp5;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0) || (r_sys_subAprocess_step==8'h1) || (r_sys_subAprocess_step==8'h3)) begin
										r_ip_DivInt_divisor_0 <= w_sys_tmp6;

									end
									else
									if((r_sys_subAprocess_step==8'h2) || (r_sys_subAprocess_step==8'h2a) || (r_sys_subAprocess_step==8'h52) || (r_sys_subAprocess_step==8'h7a)) begin
										r_ip_DivInt_divisor_0 <= w_sys_tmp14;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0) || (r_sys_subAprocess_step==8'h1) || (r_sys_subAprocess_step==8'h3) || (r_sys_subAprocess_step==8'h4)) begin
										r_ip_DivInt_dividend_1 <= w_sys_tmp9;

									end
									else
									if((r_sys_subAprocess_step==8'h2)) begin
										r_ip_DivInt_dividend_1 <= w_sys_tmp5;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0) || (r_sys_subAprocess_step==8'h1) || (r_sys_subAprocess_step==8'h3) || (r_sys_subAprocess_step==8'h4)) begin
										r_ip_DivInt_divisor_1 <= w_sys_tmp10;

									end
									else
									if((r_sys_subAprocess_step==8'h2)) begin
										r_ip_DivInt_divisor_1 <= w_sys_tmp6;

									end
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
					r_sys_processing_methodID <= ((i_subAprocess_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h13: begin
							r_sys_processing_methodID <= r_sys_subAprocess_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_subAprocess_return <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h10: begin
							r_sys_subAprocess_return <= w_sys_tmp113;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_subAprocess_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_subAprocess_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_subAprocess_phase <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h0: begin
							r_sys_subAprocess_phase <= 5'h2;
						end

						5'h2: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_subAprocess_stage) 
								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_phase <= ((w_sys_tmp1) ? 5'h8 : 5'h9);

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h9f)) begin
										r_sys_subAprocess_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_phase <= 5'hb;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_subAprocess_stage) 
								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_phase <= 5'hc;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_phase <= ((w_sys_tmp75) ? 5'hf : 5'h11);

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h5)) begin
										r_sys_subAprocess_phase <= 5'hc;

									end
								end

							endcase
						end

						5'h10: begin
							r_sys_subAprocess_phase <= 5'h13;
						end

						5'h11: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_phase <= 5'h10;

									end
								end

							endcase
						end

						5'h13: begin
							r_sys_subAprocess_phase <= 5'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_subAprocess_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h2: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_stage <= w_sys_subAprocess_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h9f)) begin
										r_sys_subAprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_stage <= w_sys_subAprocess_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h5)) begin
										r_sys_subAprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_stage <= 2'h0;

									end
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
			r_sys_subAprocess_step <= 8'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h2: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
								end

								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h9f)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
									else
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h9e)) begin
										r_sys_subAprocess_step <= w_sys_subAprocess_step_p1;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
								end

								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h5)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
									else
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h4)) begin
										r_sys_subAprocess_step <= w_sys_subAprocess_step_p1;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_sys_subAprocess_step <= 8'h0;

									end
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
			r_sys_subAprocess_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_subAprocess_busy <= ((i_subAprocess_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h0: begin
							r_sys_subAprocess_busy <= w_sys_boolTrue;
						end

						5'h13: begin
							r_sys_subAprocess_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_arrayA_0_addr_1 <= 5'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0) || (r_sys_subAprocess_step==8'h28) || (r_sys_subAprocess_step==8'h50) || (r_sys_subAprocess_step==8'h78)) begin
										r_fld_arrayA_0_addr_1 <= $signed( r_subAprocess_copy0_i_6[4:0] );

									end
									else
									if((r_sys_subAprocess_step==8'h27) || (r_sys_subAprocess_step==8'h4f) || (r_sys_subAprocess_step==8'h77) || (r_sys_subAprocess_step==8'h9f)) begin
										r_fld_arrayA_0_addr_1 <= $signed( r_subAprocess_copy1_i_7[4:0] );

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h3)) begin
										r_fld_arrayA_0_addr_1 <= $signed( r_subAprocess_copy0_i_11[4:0] );

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h27) || (r_sys_subAprocess_step==8'h4f) || (r_sys_subAprocess_step==8'h77) || (r_sys_subAprocess_step==8'h9f)) begin
										r_fld_arrayA_0_datain_1 <= w_sys_tmp4;

									end
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
			r_fld_arrayA_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h27) || (r_sys_subAprocess_step==8'h4f) || (r_sys_subAprocess_step==8'h77) || (r_sys_subAprocess_step==8'h9f)) begin
										r_fld_arrayA_0_r_w_1 <= w_sys_boolTrue;

									end
									else
									if((r_sys_subAprocess_step==8'h0) || (r_sys_subAprocess_step==8'h28) || (r_sys_subAprocess_step==8'h50) || (r_sys_subAprocess_step==8'h78)) begin
										r_fld_arrayA_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h3)) begin
										r_fld_arrayA_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h13: begin
							r_fld_arrayA_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_subAprocess_ax_1_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h25<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h28)) begin
										r_subAprocess_ax_1_addr <= r_subAprocess_i_4;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h3)) begin
										r_subAprocess_ax_1_addr <= r_subAprocess_i_4;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h25) || (r_sys_subAprocess_step==8'h26) || (r_sys_subAprocess_step==8'h28)) begin
										r_subAprocess_ax_1_datain <= w_sys_tmp4;

									end
									else
									if((r_sys_subAprocess_step==8'h27)) begin
										r_subAprocess_ax_1_datain <= w_sys_tmp8;

									end
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
			r_subAprocess_ax_1_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h25<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h28)) begin
										r_subAprocess_ax_1_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h3)) begin
										r_subAprocess_ax_1_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h13: begin
							r_subAprocess_ax_1_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_subAprocess_bx_2_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h25) || (r_sys_subAprocess_step==8'h26) || (r_sys_subAprocess_step==8'h28) || (r_sys_subAprocess_step==8'h29)) begin
										r_subAprocess_bx_2_addr <= r_subAprocess_copy3_i_9;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h3)) begin
										r_subAprocess_bx_2_addr <= r_subAprocess_copy1_i_12;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h25) || (r_sys_subAprocess_step==8'h26) || (r_sys_subAprocess_step==8'h28) || (r_sys_subAprocess_step==8'h29)) begin
										r_subAprocess_bx_2_datain <= w_sys_tmp8;

									end
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
			r_subAprocess_bx_2_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h25) || (r_sys_subAprocess_step==8'h26) || (r_sys_subAprocess_step==8'h28) || (r_sys_subAprocess_step==8'h29)) begin
										r_subAprocess_bx_2_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h3)) begin
										r_subAprocess_bx_2_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h13: begin
							r_subAprocess_bx_2_r_w <= w_sys_boolFalse;
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
					r_subAprocess_dataNum_3 <= ((i_subAprocess_req) ? i_subAprocess_dataNum_3 : r_subAprocess_dataNum_3);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subAprocess_phase) 
						5'h2: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_i_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_i_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h25<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h28)) begin
										r_subAprocess_i_4 <= w_sys_tmp20;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_i_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h3)) begin
										r_subAprocess_i_4 <= w_sys_tmp85;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h9: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_ret_5 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h2<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h5)) begin
										r_subAprocess_ret_5 <= w_sys_tmp77;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h4: begin

							case(r_sys_subAprocess_stage) 
								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_copy0_i_6 <= r_subAprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0) || (r_sys_subAprocess_step==8'h28) || (r_sys_subAprocess_step==8'h50) || (r_sys_subAprocess_step==8'h78)) begin
										r_subAprocess_copy0_i_6 <= w_sys_tmp15;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h4: begin

							case(r_sys_subAprocess_stage) 
								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_copy1_i_7 <= r_subAprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h27) || (r_sys_subAprocess_step==8'h4f) || (r_sys_subAprocess_step==8'h77) || (r_sys_subAprocess_step==8'h9f)) begin
										r_subAprocess_copy1_i_7 <= w_sys_tmp16;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h4: begin

							case(r_sys_subAprocess_stage) 
								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_copy2_i_8 <= r_subAprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h0) || (r_sys_subAprocess_step==8'h1) || (r_sys_subAprocess_step==8'h3) || (r_sys_subAprocess_step==8'h4)) begin
										r_subAprocess_copy2_i_8 <= w_sys_tmp17;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h4: begin

							case(r_sys_subAprocess_stage) 
								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_copy3_i_9 <= r_subAprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((r_sys_subAprocess_step==8'h25) || (r_sys_subAprocess_step==8'h26) || (r_sys_subAprocess_step==8'h28) || (r_sys_subAprocess_step==8'h29)) begin
										r_subAprocess_copy3_i_9 <= w_sys_tmp18;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'h4: begin

							case(r_sys_subAprocess_stage) 
								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_copy4_i_10 <= r_subAprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h3)) begin
										r_subAprocess_copy4_i_10 <= w_sys_tmp19;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'hb: begin

							case(r_sys_subAprocess_stage) 
								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_copy0_i_11 <= r_subAprocess_i_4;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h3)) begin
										r_subAprocess_copy0_i_11 <= w_sys_tmp83;

									end
								end

							endcase
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

					case(r_sys_subAprocess_phase) 
						5'hb: begin

							case(r_sys_subAprocess_stage) 
								2'h1: begin
									if((r_sys_subAprocess_step==8'h0)) begin
										r_subAprocess_copy1_i_12 <= r_subAprocess_i_4;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subAprocess_stage) 
								2'h0: begin
									if((8'h0<=r_sys_subAprocess_step && r_sys_subAprocess_step<=8'h3)) begin
										r_subAprocess_copy1_i_12 <= w_sys_tmp84;

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
