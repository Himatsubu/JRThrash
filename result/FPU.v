/*
TimeStamp:	2013/12/16		12:59
*/


module FPU(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_fpu_req,	
	output                o_fpu_busy,	
	output signed  [63:0] o_fpu_return,	
	input                 i_fixedToFloat_req,	
	output                o_fixedToFloat_busy,	
	output signed  [63:0] o_fixedToFloat_return,	
	input                 i_floatToFixed_req,	
	output                o_floatToFixed_busy,	
	output signed  [31:0] o_floatToFixed_return,	
	input          [63:0] i_fpu_operandA_1,	
	input          [63:0] i_fpu_operandB_2,	
	input  signed  [ 7:0] i_fpu_opcode_3,	
	input  signed  [31:0] i_fixedToFloat_src_4,	
	input          [63:0] i_floatToFixed_src_5	
);

	reg         [63:0] r_ip_AddFloat_portA_0;
	reg         [63:0] r_ip_AddFloat_portB_0;
	wire        [63:0] w_ip_AddFloat_result_0;
	reg         [63:0] r_ip_MultFloat_multiplicand_0;
	reg         [63:0] r_ip_MultFloat_multiplier_0;
	wire        [63:0] w_ip_MultFloat_product_0;
	reg         [63:0] r_ip_DivFloat_dividend_0;
	reg         [63:0] r_ip_DivFloat_divisor_0;
	wire        [63:0] w_ip_DivFloat_quotient_0;
	reg                r_ip_DivFloat_newData_0;
	reg         [63:0] r_ip_CompareFloatLT_portA_0;
	reg         [63:0] r_ip_CompareFloatLT_portB_0;
	wire               w_ip_CompareFloatLT_result_0;
	reg  signed [31:0] r_ip_FixedToFloat_fixed_0;
	wire        [63:0] w_ip_FixedToFloat_floating_0;
	reg         [63:0] r_ip_FloatToFixed_floating_0;
	wire signed [31:0] w_ip_FloatToFixed_fixed_0;
	reg         [ 2:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [63:0] r_sys_fpu_return;
	reg         [ 2:0] r_sys_fpu_caller;
	reg                r_sys_fpu_req;
	reg         [ 5:0] r_sys_fpu_phase;
	reg         [ 1:0] r_sys_fpu_stage;
	reg         [ 5:0] r_sys_fpu_step;
	reg                r_sys_fpu_busy;
	wire        [ 1:0] w_sys_fpu_stage_p1;
	wire        [ 5:0] w_sys_fpu_step_p1;
	reg         [63:0] r_sys_fixedToFloat_return;
	reg         [ 2:0] r_sys_fixedToFloat_caller;
	reg                r_sys_fixedToFloat_req;
	reg         [ 2:0] r_sys_fixedToFloat_phase;
	reg         [ 1:0] r_sys_fixedToFloat_stage;
	reg         [ 3:0] r_sys_fixedToFloat_step;
	reg                r_sys_fixedToFloat_busy;
	wire        [ 1:0] w_sys_fixedToFloat_stage_p1;
	wire        [ 3:0] w_sys_fixedToFloat_step_p1;
	reg  signed [31:0] r_sys_floatToFixed_return;
	reg         [ 2:0] r_sys_floatToFixed_caller;
	reg                r_sys_floatToFixed_req;
	reg         [ 2:0] r_sys_floatToFixed_phase;
	reg         [ 1:0] r_sys_floatToFixed_stage;
	reg         [ 3:0] r_sys_floatToFixed_step;
	reg                r_sys_floatToFixed_busy;
	wire        [ 1:0] w_sys_floatToFixed_stage_p1;
	wire        [ 3:0] w_sys_floatToFixed_step_p1;
	reg         [63:0] r_fld_ret_0;
	reg         [63:0] r_fpu_operandA_1;
	reg         [63:0] r_fpu_operandB_2;
	reg  signed [ 7:0] r_fpu_opcode_3;
	reg  signed [31:0] r_fixedToFloat_src_4;
	reg         [63:0] r_floatToFixed_src_5;
	wire               w_sys_tmp1;
	wire        [63:0] w_sys_tmp2;
	wire               w_sys_tmp3;
	wire        [63:0] w_sys_tmp4;
	wire               w_sys_tmp5;
	wire signed [31:0] w_sys_tmp6;
	wire        [63:0] w_sys_tmp7;
	wire               w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;
	wire        [63:0] w_sys_tmp10;
	wire               w_sys_tmp11;
	wire signed [31:0] w_sys_tmp12;
	wire        [63:0] w_sys_tmp13;
	wire        [63:0] w_sys_tmp14;
	wire        [63:0] w_sys_tmp15;
	wire               w_sys_tmp16;
	wire               w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire        [63:0] w_sys_tmp19;
	wire        [63:0] w_sys_tmp20;
	wire        [63:0] w_sys_tmp21;
	wire               w_sys_tmp22;
	wire               w_sys_tmp23;
	wire signed [31:0] w_sys_tmp24;
	wire        [63:0] w_sys_tmp25;
	wire        [63:0] w_sys_tmp26;
	wire        [63:0] w_sys_tmp27;
	wire               w_sys_tmp28;
	wire               w_sys_tmp29;
	wire signed [31:0] w_sys_tmp30;
	wire        [63:0] w_sys_tmp31;
	wire        [63:0] w_sys_tmp32;
	wire        [63:0] w_sys_tmp33;
	wire               w_sys_tmp34;
	wire               w_sys_tmp35;
	wire               w_sys_tmp36;
	wire signed [31:0] w_sys_tmp37;
	wire        [63:0] w_sys_tmp38;
	wire        [63:0] w_sys_tmp39;
	wire        [63:0] w_sys_tmp40;
	wire               w_sys_tmp41;
	wire        [63:0] w_sys_tmp42;
	wire        [63:0] w_sys_tmp43;
	wire        [63:0] w_sys_tmp44;
	wire               w_sys_tmp45;
	wire               w_sys_tmp46;
	wire        [63:0] w_sys_tmp47;
	wire        [63:0] w_sys_tmp48;
	wire signed [31:0] w_sys_tmp49;
	wire signed [15:0] w_sys_tmp50;
	wire        [63:0] w_sys_tmp51;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_fpu_busy = r_sys_fpu_busy;
	assign o_fpu_return = r_sys_fpu_return;
	assign w_sys_fpu_stage_p1 = (r_sys_fpu_stage + 2'h1);
	assign w_sys_fpu_step_p1 = (r_sys_fpu_step + 6'h1);
	assign o_fixedToFloat_busy = r_sys_fixedToFloat_busy;
	assign o_fixedToFloat_return = r_sys_fixedToFloat_return;
	assign w_sys_fixedToFloat_stage_p1 = (r_sys_fixedToFloat_stage + 2'h1);
	assign w_sys_fixedToFloat_step_p1 = (r_sys_fixedToFloat_step + 4'h1);
	assign o_floatToFixed_busy = r_sys_floatToFixed_busy;
	assign o_floatToFixed_return = r_sys_floatToFixed_return;
	assign w_sys_floatToFixed_stage_p1 = (r_sys_floatToFixed_stage + 2'h1);
	assign w_sys_floatToFixed_step_p1 = (r_sys_floatToFixed_step + 4'h1);
	assign w_sys_tmp1 = ($signed( {{24{r_fpu_opcode_3[7]}}, r_fpu_opcode_3} ) == w_sys_intZero);
	assign w_sys_tmp2 = w_ip_AddFloat_result_0;
	assign w_sys_tmp3 = ($signed( {{24{r_fpu_opcode_3[7]}}, r_fpu_opcode_3} ) == w_sys_intOne);
	assign w_sys_tmp4 = w_ip_AddFloat_result_0;
	assign w_sys_tmp5 = ($signed( {{24{r_fpu_opcode_3[7]}}, r_fpu_opcode_3} ) == w_sys_tmp6);
	assign w_sys_tmp6 = 32'sh00000002;
	assign w_sys_tmp7 = w_ip_MultFloat_product_0;
	assign w_sys_tmp8 = ($signed( {{24{r_fpu_opcode_3[7]}}, r_fpu_opcode_3} ) == w_sys_tmp9);
	assign w_sys_tmp9 = 32'sh00000003;
	assign w_sys_tmp10 = w_ip_DivFloat_quotient_0;
	assign w_sys_tmp11 = ($signed( {{24{r_fpu_opcode_3[7]}}, r_fpu_opcode_3} ) == w_sys_tmp12);
	assign w_sys_tmp12 = 32'sh00000004;
	assign w_sys_tmp13 = ((w_sys_tmp16) ? w_sys_tmp14 : w_sys_tmp15);
	assign w_sys_tmp14 = 64'h3ff0000000000000;
	assign w_sys_tmp15 = 64'h0;
	assign w_sys_tmp16 = (r_fpu_operandA_1 == r_fpu_operandB_2);
	assign w_sys_tmp17 = ($signed( {{24{r_fpu_opcode_3[7]}}, r_fpu_opcode_3} ) == w_sys_tmp18);
	assign w_sys_tmp18 = 32'sh00000005;
	assign w_sys_tmp19 = ((w_sys_tmp22) ? w_sys_tmp20 : w_sys_tmp21);
	assign w_sys_tmp20 = 64'h3ff0000000000000;
	assign w_sys_tmp21 = 64'h0;
	assign w_sys_tmp22 = (r_fpu_operandA_1 != r_fpu_operandB_2);
	assign w_sys_tmp23 = ($signed( {{24{r_fpu_opcode_3[7]}}, r_fpu_opcode_3} ) == w_sys_tmp24);
	assign w_sys_tmp24 = 32'sh00000006;
	assign w_sys_tmp25 = ((w_sys_tmp28) ? w_sys_tmp26 : w_sys_tmp27);
	assign w_sys_tmp26 = 64'h3ff0000000000000;
	assign w_sys_tmp27 = 64'h0;
	assign w_sys_tmp28 = w_ip_CompareFloatLT_result_0;
	assign w_sys_tmp29 = ($signed( {{24{r_fpu_opcode_3[7]}}, r_fpu_opcode_3} ) == w_sys_tmp30);
	assign w_sys_tmp30 = 32'sh00000007;
	assign w_sys_tmp31 = ((w_sys_tmp34) ? w_sys_tmp32 : w_sys_tmp33);
	assign w_sys_tmp32 = 64'h3ff0000000000000;
	assign w_sys_tmp33 = 64'h0;
	assign w_sys_tmp34 = ( !w_sys_tmp35 );
	assign w_sys_tmp35 = w_ip_CompareFloatLT_result_0;
	assign w_sys_tmp36 = ($signed( {{24{r_fpu_opcode_3[7]}}, r_fpu_opcode_3} ) == w_sys_tmp37);
	assign w_sys_tmp37 = 32'sh00000008;
	assign w_sys_tmp38 = ((w_sys_tmp41) ? w_sys_tmp39 : w_sys_tmp40);
	assign w_sys_tmp39 = 64'h3ff0000000000000;
	assign w_sys_tmp40 = 64'h0;
	assign w_sys_tmp41 = w_ip_CompareFloatLT_result_0;
	assign w_sys_tmp42 = ((w_sys_tmp45) ? w_sys_tmp43 : w_sys_tmp44);
	assign w_sys_tmp43 = 64'h3ff0000000000000;
	assign w_sys_tmp44 = 64'h0;
	assign w_sys_tmp45 = ( !w_sys_tmp46 );
	assign w_sys_tmp46 = w_ip_CompareFloatLT_result_0;
	assign w_sys_tmp47 = r_fld_ret_0;
	assign w_sys_tmp48 = w_ip_FixedToFloat_floating_0;
	assign w_sys_tmp49 = $signed( {{16{w_sys_tmp50[15]}}, w_sys_tmp50} );
	assign w_sys_tmp50 = $signed( w_ip_FloatToFixed_fixed_0[15:0] );
	assign w_sys_tmp51 = 64'h0;


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

	DivFloat
		DivFloat_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_DivFloat_dividend_0),
			.b (r_ip_DivFloat_divisor_0),
			.operation_nd (r_ip_DivFloat_newData_0),
			.result (w_ip_DivFloat_quotient_0)
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

	FloatToFixed
		FloatToFixed_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_FloatToFixed_floating_0),
			.result (w_ip_FloatToFixed_fixed_0)
		);

	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_fpu_phase) 
						6'h5: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_AddFloat_portA_0 <= r_fpu_operandA_1;

									end
								end

							endcase
						end

						6'h9: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_AddFloat_portA_0 <= r_fpu_operandA_1;

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

					case(r_sys_fpu_phase) 
						6'h5: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_AddFloat_portB_0 <= r_fpu_operandB_2;

									end
								end

							endcase
						end

						6'h9: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_AddFloat_portB_0 <= { ~r_fpu_operandB_2[63], r_fpu_operandB_2[62:0] };

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

					case(r_sys_fpu_phase) 
						6'hd: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_MultFloat_multiplicand_0 <= r_fpu_operandA_1;

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

					case(r_sys_fpu_phase) 
						6'hd: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_MultFloat_multiplier_0 <= r_fpu_operandB_2;

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

					case(r_sys_fpu_phase) 
						6'h11: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_DivFloat_dividend_0 <= r_fpu_operandA_1;

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

					case(r_sys_fpu_phase) 
						6'h11: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_DivFloat_divisor_0 <= r_fpu_operandB_2;

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
				3'h1: begin

					case(r_sys_fpu_phase) 
						6'h11: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_DivFloat_newData_0 <= w_sys_boolTrue;

									end
									else
									if((r_sys_fpu_step==6'h1)) begin
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
				3'h1: begin

					case(r_sys_fpu_phase) 
						6'h1d: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_CompareFloatLT_portA_0 <= r_fpu_operandA_1;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_CompareFloatLT_portA_0 <= r_fpu_operandB_2;

									end
								end

							endcase
						end

						6'h25: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_CompareFloatLT_portA_0 <= r_fpu_operandB_2;

									end
								end

							endcase
						end

						6'h27: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_CompareFloatLT_portA_0 <= r_fpu_operandA_1;

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

					case(r_sys_fpu_phase) 
						6'h1d: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_CompareFloatLT_portB_0 <= r_fpu_operandB_2;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_CompareFloatLT_portB_0 <= r_fpu_operandA_1;

									end
								end

							endcase
						end

						6'h25: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_CompareFloatLT_portB_0 <= r_fpu_operandA_1;

									end
								end

							endcase
						end

						6'h27: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_ip_CompareFloatLT_portB_0 <= r_fpu_operandB_2;

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

					case(r_sys_fixedToFloat_phase) 
						3'h3: begin

							case(r_sys_fixedToFloat_stage) 
								2'h0: begin
									if((r_sys_fixedToFloat_step==4'h0)) begin
										r_ip_FixedToFloat_fixed_0 <= r_fixedToFloat_src_4;

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

					case(r_sys_floatToFixed_phase) 
						3'h3: begin

							case(r_sys_floatToFixed_stage) 
								2'h0: begin
									if((r_sys_floatToFixed_step==4'h0)) begin
										r_ip_FloatToFixed_floating_0 <= r_floatToFixed_src_5;

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
			r_sys_processing_methodID <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_processing_methodID <= ((i_floatToFixed_req) ? 3'h3 : ((i_fixedToFloat_req) ? 3'h2 : ((i_fpu_req) ? 3'h1 : r_sys_processing_methodID)));
				end

				3'h1: begin

					case(r_sys_fpu_phase) 
						6'h2b: begin
							r_sys_processing_methodID <= r_sys_fpu_caller;
						end

					endcase
				end

				3'h2: begin

					case(r_sys_fixedToFloat_phase) 
						3'h5: begin
							r_sys_processing_methodID <= r_sys_fixedToFloat_caller;
						end

					endcase
				end

				3'h3: begin

					case(r_sys_floatToFixed_phase) 
						3'h5: begin
							r_sys_processing_methodID <= r_sys_floatToFixed_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fpu_return <= 64'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_fpu_phase) 
						6'h28: begin
							r_sys_fpu_return <= w_sys_tmp47;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fpu_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fpu_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fpu_phase <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_fpu_phase) 
						6'h0: begin
							r_sys_fpu_phase <= 6'h3;
						end

						6'h3: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= ((w_sys_tmp1) ? 6'h5 : 6'h7);

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_sys_fpu_phase <= 6'h29;

									end
								end

							endcase
						end

						6'h7: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= ((w_sys_tmp3) ? 6'h9 : 6'hb);

									end
								end

							endcase
						end

						6'h9: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_sys_fpu_phase <= 6'h29;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= ((w_sys_tmp5) ? 6'hd : 6'hf);

									end
								end

							endcase
						end

						6'hd: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_sys_fpu_phase <= 6'h29;

									end
								end

							endcase
						end

						6'hf: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= ((w_sys_tmp8) ? 6'h11 : 6'h13);

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3a)) begin
										r_sys_fpu_phase <= 6'h29;

									end
								end

							endcase
						end

						6'h13: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= ((w_sys_tmp11) ? 6'h15 : 6'h17);

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= 6'h29;

									end
								end

							endcase
						end

						6'h17: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= ((w_sys_tmp17) ? 6'h19 : 6'h1b);

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= 6'h29;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= ((w_sys_tmp23) ? 6'h1d : 6'h1f);

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_phase <= 6'h29;

									end
								end

							endcase
						end

						6'h1f: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= ((w_sys_tmp29) ? 6'h21 : 6'h23);

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_phase <= 6'h29;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= ((w_sys_tmp36) ? 6'h25 : 6'h27);

									end
								end

							endcase
						end

						6'h25: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_phase <= 6'h29;

									end
								end

							endcase
						end

						6'h27: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_phase <= 6'h29;

									end
								end

							endcase
						end

						6'h28: begin
							r_sys_fpu_phase <= 6'h2b;
						end

						6'h29: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_phase <= 6'h28;

									end
								end

							endcase
						end

						6'h2b: begin
							r_sys_fpu_phase <= 6'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fpu_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_fpu_phase) 
						6'h3: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h7: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h9: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'hd: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'hf: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3a)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h13: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h17: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h1f: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h25: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h27: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_stage <= 2'h0;

									end
								end

							endcase
						end

						6'h29: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_stage <= 2'h0;

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
			r_sys_fpu_step <= 6'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_fpu_phase) 
						6'h3: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h5: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_sys_fpu_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_fpu_step && r_sys_fpu_step<=6'h4)) begin
										r_sys_fpu_step <= w_sys_fpu_step_p1;

									end
								end

							endcase
						end

						6'h7: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h9: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_sys_fpu_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_fpu_step && r_sys_fpu_step<=6'h4)) begin
										r_sys_fpu_step <= w_sys_fpu_step_p1;

									end
								end

							endcase
						end

						6'hb: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'hd: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_sys_fpu_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_fpu_step && r_sys_fpu_step<=6'h4)) begin
										r_sys_fpu_step <= w_sys_fpu_step_p1;

									end
								end

							endcase
						end

						6'hf: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3a)) begin
										r_sys_fpu_step <= 6'h0;

									end
									else
									if((6'h0<=r_sys_fpu_step && r_sys_fpu_step<=6'h39)) begin
										r_sys_fpu_step <= w_sys_fpu_step_p1;

									end
								end

							endcase
						end

						6'h13: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h17: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h1b: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_step <= 6'h0;

									end
									else
									if((r_sys_fpu_step==6'h0) || (r_sys_fpu_step==6'h1) || (r_sys_fpu_step==6'h2)) begin
										r_sys_fpu_step <= w_sys_fpu_step_p1;

									end
								end

							endcase
						end

						6'h1f: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_step <= 6'h0;

									end
									else
									if((r_sys_fpu_step==6'h0) || (r_sys_fpu_step==6'h1) || (r_sys_fpu_step==6'h2)) begin
										r_sys_fpu_step <= w_sys_fpu_step_p1;

									end
								end

							endcase
						end

						6'h23: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

									end
								end

							endcase
						end

						6'h25: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_step <= 6'h0;

									end
									else
									if((r_sys_fpu_step==6'h0) || (r_sys_fpu_step==6'h1) || (r_sys_fpu_step==6'h2)) begin
										r_sys_fpu_step <= w_sys_fpu_step_p1;

									end
								end

							endcase
						end

						6'h27: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_sys_fpu_step <= 6'h0;

									end
									else
									if((r_sys_fpu_step==6'h0) || (r_sys_fpu_step==6'h1) || (r_sys_fpu_step==6'h2)) begin
										r_sys_fpu_step <= w_sys_fpu_step_p1;

									end
								end

							endcase
						end

						6'h29: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_sys_fpu_step <= 6'h0;

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
			r_sys_fpu_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_fpu_busy <= ((i_fpu_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h1: begin

					case(r_sys_fpu_phase) 
						6'h0: begin
							r_sys_fpu_busy <= w_sys_boolTrue;
						end

						6'h2b: begin
							r_sys_fpu_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedToFloat_return <= 64'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_fixedToFloat_phase) 
						3'h2: begin
							r_sys_fixedToFloat_return <= w_sys_tmp48;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedToFloat_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedToFloat_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedToFloat_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_fixedToFloat_phase) 
						3'h0: begin
							r_sys_fixedToFloat_phase <= 3'h3;
						end

						3'h2: begin
							r_sys_fixedToFloat_phase <= 3'h5;
						end

						3'h3: begin

							case(r_sys_fixedToFloat_stage) 
								2'h0: begin
									if((r_sys_fixedToFloat_step==4'h7)) begin
										r_sys_fixedToFloat_phase <= 3'h2;

									end
								end

							endcase
						end

						3'h5: begin
							r_sys_fixedToFloat_phase <= 3'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedToFloat_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_fixedToFloat_phase) 
						3'h3: begin

							case(r_sys_fixedToFloat_stage) 
								2'h0: begin
									if((r_sys_fixedToFloat_step==4'h7)) begin
										r_sys_fixedToFloat_stage <= 2'h0;

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
			r_sys_fixedToFloat_step <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h2: begin

					case(r_sys_fixedToFloat_phase) 
						3'h3: begin

							case(r_sys_fixedToFloat_stage) 
								2'h0: begin
									if((4'h0<=r_sys_fixedToFloat_step && r_sys_fixedToFloat_step<=4'h6)) begin
										r_sys_fixedToFloat_step <= w_sys_fixedToFloat_step_p1;

									end
									else
									if((r_sys_fixedToFloat_step==4'h7)) begin
										r_sys_fixedToFloat_step <= 4'h0;

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
			r_sys_fixedToFloat_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_fixedToFloat_busy <= ((i_fixedToFloat_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h2: begin

					case(r_sys_fixedToFloat_phase) 
						3'h0: begin
							r_sys_fixedToFloat_busy <= w_sys_boolTrue;
						end

						3'h5: begin
							r_sys_fixedToFloat_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_floatToFixed_return <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_floatToFixed_phase) 
						3'h2: begin
							r_sys_floatToFixed_return <= w_sys_tmp49;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_floatToFixed_caller <= 3'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_floatToFixed_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_floatToFixed_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_floatToFixed_phase) 
						3'h0: begin
							r_sys_floatToFixed_phase <= 3'h3;
						end

						3'h2: begin
							r_sys_floatToFixed_phase <= 3'h5;
						end

						3'h3: begin

							case(r_sys_floatToFixed_stage) 
								2'h0: begin
									if((r_sys_floatToFixed_step==4'h7)) begin
										r_sys_floatToFixed_phase <= 3'h2;

									end
								end

							endcase
						end

						3'h5: begin
							r_sys_floatToFixed_phase <= 3'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_floatToFixed_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_floatToFixed_phase) 
						3'h3: begin

							case(r_sys_floatToFixed_stage) 
								2'h0: begin
									if((r_sys_floatToFixed_step==4'h7)) begin
										r_sys_floatToFixed_stage <= 2'h0;

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
			r_sys_floatToFixed_step <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h3: begin

					case(r_sys_floatToFixed_phase) 
						3'h3: begin

							case(r_sys_floatToFixed_stage) 
								2'h0: begin
									if((r_sys_floatToFixed_step==4'h7)) begin
										r_sys_floatToFixed_step <= 4'h0;

									end
									else
									if((4'h0<=r_sys_floatToFixed_step && r_sys_floatToFixed_step<=4'h6)) begin
										r_sys_floatToFixed_step <= w_sys_floatToFixed_step_p1;

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
			r_sys_floatToFixed_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_sys_floatToFixed_busy <= ((i_floatToFixed_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				3'h3: begin

					case(r_sys_floatToFixed_phase) 
						3'h0: begin
							r_sys_floatToFixed_busy <= w_sys_boolTrue;
						end

						3'h5: begin
							r_sys_floatToFixed_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_ret_0 <= w_sys_tmp51;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h1: begin

					case(r_sys_fpu_phase) 
						6'h5: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_fld_ret_0 <= w_sys_tmp2;

									end
								end

							endcase
						end

						6'h9: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_fld_ret_0 <= w_sys_tmp4;

									end
								end

							endcase
						end

						6'hd: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h5)) begin
										r_fld_ret_0 <= w_sys_tmp7;

									end
								end

							endcase
						end

						6'h11: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3a)) begin
										r_fld_ret_0 <= w_sys_tmp10;

									end
								end

							endcase
						end

						6'h15: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp13;

									end
								end

							endcase
						end

						6'h19: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h0)) begin
										r_fld_ret_0 <= w_sys_tmp19;

									end
								end

							endcase
						end

						6'h1d: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_fld_ret_0 <= w_sys_tmp25;

									end
								end

							endcase
						end

						6'h21: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_fld_ret_0 <= w_sys_tmp31;

									end
								end

							endcase
						end

						6'h25: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_fld_ret_0 <= w_sys_tmp38;

									end
								end

							endcase
						end

						6'h27: begin

							case(r_sys_fpu_stage) 
								2'h0: begin
									if((r_sys_fpu_step==6'h3)) begin
										r_fld_ret_0 <= w_sys_tmp42;

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
					r_fpu_operandA_1 <= ((i_fpu_req) ? i_fpu_operandA_1 : r_fpu_operandA_1);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_fpu_operandB_2 <= ((i_fpu_req) ? i_fpu_operandB_2 : r_fpu_operandB_2);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_fpu_opcode_3 <= ((i_fpu_req) ? i_fpu_opcode_3 : r_fpu_opcode_3);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_fixedToFloat_src_4 <= ((i_fixedToFloat_req) ? i_fixedToFloat_src_4 : r_fixedToFloat_src_4);
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				3'h0: begin
					r_floatToFixed_src_5 <= ((i_floatToFixed_req) ? i_floatToFixed_src_5 : r_floatToFixed_src_5);
				end

			endcase
		end
	end


endmodule
