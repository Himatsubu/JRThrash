/*
TimeStamp:	2017/1/5		15:47
*/


module fifotesta(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	output signed  [31:0] o_run_return	
);

	reg  signed [31:0] r_ip_fifoA2B_a_0;
	reg  signed [31:0] r_ip_fifoA2B_s_we_0;
	reg  signed [31:0] r_ip_fifoA2B_s_re_0;
	wire signed [31:0] w_ip_fifoA2B_result_0;
	reg                r_ip_fifoA2B_newData_0;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg  signed [31:0] r_sys_run_return;
	reg         [ 1:0] r_sys_run_caller;
	reg                r_sys_run_req;
	reg         [ 4:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 3:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 3:0] w_sys_run_step_p1;
	wire signed [ 3:0] w_fld_arrayA_0_addr_0;
	wire signed [31:0] w_fld_arrayA_0_datain_0;
	wire signed [31:0] w_fld_arrayA_0_dataout_0;
	wire               w_fld_arrayA_0_r_w_0;
	wire               w_fld_arrayA_0_ce_0;
	reg  signed [ 3:0] r_fld_arrayA_0_addr_1;
	reg  signed [31:0] r_fld_arrayA_0_datain_1;
	wire signed [31:0] w_fld_arrayA_0_dataout_1;
	reg                r_fld_arrayA_0_r_w_1;
	wire               w_fld_arrayA_0_ce_1;
	reg  signed [31:0] r_run_i_1;
	reg  signed [31:0] r_run_result_2;
	reg  signed [31:0] r_run_s_we_3;
	reg  signed [31:0] r_run_s_re_4;
	reg  signed [31:0] r_sys_tmp0_int;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp5;
	wire               w_sys_tmp6;
	wire signed [31:0] w_sys_tmp7;
	wire signed [31:0] w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp11;
	wire               w_sys_tmp12;
	wire signed [31:0] w_sys_tmp13;
	wire signed [31:0] w_sys_tmp16;
	wire signed [31:0] w_sys_tmp17;
	wire               w_sys_tmp18;
	wire signed [31:0] w_sys_tmp19;
	wire signed [31:0] w_sys_tmp21;
	wire signed [31:0] w_sys_tmp22;
	wire signed [31:0] w_sys_tmp23;
	wire signed [31:0] w_sys_tmp24;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign o_run_return = r_sys_run_return;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 4'h1);
	assign w_fld_arrayA_0_addr_0 = 4'sh0;
	assign w_fld_arrayA_0_datain_0 = 32'sh0;
	assign w_fld_arrayA_0_r_w_0 = 1'h0;
	assign w_fld_arrayA_0_ce_0 = w_sys_ce;
	assign w_fld_arrayA_0_ce_1 = w_sys_ce;
	assign w_sys_tmp1 = (r_run_i_1 < w_sys_tmp2);
	assign w_sys_tmp2 = 32'sh0000000a;
	assign w_sys_tmp5 = (r_run_i_1 + w_sys_intOne);
	assign w_sys_tmp6 = (r_run_i_1 < w_sys_tmp7);
	assign w_sys_tmp7 = 32'sh0000000a;
	assign w_sys_tmp9 = w_ip_fifoA2B_result_0;
	assign w_sys_tmp10 = w_fld_arrayA_0_dataout_1;
	assign w_sys_tmp11 = (r_run_i_1 + w_sys_intOne);
	assign w_sys_tmp12 = (r_run_i_1 < w_sys_tmp13);
	assign w_sys_tmp13 = 32'sh0000000a;
	assign w_sys_tmp16 = w_ip_fifoA2B_result_0;
	assign w_sys_tmp17 = (r_run_i_1 + w_sys_intOne);
	assign w_sys_tmp18 = (r_run_i_1 < w_sys_tmp19);
	assign w_sys_tmp19 = 32'sh0000000a;
	assign w_sys_tmp21 = (r_run_result_2 + w_sys_tmp22);
	assign w_sys_tmp22 = w_fld_arrayA_0_dataout_1;
	assign w_sys_tmp23 = (r_run_i_1 + w_sys_intOne);
	assign w_sys_tmp24 = r_run_result_2;


	DualPortRAM #(.DWIDTH(32), .AWIDTH(4), .WORDS(10) )
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

	fifoA2B
		fifoA2B_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.operation_nd (r_ip_fifoA2B_newData_0),
			.a (r_ip_fifoA2B_a_0),	// in 32bit
			.s_we (r_ip_fifoA2B_s_we_0),	// in 32bit
			.s_re (r_ip_fifoA2B_s_re_0),	// in 32bit
			.p (w_ip_fifoA2B_result_0)	// out 32bit
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_ip_fifoA2B_a_0 <= w_sys_tmp10;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_ip_fifoA2B_a_0 <= w_sys_intZero;

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
						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_ip_fifoA2B_s_we_0 <= w_sys_intOne;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_ip_fifoA2B_s_we_0 <= r_run_s_we_3;

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
						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_ip_fifoA2B_s_re_0 <= r_run_s_re_4;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_ip_fifoA2B_s_re_0 <= w_sys_intOne;

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
						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_ip_fifoA2B_newData_0 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_ip_fifoA2B_newData_0 <= w_sys_boolFalse;

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
						5'h1e: begin
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
						5'h1b: begin
							r_sys_run_return <= w_sys_tmp24;
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
			r_sys_run_phase <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'h0: begin
							r_sys_run_phase <= 5'h2;
						end

						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp1) ? 5'h8 : 5'ha);

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= 5'h5;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= 5'hb;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp6) ? 5'he : 5'h10);

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h8)) begin
										r_sys_run_phase <= 5'hb;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= 5'h11;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp12) ? 5'h14 : 5'h16);

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h8)) begin
										r_sys_run_phase <= 5'h11;

									end
								end

							endcase
						end

						5'h16: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= 5'h17;

									end
								end

							endcase
						end

						5'h17: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp18) ? 5'h1a : 5'h1c);

									end
								end

							endcase
						end

						5'h1a: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_sys_run_phase <= 5'h17;

									end
								end

							endcase
						end

						5'h1b: begin
							r_sys_run_phase <= 5'h1e;
						end

						5'h1c: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_phase <= 5'h1b;

									end
								end

							endcase
						end

						5'h1e: begin
							r_sys_run_phase <= 5'h0;
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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h8)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h8)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h16: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h17: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h1a: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h1c: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
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
			r_sys_run_step <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((4'h0<=r_sys_run_step && r_sys_run_step<=4'h7)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==4'h8)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h8)) begin
										r_sys_run_step <= 4'h0;

									end
									else
									if((4'h0<=r_sys_run_step && r_sys_run_step<=4'h7)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
								end

							endcase
						end

						5'h16: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'h17: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'h1a: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0) || (r_sys_run_step==4'h1)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==4'h2)) begin
										r_sys_run_step <= 4'h0;

									end
								end

							endcase
						end

						5'h1c: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_run_step <= 4'h0;

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
						5'h0: begin
							r_sys_run_busy <= w_sys_boolTrue;
						end

						5'h1e: begin
							r_sys_run_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_arrayA_0_addr_1 <= 4'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_fld_arrayA_0_addr_1 <= $signed( r_run_i_1[3:0] );

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_fld_arrayA_0_addr_1 <= $signed( r_run_i_1[3:0] );

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h8)) begin
										r_fld_arrayA_0_addr_1 <= $signed( r_sys_tmp0_int[3:0] );

									end
								end

							endcase
						end

						5'h1a: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_fld_arrayA_0_addr_1 <= $signed( r_run_i_1[3:0] );

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
						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_fld_arrayA_0_datain_1 <= r_run_i_1;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h8)) begin
										r_fld_arrayA_0_datain_1 <= w_sys_tmp16;

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

					case(r_sys_run_phase) 
						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_fld_arrayA_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_fld_arrayA_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h8)) begin
										r_fld_arrayA_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'h1a: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_fld_arrayA_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h1e: begin
							r_fld_arrayA_0_r_w_1 <= w_sys_boolFalse;
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
						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_i_1 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_i_1 <= w_sys_tmp5;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_i_1 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_i_1 <= w_sys_tmp11;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_i_1 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_i_1 <= w_sys_tmp17;

									end
								end

							endcase
						end

						5'h16: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_i_1 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h1a: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_i_1 <= w_sys_tmp23;

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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_result_2 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h1a: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h2)) begin
										r_run_result_2 <= w_sys_tmp21;

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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_s_we_3 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_s_we_3 <= w_sys_intOne;

									end
									else
									if((r_sys_run_step==4'h1)) begin
										r_run_s_we_3 <= w_sys_intZero;

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
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_s_re_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_run_s_re_4 <= w_sys_intOne;

									end
									else
									if((r_sys_run_step==4'h1)) begin
										r_run_s_re_4 <= w_sys_intZero;

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
						5'h14: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==4'h0)) begin
										r_sys_tmp0_int <= r_run_i_1;

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
