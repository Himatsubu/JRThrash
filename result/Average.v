/*
TimeStamp:	2016/5/16		8:4
*/


module Average(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_average_req,	
	output                o_average_busy,	
	output signed  [31:0] o_average_return,	
	output signed  [31:0] o_average_data_0_addr,	
	output signed  [31:0] o_average_data_0_datain,	
	input  signed  [31:0] i_average_data_0_dataout,	
	output                o_average_data_0_r_w,	
	output                o_average_data_0_ce,	
	input  signed  [31:0] i_average_dataNum_1	
);

	reg  signed [31:0] r_ip_DivInt_dividend_0;
	reg  signed [31:0] r_ip_DivInt_divisor_0;
	wire signed [31:0] w_ip_DivInt_quotient_0;
	wire signed [31:0] w_ip_DivInt_fractional_0;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg  signed [31:0] r_sys_average_return;
	reg         [ 1:0] r_sys_average_caller;
	reg                r_sys_average_req;
	reg         [ 4:0] r_sys_average_phase;
	reg         [ 1:0] r_sys_average_stage;
	reg         [ 5:0] r_sys_average_step;
	reg                r_sys_average_busy;
	wire        [ 1:0] w_sys_average_stage_p1;
	wire        [ 5:0] w_sys_average_step_p1;
	reg  signed [31:0] r_average_data_0_addr;
	reg  signed [31:0] r_average_data_0_datain;
	wire signed [31:0] w_average_data_0_dataout;
	reg                r_average_data_0_r_w;
	wire signed [31:0] w_average_data_0_addr;
	wire signed [31:0] w_average_data_0_datain;
	wire               w_average_data_0_r_w;
	wire               w_average_data_0_ce;
	wire               w_average_data_0_cacheHit;
	reg  signed [31:0] r_average_dataNum_1;
	reg  signed [31:0] r_average_ret_2;
	reg  signed [31:0] r_average_i_3;
	reg  signed [31:0] r_average_i_4;
	reg  signed [31:0] r_sys_tmp0_int;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire               w_sys_tmp7;
	wire signed [31:0] w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp11;
	wire signed [31:0] w_sys_tmp12;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_average_data_0_cacheHit;
	assign o_average_busy = r_sys_average_busy;
	assign o_average_return = r_sys_average_return;
	assign w_sys_average_stage_p1 = (r_sys_average_stage + 2'h1);
	assign w_sys_average_step_p1 = (r_sys_average_step + 6'h1);
	assign w_average_data_0_dataout = i_average_data_0_dataout;
	assign w_average_data_0_addr = r_average_data_0_addr;
	assign w_average_data_0_datain = r_average_data_0_datain;
	assign w_average_data_0_r_w = r_average_data_0_r_w;
	assign w_average_data_0_ce = w_sys_ce;
	assign w_average_data_0_cacheHit = w_sys_boolTrue;
	assign o_average_data_0_addr = w_average_data_0_addr;
	assign o_average_data_0_datain = w_average_data_0_datain;
	assign o_average_data_0_r_w = w_average_data_0_r_w;
	assign o_average_data_0_ce = w_average_data_0_ce;
	assign w_sys_tmp1 = (r_average_i_3 < r_average_dataNum_1);
	assign w_sys_tmp4 = (w_sys_tmp5 + r_average_i_3);
	assign w_sys_tmp5 = (r_average_i_3 + r_average_i_3);
	assign w_sys_tmp6 = (r_average_i_3 + w_sys_intOne);
	assign w_sys_tmp7 = (r_average_i_4 < r_average_dataNum_1);
	assign w_sys_tmp9 = (r_average_ret_2 + w_sys_tmp10);
	assign w_sys_tmp10 = w_average_data_0_dataout;
	assign w_sys_tmp11 = (r_average_i_4 + w_sys_intOne);
	assign w_sys_tmp12 = w_ip_DivInt_quotient_0;


	DivInt
		DivInt_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.dividend (r_ip_DivInt_dividend_0),
			.divisor (r_ip_DivInt_divisor_0),
			.fractional (w_ip_DivInt_fractional_0),
			.quotient (w_ip_DivInt_quotient_0)
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						5'h10: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_ip_DivInt_dividend_0 <= r_average_ret_2;

									end
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

					case(r_sys_average_phase) 
						5'h10: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_ip_DivInt_divisor_0 <= r_average_dataNum_1;

									end
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
					r_sys_processing_methodID <= ((i_average_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_average_phase) 
						5'h12: begin
							r_sys_processing_methodID <= r_sys_average_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_average_return <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						5'hf: begin
							r_sys_average_return <= r_sys_tmp0_int;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_average_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_average_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_average_phase <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						5'h0: begin
							r_sys_average_phase <= 5'h2;
						end

						5'h2: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_phase <= ((w_sys_tmp1) ? 5'h8 : 5'ha);

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_phase <= 5'h5;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_phase <= 5'hb;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_phase <= ((w_sys_tmp7) ? 5'he : 5'h10);

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h2)) begin
										r_sys_average_phase <= 5'hb;

									end
								end

							endcase
						end

						5'hf: begin
							r_sys_average_phase <= 5'h12;
						end

						5'h10: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h25)) begin
										r_sys_average_phase <= 5'hf;

									end
								end

							endcase
						end

						5'h12: begin
							r_sys_average_phase <= 5'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_average_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						5'h2: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h2)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h25)) begin
										r_sys_average_stage <= 2'h0;

									end
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
			r_sys_average_step <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						5'h2: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_step <= 6'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_step <= 6'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_step <= 6'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_step <= 6'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_step <= 6'h0;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_sys_average_step <= 6'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h2)) begin
										r_sys_average_step <= 6'h0;

									end
									else
									if((r_sys_average_step==6'h0) || (r_sys_average_step==6'h1)) begin
										r_sys_average_step <= w_sys_average_step_p1;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h25)) begin
										r_sys_average_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_average_step && r_sys_average_step<=6'h24)) begin
										r_sys_average_step <= w_sys_average_step_p1;

									end
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
			r_sys_average_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_average_busy <= ((i_average_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_average_phase) 
						5'h0: begin
							r_sys_average_busy <= w_sys_boolTrue;
						end

						5'h12: begin
							r_sys_average_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_average_data_0_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						5'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_average_data_0_addr <= r_average_i_3;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_average_data_0_addr <= r_average_i_4;

									end
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

					case(r_sys_average_phase) 
						5'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_average_data_0_datain <= w_sys_tmp4;

									end
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
			r_average_data_0_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						5'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_average_data_0_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_average_data_0_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h12: begin
							r_average_data_0_r_w <= w_sys_boolFalse;
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
					r_average_dataNum_1 <= ((i_average_req) ? i_average_dataNum_1 : r_average_dataNum_1);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						5'h2: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_average_ret_2 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h2)) begin
										r_average_ret_2 <= w_sys_tmp9;

									end
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

					case(r_sys_average_phase) 
						5'h4: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_average_i_3 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_average_i_3 <= w_sys_tmp6;

									end
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

					case(r_sys_average_phase) 
						5'ha: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_average_i_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h0)) begin
										r_average_i_4 <= w_sys_tmp11;

									end
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

					case(r_sys_average_phase) 
						5'h10: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==6'h25)) begin
										r_sys_tmp0_int <= w_sys_tmp12;

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
