/*
TimeStamp:	2017/2/21		14:33
*/


module sub(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	input  signed         i_fld_a_0_addr_0,	
	input          [31:0] i_fld_a_0_datain_0,	
	output         [31:0] o_fld_a_0_dataout_0,	
	input                 i_fld_a_0_r_w_0,	
	input  signed         i_fld_b_1_addr_0,	
	input          [31:0] i_fld_b_1_datain_0,	
	output         [31:0] o_fld_b_1_dataout_0,	
	input                 i_fld_b_1_r_w_0	
);

	reg         [31:0] r_ip_AddFloat_portA_0;
	reg         [31:0] r_ip_AddFloat_portB_0;
	wire        [31:0] w_ip_AddFloat_result_0;
	reg         [31:0] r_ip_MultFloat_multiplicand_0;
	reg         [31:0] r_ip_MultFloat_multiplier_0;
	wire        [31:0] w_ip_MultFloat_product_0;
	reg         [31:0] r_ip_CompareFloatLT_portA_0;
	reg         [31:0] r_ip_CompareFloatLT_portB_0;
	wire               w_ip_CompareFloatLT_result_0;
	reg  signed [31:0] r_ip_FixedToFloat_fixed_0;
	wire        [31:0] w_ip_FixedToFloat_floating_0;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 1:0] r_sys_run_caller;
	reg                r_sys_run_req;
	reg         [ 4:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 4:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 4:0] w_sys_run_step_p1;
	wire signed        w_fld_a_0_addr_0;
	wire        [31:0] w_fld_a_0_datain_0;
	wire        [31:0] w_fld_a_0_dataout_0;
	wire               w_fld_a_0_r_w_0;
	wire               w_fld_a_0_ce_0;
	reg  signed        r_fld_a_0_addr_1;
	reg         [31:0] r_fld_a_0_datain_1;
	wire        [31:0] w_fld_a_0_dataout_1;
	reg                r_fld_a_0_r_w_1;
	wire               w_fld_a_0_ce_1;
	wire signed        w_fld_b_1_addr_0;
	wire        [31:0] w_fld_b_1_datain_0;
	wire        [31:0] w_fld_b_1_dataout_0;
	wire               w_fld_b_1_r_w_0;
	wire               w_fld_b_1_ce_0;
	reg  signed        r_fld_b_1_addr_1;
	reg         [31:0] r_fld_b_1_datain_1;
	wire        [31:0] w_fld_b_1_dataout_1;
	reg                r_fld_b_1_r_w_1;
	wire               w_fld_b_1_ce_1;
	reg         [31:0] r_fld_result_2;
	reg         [31:0] r_run_x_3;
	reg         [31:0] r_run_y_4;
	reg         [31:0] r_run_x1_5;
	reg         [31:0] r_run_y1_6;
	reg  signed [31:0] r_run_n_7;
	reg         [31:0] r_sys_tmp0_float;
	reg         [31:0] r_sys_tmp1_float;
	reg         [31:0] r_sys_tmp2_float;
	wire        [31:0] w_sys_tmp1;
	wire               w_sys_tmp3;
	wire signed [31:0] w_sys_tmp4;
	wire        [31:0] w_sys_tmp6;
	wire        [31:0] w_sys_tmp8;
	wire        [31:0] w_sys_tmp12;
	wire               w_sys_tmp13;
	wire        [31:0] w_sys_tmp14;
	wire        [31:0] w_sys_tmp15;
	wire        [31:0] w_sys_tmp16;
	wire        [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire        [31:0] w_sys_tmp19;
	wire        [31:0] w_sys_tmp20;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 5'h1);
	assign o_fld_a_0_dataout_0 = w_fld_a_0_dataout_0;
	assign w_fld_a_0_addr_0 = i_fld_a_0_addr_0;
	assign w_fld_a_0_datain_0 = i_fld_a_0_datain_0;
	assign w_fld_a_0_r_w_0 = i_fld_a_0_r_w_0;
	assign w_fld_a_0_ce_0 = w_sys_ce;
	assign w_fld_a_0_ce_1 = w_sys_ce;
	assign o_fld_b_1_dataout_0 = w_fld_b_1_dataout_0;
	assign w_fld_b_1_addr_0 = i_fld_b_1_addr_0;
	assign w_fld_b_1_datain_0 = i_fld_b_1_datain_0;
	assign w_fld_b_1_r_w_0 = i_fld_b_1_r_w_0;
	assign w_fld_b_1_ce_0 = w_sys_ce;
	assign w_fld_b_1_ce_1 = w_sys_ce;
	assign w_sys_tmp1 = 32'h0;
	assign w_sys_tmp3 = (r_run_n_7 < w_sys_tmp4);
	assign w_sys_tmp4 = 32'sh00000064;
	assign w_sys_tmp6 = w_ip_AddFloat_result_0;
	assign w_sys_tmp8 = w_ip_MultFloat_product_0;
	assign w_sys_tmp12 = 32'h40000000;
	assign w_sys_tmp13 = w_ip_CompareFloatLT_result_0;
	assign w_sys_tmp14 = 32'h40800000;
	assign w_sys_tmp15 = w_ip_AddFloat_result_0;
	assign w_sys_tmp16 = w_ip_MultFloat_product_0;
	assign w_sys_tmp17 = w_ip_FixedToFloat_floating_0;
	assign w_sys_tmp18 = (r_run_n_7 + w_sys_intOne);
	assign w_sys_tmp19 = 32'h0;
	assign w_sys_tmp20 = 32'h0;


	DualPortRAM #(.DWIDTH(32), .AWIDTH(1), .WORDS(1) )
		dpram_a_0(
			.clk (clock),
			.ce_0 (w_fld_a_0_ce_0),
			.addr_0 (w_fld_a_0_addr_0),
			.datain_0 (w_fld_a_0_datain_0),
			.dataout_0 (w_fld_a_0_dataout_0),
			.r_w_0 (w_fld_a_0_r_w_0),
			.ce_1 (w_fld_a_0_ce_1),
			.addr_1 (r_fld_a_0_addr_1),
			.datain_1 (r_fld_a_0_datain_1),
			.dataout_1 (w_fld_a_0_dataout_1),
			.r_w_1 (r_fld_a_0_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(1), .WORDS(1) )
		dpram_b_1(
			.clk (clock),
			.ce_0 (w_fld_b_1_ce_0),
			.addr_0 (w_fld_b_1_addr_0),
			.datain_0 (w_fld_b_1_datain_0),
			.dataout_0 (w_fld_b_1_dataout_0),
			.r_w_0 (w_fld_b_1_r_w_0),
			.ce_1 (w_fld_b_1_ce_1),
			.addr_1 (r_fld_b_1_addr_1),
			.datain_1 (r_fld_b_1_datain_1),
			.dataout_1 (w_fld_b_1_dataout_1),
			.r_w_1 (r_fld_b_1_r_w_1)
		);

	AddFloat
		AddFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_0),
			.b (r_ip_AddFloat_portB_0),
			.result (w_ip_AddFloat_result_0)
		);

	MultFloat
		MultFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_MultFloat_multiplicand_0),
			.b (r_ip_MultFloat_multiplier_0),
			.result (w_ip_MultFloat_product_0)
		);

	CompareFloatLT
		CompareFloatLT_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_CompareFloatLT_portA_0),
			.b (r_ip_CompareFloatLT_portB_0),
			.result (w_ip_CompareFloatLT_result_0)
		);

	FixedToFloat
		FixedToFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_FixedToFloat_fixed_0),
			.result (w_ip_FixedToFloat_floating_0)
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'hc)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp8;

									end
									else
									if((r_sys_run_step==5'h6)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp0_float;

									end
									else
									if((r_sys_run_step==5'hb)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp6;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h6)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp0_float;

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
									if((r_sys_run_step==5'hb)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_run_step==5'h6)) begin
										r_ip_AddFloat_portB_0 <= { ~w_sys_tmp8[31], w_sys_tmp8[30:0] };

									end
									else
									if((r_sys_run_step==5'hc)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp2_float;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h6)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp16;

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
									if((r_sys_run_step==5'h7)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp8;

									end
									else
									if((r_sys_run_step==5'h0)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_x_3;

									end
									else
									if((r_sys_run_step==5'h2)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp12;

									end
									else
									if((r_sys_run_step==5'h1)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_y_4;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_x1_5;

									end
									else
									if((r_sys_run_step==5'h1)) begin
										r_ip_MultFloat_multiplicand_0 <= r_run_y1_6;

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
									if((r_sys_run_step==5'h0) || (r_sys_run_step==5'h2)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_x_3;

									end
									else
									if((r_sys_run_step==5'h1) || (r_sys_run_step==5'h7)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_y_4;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_x1_5;

									end
									else
									if((r_sys_run_step==5'h1)) begin
										r_ip_MultFloat_multiplier_0 <= r_run_y1_6;

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
						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'hb)) begin
										r_ip_CompareFloatLT_portA_0 <= w_sys_tmp14;

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
						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'hb)) begin
										r_ip_CompareFloatLT_portB_0 <= w_sys_tmp15;

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
						5'hc: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_ip_FixedToFloat_fixed_0 <= r_run_n_7;

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
						5'h10: begin
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
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_phase <= ((w_sys_tmp3) ? 5'h8 : 5'he);

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h11)) begin
										r_sys_run_phase <= 5'ha;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'he)) begin
										r_sys_run_phase <= ((w_sys_tmp13) ? 5'hc : 5'hd);

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h7)) begin
										r_sys_run_phase <= 5'hd;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_phase <= 5'h5;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_phase <= 5'h10;

									end
								end

							endcase
						end

						5'h10: begin
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
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h11)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'he)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h7)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
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
			r_sys_run_step <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_step <= 5'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_step <= 5'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_step <= 5'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h11)) begin
										r_sys_run_step <= 5'h0;

									end
									else
									if((5'h0<=r_sys_run_step && r_sys_run_step<=5'h10)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'he)) begin
										r_sys_run_step <= 5'h0;

									end
									else
									if((5'h0<=r_sys_run_step && r_sys_run_step<=5'hd)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h7)) begin
										r_sys_run_step <= 5'h0;

									end
									else
									if((5'h0<=r_sys_run_step && r_sys_run_step<=5'h6)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_step <= 5'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_sys_run_step <= 5'h0;

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

						5'h10: begin
							r_sys_run_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_a_0_addr_1 <= 1'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_fld_a_0_addr_1 <= $signed( w_sys_intZero[0:0] );

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
			r_fld_a_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_fld_a_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h10: begin
							r_fld_a_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_b_1_addr_1 <= 1'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_fld_b_1_addr_1 <= $signed( w_sys_intZero[0:0] );

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
			r_fld_b_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'h8: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_fld_b_1_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h10: begin
							r_fld_b_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_result_2 <= w_sys_tmp20;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						5'hc: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h7)) begin
										r_fld_result_2 <= w_sys_tmp17;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_fld_result_2 <= w_sys_tmp19;

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
									if((r_sys_run_step==5'h0)) begin
										r_run_x_3 <= w_sys_tmp1;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_run_x_3 <= r_run_x1_5;

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
									if((r_sys_run_step==5'h0)) begin
										r_run_y_4 <= w_sys_tmp1;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_run_y_4 <= r_run_y1_6;

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
									if((r_sys_run_step==5'h10)) begin
										r_run_x1_5 <= w_sys_tmp6;

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
									if((r_sys_run_step==5'h11)) begin
										r_run_y1_6 <= w_sys_tmp6;

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
						5'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_run_n_7 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h0)) begin
										r_run_n_7 <= w_sys_tmp18;

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
									if((r_sys_run_step==5'h5)) begin
										r_sys_tmp0_float <= w_ip_MultFloat_product_0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==5'h5)) begin
										r_sys_tmp0_float <= w_ip_MultFloat_product_0;

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
									if((r_sys_run_step==5'h2)) begin
										r_sys_tmp1_float <= w_fld_a_0_dataout_1;

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
									if((r_sys_run_step==5'h2)) begin
										r_sys_tmp2_float <= w_fld_b_1_dataout_1;

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
