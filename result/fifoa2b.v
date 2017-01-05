/*
TimeStamp:	2017/1/5		16:50
*/


module fifoa2b(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_is_finished_req,	
	output                o_is_finished_busy,	
	input                 i_check_finished_req,	
	output                o_check_finished_busy,	
	output                o_check_finished_return,	
	input                 i_enque_req,	
	output                o_enque_busy,	
	input                 i_deque_req,	
	output                o_deque_busy,	
	output signed  [31:0] o_deque_return,	
	input                 i_is_finished_in_finished_4,	
	input  signed  [31:0] i_enque_n_in_5	
);

	reg         [ 2:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 2:0] r_sys_is_finished_caller;
	reg                r_sys_is_finished_req;
	reg         [ 2:0] r_sys_is_finished_phase;
	reg         [ 1:0] r_sys_is_finished_stage;
	reg         [ 1:0] r_sys_is_finished_step;
	reg                r_sys_is_finished_busy;
	wire        [ 1:0] w_sys_is_finished_stage_p1;
	wire        [ 1:0] w_sys_is_finished_step_p1;
	reg                r_sys_check_finished_return;
	reg         [ 2:0] r_sys_check_finished_caller;
	reg                r_sys_check_finished_req;
	reg         [ 2:0] r_sys_check_finished_phase;
	reg         [ 1:0] r_sys_check_finished_stage;
	reg         [ 1:0] r_sys_check_finished_step;
	reg                r_sys_check_finished_busy;
	wire        [ 1:0] w_sys_check_finished_stage_p1;
	wire        [ 1:0] w_sys_check_finished_step_p1;
	reg         [ 2:0] r_sys_enque_caller;
	reg                r_sys_enque_req;
	reg         [ 2:0] r_sys_enque_phase;
	reg         [ 1:0] r_sys_enque_stage;
	reg         [ 1:0] r_sys_enque_step;
	reg                r_sys_enque_busy;
	wire        [ 1:0] w_sys_enque_stage_p1;
	wire        [ 1:0] w_sys_enque_step_p1;
	reg  signed [31:0] r_sys_deque_return;
	reg         [ 2:0] r_sys_deque_caller;
	reg                r_sys_deque_req;
	reg         [ 2:0] r_sys_deque_phase;
	reg         [ 1:0] r_sys_deque_stage;
	reg         [ 2:0] r_sys_deque_step;
	reg                r_sys_deque_busy;
	wire        [ 1:0] w_sys_deque_stage_p1;
	wire        [ 2:0] w_sys_deque_step_p1;
	wire signed [ 3:0] w_fld_buffer_0_addr_0;
	wire signed [31:0] w_fld_buffer_0_datain_0;
	wire signed [31:0] w_fld_buffer_0_dataout_0;
	wire               w_fld_buffer_0_r_w_0;
	wire               w_fld_buffer_0_ce_0;
	reg  signed [ 3:0] r_fld_buffer_0_addr_1;
	reg  signed [31:0] r_fld_buffer_0_datain_1;
	wire signed [31:0] w_fld_buffer_0_dataout_1;
	reg                r_fld_buffer_0_r_w_1;
	wire               w_fld_buffer_0_ce_1;
	reg  signed [31:0] r_fld_front_1;
	reg  signed [31:0] r_fld_rear_2;
	reg                r_fld_is_finished_3;
	reg                r_is_finished_in_finished_4;
	reg  signed [31:0] r_enque_n_in_5;
	reg  signed [31:0] r_deque_n_out_6;
	wire               w_sys_tmp1;
	wire               w_sys_tmp2;
	wire signed [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire signed [31:0] w_sys_tmp7;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_is_finished_busy = r_sys_is_finished_busy;
	assign w_sys_is_finished_stage_p1 = (r_sys_is_finished_stage + 2'h1);
	assign w_sys_is_finished_step_p1 = (r_sys_is_finished_step + 2'h1);
	assign o_check_finished_busy = r_sys_check_finished_busy;
	assign o_check_finished_return = r_sys_check_finished_return;
	assign w_sys_check_finished_stage_p1 = (r_sys_check_finished_stage + 2'h1);
	assign w_sys_check_finished_step_p1 = (r_sys_check_finished_step + 2'h1);
	assign o_enque_busy = r_sys_enque_busy;
	assign w_sys_enque_stage_p1 = (r_sys_enque_stage + 2'h1);
	assign w_sys_enque_step_p1 = (r_sys_enque_step + 2'h1);
	assign o_deque_busy = r_sys_deque_busy;
	assign o_deque_return = r_sys_deque_return;
	assign w_sys_deque_stage_p1 = (r_sys_deque_stage + 2'h1);
	assign w_sys_deque_step_p1 = (r_sys_deque_step + 3'h1);
	assign w_fld_buffer_0_addr_0 = 4'sh0;
	assign w_fld_buffer_0_datain_0 = 32'sh0;
	assign w_fld_buffer_0_r_w_0 = 1'h0;
	assign w_fld_buffer_0_ce_0 = w_sys_ce;
	assign w_fld_buffer_0_ce_1 = w_sys_ce;
	assign w_sys_tmp1 = (r_is_finished_in_finished_4 == w_sys_boolFalse);
	assign w_sys_tmp2 = r_fld_is_finished_3;
	assign w_sys_tmp4 = (r_fld_rear_2 + w_sys_intOne);
	assign w_sys_tmp5 = w_fld_buffer_0_dataout_1;
	assign w_sys_tmp6 = (r_fld_front_1 + w_sys_intOne);
	assign w_sys_tmp7 = r_deque_n_out_6;


	DualPortRAM #(.DWIDTH(32), .AWIDTH(4), .WORDS(10) )
		dpram_buffer_0(
			.clk (clock),
			.ce_0 (w_fld_buffer_0_ce_0),
			.addr_0 (w_fld_buffer_0_addr_0),
			.datain_0 (w_fld_buffer_0_datain_0),
			.dataout_0 (w_fld_buffer_0_dataout_0),
			.r_w_0 (w_fld_buffer_0_r_w_0),
			.ce_1 (w_fld_buffer_0_ce_1),
			.addr_1 (r_fld_buffer_0_addr_1),
			.datain_1 (r_fld_buffer_0_datain_1),
			.dataout_1 (w_fld_buffer_0_dataout_1),
			.r_w_1 (r_fld_buffer_0_r_w_1)
		);

	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_processing_methodID <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_processing_methodID <= ((i_deque_req) ? 3'h4 : ((i_enque_req) ? 3'h3 : ((i_check_finished_req) ? 3'h2 : ((i_is_finished_req) ? 3'h1 : r_sys_processing_methodID))));
				end

				3'h1: begin

					case(r_sys_is_finished_phase) 
						3'h7: begin
							r_sys_processing_methodID <= r_sys_is_finished_caller;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_check_finished_phase) 
						3'h5: begin
							r_sys_processing_methodID <= r_sys_check_finished_caller;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_enque_phase) 
						3'h4: begin
							r_sys_processing_methodID <= r_sys_enque_caller;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_deque_phase) 
						3'h6: begin
							r_sys_processing_methodID <= r_sys_deque_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_is_finished_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_is_finished_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_is_finished_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_is_finished_phase) 
						3'h0: begin
							r_sys_is_finished_phase <= 3'h3;
						end

						3'h3: begin

							case(r_sys_is_finished_stage) 
								2'h0: begin
									if((r_sys_is_finished_step==2'h0)) begin
										r_sys_is_finished_phase <= ((w_sys_tmp1) ? 3'h5 : 3'h7);

									end
								end

							endcase
						end

						3'h5: begin

							case(r_sys_is_finished_stage) 
								2'h0: begin
									if((r_sys_is_finished_step==2'h0)) begin
										r_sys_is_finished_phase <= 3'h7;

									end
								end

							endcase
						end

						3'h7: begin
							r_sys_is_finished_phase <= 3'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_is_finished_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_is_finished_phase) 
						3'h3: begin

							case(r_sys_is_finished_stage) 
								2'h0: begin
									if((r_sys_is_finished_step==2'h0)) begin
										r_sys_is_finished_stage <= 2'h0;

									end
								end

							endcase
						end

						3'h5: begin

							case(r_sys_is_finished_stage) 
								2'h0: begin
									if((r_sys_is_finished_step==2'h0)) begin
										r_sys_is_finished_stage <= 2'h0;

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
			r_sys_is_finished_step <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_is_finished_phase) 
						3'h3: begin

							case(r_sys_is_finished_stage) 
								2'h0: begin
									if((r_sys_is_finished_step==2'h0)) begin
										r_sys_is_finished_step <= 2'h0;

									end
								end

							endcase
						end

						3'h5: begin

							case(r_sys_is_finished_stage) 
								2'h0: begin
									if((r_sys_is_finished_step==2'h0)) begin
										r_sys_is_finished_step <= 2'h0;

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
			r_sys_is_finished_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_is_finished_busy <= ((i_is_finished_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h1: begin

					case(r_sys_is_finished_phase) 
						3'h0: begin
							r_sys_is_finished_busy <= w_sys_boolTrue;
						end

						3'h7: begin
							r_sys_is_finished_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_check_finished_return <= 1'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_check_finished_phase) 
						3'h2: begin
							r_sys_check_finished_return <= w_sys_tmp2;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_check_finished_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_check_finished_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_check_finished_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_check_finished_phase) 
						3'h0: begin
							r_sys_check_finished_phase <= 3'h3;
						end

						3'h2: begin
							r_sys_check_finished_phase <= 3'h5;
						end

						3'h3: begin

							case(r_sys_check_finished_stage) 
								2'h0: begin
									if((r_sys_check_finished_step==2'h0)) begin
										r_sys_check_finished_phase <= 3'h2;

									end
								end

							endcase
						end

						3'h5: begin
							r_sys_check_finished_phase <= 3'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_check_finished_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_check_finished_phase) 
						3'h3: begin

							case(r_sys_check_finished_stage) 
								2'h0: begin
									if((r_sys_check_finished_step==2'h0)) begin
										r_sys_check_finished_stage <= 2'h0;

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
			r_sys_check_finished_step <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_check_finished_phase) 
						3'h3: begin

							case(r_sys_check_finished_stage) 
								2'h0: begin
									if((r_sys_check_finished_step==2'h0)) begin
										r_sys_check_finished_step <= 2'h0;

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
			r_sys_check_finished_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_check_finished_busy <= ((i_check_finished_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h2: begin

					case(r_sys_check_finished_phase) 
						3'h0: begin
							r_sys_check_finished_busy <= w_sys_boolTrue;
						end

						3'h5: begin
							r_sys_check_finished_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_enque_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_enque_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_enque_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_enque_phase) 
						3'h0: begin
							r_sys_enque_phase <= 3'h2;
						end

						3'h2: begin

							case(r_sys_enque_stage) 
								2'h0: begin
									if((r_sys_enque_step==2'h0)) begin
										r_sys_enque_phase <= 3'h4;

									end
								end

							endcase
						end

						3'h4: begin
							r_sys_enque_phase <= 3'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_enque_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_enque_phase) 
						3'h2: begin

							case(r_sys_enque_stage) 
								2'h0: begin
									if((r_sys_enque_step==2'h0)) begin
										r_sys_enque_stage <= 2'h0;

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
			r_sys_enque_step <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_enque_phase) 
						3'h2: begin

							case(r_sys_enque_stage) 
								2'h0: begin
									if((r_sys_enque_step==2'h0)) begin
										r_sys_enque_step <= 2'h0;

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
			r_sys_enque_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_enque_busy <= ((i_enque_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h3: begin

					case(r_sys_enque_phase) 
						3'h0: begin
							r_sys_enque_busy <= w_sys_boolTrue;
						end

						3'h4: begin
							r_sys_enque_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_deque_return <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_deque_phase) 
						3'h3: begin
							r_sys_deque_return <= w_sys_tmp7;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_deque_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_deque_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_deque_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_deque_phase) 
						3'h0: begin
							r_sys_deque_phase <= 3'h2;
						end

						3'h2: begin

							case(r_sys_deque_stage) 
								2'h0: begin
									if((r_sys_deque_step==3'h2)) begin
										r_sys_deque_phase <= 3'h4;

									end
								end

							endcase
						end

						3'h3: begin
							r_sys_deque_phase <= 3'h6;
						end

						3'h4: begin

							case(r_sys_deque_stage) 
								2'h0: begin
									if((r_sys_deque_step==3'h0)) begin
										r_sys_deque_phase <= 3'h3;

									end
								end

							endcase
						end

						3'h6: begin
							r_sys_deque_phase <= 3'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_deque_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_deque_phase) 
						3'h2: begin

							case(r_sys_deque_stage) 
								2'h0: begin
									if((r_sys_deque_step==3'h2)) begin
										r_sys_deque_stage <= 2'h0;

									end
								end

							endcase
						end

						3'h4: begin

							case(r_sys_deque_stage) 
								2'h0: begin
									if((r_sys_deque_step==3'h0)) begin
										r_sys_deque_stage <= 2'h0;

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
			r_sys_deque_step <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_deque_phase) 
						3'h2: begin

							case(r_sys_deque_stage) 
								2'h0: begin
									if((r_sys_deque_step==3'h0) || (r_sys_deque_step==3'h1)) begin
										r_sys_deque_step <= w_sys_deque_step_p1;

									end
									else
									if((r_sys_deque_step==3'h2)) begin
										r_sys_deque_step <= 3'h0;

									end
								end

							endcase
						end

						3'h4: begin

							case(r_sys_deque_stage) 
								2'h0: begin
									if((r_sys_deque_step==3'h0)) begin
										r_sys_deque_step <= 3'h0;

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
			r_sys_deque_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_deque_busy <= ((i_deque_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h4: begin

					case(r_sys_deque_phase) 
						3'h0: begin
							r_sys_deque_busy <= w_sys_boolTrue;
						end

						3'h6: begin
							r_sys_deque_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_buffer_0_addr_1 <= 4'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_enque_phase) 
						3'h2: begin

							case(r_sys_enque_stage) 
								2'h0: begin
									if((r_sys_enque_step==2'h0)) begin
										r_fld_buffer_0_addr_1 <= $signed( r_fld_rear_2[3:0] );

									end
								end

							endcase
						end

					endcase
				end

				3'h4: begin

					case(r_sys_deque_phase) 
						3'h2: begin

							case(r_sys_deque_stage) 
								2'h0: begin
									if((r_sys_deque_step==3'h0)) begin
										r_fld_buffer_0_addr_1 <= $signed( r_fld_front_1[3:0] );

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
				3'h3: begin

					case(r_sys_enque_phase) 
						3'h2: begin

							case(r_sys_enque_stage) 
								2'h0: begin
									if((r_sys_enque_step==2'h0)) begin
										r_fld_buffer_0_datain_1 <= r_enque_n_in_5;

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
			r_fld_buffer_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_is_finished_phase) 
						3'h7: begin
							r_fld_buffer_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_check_finished_phase) 
						3'h5: begin
							r_fld_buffer_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_enque_phase) 
						3'h2: begin

							case(r_sys_enque_stage) 
								2'h0: begin
									if((r_sys_enque_step==2'h0)) begin
										r_fld_buffer_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						3'h4: begin
							r_fld_buffer_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h4: begin

					case(r_sys_deque_phase) 
						3'h2: begin

							case(r_sys_deque_stage) 
								2'h0: begin
									if((r_sys_deque_step==3'h0)) begin
										r_fld_buffer_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						3'h6: begin
							r_fld_buffer_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_front_1 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_deque_phase) 
						3'h2: begin

							case(r_sys_deque_stage) 
								2'h0: begin
									if((r_sys_deque_step==3'h0)) begin
										r_fld_front_1 <= w_sys_tmp6;

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
			r_fld_rear_2 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_enque_phase) 
						3'h2: begin

							case(r_sys_enque_stage) 
								2'h0: begin
									if((r_sys_enque_step==2'h0)) begin
										r_fld_rear_2 <= w_sys_tmp4;

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
			r_fld_is_finished_3 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_is_finished_phase) 
						3'h5: begin

							case(r_sys_is_finished_stage) 
								2'h0: begin
									if((r_sys_is_finished_step==2'h0)) begin
										r_fld_is_finished_3 <= w_sys_boolFalse;

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
				3'h0: begin
					r_is_finished_in_finished_4 <= ((i_is_finished_req) ? i_is_finished_in_finished_4 : r_is_finished_in_finished_4);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_enque_n_in_5 <= ((i_enque_req) ? i_enque_n_in_5 : r_enque_n_in_5);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h4: begin

					case(r_sys_deque_phase) 
						3'h2: begin

							case(r_sys_deque_stage) 
								2'h0: begin
									if((r_sys_deque_step==3'h2)) begin
										r_deque_n_out_6 <= w_sys_tmp5;

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
