/*
TimeStamp:	2017/1/26		17:30
*/


module PE(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_average_req,	
	output                o_average_busy,	
	output signed  [31:0] o_average_return,	
	input  signed  [31:0] i_average_dataNum_0,	
	output signed  [31:0] o_average_matX_1_addr,	
	output signed  [31:0] o_average_matX_1_datain,	
	input  signed  [31:0] i_average_matX_1_dataout,	
	output                o_average_matX_1_r_w,	
	output                o_average_matX_1_ce	
);

	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg  signed [31:0] r_sys_average_return;
	reg         [ 1:0] r_sys_average_caller;
	reg                r_sys_average_req;
	reg         [ 3:0] r_sys_average_phase;
	reg         [ 1:0] r_sys_average_stage;
	reg         [ 2:0] r_sys_average_step;
	reg                r_sys_average_busy;
	wire        [ 1:0] w_sys_average_stage_p1;
	wire        [ 2:0] w_sys_average_step_p1;
	reg  signed [31:0] r_average_dataNum_0;
	reg  signed [31:0] r_average_matX_1_addr;
	reg  signed [31:0] r_average_matX_1_datain;
	wire signed [31:0] w_average_matX_1_dataout;
	reg                r_average_matX_1_r_w;
	wire signed [31:0] w_average_matX_1_addr;
	wire signed [31:0] w_average_matX_1_datain;
	wire               w_average_matX_1_r_w;
	wire               w_average_matX_1_ce;
	wire               w_average_matX_1_cacheHit;
	reg  signed [31:0] r_average_i_2;
	reg  signed [31:0] r_average_average_3;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp3;
	wire signed [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_average_matX_1_cacheHit;
	assign o_average_busy = r_sys_average_busy;
	assign o_average_return = r_sys_average_return;
	assign w_sys_average_stage_p1 = (r_sys_average_stage + 2'h1);
	assign w_sys_average_step_p1 = (r_sys_average_step + 3'h1);
	assign w_average_matX_1_dataout = i_average_matX_1_dataout;
	assign w_average_matX_1_addr = r_average_matX_1_addr;
	assign w_average_matX_1_datain = r_average_matX_1_datain;
	assign w_average_matX_1_r_w = r_average_matX_1_r_w;
	assign w_average_matX_1_ce = w_sys_ce;
	assign w_average_matX_1_cacheHit = w_sys_boolTrue;
	assign o_average_matX_1_addr = w_average_matX_1_addr;
	assign o_average_matX_1_datain = w_average_matX_1_datain;
	assign o_average_matX_1_r_w = w_average_matX_1_r_w;
	assign o_average_matX_1_ce = w_average_matX_1_ce;
	assign w_sys_tmp1 = (r_average_i_2 < r_average_dataNum_0);
	assign w_sys_tmp3 = (w_sys_tmp4 + r_average_average_3);
	assign w_sys_tmp4 = w_average_matX_1_dataout;
	assign w_sys_tmp5 = (r_average_i_2 + w_sys_intOne);
	assign w_sys_tmp6 = r_average_average_3;


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
						4'hc: begin
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
						4'h9: begin
							r_sys_average_return <= w_sys_tmp6;
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
			r_sys_average_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						4'h0: begin
							r_sys_average_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_phase <= ((w_sys_tmp1) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h2)) begin
										r_sys_average_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin
							r_sys_average_phase <= 4'hc;
						end

						4'ha: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_phase <= 4'h9;

									end
								end

							endcase
						end

						4'hc: begin
							r_sys_average_phase <= 4'h0;
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
						4'h2: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h2)) begin
										r_sys_average_stage <= 2'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
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
			r_sys_average_step <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						4'h2: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_step <= 3'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_step <= 3'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_step <= 3'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h2)) begin
										r_sys_average_step <= 3'h0;

									end
									else
									if((r_sys_average_step==3'h0) || (r_sys_average_step==3'h1)) begin
										r_sys_average_step <= w_sys_average_step_p1;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_sys_average_step <= 3'h0;

									end
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
						4'h0: begin
							r_sys_average_busy <= w_sys_boolTrue;
						end

						4'hc: begin
							r_sys_average_busy <= w_sys_boolFalse;
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
					r_average_dataNum_0 <= ((i_average_req) ? i_average_dataNum_0 : r_average_dataNum_0);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_average_matX_1_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						4'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_average_matX_1_addr <= r_average_i_2;

									end
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
			r_average_matX_1_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_average_phase) 
						4'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_average_matX_1_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hc: begin
							r_average_matX_1_r_w <= w_sys_boolFalse;
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
						4'h4: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_average_i_2 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_average_i_2 <= w_sys_tmp5;

									end
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
						4'h2: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h0)) begin
										r_average_average_3 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_average_stage) 
								2'h0: begin
									if((r_sys_average_step==3'h2)) begin
										r_average_average_3 <= w_sys_tmp3;

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