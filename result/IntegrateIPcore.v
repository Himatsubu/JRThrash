/*
TimeStamp:	2013/12/16		12:59
*/


module IntegrateIPcore(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_main_req,	
	output                o_main_busy,	
	output signed  [31:0] o_main_return	
);

	reg  signed [15:0] r_ip_SumOfProduct_a_0;
	reg  signed [15:0] r_ip_SumOfProduct_b_0;
	reg  signed [31:0] r_ip_SumOfProduct_c_0;
	wire signed [32:0] w_ip_SumOfProduct_result_0;
	reg  signed [15:0] r_ip_SumOfProduct_a_1;
	reg  signed [15:0] r_ip_SumOfProduct_b_1;
	reg  signed [31:0] r_ip_SumOfProduct_c_1;
	wire signed [32:0] w_ip_SumOfProduct_result_1;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg  signed [31:0] r_sys_main_return;
	reg         [ 1:0] r_sys_main_caller;
	reg                r_sys_main_req;
	reg         [ 2:0] r_sys_main_phase;
	reg         [ 1:0] r_sys_main_stage;
	reg         [ 1:0] r_sys_main_step;
	reg                r_sys_main_busy;
	wire        [ 1:0] w_sys_main_stage_p1;
	wire        [ 1:0] w_sys_main_step_p1;
	reg  signed [31:0] r_sys_tmp0_int;
	wire signed [31:0] w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp3;
	wire signed [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire signed [31:0] w_sys_tmp7;
	wire signed [31:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_main_busy = r_sys_main_busy;
	assign o_main_return = r_sys_main_return;
	assign w_sys_main_stage_p1 = (r_sys_main_stage + 2'h1);
	assign w_sys_main_step_p1 = (r_sys_main_step + 2'h1);
	assign w_sys_tmp1 = (w_sys_tmp2 + w_sys_tmp6);
	assign w_sys_tmp2 = $signed( w_ip_SumOfProduct_result_0[31:0] );
	assign w_sys_tmp3 = 32'sh0000000a;
	assign w_sys_tmp4 = 32'sh00000014;
	assign w_sys_tmp5 = 32'sh0000001e;
	assign w_sys_tmp6 = $signed( w_ip_SumOfProduct_result_1[31:0] );
	assign w_sys_tmp7 = 32'sh00000028;
	assign w_sys_tmp8 = 32'sh00000032;
	assign w_sys_tmp9 = 32'sh0000003c;


	SumOfProduct
		SumOfProduct_inst_0(
			.clk (clock),
			.a (r_ip_SumOfProduct_a_0),	// in 16bit
			.b (r_ip_SumOfProduct_b_0),	// in 16bit
			.c (r_ip_SumOfProduct_c_0),	// in 32bit
			.p (w_ip_SumOfProduct_result_0)	// out 33bit
		);

	SumOfProduct
		SumOfProduct_inst_1(
			.clk (clock),
			.a (r_ip_SumOfProduct_a_1),	// in 16bit
			.b (r_ip_SumOfProduct_b_1),	// in 16bit
			.c (r_ip_SumOfProduct_c_1),	// in 32bit
			.p (w_ip_SumOfProduct_result_1)	// out 33bit
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_main_phase) 
						3'h3: begin

							case(r_sys_main_stage) 
								2'h0: begin
									if((r_sys_main_step==2'h0)) begin
										r_ip_SumOfProduct_a_0 <= $signed( w_sys_tmp3[15:0] );

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

					case(r_sys_main_phase) 
						3'h3: begin

							case(r_sys_main_stage) 
								2'h0: begin
									if((r_sys_main_step==2'h0)) begin
										r_ip_SumOfProduct_b_0 <= $signed( w_sys_tmp4[15:0] );

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

					case(r_sys_main_phase) 
						3'h3: begin

							case(r_sys_main_stage) 
								2'h0: begin
									if((r_sys_main_step==2'h0)) begin
										r_ip_SumOfProduct_c_0 <= w_sys_tmp5;

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

					case(r_sys_main_phase) 
						3'h3: begin

							case(r_sys_main_stage) 
								2'h0: begin
									if((r_sys_main_step==2'h0)) begin
										r_ip_SumOfProduct_a_1 <= $signed( w_sys_tmp7[15:0] );

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

					case(r_sys_main_phase) 
						3'h3: begin

							case(r_sys_main_stage) 
								2'h0: begin
									if((r_sys_main_step==2'h0)) begin
										r_ip_SumOfProduct_b_1 <= $signed( w_sys_tmp8[15:0] );

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

					case(r_sys_main_phase) 
						3'h3: begin

							case(r_sys_main_stage) 
								2'h0: begin
									if((r_sys_main_step==2'h0)) begin
										r_ip_SumOfProduct_c_1 <= w_sys_tmp9;

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
					r_sys_processing_methodID <= ((i_main_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_main_phase) 
						3'h5: begin
							r_sys_processing_methodID <= r_sys_main_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_main_return <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_main_phase) 
						3'h2: begin
							r_sys_main_return <= r_sys_tmp0_int;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_main_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_main_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_main_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_main_phase) 
						3'h0: begin
							r_sys_main_phase <= 3'h3;
						end

						3'h2: begin
							r_sys_main_phase <= 3'h5;
						end

						3'h3: begin

							case(r_sys_main_stage) 
								2'h0: begin
									if((r_sys_main_step==2'h1)) begin
										r_sys_main_phase <= 3'h2;

									end
								end

							endcase
						end

						3'h5: begin
							r_sys_main_phase <= 3'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_main_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_main_phase) 
						3'h3: begin

							case(r_sys_main_stage) 
								2'h0: begin
									if((r_sys_main_step==2'h1)) begin
										r_sys_main_stage <= 2'h0;

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
			r_sys_main_step <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_main_phase) 
						3'h3: begin

							case(r_sys_main_stage) 
								2'h0: begin
									if((r_sys_main_step==2'h0)) begin
										r_sys_main_step <= w_sys_main_step_p1;

									end
									else
									if((r_sys_main_step==2'h1)) begin
										r_sys_main_step <= 2'h0;

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
			r_sys_main_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_main_busy <= ((i_main_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_main_phase) 
						3'h0: begin
							r_sys_main_busy <= w_sys_boolTrue;
						end

						3'h5: begin
							r_sys_main_busy <= w_sys_boolFalse;
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

					case(r_sys_main_phase) 
						3'h3: begin

							case(r_sys_main_stage) 
								2'h0: begin
									if((r_sys_main_step==2'h1)) begin
										r_sys_tmp0_int <= w_sys_tmp1;

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
