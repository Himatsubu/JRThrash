/*
TimeStamp:	2016/6/7		14:47
*/


module mulint_JRT(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	output signed  [31:0] o_run_return,	
	input  signed  [31:0] i_run_input_a_0	
);

	reg  signed [31:0] r_ip_Multint_multiplicand_0;
	reg  signed [31:0] r_ip_Multint_multiplier_0;
	wire signed [63:0] w_ip_Multint_product_0;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg  signed [31:0] r_sys_run_return;
	reg         [ 1:0] r_sys_run_caller;
	reg                r_sys_run_req;
	reg         [ 2:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 2:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 2:0] w_sys_run_step_p1;
	reg  signed [31:0] r_run_input_a_0;
	reg  signed [31:0] r_run_input_b_1;
	reg  signed [31:0] r_run_result_2;
	wire signed [31:0] w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign o_run_return = r_sys_run_return;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 3'h1);
	assign w_sys_tmp1 = r_run_result_2;
	assign w_sys_tmp2 = $signed( w_ip_Multint_product_0[31:0] );


	Multint
		Multint_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_Multint_multiplicand_0),
			.b (r_ip_Multint_multiplier_0),
			.p (w_ip_Multint_product_0)
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_ip_Multint_multiplicand_0 <= r_run_input_a_0;

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
						3'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_ip_Multint_multiplier_0 <= r_run_input_b_1;

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
						3'h6: begin
							r_sys_processing_methodID <= r_sys_run_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_run_return <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h3: begin
							r_sys_run_return <= w_sys_tmp1;
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
			r_sys_run_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h0: begin
							r_sys_run_phase <= 3'h2;
						end

						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_phase <= 3'h4;

									end
								end

							endcase
						end

						3'h3: begin
							r_sys_run_phase <= 3'h6;
						end

						3'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h5)) begin
										r_sys_run_phase <= 3'h3;

									end
								end

							endcase
						end

						3'h6: begin
							r_sys_run_phase <= 3'h0;
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
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						3'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h5)) begin
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
			r_sys_run_step <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_step <= 3'h0;

									end
								end

							endcase
						end

						3'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h5)) begin
										r_sys_run_step <= 3'h0;

									end
									else
									if((3'h0<=r_sys_run_step && r_sys_run_step<=3'h4)) begin
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
						3'h0: begin
							r_sys_run_busy <= w_sys_boolTrue;
						end

						3'h6: begin
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
				2'h0: begin
					r_run_input_a_0 <= ((i_run_req) ? i_run_input_a_0 : r_run_input_a_0);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_run_input_b_1 <= w_sys_intOne;

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
						3'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h5)) begin
										r_run_result_2 <= w_sys_tmp2;

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