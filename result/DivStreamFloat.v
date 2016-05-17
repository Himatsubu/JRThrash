/*
TimeStamp:	2013/12/16		12:59
*/


module DivStreamFloat(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_divStream_req,	
	output                o_divStream_busy,	
	output signed  [31:0] o_divStream_a_0_addr,	
	output         [63:0] o_divStream_a_0_datain,	
	input          [63:0] i_divStream_a_0_dataout,	
	output                o_divStream_a_0_r_w,	
	output                o_divStream_a_0_ce,	
	output signed  [31:0] o_divStream_b_1_addr,	
	output         [63:0] o_divStream_b_1_datain,	
	input          [63:0] i_divStream_b_1_dataout,	
	output                o_divStream_b_1_r_w,	
	output                o_divStream_b_1_ce,	
	output signed  [31:0] o_divStream_result_2_addr,	
	output         [63:0] o_divStream_result_2_datain,	
	input          [63:0] i_divStream_result_2_dataout,	
	output                o_divStream_result_2_r_w,	
	output                o_divStream_result_2_ce	
);

	reg  signed [31:0] r_ip_MultInt_multiplicand_0;
	reg  signed [31:0] r_ip_MultInt_multiplier_0;
	wire signed [63:0] w_ip_MultInt_product_0;
	reg         [63:0] r_ip_AddFloat_portA_0;
	reg         [63:0] r_ip_AddFloat_portB_0;
	wire        [63:0] w_ip_AddFloat_result_0;
	reg         [63:0] r_ip_DivFloat_dividend_0;
	reg         [63:0] r_ip_DivFloat_divisor_0;
	wire        [63:0] w_ip_DivFloat_quotient_0;
	reg                r_ip_DivFloat_newData_0;
	reg         [63:0] r_ip_DivFloat_dividend_1;
	reg         [63:0] r_ip_DivFloat_divisor_1;
	wire        [63:0] w_ip_DivFloat_quotient_1;
	reg                r_ip_DivFloat_newData_1;
	reg         [63:0] r_ip_DivFloat_dividend_2;
	reg         [63:0] r_ip_DivFloat_divisor_2;
	wire        [63:0] w_ip_DivFloat_quotient_2;
	reg                r_ip_DivFloat_newData_2;
	reg         [63:0] r_ip_DivFloat_dividend_3;
	reg         [63:0] r_ip_DivFloat_divisor_3;
	wire        [63:0] w_ip_DivFloat_quotient_3;
	reg                r_ip_DivFloat_newData_3;
	reg  signed [31:0] r_ip_FixedToFloat_fixed_0;
	wire        [63:0] w_ip_FixedToFloat_floating_0;
	reg  signed [31:0] r_ip_FixedToFloat_fixed_1;
	wire        [63:0] w_ip_FixedToFloat_floating_1;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 1:0] r_sys_divStream_caller;
	reg                r_sys_divStream_req;
	reg         [ 4:0] r_sys_divStream_phase;
	reg         [ 1:0] r_sys_divStream_stage;
	reg         [ 6:0] r_sys_divStream_step;
	reg                r_sys_divStream_busy;
	wire        [ 1:0] w_sys_divStream_stage_p1;
	wire        [ 6:0] w_sys_divStream_step_p1;
	reg  signed [31:0] r_divStream_a_0_addr;
	reg         [63:0] r_divStream_a_0_datain;
	wire        [63:0] w_divStream_a_0_dataout;
	reg                r_divStream_a_0_r_w;
	wire signed [31:0] w_divStream_a_0_addr;
	wire        [63:0] w_divStream_a_0_datain;
	wire               w_divStream_a_0_r_w;
	wire               w_divStream_a_0_ce;
	wire               w_divStream_a_0_cacheHit;
	reg  signed [31:0] r_divStream_b_1_addr;
	reg         [63:0] r_divStream_b_1_datain;
	wire        [63:0] w_divStream_b_1_dataout;
	reg                r_divStream_b_1_r_w;
	wire signed [31:0] w_divStream_b_1_addr;
	wire        [63:0] w_divStream_b_1_datain;
	wire               w_divStream_b_1_r_w;
	wire               w_divStream_b_1_ce;
	wire               w_divStream_b_1_cacheHit;
	reg  signed [31:0] r_divStream_result_2_addr;
	reg         [63:0] r_divStream_result_2_datain;
	wire        [63:0] w_divStream_result_2_dataout;
	reg                r_divStream_result_2_r_w;
	wire signed [31:0] w_divStream_result_2_addr;
	wire        [63:0] w_divStream_result_2_datain;
	wire               w_divStream_result_2_r_w;
	wire               w_divStream_result_2_ce;
	wire               w_divStream_result_2_cacheHit;
	reg  signed [31:0] r_divStream_i_3;
	reg  signed [31:0] r_divStream_copy0_i_4;
	reg  signed [31:0] r_divStream_copy1_i_5;
	reg  signed [31:0] r_divStream_copy2_i_6;
	reg  signed [31:0] r_divStream_copy3_i_7;
	reg  signed [31:0] r_divStream_copy0_i_8;
	reg  signed [31:0] r_divStream_copy1_i_9;
	reg         [63:0] r_sys_tmp0_float;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire        [63:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire        [63:0] w_sys_tmp8;
	wire        [63:0] w_sys_tmp9;
	wire        [63:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp11;
	wire signed [31:0] w_sys_tmp12;
	wire signed [31:0] w_sys_tmp13;
	wire signed [31:0] w_sys_tmp14;
	wire signed [31:0] w_sys_tmp15;
	wire signed [31:0] w_sys_tmp21;
	wire               w_sys_tmp196;
	wire signed [31:0] w_sys_tmp197;
	wire        [63:0] w_sys_tmp200;
	wire        [63:0] w_sys_tmp201;
	wire        [63:0] w_sys_tmp202;
	wire signed [31:0] w_sys_tmp203;
	wire signed [31:0] w_sys_tmp204;
	wire signed [31:0] w_sys_tmp205;
	wire        [63:0] w_sys_tmp207;
	wire        [63:0] w_sys_tmp214;
	wire        [63:0] w_sys_tmp221;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_divStream_a_0_cacheHit & w_divStream_b_1_cacheHit & w_divStream_result_2_cacheHit;
	assign o_divStream_busy = r_sys_divStream_busy;
	assign w_sys_divStream_stage_p1 = (r_sys_divStream_stage + 2'h1);
	assign w_sys_divStream_step_p1 = (r_sys_divStream_step + 7'h1);
	assign w_divStream_a_0_dataout = i_divStream_a_0_dataout;
	assign w_divStream_a_0_addr = r_divStream_a_0_addr;
	assign w_divStream_a_0_datain = r_divStream_a_0_datain;
	assign w_divStream_a_0_r_w = r_divStream_a_0_r_w;
	assign w_divStream_a_0_ce = w_sys_ce;
	assign w_divStream_a_0_cacheHit = w_sys_boolTrue;
	assign o_divStream_a_0_addr = w_divStream_a_0_addr;
	assign o_divStream_a_0_datain = w_divStream_a_0_datain;
	assign o_divStream_a_0_r_w = w_divStream_a_0_r_w;
	assign o_divStream_a_0_ce = w_divStream_a_0_ce;
	assign w_divStream_b_1_dataout = i_divStream_b_1_dataout;
	assign w_divStream_b_1_addr = r_divStream_b_1_addr;
	assign w_divStream_b_1_datain = r_divStream_b_1_datain;
	assign w_divStream_b_1_r_w = r_divStream_b_1_r_w;
	assign w_divStream_b_1_ce = w_sys_ce;
	assign w_divStream_b_1_cacheHit = w_sys_boolTrue;
	assign o_divStream_b_1_addr = w_divStream_b_1_addr;
	assign o_divStream_b_1_datain = w_divStream_b_1_datain;
	assign o_divStream_b_1_r_w = w_divStream_b_1_r_w;
	assign o_divStream_b_1_ce = w_divStream_b_1_ce;
	assign w_divStream_result_2_dataout = i_divStream_result_2_dataout;
	assign w_divStream_result_2_addr = r_divStream_result_2_addr;
	assign w_divStream_result_2_datain = r_divStream_result_2_datain;
	assign w_divStream_result_2_r_w = r_divStream_result_2_r_w;
	assign w_divStream_result_2_ce = w_sys_ce;
	assign w_divStream_result_2_cacheHit = w_sys_boolTrue;
	assign o_divStream_result_2_addr = w_divStream_result_2_addr;
	assign o_divStream_result_2_datain = w_divStream_result_2_datain;
	assign o_divStream_result_2_r_w = w_divStream_result_2_r_w;
	assign o_divStream_result_2_ce = w_divStream_result_2_ce;
	assign w_sys_tmp1 = (r_divStream_i_3 < w_sys_tmp2);
	assign w_sys_tmp2 = 32'sh00000040;
	assign w_sys_tmp5 = w_ip_FixedToFloat_floating_1;
	assign w_sys_tmp6 = $signed( w_ip_MultInt_product_0[31:0] );
	assign w_sys_tmp8 = w_ip_AddFloat_result_0;
	assign w_sys_tmp9 = w_ip_FixedToFloat_floating_0;
	assign w_sys_tmp10 = 64'h3fe0000000000000;
	assign w_sys_tmp11 = (r_divStream_copy0_i_4 + w_sys_intOne);
	assign w_sys_tmp12 = (r_divStream_copy1_i_5 + w_sys_intOne);
	assign w_sys_tmp13 = (r_divStream_copy2_i_6 + w_sys_intOne);
	assign w_sys_tmp14 = (r_divStream_copy3_i_7 + w_sys_intOne);
	assign w_sys_tmp15 = (r_divStream_i_3 + w_sys_intOne);
	assign w_sys_tmp21 = w_sys_tmp11;
	assign w_sys_tmp196 = (r_divStream_i_3 < w_sys_tmp197);
	assign w_sys_tmp197 = 32'sh00000040;
	assign w_sys_tmp200 = w_ip_DivFloat_quotient_0;
	assign w_sys_tmp201 = w_divStream_a_0_dataout;
	assign w_sys_tmp202 = w_divStream_b_1_dataout;
	assign w_sys_tmp203 = (r_divStream_copy0_i_8 + w_sys_intOne);
	assign w_sys_tmp204 = (r_divStream_copy1_i_9 + w_sys_intOne);
	assign w_sys_tmp205 = (r_divStream_i_3 + w_sys_intOne);
	assign w_sys_tmp207 = w_ip_DivFloat_quotient_1;
	assign w_sys_tmp214 = w_ip_DivFloat_quotient_2;
	assign w_sys_tmp221 = w_ip_DivFloat_quotient_3;


	MultInt
		MultInt_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_MultInt_multiplicand_0),
			.b (r_ip_MultInt_multiplier_0),
			.p (w_ip_MultInt_product_0)
		);

	AddFloat
		AddFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_AddFloat_portA_0),
			.b (r_ip_AddFloat_portB_0),
			.result (w_ip_AddFloat_result_0)
		);

	DivFloat
		DivFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_DivFloat_dividend_0),
			.b (r_ip_DivFloat_divisor_0),
			.operation_nd (r_ip_DivFloat_newData_0),
			.result (w_ip_DivFloat_quotient_0)
		);

	DivFloat
		DivFloat_inst_1(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_DivFloat_dividend_1),
			.b (r_ip_DivFloat_divisor_1),
			.operation_nd (r_ip_DivFloat_newData_1),
			.result (w_ip_DivFloat_quotient_1)
		);

	DivFloat
		DivFloat_inst_2(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_DivFloat_dividend_2),
			.b (r_ip_DivFloat_divisor_2),
			.operation_nd (r_ip_DivFloat_newData_2),
			.result (w_ip_DivFloat_quotient_2)
		);

	DivFloat
		DivFloat_inst_3(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_DivFloat_dividend_3),
			.b (r_ip_DivFloat_divisor_3),
			.operation_nd (r_ip_DivFloat_newData_3),
			.result (w_ip_DivFloat_quotient_3)
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

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_ip_MultInt_multiplicand_0 <= r_divStream_copy3_i_7;

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

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_ip_MultInt_multiplier_0 <= r_divStream_copy2_i_6;

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

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h8<=r_sys_divStream_step && r_sys_divStream_step<=7'h16)) begin
										r_ip_AddFloat_portA_0 <= r_sys_tmp0_float;

									end
									else
									if((r_sys_divStream_step==7'h7)) begin
										r_ip_AddFloat_portA_0 <= w_sys_tmp9;

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

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h7<=r_sys_divStream_step && r_sys_divStream_step<=7'h16)) begin
										r_ip_AddFloat_portB_0 <= w_sys_tmp10;

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

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h2) || (r_sys_divStream_step==7'h6) || (r_sys_divStream_step==7'ha) || (r_sys_divStream_step==7'he)) begin
										r_ip_DivFloat_dividend_0 <= w_sys_tmp201;

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

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h2) || (r_sys_divStream_step==7'h6) || (r_sys_divStream_step==7'ha) || (r_sys_divStream_step==7'he)) begin
										r_ip_DivFloat_divisor_0 <= w_sys_tmp202;

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
			r_ip_DivFloat_newData_0 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h2) || (r_sys_divStream_step==7'h6) || (r_sys_divStream_step==7'ha) || (r_sys_divStream_step==7'he)) begin
										r_ip_DivFloat_newData_0 <= w_sys_boolTrue;

									end
									else
									if((r_sys_divStream_step==7'h3) || (r_sys_divStream_step==7'h7) || (r_sys_divStream_step==7'hb) || (r_sys_divStream_step==7'hf)) begin
										r_ip_DivFloat_newData_0 <= w_sys_boolFalse;

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

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h3) || (r_sys_divStream_step==7'h7) || (r_sys_divStream_step==7'hb) || (r_sys_divStream_step==7'hf)) begin
										r_ip_DivFloat_dividend_1 <= w_sys_tmp201;

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

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h3) || (r_sys_divStream_step==7'h7) || (r_sys_divStream_step==7'hb) || (r_sys_divStream_step==7'hf)) begin
										r_ip_DivFloat_divisor_1 <= w_sys_tmp202;

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
			r_ip_DivFloat_newData_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h3) || (r_sys_divStream_step==7'h7) || (r_sys_divStream_step==7'hb) || (r_sys_divStream_step==7'hf)) begin
										r_ip_DivFloat_newData_1 <= w_sys_boolTrue;

									end
									else
									if((r_sys_divStream_step==7'h4) || (r_sys_divStream_step==7'h8) || (r_sys_divStream_step==7'hc) || (r_sys_divStream_step==7'h10)) begin
										r_ip_DivFloat_newData_1 <= w_sys_boolFalse;

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

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h4) || (r_sys_divStream_step==7'h8) || (r_sys_divStream_step==7'hc) || (r_sys_divStream_step==7'h10)) begin
										r_ip_DivFloat_dividend_2 <= w_sys_tmp201;

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

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h4) || (r_sys_divStream_step==7'h8) || (r_sys_divStream_step==7'hc) || (r_sys_divStream_step==7'h10)) begin
										r_ip_DivFloat_divisor_2 <= w_sys_tmp202;

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
			r_ip_DivFloat_newData_2 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h4) || (r_sys_divStream_step==7'h8) || (r_sys_divStream_step==7'hc) || (r_sys_divStream_step==7'h10)) begin
										r_ip_DivFloat_newData_2 <= w_sys_boolTrue;

									end
									else
									if((r_sys_divStream_step==7'h5) || (r_sys_divStream_step==7'h9) || (r_sys_divStream_step==7'hd) || (r_sys_divStream_step==7'h11)) begin
										r_ip_DivFloat_newData_2 <= w_sys_boolFalse;

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

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h5) || (r_sys_divStream_step==7'h9) || (r_sys_divStream_step==7'hd) || (r_sys_divStream_step==7'h11)) begin
										r_ip_DivFloat_dividend_3 <= w_sys_tmp201;

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

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h5) || (r_sys_divStream_step==7'h9) || (r_sys_divStream_step==7'hd) || (r_sys_divStream_step==7'h11)) begin
										r_ip_DivFloat_divisor_3 <= w_sys_tmp202;

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
			r_ip_DivFloat_newData_3 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h5) || (r_sys_divStream_step==7'h9) || (r_sys_divStream_step==7'hd) || (r_sys_divStream_step==7'h11)) begin
										r_ip_DivFloat_newData_3 <= w_sys_boolTrue;

									end
									else
									if((r_sys_divStream_step==7'h6) || (r_sys_divStream_step==7'ha) || (r_sys_divStream_step==7'he) || (r_sys_divStream_step==7'h12)) begin
										r_ip_DivFloat_newData_3 <= w_sys_boolFalse;

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

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_ip_FixedToFloat_fixed_0 <= r_divStream_copy0_i_4;

									end
									else
									if((7'h1<=r_sys_divStream_step && r_sys_divStream_step<=7'he)) begin
										r_ip_FixedToFloat_fixed_0 <= w_sys_tmp21;

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

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h5<=r_sys_divStream_step && r_sys_divStream_step<=7'h14)) begin
										r_ip_FixedToFloat_fixed_1 <= w_sys_tmp6;

									end
									else
									if((r_sys_divStream_step==7'h0)) begin
										r_ip_FixedToFloat_fixed_1 <= w_sys_tmp21;

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
					r_sys_processing_methodID <= ((i_divStream_req) ? 2'h1 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_divStream_phase) 
						5'h10: begin
							r_sys_processing_methodID <= r_sys_divStream_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_divStream_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_divStream_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_divStream_phase <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'h0: begin
							r_sys_divStream_phase <= 5'h2;
						end

						5'h2: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_divStream_stage) 
								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_phase <= ((w_sys_tmp1) ? 5'h8 : 5'ha);

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h1b)) begin
										r_sys_divStream_phase <= 5'h5;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_divStream_stage) 
								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_phase <= 5'hb;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_phase <= ((w_sys_tmp196) ? 5'he : 5'h10);

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h4b)) begin
										r_sys_divStream_phase <= 5'hb;

									end
								end

							endcase
						end

						5'h10: begin
							r_sys_divStream_phase <= 5'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_divStream_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'h2: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_stage <= w_sys_divStream_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h1b)) begin
										r_sys_divStream_stage <= 2'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_stage <= w_sys_divStream_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_stage <= 2'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h4b)) begin
										r_sys_divStream_stage <= 2'h0;

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
			r_sys_divStream_step <= 7'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'h2: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_step <= 7'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_step <= 7'h0;

									end
								end

								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_step <= 7'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_step <= 7'h0;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h1b)) begin
										r_sys_divStream_step <= 7'h0;

									end
									else
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'h1a)) begin
										r_sys_divStream_step <= w_sys_divStream_step_p1;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_step <= 7'h0;

									end
								end

								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_step <= 7'h0;

									end
								end

							endcase
						end

						5'hb: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_sys_divStream_step <= 7'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h4b)) begin
										r_sys_divStream_step <= 7'h0;

									end
									else
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'h4a)) begin
										r_sys_divStream_step <= w_sys_divStream_step_p1;

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
			r_sys_divStream_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_divStream_busy <= ((i_divStream_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_divStream_phase) 
						5'h0: begin
							r_sys_divStream_busy <= w_sys_boolTrue;
						end

						5'h10: begin
							r_sys_divStream_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_divStream_a_0_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'hc<=r_sys_divStream_step && r_sys_divStream_step<=7'h1b)) begin
										r_divStream_a_0_addr <= r_divStream_i_3;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_divStream_a_0_addr <= r_divStream_copy1_i_9;

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

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'hc<=r_sys_divStream_step && r_sys_divStream_step<=7'h1b)) begin
										r_divStream_a_0_datain <= w_sys_tmp5;

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
			r_divStream_a_0_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'hc<=r_sys_divStream_step && r_sys_divStream_step<=7'h1b)) begin
										r_divStream_a_0_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_divStream_a_0_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h10: begin
							r_divStream_a_0_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_divStream_b_1_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'hc<=r_sys_divStream_step && r_sys_divStream_step<=7'h1b)) begin
										r_divStream_b_1_addr <= r_divStream_copy1_i_5;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_divStream_b_1_addr <= r_divStream_copy0_i_8;

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

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'hc<=r_sys_divStream_step && r_sys_divStream_step<=7'h1b)) begin
										r_divStream_b_1_datain <= w_sys_tmp8;

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
			r_divStream_b_1_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'hc<=r_sys_divStream_step && r_sys_divStream_step<=7'h1b)) begin
										r_divStream_b_1_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_divStream_b_1_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h10: begin
							r_divStream_b_1_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_divStream_result_2_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h3c<=r_sys_divStream_step && r_sys_divStream_step<=7'h4b)) begin
										r_divStream_result_2_addr <= r_divStream_i_3;

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

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h3e) || (r_sys_divStream_step==7'h42) || (r_sys_divStream_step==7'h46) || (r_sys_divStream_step==7'h4a)) begin
										r_divStream_result_2_datain <= w_sys_tmp214;

									end
									else
									if((r_sys_divStream_step==7'h3d) || (r_sys_divStream_step==7'h41) || (r_sys_divStream_step==7'h45) || (r_sys_divStream_step==7'h49)) begin
										r_divStream_result_2_datain <= w_sys_tmp207;

									end
									else
									if((r_sys_divStream_step==7'h3c) || (r_sys_divStream_step==7'h40) || (r_sys_divStream_step==7'h44) || (r_sys_divStream_step==7'h48)) begin
										r_divStream_result_2_datain <= w_sys_tmp200;

									end
									else
									if((r_sys_divStream_step==7'h3f) || (r_sys_divStream_step==7'h43) || (r_sys_divStream_step==7'h47) || (r_sys_divStream_step==7'h4b)) begin
										r_divStream_result_2_datain <= w_sys_tmp221;

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
			r_divStream_result_2_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_divStream_phase) 
						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h3c<=r_sys_divStream_step && r_sys_divStream_step<=7'h4b)) begin
										r_divStream_result_2_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'h10: begin
							r_divStream_result_2_r_w <= w_sys_boolFalse;
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

					case(r_sys_divStream_phase) 
						5'h4: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_divStream_i_3 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'hc<=r_sys_divStream_step && r_sys_divStream_step<=7'h1b)) begin
										r_divStream_i_3 <= w_sys_tmp15;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_divStream_i_3 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h3c<=r_sys_divStream_step && r_sys_divStream_step<=7'h4b)) begin
										r_divStream_i_3 <= w_sys_tmp205;

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

					case(r_sys_divStream_phase) 
						5'h4: begin

							case(r_sys_divStream_stage) 
								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_divStream_copy0_i_4 <= r_divStream_i_3;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_divStream_copy0_i_4 <= w_sys_tmp11;

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

					case(r_sys_divStream_phase) 
						5'h4: begin

							case(r_sys_divStream_stage) 
								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_divStream_copy1_i_5 <= r_divStream_i_3;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'hc<=r_sys_divStream_step && r_sys_divStream_step<=7'h1b)) begin
										r_divStream_copy1_i_5 <= w_sys_tmp12;

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

					case(r_sys_divStream_phase) 
						5'h4: begin

							case(r_sys_divStream_stage) 
								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_divStream_copy2_i_6 <= r_divStream_i_3;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_divStream_copy2_i_6 <= w_sys_tmp13;

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

					case(r_sys_divStream_phase) 
						5'h4: begin

							case(r_sys_divStream_stage) 
								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_divStream_copy3_i_7 <= r_divStream_i_3;

									end
								end

							endcase
						end

						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_divStream_copy3_i_7 <= w_sys_tmp14;

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

					case(r_sys_divStream_phase) 
						5'ha: begin

							case(r_sys_divStream_stage) 
								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_divStream_copy0_i_8 <= r_divStream_i_3;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_divStream_copy0_i_8 <= w_sys_tmp203;

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

					case(r_sys_divStream_phase) 
						5'ha: begin

							case(r_sys_divStream_stage) 
								2'h1: begin
									if((r_sys_divStream_step==7'h0)) begin
										r_divStream_copy1_i_9 <= r_divStream_i_3;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((7'h0<=r_sys_divStream_step && r_sys_divStream_step<=7'hf)) begin
										r_divStream_copy1_i_9 <= w_sys_tmp204;

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

					case(r_sys_divStream_phase) 
						5'h8: begin

							case(r_sys_divStream_stage) 
								2'h0: begin
									if((r_sys_divStream_step==7'h7)) begin
										r_sys_tmp0_float <= w_ip_FixedToFloat_floating_1;

									end
									else
									if((7'h8<=r_sys_divStream_step && r_sys_divStream_step<=7'h15)) begin
										r_sys_tmp0_float <= w_ip_FixedToFloat_floating_0;

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
