/*
TimeStamp:	2013/12/16		12:59
*/


module SumOfProducts(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_sumOfProducts_req,	
	output                o_sumOfProducts_busy,	
	output signed  [31:0] o_sumOfProducts_return,	
	output signed  [31:0] o_sumOfProducts_arrayA_0_addr,	
	output         [31:0] o_sumOfProducts_arrayA_0_datain,	
	input          [31:0] i_sumOfProducts_arrayA_0_dataout,	
	output                o_sumOfProducts_arrayA_0_r_w,	
	output                o_sumOfProducts_arrayA_0_ce,	
	input                 i_sumOfProducts_arrayA_0_cacheHit,	
	output signed  [31:0] o_sumOfProducts_arrayB_1_addr,	
	output         [31:0] o_sumOfProducts_arrayB_1_datain,	
	input          [31:0] i_sumOfProducts_arrayB_1_dataout,	
	output                o_sumOfProducts_arrayB_1_r_w,	
	output                o_sumOfProducts_arrayB_1_ce,	
	input                 i_sumOfProducts_arrayB_1_cacheHit,	
	input  signed  [31:0] i_sumOfProducts_len_2	
);

	reg                r_sys_setInitValue_arbiter0;
	reg         [31:0] r_ip_AddFloat_portA_0;
	reg         [31:0] r_ip_AddFloat_portB_0;
	wire        [31:0] w_ip_AddFloat_result_0;
	reg         [31:0] r_ip_MultFloat_multiplicand_0;
	reg         [31:0] r_ip_MultFloat_multiplier_0;
	wire        [31:0] w_ip_MultFloat_product_0;
	reg  signed [31:0] r_ip_FixedToFloat_fixed_0;
	wire        [31:0] w_ip_FixedToFloat_floating_0;
	reg  signed [31:0] r_ip_FixedToFloat_fixed_1;
	wire        [31:0] w_ip_FixedToFloat_floating_1;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [31:0] r_sys_sumOfProducts_return;
	reg         [ 1:0] r_sys_sumOfProducts_caller;
	reg                r_sys_sumOfProducts_req;
	reg         [ 3:0] r_sys_sumOfProducts_phase;
	reg         [ 1:0] r_sys_sumOfProducts_stage;
	reg         [ 6:0] r_sys_sumOfProducts_step;
	reg                r_sys_sumOfProducts_busy;
	wire        [ 1:0] w_sys_sumOfProducts_stage_p1;
	wire        [ 6:0] w_sys_sumOfProducts_step_p1;
	reg         [ 1:0] r_sys_setInitValue_caller;
	reg                r_sys_setInitValue_req;
	reg         [ 3:0] r_sys_setInitValue_phase;
	reg         [ 1:0] r_sys_setInitValue_stage;
	reg         [ 4:0] r_sys_setInitValue_step;
	reg                r_sys_setInitValue_busy;
	wire        [ 1:0] w_sys_setInitValue_stage_p1;
	wire        [ 4:0] w_sys_setInitValue_step_p1;
	reg  signed [31:0] r_sumOfProducts_arrayA_0_addr;
	reg         [31:0] r_sumOfProducts_arrayA_0_datain;
	wire        [31:0] w_sumOfProducts_arrayA_0_dataout;
	reg                r_sumOfProducts_arrayA_0_r_w;
	wire signed [31:0] w_sumOfProducts_arrayA_0_addr;
	wire        [31:0] w_sumOfProducts_arrayA_0_datain;
	wire               w_sumOfProducts_arrayA_0_r_w;
	wire               w_sumOfProducts_arrayA_0_ce;
	wire               w_sumOfProducts_arrayA_0_cacheHit;
	reg  signed [31:0] r_sumOfProducts_arrayB_1_addr;
	reg         [31:0] r_sumOfProducts_arrayB_1_datain;
	wire        [31:0] w_sumOfProducts_arrayB_1_dataout;
	reg                r_sumOfProducts_arrayB_1_r_w;
	wire signed [31:0] w_sumOfProducts_arrayB_1_addr;
	wire        [31:0] w_sumOfProducts_arrayB_1_datain;
	wire               w_sumOfProducts_arrayB_1_r_w;
	wire               w_sumOfProducts_arrayB_1_ce;
	wire               w_sumOfProducts_arrayB_1_cacheHit;
	reg  signed [31:0] r_sumOfProducts_len_2;
	reg         [31:0] r_sumOfProducts_ret_3;
	reg  signed [31:0] r_sumOfProducts_i_4;
	reg  signed [31:0] r_setInitValue_arrayA_5_addr;
	reg         [31:0] r_setInitValue_arrayA_5_datain;
	wire        [31:0] w_setInitValue_arrayA_5_dataout;
	reg                r_setInitValue_arrayA_5_r_w;
	wire signed [31:0] w_setInitValue_arrayA_5_addr;
	wire        [31:0] w_setInitValue_arrayA_5_datain;
	wire               w_setInitValue_arrayA_5_r_w;
	wire               w_setInitValue_arrayA_5_ce;
	wire               w_setInitValue_arrayA_5_cacheHit;
	reg  signed [31:0] r_setInitValue_arrayB_6_addr;
	reg         [31:0] r_setInitValue_arrayB_6_datain;
	wire        [31:0] w_setInitValue_arrayB_6_dataout;
	reg                r_setInitValue_arrayB_6_r_w;
	wire signed [31:0] w_setInitValue_arrayB_6_addr;
	wire        [31:0] w_setInitValue_arrayB_6_datain;
	wire               w_setInitValue_arrayB_6_r_w;
	wire               w_setInitValue_arrayB_6_ce;
	wire               w_setInitValue_arrayB_6_cacheHit;
	reg  signed [31:0] r_setInitValue_len_7;
	reg  signed [31:0] r_setInitValue_i_8;
	reg  signed [31:0] r_sumOfProducts_copy0_i_9;
	reg  signed [31:0] r_setInitValue_copy0_i_10;
	reg  signed [31:0] r_setInitValue_copy1_i_11;
	reg  signed [31:0] r_setInitValue_copy2_i_12;
	reg         [31:0] r_sys_tmp0_float;
	reg         [31:0] r_sys_tmp1_float;
	reg         [31:0] r_sys_tmp2_float;
	reg         [31:0] r_sys_tmp3_float;
	reg         [31:0] r_sys_tmp4_float;
	reg         [31:0] r_sys_tmp5_float;
	wire        [31:0] w_sys_tmp1;
	wire               w_sys_tmp2;
	wire        [31:0] w_sys_tmp4;
	wire        [31:0] w_sys_tmp5;
	wire        [31:0] w_sys_tmp6;
	wire        [31:0] w_sys_tmp7;
	wire signed [31:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;
	wire        [31:0] w_sys_tmp11;
	wire        [31:0] w_sys_tmp52;
	wire               w_sys_tmp53;
	wire        [31:0] w_sys_tmp56;
	wire        [31:0] w_sys_tmp58;
	wire signed [31:0] w_sys_tmp59;
	wire signed [31:0] w_sys_tmp61;
	wire signed [31:0] w_sys_tmp62;
	wire signed [31:0] w_sys_tmp63;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_sumOfProducts_arrayA_0_cacheHit & w_sumOfProducts_arrayB_1_cacheHit & w_setInitValue_arrayA_5_cacheHit & w_setInitValue_arrayB_6_cacheHit;
	assign o_sumOfProducts_busy = r_sys_sumOfProducts_busy;
	assign o_sumOfProducts_return = r_sys_sumOfProducts_return;
	assign w_sys_sumOfProducts_stage_p1 = (r_sys_sumOfProducts_stage + 2'h1);
	assign w_sys_sumOfProducts_step_p1 = (r_sys_sumOfProducts_step + 7'h1);
	assign w_sys_setInitValue_stage_p1 = (r_sys_setInitValue_stage + 2'h1);
	assign w_sys_setInitValue_step_p1 = (r_sys_setInitValue_step + 5'h1);
	assign w_sumOfProducts_arrayA_0_dataout = i_sumOfProducts_arrayA_0_dataout;
	assign w_sumOfProducts_arrayA_0_addr = ( r_sys_setInitValue_arbiter0 ? w_setInitValue_arrayA_5_addr : r_sumOfProducts_arrayA_0_addr ) ;
	assign w_sumOfProducts_arrayA_0_datain = ( r_sys_setInitValue_arbiter0 ? w_setInitValue_arrayA_5_datain : r_sumOfProducts_arrayA_0_datain ) ;
	assign w_sumOfProducts_arrayA_0_r_w = ( r_sys_setInitValue_arbiter0 ? w_setInitValue_arrayA_5_r_w : r_sumOfProducts_arrayA_0_r_w ) ;
	assign w_sumOfProducts_arrayA_0_ce = w_sys_ce;
	assign w_sumOfProducts_arrayA_0_cacheHit = i_sumOfProducts_arrayA_0_cacheHit;
	assign o_sumOfProducts_arrayA_0_addr = w_sumOfProducts_arrayA_0_addr;
	assign o_sumOfProducts_arrayA_0_datain = w_sumOfProducts_arrayA_0_datain;
	assign o_sumOfProducts_arrayA_0_r_w = w_sumOfProducts_arrayA_0_r_w;
	assign o_sumOfProducts_arrayA_0_ce = w_sumOfProducts_arrayA_0_ce;
	assign w_sumOfProducts_arrayB_1_dataout = i_sumOfProducts_arrayB_1_dataout;
	assign w_sumOfProducts_arrayB_1_addr = ( r_sys_setInitValue_arbiter0 ? w_setInitValue_arrayB_6_addr : r_sumOfProducts_arrayB_1_addr ) ;
	assign w_sumOfProducts_arrayB_1_datain = ( r_sys_setInitValue_arbiter0 ? w_setInitValue_arrayB_6_datain : r_sumOfProducts_arrayB_1_datain ) ;
	assign w_sumOfProducts_arrayB_1_r_w = ( r_sys_setInitValue_arbiter0 ? w_setInitValue_arrayB_6_r_w : r_sumOfProducts_arrayB_1_r_w ) ;
	assign w_sumOfProducts_arrayB_1_ce = w_sys_ce;
	assign w_sumOfProducts_arrayB_1_cacheHit = i_sumOfProducts_arrayB_1_cacheHit;
	assign o_sumOfProducts_arrayB_1_addr = w_sumOfProducts_arrayB_1_addr;
	assign o_sumOfProducts_arrayB_1_datain = w_sumOfProducts_arrayB_1_datain;
	assign o_sumOfProducts_arrayB_1_r_w = w_sumOfProducts_arrayB_1_r_w;
	assign o_sumOfProducts_arrayB_1_ce = w_sumOfProducts_arrayB_1_ce;
	assign w_setInitValue_arrayA_5_dataout = ( r_sys_setInitValue_arbiter0 ? w_sumOfProducts_arrayA_0_dataout : 32'h0 ) ;
	assign w_setInitValue_arrayA_5_addr = r_setInitValue_arrayA_5_addr;
	assign w_setInitValue_arrayA_5_datain = r_setInitValue_arrayA_5_datain;
	assign w_setInitValue_arrayA_5_r_w = r_setInitValue_arrayA_5_r_w;
	assign w_setInitValue_arrayA_5_ce = w_sys_ce;
	assign w_setInitValue_arrayA_5_cacheHit = ( r_sys_setInitValue_arbiter0 ? w_sumOfProducts_arrayA_0_cacheHit : w_sys_boolTrue ) ;
	assign w_setInitValue_arrayB_6_dataout = ( r_sys_setInitValue_arbiter0 ? w_sumOfProducts_arrayB_1_dataout : 32'h0 ) ;
	assign w_setInitValue_arrayB_6_addr = r_setInitValue_arrayB_6_addr;
	assign w_setInitValue_arrayB_6_datain = r_setInitValue_arrayB_6_datain;
	assign w_setInitValue_arrayB_6_r_w = r_setInitValue_arrayB_6_r_w;
	assign w_setInitValue_arrayB_6_ce = w_sys_ce;
	assign w_setInitValue_arrayB_6_cacheHit = ( r_sys_setInitValue_arbiter0 ? w_sumOfProducts_arrayB_1_cacheHit : w_sys_boolTrue ) ;
	assign w_sys_tmp1 = 32'h0;
	assign w_sys_tmp2 = (r_sumOfProducts_i_4 < r_sumOfProducts_len_2);
	assign w_sys_tmp4 = w_ip_AddFloat_result_0;
	assign w_sys_tmp5 = w_ip_MultFloat_product_0;
	assign w_sys_tmp6 = w_sumOfProducts_arrayA_0_dataout;
	assign w_sys_tmp7 = w_sumOfProducts_arrayB_1_dataout;
	assign w_sys_tmp8 = (r_sumOfProducts_copy0_i_9 + w_sys_intOne);
	assign w_sys_tmp9 = (r_sumOfProducts_i_4 + w_sys_intOne);
	assign w_sys_tmp11 = w_sys_tmp4;
	assign w_sys_tmp52 = r_sumOfProducts_ret_3;
	assign w_sys_tmp53 = (r_setInitValue_i_8 < r_setInitValue_len_7);
	assign w_sys_tmp56 = w_ip_FixedToFloat_floating_0;
	assign w_sys_tmp58 = w_ip_FixedToFloat_floating_1;
	assign w_sys_tmp59 = (r_setInitValue_copy0_i_10 + w_sys_intOne);
	assign w_sys_tmp61 = (r_setInitValue_copy1_i_11 + w_sys_intOne);
	assign w_sys_tmp62 = (r_setInitValue_copy2_i_12 + w_sys_intOne);
	assign w_sys_tmp63 = (r_setInitValue_i_8 + w_sys_intOne);


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

	FixedToFloat
		FixedToFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_FixedToFloat_fixed_0),
			.result (w_ip_FixedToFloat_floating_0)
		);

	FixedToFloat
		FixedToFloat_inst_1(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_FixedToFloat_fixed_1),
			.result (w_ip_FixedToFloat_floating_1)
		);

	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setInitValue_arbiter0 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h2: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h1)) begin
										r_sys_setInitValue_arbiter0 <= w_sys_boolFalse;

									end
									else
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_setInitValue_arbiter0 <= w_sys_boolTrue;

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

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h10) || (r_sys_sumOfProducts_step==7'h17) || (r_sys_sumOfProducts_step==7'h1e) || (r_sys_sumOfProducts_step==7'h25) || (r_sys_sumOfProducts_step==7'h2c) || (r_sys_sumOfProducts_step==7'h33) || (r_sys_sumOfProducts_step==7'h3a)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp11;

									end
									else
									if((r_sys_sumOfProducts_step==7'h9)) begin
										r_ip_AddFloat_portA_0 <= r_sumOfProducts_ret_3;

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

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h2c)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp1_float;

									end
									else
									if((r_sys_sumOfProducts_step==7'h10) || (r_sys_sumOfProducts_step==7'h3a)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp5_float;

									end
									else
									if((r_sys_sumOfProducts_step==7'h25)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp2_float;

									end
									else
									if((r_sys_sumOfProducts_step==7'h17)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp4_float;

									end
									else
									if((r_sys_sumOfProducts_step==7'h1e)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp3_float;

									end
									else
									if((r_sys_sumOfProducts_step==7'h33)) begin
										r_ip_AddFloat_portB_0 <= r_sys_tmp0_float;

									end
									else
									if((r_sys_sumOfProducts_step==7'h9)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp5;

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

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((7'h2<=r_sys_sumOfProducts_step && r_sys_sumOfProducts_step<=7'h9)) begin
										r_ip_MultFloat_multiplicand_0 <= w_sys_tmp6;

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

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((7'h2<=r_sys_sumOfProducts_step && r_sys_sumOfProducts_step<=7'h9)) begin
										r_ip_MultFloat_multiplier_0 <= w_sys_tmp7;

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
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h0<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'h7)) begin
										r_ip_FixedToFloat_fixed_0 <= r_setInitValue_copy2_i_12;

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
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h0<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'h7)) begin
										r_ip_FixedToFloat_fixed_1 <= w_sys_tmp59;

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
					r_sys_processing_methodID <= ((i_sumOfProducts_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h2: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_processing_methodID <= 2'h2;

									end
								end

							endcase
						end

						4'hc: begin
							r_sys_processing_methodID <= r_sys_sumOfProducts_caller;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h9: begin
							r_sys_processing_methodID <= r_sys_setInitValue_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumOfProducts_return <= 32'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h9: begin
							r_sys_sumOfProducts_return <= w_sys_tmp52;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumOfProducts_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumOfProducts_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumOfProducts_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h0: begin
							r_sys_sumOfProducts_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_sumOfProducts_stage) 
								2'h1: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumOfProducts_stage) 
								2'h1: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_phase <= ((w_sys_tmp2) ? 4'h8 : 4'ha);

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h41)) begin
										r_sys_sumOfProducts_phase <= 4'h5;

									end
								end

							endcase
						end

						4'h9: begin
							r_sys_sumOfProducts_phase <= 4'hc;
						end

						4'ha: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_phase <= 4'h9;

									end
								end

							endcase
						end

						4'hc: begin
							r_sys_sumOfProducts_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_sumOfProducts_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h2: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h1)) begin
										r_sys_sumOfProducts_stage <= w_sys_sumOfProducts_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_stage <= w_sys_sumOfProducts_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h41)) begin
										r_sys_sumOfProducts_stage <= 2'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_stage <= 2'h0;

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
			r_sys_sumOfProducts_step <= 7'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h2: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_step <= w_sys_sumOfProducts_step_p1;

									end
									else
									if((r_sys_sumOfProducts_step==7'h1)) begin
										r_sys_sumOfProducts_step <= 7'h0;

									end
								end

								2'h1: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_step <= 7'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_step <= 7'h0;

									end
								end

								2'h1: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_step <= 7'h0;

									end
								end

							endcase
						end

						4'h5: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_step <= 7'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sumOfProducts_step && r_sys_sumOfProducts_step<=7'h40)) begin
										r_sys_sumOfProducts_step <= w_sys_sumOfProducts_step_p1;

									end
									else
									if((r_sys_sumOfProducts_step==7'h41)) begin
										r_sys_sumOfProducts_step <= 7'h0;

									end
								end

							endcase
						end

						4'ha: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_sumOfProducts_step <= 7'h0;

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
			r_sys_sumOfProducts_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_sumOfProducts_busy <= ((i_sumOfProducts_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h0: begin
							r_sys_sumOfProducts_busy <= w_sys_boolTrue;
						end

						4'hc: begin
							r_sys_sumOfProducts_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setInitValue_caller <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h2: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sys_setInitValue_caller <= r_sys_processing_methodID;

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
			r_sys_setInitValue_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setInitValue_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h0: begin
							r_sys_setInitValue_phase <= 4'h3;
						end

						4'h3: begin

							case(r_sys_setInitValue_stage) 
								2'h1: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_sys_setInitValue_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_sys_setInitValue_phase <= ((w_sys_tmp53) ? 4'h7 : 4'h9);

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((r_sys_setInitValue_step==5'he)) begin
										r_sys_setInitValue_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h9: begin
							r_sys_setInitValue_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setInitValue_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h3: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_sys_setInitValue_stage <= w_sys_setInitValue_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_sys_setInitValue_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_sys_setInitValue_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((r_sys_setInitValue_step==5'he)) begin
										r_sys_setInitValue_stage <= 2'h0;

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
			r_sys_setInitValue_step <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h3: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_sys_setInitValue_step <= 5'h0;

									end
								end

								2'h1: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_sys_setInitValue_step <= 5'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_sys_setInitValue_step <= 5'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((r_sys_setInitValue_step==5'he)) begin
										r_sys_setInitValue_step <= 5'h0;

									end
									else
									if((5'h0<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'hd)) begin
										r_sys_setInitValue_step <= w_sys_setInitValue_step_p1;

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
			r_sys_setInitValue_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h0: begin
							r_sys_setInitValue_busy <= w_sys_boolTrue;
						end

						4'h9: begin
							r_sys_setInitValue_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sumOfProducts_arrayA_0_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sumOfProducts_step && r_sys_sumOfProducts_step<=7'h7)) begin
										r_sumOfProducts_arrayA_0_addr <= r_sumOfProducts_i_4;

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
			r_sumOfProducts_arrayA_0_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sumOfProducts_step && r_sys_sumOfProducts_step<=7'h7)) begin
										r_sumOfProducts_arrayA_0_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hc: begin
							r_sumOfProducts_arrayA_0_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h9: begin
							r_sumOfProducts_arrayA_0_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sumOfProducts_arrayB_1_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sumOfProducts_step && r_sys_sumOfProducts_step<=7'h7)) begin
										r_sumOfProducts_arrayB_1_addr <= r_sumOfProducts_copy0_i_9;

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
			r_sumOfProducts_arrayB_1_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sumOfProducts_step && r_sys_sumOfProducts_step<=7'h7)) begin
										r_sumOfProducts_arrayB_1_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'hc: begin
							r_sumOfProducts_arrayB_1_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h9: begin
							r_sumOfProducts_arrayB_1_r_w <= w_sys_boolFalse;
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
					r_sumOfProducts_len_2 <= ((i_sumOfProducts_req) ? i_sumOfProducts_len_2 : r_sumOfProducts_len_2);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'h2: begin

							case(r_sys_sumOfProducts_stage) 
								2'h1: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sumOfProducts_ret_3 <= w_sys_tmp1;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h10) || (r_sys_sumOfProducts_step==7'h17) || (r_sys_sumOfProducts_step==7'h1e) || (r_sys_sumOfProducts_step==7'h25) || (r_sys_sumOfProducts_step==7'h2c) || (r_sys_sumOfProducts_step==7'h33) || (r_sys_sumOfProducts_step==7'h3a) || (r_sys_sumOfProducts_step==7'h41)) begin
										r_sumOfProducts_ret_3 <= w_sys_tmp4;

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

					case(r_sys_sumOfProducts_phase) 
						4'h4: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sumOfProducts_i_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sumOfProducts_step && r_sys_sumOfProducts_step<=7'h7)) begin
										r_sumOfProducts_i_4 <= w_sys_tmp9;

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
			r_setInitValue_arrayA_5_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h7<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'he)) begin
										r_setInitValue_arrayA_5_addr <= r_setInitValue_i_8;

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
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h7<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'he)) begin
										r_setInitValue_arrayA_5_datain <= w_sys_tmp56;

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
			r_setInitValue_arrayA_5_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'hc: begin
							r_setInitValue_arrayA_5_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h7<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'he)) begin
										r_setInitValue_arrayA_5_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'h9: begin
							r_setInitValue_arrayA_5_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_setInitValue_arrayB_6_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h7<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'he)) begin
										r_setInitValue_arrayB_6_addr <= r_setInitValue_copy1_i_11;

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
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h7<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'he)) begin
										r_setInitValue_arrayB_6_datain <= w_sys_tmp58;

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
			r_setInitValue_arrayB_6_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_sumOfProducts_phase) 
						4'hc: begin
							r_setInitValue_arrayB_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h7<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'he)) begin
										r_setInitValue_arrayB_6_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'h9: begin
							r_setInitValue_arrayB_6_r_w <= w_sys_boolFalse;
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

					case(r_sys_sumOfProducts_phase) 
						4'h2: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_setInitValue_len_7 <= r_sumOfProducts_len_2;

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
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h3: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_setInitValue_i_8 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h7<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'he)) begin
										r_setInitValue_i_8 <= w_sys_tmp63;

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

					case(r_sys_sumOfProducts_phase) 
						4'h4: begin

							case(r_sys_sumOfProducts_stage) 
								2'h1: begin
									if((r_sys_sumOfProducts_step==7'h0)) begin
										r_sumOfProducts_copy0_i_9 <= r_sumOfProducts_i_4;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((7'h0<=r_sys_sumOfProducts_step && r_sys_sumOfProducts_step<=7'h7)) begin
										r_sumOfProducts_copy0_i_9 <= w_sys_tmp8;

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
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h3: begin

							case(r_sys_setInitValue_stage) 
								2'h1: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_setInitValue_copy0_i_10 <= r_setInitValue_i_8;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h0<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'h7)) begin
										r_setInitValue_copy0_i_10 <= w_sys_tmp59;

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
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h3: begin

							case(r_sys_setInitValue_stage) 
								2'h1: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_setInitValue_copy1_i_11 <= r_setInitValue_i_8;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h7<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'he)) begin
										r_setInitValue_copy1_i_11 <= w_sys_tmp61;

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
				2'h2: begin

					case(r_sys_setInitValue_phase) 
						4'h3: begin

							case(r_sys_setInitValue_stage) 
								2'h1: begin
									if((r_sys_setInitValue_step==5'h0)) begin
										r_setInitValue_copy2_i_12 <= r_setInitValue_i_8;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_setInitValue_stage) 
								2'h0: begin
									if((5'h0<=r_sys_setInitValue_step && r_sys_setInitValue_step<=5'h7)) begin
										r_setInitValue_copy2_i_12 <= w_sys_tmp62;

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

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'hf)) begin
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

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'he)) begin
										r_sys_tmp1_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'hd)) begin
										r_sys_tmp2_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'hc)) begin
										r_sys_tmp3_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'hb)) begin
										r_sys_tmp4_float <= w_ip_MultFloat_product_0;

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

					case(r_sys_sumOfProducts_phase) 
						4'h8: begin

							case(r_sys_sumOfProducts_stage) 
								2'h0: begin
									if((r_sys_sumOfProducts_step==7'ha) || (r_sys_sumOfProducts_step==7'h10)) begin
										r_sys_tmp5_float <= w_ip_MultFloat_product_0;

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
