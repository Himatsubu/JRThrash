/*
TimeStamp:	2013/12/16		12:59
*/


module MultArray(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_multArray_req,	
	output                o_multArray_busy,	
	input  signed  [ 3:0] i_fld_result_2_addr_0,	
	input  signed  [31:0] i_fld_result_2_datain_0,	
	output signed  [31:0] o_fld_result_2_dataout_0,	
	input                 i_fld_result_2_r_w_0	
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
	reg         [ 1:0] r_sys_setArray_caller;
	reg                r_sys_setArray_req;
	reg         [ 4:0] r_sys_setArray_phase;
	reg         [ 1:0] r_sys_setArray_stage;
	reg         [ 3:0] r_sys_setArray_step;
	reg                r_sys_setArray_busy;
	wire        [ 1:0] w_sys_setArray_stage_p1;
	wire        [ 3:0] w_sys_setArray_step_p1;
	reg         [ 1:0] r_sys_multArray_caller;
	reg                r_sys_multArray_req;
	reg         [ 4:0] r_sys_multArray_phase;
	reg         [ 1:0] r_sys_multArray_stage;
	reg         [ 4:0] r_sys_multArray_step;
	reg                r_sys_multArray_busy;
	wire        [ 1:0] w_sys_multArray_stage_p1;
	wire        [ 4:0] w_sys_multArray_step_p1;
	wire signed [ 3:0] w_fld_ax_0_addr_0;
	wire signed [31:0] w_fld_ax_0_datain_0;
	wire signed [31:0] w_fld_ax_0_dataout_0;
	wire               w_fld_ax_0_r_w_0;
	wire               w_fld_ax_0_ce_0;
	reg  signed [ 3:0] r_fld_ax_0_addr_1;
	reg  signed [31:0] r_fld_ax_0_datain_1;
	wire signed [31:0] w_fld_ax_0_dataout_1;
	reg                r_fld_ax_0_r_w_1;
	wire               w_fld_ax_0_ce_1;
	wire signed [ 3:0] w_fld_bx_1_addr_0;
	wire signed [31:0] w_fld_bx_1_datain_0;
	wire signed [31:0] w_fld_bx_1_dataout_0;
	wire               w_fld_bx_1_r_w_0;
	wire               w_fld_bx_1_ce_0;
	reg  signed [ 3:0] r_fld_bx_1_addr_1;
	reg  signed [31:0] r_fld_bx_1_datain_1;
	wire signed [31:0] w_fld_bx_1_dataout_1;
	reg                r_fld_bx_1_r_w_1;
	wire               w_fld_bx_1_ce_1;
	wire signed [ 3:0] w_fld_result_2_addr_0;
	wire signed [31:0] w_fld_result_2_datain_0;
	wire signed [31:0] w_fld_result_2_dataout_0;
	wire               w_fld_result_2_r_w_0;
	wire               w_fld_result_2_ce_0;
	reg  signed [ 3:0] r_fld_result_2_addr_1;
	reg  signed [31:0] r_fld_result_2_datain_1;
	wire signed [31:0] w_fld_result_2_dataout_1;
	reg                r_fld_result_2_r_w_1;
	wire               w_fld_result_2_ce_1;
	reg  signed [31:0] r_setArray_i_3;
	reg  signed [31:0] r_setArray_j_4;
	reg  signed [31:0] r_multArray_tmp_5;
	reg  signed [31:0] r_multArray_i_6;
	reg  signed [31:0] r_multArray_j_7;
	reg  signed [31:0] r_multArray_k_8;
	reg  signed [31:0] r_multArray_copy0_k_9;
	reg  signed [31:0] r_sys_tmp0_int;
	reg  signed [31:0] r_sys_tmp1_int;
	wire               w_sys_tmp1;
	wire signed [31:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp3;
	wire               w_sys_tmp4;
	wire signed [31:0] w_sys_tmp5;
	wire signed [31:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp11;
	wire signed [31:0] w_sys_tmp12;
	wire signed [31:0] w_sys_tmp13;
	wire signed [31:0] w_sys_tmp14;
	wire signed [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire signed [31:0] w_sys_tmp20;
	wire signed [31:0] w_sys_tmp21;
	wire signed [31:0] w_sys_tmp22;
	wire signed [31:0] w_sys_tmp24;
	wire signed [31:0] w_sys_tmp25;
	wire               w_sys_tmp26;
	wire signed [31:0] w_sys_tmp28;
	wire               w_sys_tmp29;
	wire signed [31:0] w_sys_tmp30;
	wire signed [31:0] w_sys_tmp31;
	wire               w_sys_tmp32;
	wire signed [31:0] w_sys_tmp33;
	wire signed [31:0] w_sys_tmp36;
	wire signed [31:0] w_sys_tmp37;
	wire signed [31:0] w_sys_tmp38;
	wire signed [31:0] w_sys_tmp39;
	wire               w_sys_tmp40;
	wire signed [31:0] w_sys_tmp41;
	wire signed [31:0] w_sys_tmp42;
	wire               w_sys_tmp43;
	wire signed [31:0] w_sys_tmp44;
	wire               w_sys_tmp46;
	wire signed [31:0] w_sys_tmp47;
	wire signed [31:0] w_sys_tmp49;
	wire signed [31:0] w_sys_tmp50;
	wire signed [31:0] w_sys_tmp51;
	wire signed [31:0] w_sys_tmp52;
	wire signed [31:0] w_sys_tmp54;
	wire signed [31:0] w_sys_tmp55;
	wire signed [31:0] w_sys_tmp56;
	wire signed [31:0] w_sys_tmp57;
	wire signed [31:0] w_sys_tmp58;
	wire signed [31:0] w_sys_tmp59;
	wire signed [31:0] w_sys_tmp60;
	wire signed [31:0] w_sys_tmp110;
	wire signed [31:0] w_sys_tmp111;
	wire signed [31:0] w_sys_tmp112;
	wire signed [31:0] w_sys_tmp113;
	wire signed [31:0] w_sys_tmp114;
	wire signed [31:0] w_sys_tmp115;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign w_sys_setArray_stage_p1 = (r_sys_setArray_stage + 2'h1);
	assign w_sys_setArray_step_p1 = (r_sys_setArray_step + 4'h1);
	assign o_multArray_busy = r_sys_multArray_busy;
	assign w_sys_multArray_stage_p1 = (r_sys_multArray_stage + 2'h1);
	assign w_sys_multArray_step_p1 = (r_sys_multArray_step + 5'h1);
	assign w_fld_ax_0_addr_0 = 4'sh0;
	assign w_fld_ax_0_datain_0 = 32'sh0;
	assign w_fld_ax_0_r_w_0 = 1'h0;
	assign w_fld_ax_0_ce_0 = w_sys_ce;
	assign w_fld_ax_0_ce_1 = w_sys_ce;
	assign w_fld_bx_1_addr_0 = 4'sh0;
	assign w_fld_bx_1_datain_0 = 32'sh0;
	assign w_fld_bx_1_r_w_0 = 1'h0;
	assign w_fld_bx_1_ce_0 = w_sys_ce;
	assign w_fld_bx_1_ce_1 = w_sys_ce;
	assign o_fld_result_2_dataout_0 = w_fld_result_2_dataout_0;
	assign w_fld_result_2_addr_0 = i_fld_result_2_addr_0;
	assign w_fld_result_2_datain_0 = i_fld_result_2_datain_0;
	assign w_fld_result_2_r_w_0 = i_fld_result_2_r_w_0;
	assign w_fld_result_2_ce_0 = w_sys_ce;
	assign w_fld_result_2_ce_1 = w_sys_ce;
	assign w_sys_tmp1 = (r_setArray_i_3 < w_sys_tmp2);
	assign w_sys_tmp2 = 32'sh00000003;
	assign w_sys_tmp3 = (r_setArray_i_3 + w_sys_intOne);
	assign w_sys_tmp4 = (r_setArray_j_4 < w_sys_tmp5);
	assign w_sys_tmp5 = 32'sh00000005;
	assign w_sys_tmp8 = (w_sys_tmp9 + r_setArray_j_4);
	assign w_sys_tmp9 = $signed( w_ip_Multint_product_0[31:0] );
	assign w_sys_tmp10 = 32'sh00000005;
	assign w_sys_tmp11 = (w_sys_tmp12 + r_setArray_j_4);
	assign w_sys_tmp12 = $signed( w_ip_Multint_product_1[31:0] );
	assign w_sys_tmp13 = (r_setArray_i_3 + w_sys_intOne);
	assign w_sys_tmp14 = 32'sh00000029;
	assign w_sys_tmp17 = 32'sh00000003;
	assign w_sys_tmp18 = ((w_sys_tmp26) ? r_sys_tmp0_int : w_sys_tmp9);
	assign w_sys_tmp20 = (r_setArray_i_3 + w_sys_tmp21);
	assign w_sys_tmp21 = 32'sh00000002;
	assign w_sys_tmp22 = 32'sh0000003d;
	assign w_sys_tmp24 = ( -r_setArray_j_4 );
	assign w_sys_tmp25 = 32'sh00000042;
	assign w_sys_tmp26 = (r_setArray_j_4 < w_sys_tmp17);
	assign w_sys_tmp28 = (r_setArray_j_4 + w_sys_intOne);
	assign w_sys_tmp29 = (r_setArray_i_3 < w_sys_tmp30);
	assign w_sys_tmp30 = 32'sh00000003;
	assign w_sys_tmp31 = (r_setArray_i_3 + w_sys_intOne);
	assign w_sys_tmp32 = (r_setArray_j_4 < w_sys_tmp33);
	assign w_sys_tmp33 = 32'sh00000003;
	assign w_sys_tmp36 = (w_sys_tmp37 + r_setArray_j_4);
	assign w_sys_tmp37 = $signed( w_ip_Multint_product_1[31:0] );
	assign w_sys_tmp38 = 32'sh00000003;
	assign w_sys_tmp39 = (r_setArray_j_4 + w_sys_intOne);
	assign w_sys_tmp40 = (r_multArray_i_6 < w_sys_tmp41);
	assign w_sys_tmp41 = 32'sh00000003;
	assign w_sys_tmp42 = (r_multArray_i_6 + w_sys_intOne);
	assign w_sys_tmp43 = (r_multArray_j_7 < w_sys_tmp44);
	assign w_sys_tmp44 = 32'sh00000003;
	assign w_sys_tmp46 = (r_multArray_k_8 < w_sys_tmp47);
	assign w_sys_tmp47 = 32'sh00000005;
	assign w_sys_tmp49 = (r_multArray_tmp_5 + w_sys_tmp50);
	assign w_sys_tmp50 = $signed( w_ip_Multint_product_1[31:0] );
	assign w_sys_tmp51 = w_fld_ax_0_dataout_1;
	assign w_sys_tmp52 = (w_sys_tmp50 + r_multArray_k_8);
	assign w_sys_tmp54 = 32'sh00000005;
	assign w_sys_tmp55 = w_fld_bx_1_dataout_1;
	assign w_sys_tmp56 = (w_sys_tmp57 + r_multArray_j_7);
	assign w_sys_tmp57 = $signed( w_ip_Multint_product_0[31:0] );
	assign w_sys_tmp58 = 32'sh00000003;
	assign w_sys_tmp59 = (r_multArray_copy0_k_9 + w_sys_intOne);
	assign w_sys_tmp60 = (r_multArray_k_8 + w_sys_intOne);
	assign w_sys_tmp110 = (w_sys_tmp111 + r_multArray_j_7);
	assign w_sys_tmp111 = $signed( w_ip_Multint_product_0[31:0] );
	assign w_sys_tmp112 = 32'sh00000003;
	assign w_sys_tmp113 = (r_multArray_j_7 + w_sys_intOne);
	assign w_sys_tmp114 = (w_sys_tmp9 + r_setArray_i_3);
	assign w_sys_tmp115 = (w_sys_tmp12 + r_setArray_j_4);


	DualPortRAM #(.DWIDTH(32), .AWIDTH(4), .WORDS(15) )
		dpram_ax_0(
			.clk (clock),
			.ce_0 (w_fld_ax_0_ce_0),
			.addr_0 (w_fld_ax_0_addr_0),
			.datain_0 (w_fld_ax_0_datain_0),
			.dataout_0 (w_fld_ax_0_dataout_0),
			.r_w_0 (w_fld_ax_0_r_w_0),
			.ce_1 (w_fld_ax_0_ce_1),
			.addr_1 (r_fld_ax_0_addr_1),
			.datain_1 (r_fld_ax_0_datain_1),
			.dataout_1 (w_fld_ax_0_dataout_1),
			.r_w_1 (r_fld_ax_0_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(4), .WORDS(15) )
		dpram_bx_1(
			.clk (clock),
			.ce_0 (w_fld_bx_1_ce_0),
			.addr_0 (w_fld_bx_1_addr_0),
			.datain_0 (w_fld_bx_1_datain_0),
			.dataout_0 (w_fld_bx_1_dataout_0),
			.r_w_0 (w_fld_bx_1_r_w_0),
			.ce_1 (w_fld_bx_1_ce_1),
			.addr_1 (r_fld_bx_1_addr_1),
			.datain_1 (r_fld_bx_1_datain_1),
			.dataout_1 (w_fld_bx_1_dataout_1),
			.r_w_1 (r_fld_bx_1_r_w_1)
		);

	DualPortRAM #(.DWIDTH(32), .AWIDTH(4), .WORDS(9) )
		dpram_result_2(
			.clk (clock),
			.ce_0 (w_fld_result_2_ce_0),
			.addr_0 (w_fld_result_2_addr_0),
			.datain_0 (w_fld_result_2_datain_0),
			.dataout_0 (w_fld_result_2_dataout_0),
			.r_w_0 (w_fld_result_2_r_w_0),
			.ce_1 (w_fld_result_2_ce_1),
			.addr_1 (r_fld_result_2_addr_1),
			.datain_1 (r_fld_result_2_datain_1),
			.dataout_1 (w_fld_result_2_dataout_1),
			.r_w_1 (r_fld_result_2_r_w_1)
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

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h1)) begin
										r_ip_Multint_multiplicand_0 <= w_sys_tmp17;

									end
									else
									if((r_sys_setArray_step==4'h0)) begin
										r_ip_Multint_multiplicand_0 <= w_sys_tmp10;

									end
									else
									if((r_sys_setArray_step==4'h2)) begin
										r_ip_Multint_multiplicand_0 <= w_sys_tmp24;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'h0<=r_sys_multArray_step && r_sys_multArray_step<=5'h4)) begin
										r_ip_Multint_multiplicand_0 <= w_sys_tmp58;

									end
								end

							endcase
						end

						5'h13: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_ip_Multint_multiplicand_0 <= w_sys_tmp112;

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

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_ip_Multint_multiplier_0 <= r_setArray_i_3;

									end
									else
									if((r_sys_setArray_step==4'h2)) begin
										r_ip_Multint_multiplier_0 <= w_sys_tmp25;

									end
									else
									if((r_sys_setArray_step==4'h1)) begin
										r_ip_Multint_multiplier_0 <= r_setArray_j_4;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'h0<=r_sys_multArray_step && r_sys_multArray_step<=5'h4)) begin
										r_ip_Multint_multiplier_0 <= r_multArray_copy0_k_9;

									end
								end

							endcase
						end

						5'h13: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_ip_Multint_multiplier_0 <= r_multArray_i_6;

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

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h1)) begin
										r_ip_Multint_multiplicand_1 <= w_sys_tmp20;

									end
									else
									if((r_sys_setArray_step==4'h0)) begin
										r_ip_Multint_multiplicand_1 <= w_sys_tmp13;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_ip_Multint_multiplicand_1 <= w_sys_tmp38;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'h7<=r_sys_multArray_step && r_sys_multArray_step<=5'hb)) begin
										r_ip_Multint_multiplicand_1 <= w_sys_tmp51;

									end
									else
									if((5'h0<=r_sys_multArray_step && r_sys_multArray_step<=5'h4)) begin
										r_ip_Multint_multiplicand_1 <= w_sys_tmp54;

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

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_ip_Multint_multiplier_1 <= w_sys_tmp14;

									end
									else
									if((r_sys_setArray_step==4'h1)) begin
										r_ip_Multint_multiplier_1 <= w_sys_tmp22;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_ip_Multint_multiplier_1 <= r_setArray_i_3;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'h0<=r_sys_multArray_step && r_sys_multArray_step<=5'h4)) begin
										r_ip_Multint_multiplier_1 <= r_multArray_i_6;

									end
									else
									if((5'h7<=r_sys_multArray_step && r_sys_multArray_step<=5'hb)) begin
										r_ip_Multint_multiplier_1 <= w_sys_tmp55;

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
					r_sys_processing_methodID <= ((i_multArray_req) ? 2'h2 : r_sys_processing_methodID);
				end

				2'h1: begin

					case(r_sys_setArray_phase) 
						5'h1a: begin
							r_sys_processing_methodID <= r_sys_setArray_caller;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h2: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_processing_methodID <= 2'h1;

									end
								end

							endcase
						end

						5'h15: begin
							r_sys_processing_methodID <= r_sys_multArray_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_setArray_caller <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h2: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
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
			r_sys_setArray_phase <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_setArray_phase) 
						5'h0: begin
							r_sys_setArray_phase <= 5'h2;
						end

						5'h2: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= ((w_sys_tmp1) ? 5'h9 : 5'hf);

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= 5'ha;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= ((w_sys_tmp4) ? 5'hd : 5'h6);

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h7)) begin
										r_sys_setArray_phase <= 5'ha;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= 5'h10;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= ((w_sys_tmp29) ? 5'h14 : 5'h1a);

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= 5'h10;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= 5'h15;

									end
								end

							endcase
						end

						5'h15: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_phase <= ((w_sys_tmp32) ? 5'h18 : 5'h11);

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h5)) begin
										r_sys_setArray_phase <= 5'h15;

									end
								end

							endcase
						end

						5'h1a: begin
							r_sys_setArray_phase <= 5'h0;
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
				2'h1: begin

					case(r_sys_setArray_phase) 
						5'h2: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h7)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h15: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h5)) begin
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
				2'h1: begin

					case(r_sys_setArray_phase) 
						5'h2: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((4'h0<=r_sys_setArray_step && r_sys_setArray_step<=4'h6)) begin
										r_sys_setArray_step <= w_sys_setArray_step_p1;

									end
									else
									if((r_sys_setArray_step==4'h7)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'h10: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'h15: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_sys_setArray_step <= 4'h0;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((4'h0<=r_sys_setArray_step && r_sys_setArray_step<=4'h4)) begin
										r_sys_setArray_step <= w_sys_setArray_step_p1;

									end
									else
									if((r_sys_setArray_step==4'h5)) begin
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
				2'h1: begin

					case(r_sys_setArray_phase) 
						5'h0: begin
							r_sys_setArray_busy <= w_sys_boolTrue;
						end

						5'h1a: begin
							r_sys_setArray_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multArray_caller <= 2'h0;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multArray_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multArray_phase <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h0: begin
							r_sys_multArray_phase <= 5'h2;
						end

						5'h2: begin

							case(r_sys_multArray_stage) 
								2'h1: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_phase <= 5'h4;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_phase <= ((w_sys_tmp40) ? 5'h9 : 5'h15);

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_phase <= 5'h5;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_phase <= 5'ha;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_phase <= ((w_sys_tmp43) ? 5'he : 5'h6);

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_multArray_stage) 
								2'h1: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_phase <= 5'hf;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_phase <= ((w_sys_tmp46) ? 5'h12 : 5'h13);

									end
								end

							endcase
						end

						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h10)) begin
										r_sys_multArray_phase <= 5'hf;

									end
								end

							endcase
						end

						5'h13: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h5)) begin
										r_sys_multArray_phase <= 5'ha;

									end
								end

							endcase
						end

						5'h15: begin
							r_sys_multArray_phase <= 5'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_multArray_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h2: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h1)) begin
										r_sys_multArray_stage <= w_sys_multArray_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_stage <= w_sys_multArray_stage_p1;

									end
								end

								2'h1: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h10)) begin
										r_sys_multArray_stage <= 2'h0;

									end
								end

							endcase
						end

						5'h13: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h5)) begin
										r_sys_multArray_stage <= 2'h0;

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
			r_sys_multArray_step <= 5'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h2: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h1)) begin
										r_sys_multArray_step <= 5'h0;

									end
									else
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_step <= w_sys_multArray_step_p1;

									end
								end

								2'h1: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_step <= 5'h0;

									end
								end

							endcase
						end

						5'h4: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_step <= 5'h0;

									end
								end

							endcase
						end

						5'h5: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_step <= 5'h0;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_step <= 5'h0;

									end
								end

							endcase
						end

						5'h9: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_step <= 5'h0;

									end
								end

							endcase
						end

						5'ha: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_step <= 5'h0;

									end
								end

							endcase
						end

						5'he: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_step <= 5'h0;

									end
								end

								2'h1: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_step <= 5'h0;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_sys_multArray_step <= 5'h0;

									end
								end

							endcase
						end

						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h10)) begin
										r_sys_multArray_step <= 5'h0;

									end
									else
									if((5'h0<=r_sys_multArray_step && r_sys_multArray_step<=5'hf)) begin
										r_sys_multArray_step <= w_sys_multArray_step_p1;

									end
								end

							endcase
						end

						5'h13: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h5)) begin
										r_sys_multArray_step <= 5'h0;

									end
									else
									if((5'h0<=r_sys_multArray_step && r_sys_multArray_step<=5'h4)) begin
										r_sys_multArray_step <= w_sys_multArray_step_p1;

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
			r_sys_multArray_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h0: begin
					r_sys_multArray_busy <= ((i_multArray_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h0: begin
							r_sys_multArray_busy <= w_sys_boolTrue;
						end

						5'h15: begin
							r_sys_multArray_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_ax_0_addr_1 <= 4'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h5)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp8[3:0] );

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'h5<=r_sys_multArray_step && r_sys_multArray_step<=5'h9)) begin
										r_fld_ax_0_addr_1 <= $signed( w_sys_tmp52[3:0] );

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

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h5)) begin
										r_fld_ax_0_datain_1 <= w_sys_tmp11;

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
			r_fld_ax_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h5)) begin
										r_fld_ax_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'h1a: begin
							r_fld_ax_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'h5<=r_sys_multArray_step && r_sys_multArray_step<=5'h9)) begin
										r_fld_ax_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h15: begin
							r_fld_ax_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_bx_1_addr_1 <= 4'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h7)) begin
										r_fld_bx_1_addr_1 <= $signed( r_sys_tmp1_int[3:0] );

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'h5<=r_sys_multArray_step && r_sys_multArray_step<=5'h9)) begin
										r_fld_bx_1_addr_1 <= $signed( w_sys_tmp56[3:0] );

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

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h7)) begin
										r_fld_bx_1_datain_1 <= w_sys_tmp18;

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
			r_fld_bx_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h7)) begin
										r_fld_bx_1_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'h1a: begin
							r_fld_bx_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'h5<=r_sys_multArray_step && r_sys_multArray_step<=5'h9)) begin
										r_fld_bx_1_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						5'h15: begin
							r_fld_bx_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_result_2_addr_1 <= 4'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_setArray_phase) 
						5'h18: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h5)) begin
										r_fld_result_2_addr_1 <= $signed( w_sys_tmp36[3:0] );

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h13: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h5)) begin
										r_fld_result_2_addr_1 <= $signed( w_sys_tmp110[3:0] );

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

					case(r_sys_setArray_phase) 
						5'h18: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h5)) begin
										r_fld_result_2_datain_1 <= w_sys_intZero;

									end
								end

							endcase
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h13: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h5)) begin
										r_fld_result_2_datain_1 <= r_multArray_tmp_5;

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
			r_fld_result_2_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_setArray_phase) 
						5'h18: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h5)) begin
										r_fld_result_2_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'h1a: begin
							r_fld_result_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_multArray_phase) 
						5'h13: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h5)) begin
										r_fld_result_2_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						5'h15: begin
							r_fld_result_2_r_w_1 <= w_sys_boolFalse;
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

					case(r_sys_setArray_phase) 
						5'h4: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_i_3 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_i_3 <= w_sys_tmp3;

									end
								end

							endcase
						end

						5'hf: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_i_3 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h11: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_i_3 <= w_sys_tmp31;

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

					case(r_sys_setArray_phase) 
						5'h9: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_j_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h7)) begin
										r_setArray_j_4 <= w_sys_tmp28;

									end
								end

							endcase
						end

						5'h14: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h0)) begin
										r_setArray_j_4 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h18: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h5)) begin
										r_setArray_j_4 <= w_sys_tmp39;

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

					case(r_sys_multArray_phase) 
						5'h2: begin

							case(r_sys_multArray_stage) 
								2'h1: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_multArray_tmp_5 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'hc<=r_sys_multArray_step && r_sys_multArray_step<=5'h10)) begin
										r_multArray_tmp_5 <= w_sys_tmp49;

									end
								end

							endcase
						end

						5'h13: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h5)) begin
										r_multArray_tmp_5 <= w_sys_intZero;

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

					case(r_sys_multArray_phase) 
						5'h4: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_multArray_i_6 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h6: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_multArray_i_6 <= w_sys_tmp42;

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

					case(r_sys_multArray_phase) 
						5'h9: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_multArray_j_7 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h13: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h5)) begin
										r_multArray_j_7 <= w_sys_tmp113;

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

					case(r_sys_multArray_phase) 
						5'he: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_multArray_k_8 <= w_sys_intZero;

									end
								end

							endcase
						end

						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'h5<=r_sys_multArray_step && r_sys_multArray_step<=5'h9)) begin
										r_multArray_k_8 <= w_sys_tmp60;

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

					case(r_sys_multArray_phase) 
						5'he: begin

							case(r_sys_multArray_stage) 
								2'h1: begin
									if((r_sys_multArray_step==5'h0)) begin
										r_multArray_copy0_k_9 <= r_multArray_k_8;

									end
								end

							endcase
						end

						5'h12: begin

							case(r_sys_multArray_stage) 
								2'h0: begin
									if((5'h0<=r_sys_multArray_step && r_sys_multArray_step<=5'h4)) begin
										r_multArray_copy0_k_9 <= w_sys_tmp59;

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

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h6)) begin
										r_sys_tmp0_int <= w_sys_tmp115;

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

					case(r_sys_setArray_phase) 
						5'hd: begin

							case(r_sys_setArray_stage) 
								2'h0: begin
									if((r_sys_setArray_step==4'h6)) begin
										r_sys_tmp1_int <= w_sys_tmp114;

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
