/*
TimeStamp:	2016/12/21		19:6
*/


module ThreadSubB(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	input                 i_getRet_req,	
	output                o_getRet_busy,	
	output signed  [31:0] o_getRet_return,	
	input  signed  [ 4:0] i_fld_arrayB_0_addr_0,	
	input  signed  [31:0] i_fld_arrayB_0_datain_0,	
	output signed  [31:0] o_fld_arrayB_0_dataout_0,	
	input                 i_fld_arrayB_0_r_w_0,	
	output signed  [31:0] o_fld_ret_1,	
	input  signed  [31:0] i_fld_numberB_2	
);

	reg         [ 2:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 2:0] r_sys_run_caller;
	reg                r_sys_run_req;
	reg         [ 3:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 2:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 2:0] w_sys_run_step_p1;
	reg         [ 2:0] r_sys_setArray_caller;
	reg                r_sys_setArray_req;
	reg         [ 3:0] r_sys_setArray_phase;
	reg         [ 1:0] r_sys_setArray_stage;
	reg         [ 3:0] r_sys_setArray_step;
	reg                r_sys_setArray_busy;
	wire        [ 1:0] w_sys_setArray_stage_p1;
	wire        [ 3:0] w_sys_setArray_step_p1;
	reg  signed [31:0] r_sys_getRet_return;
	reg         [ 2:0] r_sys_getRet_caller;
	reg                r_sys_getRet_req;
	reg         [ 2:0] r_sys_getRet_phase;
	reg         [ 1:0] r_sys_getRet_stage;
	reg         [ 1:0] r_sys_getRet_step;
	reg                r_sys_getRet_busy;
	wire        [ 1:0] w_sys_getRet_stage_p1;
	wire        [ 1:0] w_sys_getRet_step_p1;
	wire signed [ 4:0] w_fld_arrayB_0_addr_0;
	wire signed [31:0] w_fld_arrayB_0_datain_0;
	wire signed [31:0] w_fld_arrayB_0_dataout_0;
	wire               w_fld_arrayB_0_r_w_0;
	wire               w_fld_arrayB_0_ce_0;
	reg  signed [ 4:0] r_fld_arrayB_0_addr_1;
	reg  signed [31:0] r_fld_arrayB_0_datain_1;
	wire signed [31:0] w_fld_arrayB_0_dataout_1;
	reg                r_fld_arrayB_0_r_w_1;
	wire               w_fld_arrayB_0_ce_1;
	reg  signed [31:0] r_fld_ret_1;
	reg  signed [31:0] r_run_i_3;
	reg  signed [31:0] r_setArray_i_4;
	reg  signed [31:0] r_setArray_copy0_i_5;
	reg  signed [31:0] r_setArray_copy1_i_6;
	reg  signed [31:0] r_setArray_copy2_i_7;
	reg  signed [31:0] r_setArray_copy3_i_8;
	reg  signed [31:0] r_sys_tmp0_int;
	reg  signed [31:0] r_sys_tmp1_int;
	reg  signed [31:0] r_sys_tmp2_int;
	reg  signed [31:0] r_sys_tmp3_int;
	reg  signed [31:0] r_sys_tmp4_int;
	reg  signed [31:0] r_sys_tmp5_int;
	reg  signed [31:0] r_sys_tmp6_int;
	reg  signed [31:0] r_sys_tmp7_int;
	reg  signed [31:0] r_sys_tmp8_int;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire               w_sys_tmp16;
	wire signed [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp20;
	wire signed [31:0] w_sys_tmp21;
	wire signed [31:0] w_sys_tmp22;
	wire               w_sys_tmp23;
	wire signed [31:0] w_sys_tmp24;
	wire signed [31:0] w_sys_tmp25;
	wire signed [31:0] w_sys_tmp26;
	wire signed [31:0] w_sys_tmp27;
	wire signed [31:0] w_sys_tmp28;
	wire signed [31:0] w_sys_tmp29;
	wire signed [31:0] w_sys_tmp31;
	wire signed [31:0] w_sys_tmp33;
	wire signed [31:0] w_sys_tmp34;
	wire signed [31:0] w_sys_tmp35;
	wire               w_sys_tmp36;
	wire signed [31:0] w_sys_tmp38;
	wire signed [31:0] w_sys_tmp45;
	wire signed [31:0] w_sys_tmp72;
	wire signed [31:0] w_sys_tmp73;
	wire signed [31:0] w_sys_tmp74;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 3'h1);
	assign w_sys_setArray_stage_p1 = (r_sys_setArray_stage + 2'h1);
	assign w_sys_setArray_step_p1 = (r_sys_setArray_step + 4'h1);
	assign o_getRet_busy = r_sys_getRet_busy;
	assign o_getRet_return = r_sys_getRet_return;
	assign w_sys_getRet_stage_p1 = (r_sys_getRet_stage + 2'h1);
	assign w_sys_getRet_step_p1 = (r_sys_getRet_step + 2'h1);
	assign o_fld_arrayB_0_dataout_0 = w_fld_arrayB_0_dataout_0;
	assign w_fld_arrayB_0_addr_0 = i_fld_arrayB_0_addr_0;
	assign w_fld_arrayB_0_datain_0 = i_fld_arrayB_0_datain_0;
	assign w_fld_arrayB_0_r_w_0 = i_fld_arrayB_0_r_w_0;
	assign w_fld_arrayB_0_ce_0 = w_sys_ce;
	assign w_fld_arrayB_0_ce_1 = w_sys_ce;
	assign o_fld_ret_1 = r_fld_ret_1;
	assign w_sys_tmp1 = (r_run_i_3 < w_sys_tmp2);
	assign w_sys_tmp2 = 32'sh00000020;
	assign w_sys_tmp4 = (r_fld_ret_1 + w_sys_tmp5);
	assign w_sys_tmp5 = w_fld_arrayB_0_dataout_1;
	assign w_sys_tmp6 = (r_run_i_3 + w_sys_intOne);
	assign w_sys_tmp16 = (r_setArray_i_4 < w_sys_tmp17);
	assign w_sys_tmp17 = 32'sh00000020;
	assign w_sys_tmp20 = (w_sys_tmp21 + r_sys_tmp7_int);
	assign w_sys_tmp21 = w_fld_arrayB_0_dataout_1;
	assign w_sys_tmp22 = (i_fld_numberB_2 % r_setArray_copy2_i_7);
	assign w_sys_tmp23 = (w_sys_tmp24 < r_setArray_copy0_i_5);
	assign w_sys_tmp24 = 32'sh0000000f;
	assign w_sys_tmp25 = (r_setArray_copy0_i_5 + w_sys_intOne);
	assign w_sys_tmp26 = (r_setArray_copy1_i_6 + w_sys_intOne);
	assign w_sys_tmp27 = (r_setArray_copy2_i_7 + w_sys_intOne);
	assign w_sys_tmp28 = (r_setArray_copy3_i_8 + w_sys_intOne);
	assign w_sys_tmp29 = (r_setArray_i_4 + w_sys_intOne);
	assign w_sys_tmp31 = (w_sys_tmp21 + r_sys_tmp6_int);
	assign w_sys_tmp33 = (i_fld_numberB_2 % w_sys_tmp34);
	assign w_sys_tmp34 = w_sys_tmp27;
	assign w_sys_tmp35 = w_sys_tmp26;
	assign w_sys_tmp36 = (w_sys_tmp24 < w_sys_tmp38);
	assign w_sys_tmp38 = w_sys_tmp25;
	assign w_sys_tmp45 = (w_sys_tmp21 + r_sys_tmp1_int);
	assign w_sys_tmp72 = r_fld_ret_1;
	assign w_sys_tmp73 = ((w_sys_tmp23) ? w_sys_tmp22 : r_setArray_copy1_i_6);
	assign w_sys_tmp74 = ((w_sys_tmp36) ? w_sys_tmp33 : w_sys_tmp35);


	DualPortRAM #(.DWIDTH(32), .AWIDTH(5), .WORDS(32) )
		dpram_arrayB_0(
			.clk (clock),
			.ce_0 (w_fld_arrayB_0_ce_0),
			.addr_0 (w_fld_arrayB_0_addr_0),
			.datain_0 (w_fld_arrayB_0_datain_0),
			.dataout_0 (w_fld_arrayB_0_dataout_0),
			.r_w_0 (w_fld_arrayB_0_r_w_0),
			.ce_1 (w_fld_arrayB_0_ce_1),
			.addr_1 (r_fld_arrayB_0_addr_1),
			.datain_1 (r_fld_arrayB_0_datain_1),
			.dataout_1 (w_fld_arrayB_0_dataout_1),
			.r_w_1 (r_fld_arrayB_0_r_w_1)
		);

	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_processing_methodID <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_processing_methodID <= ((i_getRet_req) ? 3'h3 : ((i_run_req) ? 3'h1 : r_sys_processing_methodID));
				end

				3'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_processing_methodID <= 3'h2;

									end
								end

							endcase
						end

						4'ha: begin
							r_sys_processing_methodID <= r_sys_run_caller;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h9: begin
							r_sys_processing_methodID <= r_sys_setArray_caller;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_getRet_phase) 
						3'h5: begin
							r_sys_processing_methodID <= r_sys_getRet_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_run_caller <= 3'h0;

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
				3'h1: begin

					case(r_sys_run_phase) 
						4'h0: begin
							r_sys_run_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h1)) begin
										r_sys_run_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h1: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp1) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h5)) begin
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
				3'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h1)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_stage <= w_sys_run_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

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
				3'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h1)) begin
										r_sys_run_step <= 3'h0;

									end
									else
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_step <= 3'h0;

									end
								end

								2'h1: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_step <= 3'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_step <= 3'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((3'h0<=r_sys_run_step && r_sys_run_step<=3'h4)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==3'h5)) begin
										r_sys_run_step <= 3'h0;

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
				3'h0: begin
					r_sys_run_busy <= ((i_run_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h1: begin

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
			r_sys_setArray_caller <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_run_phase) 
						4'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_setArray_caller <= r_sys_processing_methodID;

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
			r_sys_setArray_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setArray_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h0: begin
							r_sys_setArray_phase <= 4'h3;
						end

						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h1: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= ((w_sys_tmp16) ? 4'h7 : 4'h9);

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'hb)) begin
										r_sys_setArray_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h9: begin
							r_sys_setArray_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setArray_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= w_sys_setArray_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'hb)) begin
										r_sys_setArray_stage <= 2'h0;

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
			r_sys_setArray_step <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

								2'h1: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((4'h0<=r_sys_setArray_step && r_sys_setArray_step<=4'ha)) begin
										r_sys_setArray_step <= w_sys_setArray_step_p1;

									end
									else
									if((r_sys_setArray_step==4'hb)) begin
										r_sys_setArray_step <= 4'h0;

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
			r_sys_setArray_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h0: begin
							r_sys_setArray_busy <= w_sys_boolTrue;
						end

						4'h9: begin
							r_sys_setArray_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_getRet_return <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_getRet_phase) 
						3'h2: begin
							r_sys_getRet_return <= w_sys_tmp72;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_getRet_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_getRet_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_getRet_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_getRet_phase) 
						3'h0: begin
							r_sys_getRet_phase <= 3'h3;
						end

						3'h2: begin
							r_sys_getRet_phase <= 3'h5;
						end

						3'h3: begin

							case(r_sys_getRet_stage) 
								2'h0: begin
									if((r_sys_getRet_step==2'h0)) begin
										r_sys_getRet_phase <= 3'h2;

									end
								end

							endcase
						end

						3'h5: begin
							r_sys_getRet_phase <= 3'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_getRet_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_getRet_phase) 
						3'h3: begin

							case(r_sys_getRet_stage) 
								2'h0: begin
									if((r_sys_getRet_step==2'h0)) begin
										r_sys_getRet_stage <= 2'h0;

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
			r_sys_getRet_step <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_getRet_phase) 
						3'h3: begin

							case(r_sys_getRet_stage) 
								2'h0: begin
									if((r_sys_getRet_step==2'h0)) begin
										r_sys_getRet_step <= 2'h0;

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
			r_sys_getRet_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_getRet_busy <= ((i_getRet_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h3: begin

					case(r_sys_getRet_phase) 
						3'h0: begin
							r_sys_getRet_busy <= w_sys_boolTrue;
						end

						3'h5: begin
							r_sys_getRet_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_arrayB_0_addr_1 <= 5'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_run_phase) 
						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h1) || (r_sys_run_step==3'h2) || (r_sys_run_step==3'h3)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_sys_tmp0_int[4:0] );

									end
									else
									if((r_sys_run_step==3'h0)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_run_i_3[4:0] );

									end
								end

							endcase
						end

					endcase
				end

				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h3)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_sys_tmp4_int[4:0] );

									end
									else
									if((r_sys_setArray_step==4'h9)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_sys_tmp0_int[4:0] );

									end
									else
									if((r_sys_setArray_step==4'h2) || (r_sys_setArray_step==4'hb)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_sys_tmp8_int[4:0] );

									end
									else
									if((r_sys_setArray_step==4'h6)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_sys_tmp2_int[4:0] );

									end
									else
									if((r_sys_setArray_step==4'h8)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_sys_tmp3_int[4:0] );

									end
									else
									if((r_sys_setArray_step==4'h0)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_setArray_copy3_i_8[4:0] );

									end
									else
									if((r_sys_setArray_step==4'h5)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_sys_tmp5_int[4:0] );

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h2) || (r_sys_setArray_step==4'hb)) begin
										r_fld_arrayB_0_datain_1 <= w_sys_tmp20;

									end
									else
									if((r_sys_setArray_step==4'h5)) begin
										r_fld_arrayB_0_datain_1 <= w_sys_tmp31;

									end
									else
									if((r_sys_setArray_step==4'h8)) begin
										r_fld_arrayB_0_datain_1 <= w_sys_tmp45;

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
			r_fld_arrayB_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_run_phase) 
						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((3'h0<=r_sys_run_step && r_sys_run_step<=3'h3)) begin
										r_fld_arrayB_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'ha: begin
							r_fld_arrayB_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h2) || (r_sys_setArray_step==4'h5) || (r_sys_setArray_step==4'h8) || (r_sys_setArray_step==4'hb)) begin
										r_fld_arrayB_0_r_w_1 <= w_sys_boolTrue;

									end
									else
									if((r_sys_setArray_step==4'h0) || (r_sys_setArray_step==4'h3) || (r_sys_setArray_step==4'h6) || (r_sys_setArray_step==4'h9)) begin
										r_fld_arrayB_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'h9: begin
							r_fld_arrayB_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_getRet_phase) 
						3'h5: begin
							r_fld_arrayB_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_ret_1 <= w_sys_intZero;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_run_phase) 
						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((3'h2<=r_sys_run_step && r_sys_run_step<=3'h5)) begin
										r_fld_ret_1 <= w_sys_tmp4;

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
				3'h1: begin

					case(r_sys_run_phase) 
						4'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_run_i_3 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((3'h0<=r_sys_run_step && r_sys_run_step<=3'h3)) begin
										r_run_i_3 <= w_sys_tmp6;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_i_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((4'h0<=r_sys_setArray_step && r_sys_setArray_step<=4'h3)) begin
										r_setArray_i_4 <= w_sys_tmp29;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h1: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_copy0_i_5 <= r_setArray_i_4;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((4'h0<=r_sys_setArray_step && r_sys_setArray_step<=4'h3)) begin
										r_setArray_copy0_i_5 <= w_sys_tmp25;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h1: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_copy1_i_6 <= r_setArray_i_4;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((4'h0<=r_sys_setArray_step && r_sys_setArray_step<=4'h3)) begin
										r_setArray_copy1_i_6 <= w_sys_tmp26;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h1: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_copy2_i_7 <= r_setArray_i_4;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((4'h0<=r_sys_setArray_step && r_sys_setArray_step<=4'h3)) begin
										r_setArray_copy2_i_7 <= w_sys_tmp27;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h3: begin

							case(r_sys_setArray_stage) 
								2'h1: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_copy3_i_8 <= r_setArray_i_4;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((4'h0<=r_sys_setArray_step && r_sys_setArray_step<=4'h3)) begin
										r_setArray_copy3_i_8 <= w_sys_tmp28;

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
				3'h1: begin

					case(r_sys_run_phase) 
						4'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0) || (r_sys_run_step==3'h1) || (r_sys_run_step==3'h2)) begin
										r_sys_tmp0_int <= w_sys_tmp6;

									end
								end

							endcase
						end

					endcase
				end

				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h2)) begin
										r_sys_tmp0_int <= w_sys_tmp28;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h1)) begin
										r_sys_tmp1_int <= w_sys_tmp74;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h1)) begin
										r_sys_tmp2_int <= w_sys_tmp28;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h1)) begin
										r_sys_tmp3_int <= w_sys_tmp29;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_tmp4_int <= w_sys_tmp28;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_tmp5_int <= w_sys_tmp29;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_tmp6_int <= w_sys_tmp74;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h2)) begin
										r_sys_tmp7_int <= w_sys_tmp74;

									end
									else
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_tmp7_int <= w_sys_tmp73;

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
				3'h2: begin

					case(r_sys_setArray_phase) 
						4'h7: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h2)) begin
										r_sys_tmp8_int <= w_sys_tmp29;

									end
									else
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_tmp8_int <= r_setArray_i_4;

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
