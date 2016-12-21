/*
TimeStamp:	2016/12/21		17:56
*/


module BoolTest(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	output                o_fld_a_0	
);

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
	reg         [ 1:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 1:0] w_sys_run_step_p1;
	reg                r_fld_a_0;
	reg  signed [31:0] r_run_i_1;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp4;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 2'h1);
	assign o_fld_a_0 = r_fld_a_0;
	assign w_sys_tmp1 = (r_run_i_1 < w_sys_tmp2);
	assign w_sys_tmp2 = 32'sh00000064;
	assign w_sys_tmp4 = (r_run_i_1 + w_sys_intOne);


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
						4'ha: begin
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
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp1) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h1)) begin
										r_sys_run_phase <= 4'h5;

									end
								end

							endcase
						end

						4'ha: begin
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
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h1)) begin
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
			r_sys_run_step <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_step <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_step <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_step <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==2'h1)) begin
										r_sys_run_step <= 2'h0;

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

						4'ha: begin
							r_sys_run_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_a_0 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0) || (r_sys_run_step==2'h1)) begin
										r_fld_a_0 <= w_sys_boolFalse;

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
									if((r_sys_run_step==2'h0)) begin
										r_run_i_1 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_run_i_1 <= w_sys_tmp4;

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
