/*
TimeStamp:	2013/12/16		12:59
*/


module SubClassB(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_subBprocess_req,	
	output                o_subBprocess_busy,	
	output signed  [31:0] o_subBprocess_return,	
	input  signed  [ 4:0] i_fld_arrayB_0_addr_0,	
	input  signed  [31:0] i_fld_arrayB_0_datain_0,	
	output signed  [31:0] o_fld_arrayB_0_dataout_0,	
	input                 i_fld_arrayB_0_r_w_0,	
	output signed  [31:0] o_subBprocess_ax_1_addr,	
	output signed  [31:0] o_subBprocess_ax_1_datain,	
	input  signed  [31:0] i_subBprocess_ax_1_dataout,	
	output                o_subBprocess_ax_1_r_w,	
	output                o_subBprocess_ax_1_ce,	
	input                 i_subBprocess_ax_1_cacheHit,	
	output signed  [31:0] o_subBprocess_bx_2_addr,	
	output signed  [31:0] o_subBprocess_bx_2_datain,	
	input  signed  [31:0] i_subBprocess_bx_2_dataout,	
	output                o_subBprocess_bx_2_r_w,	
	output                o_subBprocess_bx_2_ce,	
	input  signed  [31:0] i_subBprocess_dataNum_3	
);

	reg  signed [31:0] r_ip_Multint_multiplicand_0;
	reg  signed [31:0] r_ip_Multint_multiplier_0;
	wire signed [63:0] w_ip_Multint_product_0;
	reg  signed [31:0] r_ip_Multint_multiplicand_1;
	reg  signed [31:0] r_ip_Multint_multiplier_1;
	wire signed [63:0] w_ip_Multint_product_1;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg  signed [31:0] r_sys_subBprocess_return;
	reg         [ 1:0] r_sys_subBprocess_caller;
	reg                r_sys_subBprocess_req;
	reg         [ 4:0] r_sys_subBprocess_phase;
	reg         [ 1:0] r_sys_subBprocess_stage;
	reg         [ 5:0] r_sys_subBprocess_step;
	reg                r_sys_subBprocess_busy;
	wire        [ 1:0] w_sys_subBprocess_stage_p1;
	wire        [ 5:0] w_sys_subBprocess_step_p1;
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
	reg  signed [31:0] r_subBprocess_ax_1_addr;
	reg  signed [31:0] r_subBprocess_ax_1_datain;
	wire signed [31:0] w_subBprocess_ax_1_dataout;
	reg                r_subBprocess_ax_1_r_w;
	wire signed [31:0] w_subBprocess_ax_1_addr;
	wire signed [31:0] w_subBprocess_ax_1_datain;
	wire               w_subBprocess_ax_1_r_w;
	wire               w_subBprocess_ax_1_ce;
	wire               w_subBprocess_ax_1_cacheHit;
	reg  signed [31:0] r_subBprocess_bx_2_addr;
	reg  signed [31:0] r_subBprocess_bx_2_datain;
	wire signed [31:0] w_subBprocess_bx_2_dataout;
	reg                r_subBprocess_bx_2_r_w;
	wire signed [31:0] w_subBprocess_bx_2_addr;
	wire signed [31:0] w_subBprocess_bx_2_datain;
	wire               w_subBprocess_bx_2_r_w;
	wire               w_subBprocess_bx_2_ce;
	wire               w_subBprocess_bx_2_cacheHit;
	reg  signed [31:0] r_subBprocess_dataNum_3;
	reg  signed [31:0] r_subBprocess_i_4;
	reg  signed [31:0] r_subBprocess_ret_5;
	reg  signed [31:0] r_subBprocess_copy0_i_6;
	reg  signed [31:0] r_subBprocess_copy1_i_7;
	reg  signed [31:0] r_subBprocess_copy2_i_8;
	reg  signed [31:0] r_subBprocess_copy3_i_9;
	reg  signed [31:0] r_subBprocess_copy4_i_10;
	reg  signed [31:0] r_subBprocess_copy5_i_11;
	reg  signed [31:0] r_subBprocess_copy6_i_12;
	reg  signed [31:0] r_subBprocess_copy0_i_13;
	reg  signed [31:0] r_subBprocess_copy1_i_14;
	reg  signed [31:0] r_sys_tmp0_int;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire signed [31:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp12;
	wire signed [31:0] w_sys_tmp14;
	wire signed [31:0] w_sys_tmp15;
	wire signed [31:0] w_sys_tmp16;
	wire signed [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire signed [31:0] w_sys_tmp19;
	wire signed [31:0] w_sys_tmp20;
	wire signed [31:0] w_sys_tmp21;
	wire signed [31:0] w_sys_tmp22;
	wire               w_sys_tmp83;
	wire signed [31:0] w_sys_tmp85;
	wire signed [31:0] w_sys_tmp86;
	wire signed [31:0] w_sys_tmp87;
	wire signed [31:0] w_sys_tmp88;
	wire signed [31:0] w_sys_tmp89;
	wire signed [31:0] w_sys_tmp90;
	wire signed [31:0] w_sys_tmp91;
	wire signed [31:0] w_sys_tmp92;
	wire signed [31:0] w_sys_tmp93;
	wire signed [31:0] w_sys_tmp121;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_subBprocess_ax_1_cacheHit & w_subBprocess_bx_2_cacheHit;
	assign o_subBprocess_busy = r_sys_subBprocess_busy;
	assign o_subBprocess_return = r_sys_subBprocess_return;
	assign w_sys_subBprocess_stage_p1 = (r_sys_subBprocess_stage + 2'h1);
	assign w_sys_subBprocess_step_p1 = (r_sys_subBprocess_step + 6'h1);
	assign o_fld_arrayB_0_dataout_0 = w_fld_arrayB_0_dataout_0;
	assign w_fld_arrayB_0_addr_0 = i_fld_arrayB_0_addr_0;
	assign w_fld_arrayB_0_datain_0 = i_fld_arrayB_0_datain_0;
	assign w_fld_arrayB_0_r_w_0 = i_fld_arrayB_0_r_w_0;
	assign w_fld_arrayB_0_ce_0 = w_sys_ce;
	assign w_fld_arrayB_0_ce_1 = w_sys_ce;
	assign w_subBprocess_ax_1_dataout = i_subBprocess_ax_1_dataout;
	assign w_subBprocess_ax_1_addr = r_subBprocess_ax_1_addr;
	assign w_subBprocess_ax_1_datain = r_subBprocess_ax_1_datain;
	assign w_subBprocess_ax_1_r_w = r_subBprocess_ax_1_r_w;
	assign w_subBprocess_ax_1_ce = w_sys_ce;
	assign w_subBprocess_ax_1_cacheHit = i_subBprocess_ax_1_cacheHit;
	assign o_subBprocess_ax_1_addr = w_subBprocess_ax_1_addr;
	assign o_subBprocess_ax_1_datain = w_subBprocess_ax_1_datain;
	assign o_subBprocess_ax_1_r_w = w_subBprocess_ax_1_r_w;
	assign o_subBprocess_ax_1_ce = w_subBprocess_ax_1_ce;
	assign w_subBprocess_bx_2_dataout = i_subBprocess_bx_2_dataout;
	assign w_subBprocess_bx_2_addr = r_subBprocess_bx_2_addr;
	assign w_subBprocess_bx_2_datain = r_subBprocess_bx_2_datain;
	assign w_subBprocess_bx_2_r_w = r_subBprocess_bx_2_r_w;
	assign w_subBprocess_bx_2_ce = w_sys_ce;
	assign w_subBprocess_bx_2_cacheHit = w_sys_boolTrue;
	assign o_subBprocess_bx_2_addr = w_subBprocess_bx_2_addr;
	assign o_subBprocess_bx_2_datain = w_subBprocess_bx_2_datain;
	assign o_subBprocess_bx_2_r_w = w_subBprocess_bx_2_r_w;
	assign o_subBprocess_bx_2_ce = w_subBprocess_bx_2_ce;
	assign w_sys_tmp1 = (r_subBprocess_i_4 < r_subBprocess_dataNum_3);
	assign w_sys_tmp4 = $signed( w_ip_Multint_product_0[31:0] );
	assign w_sys_tmp5 = (r_subBprocess_copy6_i_12 - r_subBprocess_dataNum_3);
	assign w_sys_tmp6 = 32'sh0000000d;
	assign w_sys_tmp8 = $signed( w_ip_Multint_product_1[31:0] );
	assign w_sys_tmp9 = (r_subBprocess_copy4_i_10 - r_subBprocess_dataNum_3);
	assign w_sys_tmp10 = 32'sh00000014;
	assign w_sys_tmp12 = (r_sys_tmp0_int + w_sys_tmp4);
	assign w_sys_tmp14 = w_fld_arrayB_0_dataout_1;
	assign w_sys_tmp15 = (r_subBprocess_copy0_i_6 + w_sys_intOne);
	assign w_sys_tmp16 = (r_subBprocess_copy1_i_7 + w_sys_intOne);
	assign w_sys_tmp17 = (r_subBprocess_copy2_i_8 + w_sys_intOne);
	assign w_sys_tmp18 = (r_subBprocess_copy3_i_9 + w_sys_intOne);
	assign w_sys_tmp19 = (r_subBprocess_copy4_i_10 + w_sys_intOne);
	assign w_sys_tmp20 = (r_subBprocess_copy5_i_11 + w_sys_intOne);
	assign w_sys_tmp21 = (r_subBprocess_copy6_i_12 + w_sys_intOne);
	assign w_sys_tmp22 = (r_subBprocess_i_4 + w_sys_intOne);
	assign w_sys_tmp83 = (r_subBprocess_i_4 < r_subBprocess_dataNum_3);
	assign w_sys_tmp85 = (r_subBprocess_ret_5 + w_sys_tmp86);
	assign w_sys_tmp86 = (w_sys_tmp87 + w_sys_tmp90);
	assign w_sys_tmp87 = (w_sys_tmp88 + w_sys_tmp89);
	assign w_sys_tmp88 = w_subBprocess_ax_1_dataout;
	assign w_sys_tmp89 = w_subBprocess_bx_2_dataout;
	assign w_sys_tmp90 = w_fld_arrayB_0_dataout_1;
	assign w_sys_tmp91 = (r_subBprocess_copy0_i_13 + w_sys_intOne);
	assign w_sys_tmp92 = (r_subBprocess_copy1_i_14 + w_sys_intOne);
	assign w_sys_tmp93 = (r_subBprocess_i_4 + w_sys_intOne);
	assign w_sys_tmp121 = r_subBprocess_ret_5;


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

	Multint
		Multint_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_Multint_multiplicand_0),
			.b (r_ip_Multint_multiplier_0),
			.p (w_ip_Multint_product_0)
		);

	Multint
		Multint_inst_1(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_Multint_multiplicand_1),
			.b (r_ip_Multint_multiplier_1),
			.p (w_ip_Multint_product_1)
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h3) || (r_sys_subBprocess_step==6'hc) || (r_sys_subBprocess_step==6'h15) || (r_sys_subBprocess_step==6'h1e)) begin
										r_ip_Multint_multiplicand_0 <= w_sys_tmp14;

									end
									else
									if((r_sys_subBprocess_step==6'h0) || (r_sys_subBprocess_step==6'h1) || (r_sys_subBprocess_step==6'h2)) begin
										r_ip_Multint_multiplicand_0 <= w_sys_tmp5;

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

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h3) || (r_sys_subBprocess_step==6'hc) || (r_sys_subBprocess_step==6'h15) || (r_sys_subBprocess_step==6'h1e)) begin
										r_ip_Multint_multiplier_0 <= r_subBprocess_copy0_i_6;

									end
									else
									if((r_sys_subBprocess_step==6'h0) || (r_sys_subBprocess_step==6'h1) || (r_sys_subBprocess_step==6'h2)) begin
										r_ip_Multint_multiplier_0 <= w_sys_tmp6;

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

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0) || (r_sys_subBprocess_step==6'h1) || (r_sys_subBprocess_step==6'h2) || (r_sys_subBprocess_step==6'h4)) begin
										r_ip_Multint_multiplicand_1 <= w_sys_tmp9;

									end
									else
									if((r_sys_subBprocess_step==6'h3)) begin
										r_ip_Multint_multiplicand_1 <= w_sys_tmp5;

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

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0) || (r_sys_subBprocess_step==6'h1) || (r_sys_subBprocess_step==6'h2) || (r_sys_subBprocess_step==6'h4)) begin
										r_ip_Multint_multiplier_1 <= w_sys_tmp10;

									end
									else
									if((r_sys_subBprocess_step==6'h3)) begin
										r_ip_Multint_multiplier_1 <= w_sys_tmp6;

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
					r_sys_processing_methodID <= ((i_subBprocess_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h13: begin
							r_sys_processing_methodID <= r_sys_subBprocess_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_subBprocess_return <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h10: begin
							r_sys_subBprocess_return <= w_sys_tmp121;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_subBprocess_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_subBprocess_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_subBprocess_phase <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h0: begin
							r_sys_subBprocess_phase <= 5'h2;
						end

						5'h2: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_phase <= ((w_sys_tmp1) ? 5'h8 : 5'h9);

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h23)) begin
										r_sys_subBprocess_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_phase <= 5'hb;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_phase <= 5'hc;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_phase <= ((w_sys_tmp83) ? 5'hf : 5'h11);

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h5)) begin
										r_sys_subBprocess_phase <= 5'hc;

									end
								end

							endcase
						end

						5'h10: begin
							r_sys_subBprocess_phase <= 5'h13;
						end

						5'h11: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_phase <= 5'h10;

									end
								end

							endcase
						end

						5'h13: begin
							r_sys_subBprocess_phase <= 5'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_subBprocess_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h2: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_stage <= w_sys_subBprocess_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h23)) begin
										r_sys_subBprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_stage <= w_sys_subBprocess_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h5)) begin
										r_sys_subBprocess_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_stage <= 2'h0;

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
			r_sys_subBprocess_step <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h2: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_step <= 6'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_step <= 6'h0;

									end
								end

								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_step <= 6'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_step <= 6'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h23)) begin
										r_sys_subBprocess_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h22)) begin
										r_sys_subBprocess_step <= w_sys_subBprocess_step_p1;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_step <= 6'h0;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_step <= 6'h0;

									end
								end

								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_step <= 6'h0;

									end
								end

							endcase
						end

						5'hc: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_step <= 6'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h5)) begin
										r_sys_subBprocess_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h4)) begin
										r_sys_subBprocess_step <= w_sys_subBprocess_step_p1;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_sys_subBprocess_step <= 6'h0;

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
			r_sys_subBprocess_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_subBprocess_busy <= ((i_subBprocess_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h0: begin
							r_sys_subBprocess_busy <= w_sys_boolTrue;
						end

						5'h13: begin
							r_sys_subBprocess_busy <= w_sys_boolFalse;
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
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0) || (r_sys_subBprocess_step==6'h9) || (r_sys_subBprocess_step==6'h12) || (r_sys_subBprocess_step==6'h1b)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_subBprocess_copy2_i_8[4:0] );

									end
									else
									if((r_sys_subBprocess_step==6'h8) || (r_sys_subBprocess_step==6'h11) || (r_sys_subBprocess_step==6'h1a) || (r_sys_subBprocess_step==6'h23)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_subBprocess_copy3_i_9[4:0] );

									end
									else
									if((r_sys_subBprocess_step==6'h1) || (r_sys_subBprocess_step==6'ha) || (r_sys_subBprocess_step==6'h13) || (r_sys_subBprocess_step==6'h1c)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_subBprocess_copy1_i_7[4:0] );

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h3)) begin
										r_fld_arrayB_0_addr_1 <= $signed( r_subBprocess_copy0_i_13[4:0] );

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

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h8) || (r_sys_subBprocess_step==6'h11) || (r_sys_subBprocess_step==6'h1a) || (r_sys_subBprocess_step==6'h23)) begin
										r_fld_arrayB_0_datain_1 <= w_sys_tmp12;

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
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h8) || (r_sys_subBprocess_step==6'h11) || (r_sys_subBprocess_step==6'h1a) || (r_sys_subBprocess_step==6'h23)) begin
										r_fld_arrayB_0_r_w_1 <= w_sys_boolTrue;

									end
									else
									if((r_sys_subBprocess_step==6'h0) || (r_sys_subBprocess_step==6'h1) || (r_sys_subBprocess_step==6'h9) || (r_sys_subBprocess_step==6'ha) || (r_sys_subBprocess_step==6'h12) || (r_sys_subBprocess_step==6'h13) || (r_sys_subBprocess_step==6'h1b) || (r_sys_subBprocess_step==6'h1c)) begin
										r_fld_arrayB_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h3)) begin
										r_fld_arrayB_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h13: begin
							r_fld_arrayB_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_subBprocess_ax_1_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h5<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h8)) begin
										r_subBprocess_ax_1_addr <= r_subBprocess_i_4;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h3)) begin
										r_subBprocess_ax_1_addr <= r_subBprocess_i_4;

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

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h8)) begin
										r_subBprocess_ax_1_datain <= w_sys_tmp8;

									end
									else
									if((r_sys_subBprocess_step==6'h5) || (r_sys_subBprocess_step==6'h6) || (r_sys_subBprocess_step==6'h7)) begin
										r_subBprocess_ax_1_datain <= w_sys_tmp4;

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
			r_subBprocess_ax_1_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h5<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h8)) begin
										r_subBprocess_ax_1_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h3)) begin
										r_subBprocess_ax_1_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h13: begin
							r_subBprocess_ax_1_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_subBprocess_bx_2_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h5) || (r_sys_subBprocess_step==6'h6) || (r_sys_subBprocess_step==6'h7) || (r_sys_subBprocess_step==6'h9)) begin
										r_subBprocess_bx_2_addr <= r_subBprocess_copy5_i_11;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h3)) begin
										r_subBprocess_bx_2_addr <= r_subBprocess_copy1_i_14;

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

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h5) || (r_sys_subBprocess_step==6'h6) || (r_sys_subBprocess_step==6'h7) || (r_sys_subBprocess_step==6'h9)) begin
										r_subBprocess_bx_2_datain <= w_sys_tmp8;

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
			r_subBprocess_bx_2_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h5) || (r_sys_subBprocess_step==6'h6) || (r_sys_subBprocess_step==6'h7) || (r_sys_subBprocess_step==6'h9)) begin
										r_subBprocess_bx_2_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h3)) begin
										r_subBprocess_bx_2_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h13: begin
							r_subBprocess_bx_2_r_w <= w_sys_boolFalse;
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
					r_subBprocess_dataNum_3 <= ((i_subBprocess_req) ? i_subBprocess_dataNum_3 : r_subBprocess_dataNum_3);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_subBprocess_phase) 
						5'h2: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_i_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_i_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h5<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h8)) begin
										r_subBprocess_i_4 <= w_sys_tmp22;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_i_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h3)) begin
										r_subBprocess_i_4 <= w_sys_tmp93;

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

					case(r_sys_subBprocess_phase) 
						5'h9: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_ret_5 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h2<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h5)) begin
										r_subBprocess_ret_5 <= w_sys_tmp85;

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

					case(r_sys_subBprocess_phase) 
						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_copy0_i_6 <= r_subBprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h3) || (r_sys_subBprocess_step==6'hc) || (r_sys_subBprocess_step==6'h15) || (r_sys_subBprocess_step==6'h1e)) begin
										r_subBprocess_copy0_i_6 <= w_sys_tmp15;

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

					case(r_sys_subBprocess_phase) 
						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_copy1_i_7 <= r_subBprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h1) || (r_sys_subBprocess_step==6'ha) || (r_sys_subBprocess_step==6'h13) || (r_sys_subBprocess_step==6'h1c)) begin
										r_subBprocess_copy1_i_7 <= w_sys_tmp16;

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

					case(r_sys_subBprocess_phase) 
						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_copy2_i_8 <= r_subBprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0) || (r_sys_subBprocess_step==6'h9) || (r_sys_subBprocess_step==6'h12) || (r_sys_subBprocess_step==6'h1b)) begin
										r_subBprocess_copy2_i_8 <= w_sys_tmp17;

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

					case(r_sys_subBprocess_phase) 
						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_copy3_i_9 <= r_subBprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h8) || (r_sys_subBprocess_step==6'h11) || (r_sys_subBprocess_step==6'h1a) || (r_sys_subBprocess_step==6'h23)) begin
										r_subBprocess_copy3_i_9 <= w_sys_tmp18;

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

					case(r_sys_subBprocess_phase) 
						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_copy4_i_10 <= r_subBprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h0) || (r_sys_subBprocess_step==6'h1) || (r_sys_subBprocess_step==6'h2) || (r_sys_subBprocess_step==6'h4)) begin
										r_subBprocess_copy4_i_10 <= w_sys_tmp19;

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

					case(r_sys_subBprocess_phase) 
						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_copy5_i_11 <= r_subBprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h5) || (r_sys_subBprocess_step==6'h6) || (r_sys_subBprocess_step==6'h7) || (r_sys_subBprocess_step==6'h9)) begin
										r_subBprocess_copy5_i_11 <= w_sys_tmp20;

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

					case(r_sys_subBprocess_phase) 
						5'h4: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_copy6_i_12 <= r_subBprocess_i_4;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h3)) begin
										r_subBprocess_copy6_i_12 <= w_sys_tmp21;

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

					case(r_sys_subBprocess_phase) 
						5'hb: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_copy0_i_13 <= r_subBprocess_i_4;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h3)) begin
										r_subBprocess_copy0_i_13 <= w_sys_tmp91;

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

					case(r_sys_subBprocess_phase) 
						5'hb: begin

							case(r_sys_subBprocess_stage) 
								2'h1: begin
									if((r_sys_subBprocess_step==6'h0)) begin
										r_subBprocess_copy1_i_14 <= r_subBprocess_i_4;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((6'h0<=r_sys_subBprocess_step && r_sys_subBprocess_step<=6'h3)) begin
										r_subBprocess_copy1_i_14 <= w_sys_tmp92;

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

					case(r_sys_subBprocess_phase) 
						5'h8: begin

							case(r_sys_subBprocess_stage) 
								2'h0: begin
									if((r_sys_subBprocess_step==6'h2) || (r_sys_subBprocess_step==6'hb) || (r_sys_subBprocess_step==6'h14) || (r_sys_subBprocess_step==6'h1d)) begin
										r_sys_tmp0_int <= w_fld_arrayB_0_dataout_1;

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
