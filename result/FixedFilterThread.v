/*
TimeStamp:	2013/12/16		12:59
*/


module FixedFilterThread(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	input  signed  [11:0] i_fld_inputWave_0_addr_0,	
	input  signed  [15:0] i_fld_inputWave_0_datain_0,	
	output signed  [15:0] o_fld_inputWave_0_dataout_0,	
	input                 i_fld_inputWave_0_r_w_0,	
	input  signed  [10:0] i_fld_outputWave_1_addr_0,	
	input  signed  [15:0] i_fld_outputWave_1_datain_0,	
	output signed  [15:0] o_fld_outputWave_1_dataout_0,	
	input                 i_fld_outputWave_1_r_w_0,	
	input  signed  [ 8:0] i_fld_filterCoef_2_addr_0,	
	input  signed  [15:0] i_fld_filterCoef_2_datain_0,	
	output signed  [15:0] o_fld_filterCoef_2_dataout_0,	
	input                 i_fld_filterCoef_2_r_w_0	
);

	reg                r_sys_fixedFilter_arbiter0;
	reg  signed [15:0] r_ip_MultInt_multiplicand_0;
	reg  signed [15:0] r_ip_MultInt_multiplier_0;
	wire signed [31:0] w_ip_MultInt_product_0;
	reg  signed [15:0] r_ip_MultInt_multiplicand_1;
	reg  signed [15:0] r_ip_MultInt_multiplier_1;
	wire signed [31:0] w_ip_MultInt_product_1;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [ 1:0] r_sys_run_caller;
	reg                r_sys_run_req;
	reg         [ 2:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 1:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 1:0] w_sys_run_step_p1;
	reg         [ 1:0] r_sys_fixedFilter_caller;
	reg                r_sys_fixedFilter_req;
	reg         [ 3:0] r_sys_fixedFilter_phase;
	reg         [ 1:0] r_sys_fixedFilter_stage;
	reg         [ 8:0] r_sys_fixedFilter_step;
	reg                r_sys_fixedFilter_busy;
	wire        [ 1:0] w_sys_fixedFilter_stage_p1;
	wire        [ 8:0] w_sys_fixedFilter_step_p1;
	wire signed [11:0] w_fld_inputWave_0_addr_0;
	wire signed [15:0] w_fld_inputWave_0_datain_0;
	wire signed [15:0] w_fld_inputWave_0_dataout_0;
	wire               w_fld_inputWave_0_r_w_0;
	wire               w_fld_inputWave_0_ce_0;
	reg  signed [11:0] r_fld_inputWave_0_addr_1;
	reg  signed [15:0] r_fld_inputWave_0_datain_1;
	wire signed [15:0] w_fld_inputWave_0_dataout_1;
	reg                r_fld_inputWave_0_r_w_1;
	wire               w_fld_inputWave_0_ce_1;
	wire signed [10:0] w_fld_outputWave_1_addr_0;
	wire signed [15:0] w_fld_outputWave_1_datain_0;
	wire signed [15:0] w_fld_outputWave_1_dataout_0;
	wire               w_fld_outputWave_1_r_w_0;
	wire               w_fld_outputWave_1_ce_0;
	reg  signed [10:0] r_fld_outputWave_1_addr_1;
	reg  signed [15:0] r_fld_outputWave_1_datain_1;
	wire signed [15:0] w_fld_outputWave_1_dataout_1;
	reg                r_fld_outputWave_1_r_w_1;
	wire               w_fld_outputWave_1_ce_1;
	wire signed [ 8:0] w_fld_filterCoef_2_addr_0;
	wire signed [15:0] w_fld_filterCoef_2_datain_0;
	wire signed [15:0] w_fld_filterCoef_2_dataout_0;
	wire               w_fld_filterCoef_2_r_w_0;
	wire               w_fld_filterCoef_2_ce_0;
	reg  signed [ 8:0] r_fld_filterCoef_2_addr_1;
	reg  signed [15:0] r_fld_filterCoef_2_datain_1;
	wire signed [15:0] w_fld_filterCoef_2_dataout_1;
	reg                r_fld_filterCoef_2_r_w_1;
	wire               w_fld_filterCoef_2_ce_1;
	reg  signed [15:0] r_fld_multNum_3;
	reg  signed [15:0] r_fixedFilter_pointNum_4;
	reg  signed [31:0] r_fixedFilter_inputWave_5_addr;
	reg  signed [15:0] r_fixedFilter_inputWave_5_datain;
	wire signed [15:0] w_fixedFilter_inputWave_5_dataout;
	reg                r_fixedFilter_inputWave_5_r_w;
	wire signed [31:0] w_fixedFilter_inputWave_5_addr;
	wire signed [15:0] w_fixedFilter_inputWave_5_datain;
	wire               w_fixedFilter_inputWave_5_r_w;
	wire               w_fixedFilter_inputWave_5_ce;
	wire               w_fixedFilter_inputWave_5_cacheHit;
	reg  signed [31:0] r_fixedFilter_outputWave_6_addr;
	reg  signed [15:0] r_fixedFilter_outputWave_6_datain;
	wire signed [15:0] w_fixedFilter_outputWave_6_dataout;
	reg                r_fixedFilter_outputWave_6_r_w;
	wire signed [31:0] w_fixedFilter_outputWave_6_addr;
	wire signed [15:0] w_fixedFilter_outputWave_6_datain;
	wire               w_fixedFilter_outputWave_6_r_w;
	wire               w_fixedFilter_outputWave_6_ce;
	wire               w_fixedFilter_outputWave_6_cacheHit;
	reg  signed [31:0] r_fixedFilter_filterCoef_7_addr;
	reg  signed [15:0] r_fixedFilter_filterCoef_7_datain;
	wire signed [15:0] w_fixedFilter_filterCoef_7_dataout;
	reg                r_fixedFilter_filterCoef_7_r_w;
	wire signed [31:0] w_fixedFilter_filterCoef_7_addr;
	wire signed [15:0] w_fixedFilter_filterCoef_7_datain;
	wire               w_fixedFilter_filterCoef_7_r_w;
	wire               w_fixedFilter_filterCoef_7_ce;
	wire               w_fixedFilter_filterCoef_7_cacheHit;
	reg  signed [31:0] r_fixedFilter_output0_8;
	reg  signed [31:0] r_fixedFilter_output1_9;
	reg  signed [15:0] r_fixedFilter_i_10;
	reg  signed [15:0] r_fixedFilter_k_11;
	reg  signed [15:0] r_fixedFilter_tmpCoef0_12;
	reg  signed [15:0] r_fixedFilter_inputWave0_13;
	reg  signed [15:0] r_fixedFilter_tmpCoef1_14;
	reg  signed [15:0] r_fixedFilter_inputWave1_15;
	reg  signed [15:0] r_fixedFilter_j_16;
	wire signed [31:0] w_sys_tmp1;
	wire signed [15:0] w_sys_tmp2;
	wire signed [31:0] w_sys_tmp3;
	wire               w_sys_tmp4;
	wire               w_sys_tmp5;
	wire signed [15:0] w_sys_tmp7;
	wire signed [31:0] w_sys_tmp8;
	wire signed [31:0] w_sys_tmp9;
	wire signed [31:0] w_sys_tmp10;
	wire signed [31:0] w_sys_tmp11;
	wire signed [31:0] w_sys_tmp12;
	wire signed [31:0] w_sys_tmp13;
	wire signed [31:0] w_sys_tmp14;
	wire signed [31:0] w_sys_tmp16;
	wire signed [31:0] w_sys_tmp17;
	wire signed [31:0] w_sys_tmp18;
	wire signed [31:0] w_sys_tmp19;
	wire signed [31:0] w_sys_tmp20;
	wire signed [15:0] w_sys_tmp4530;
	wire signed [31:0] w_sys_tmp4531;
	wire signed [31:0] w_sys_tmp4532;
	wire signed [31:0] w_sys_tmp4534;
	wire signed [15:0] w_sys_tmp4535;
	wire signed [31:0] w_sys_tmp4536;
	wire signed [31:0] w_sys_tmp4538;
	wire signed [31:0] w_sys_tmp4539;
	wire signed [31:0] w_sys_tmp4540;
	wire signed [31:0] w_sys_tmp4541;
	wire signed [31:0] w_sys_tmp4542;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce & w_fixedFilter_inputWave_5_cacheHit & w_fixedFilter_outputWave_6_cacheHit & w_fixedFilter_filterCoef_7_cacheHit;
	assign o_run_busy = r_sys_run_busy;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 2'h1);
	assign w_sys_fixedFilter_stage_p1 = (r_sys_fixedFilter_stage + 2'h1);
	assign w_sys_fixedFilter_step_p1 = (r_sys_fixedFilter_step + 9'h1);
	assign o_fld_inputWave_0_dataout_0 = w_fld_inputWave_0_dataout_0;
	assign w_fld_inputWave_0_addr_0 = ( r_sys_fixedFilter_arbiter0 ? $signed( w_fixedFilter_inputWave_5_addr[11:0] ) : i_fld_inputWave_0_addr_0 ) ;
	assign w_fld_inputWave_0_datain_0 = ( r_sys_fixedFilter_arbiter0 ? w_fixedFilter_inputWave_5_datain : i_fld_inputWave_0_datain_0 ) ;
	assign w_fld_inputWave_0_r_w_0 = ( r_sys_fixedFilter_arbiter0 ? w_fixedFilter_inputWave_5_r_w : i_fld_inputWave_0_r_w_0 ) ;
	assign w_fld_inputWave_0_ce_0 = w_sys_ce;
	assign w_fld_inputWave_0_ce_1 = w_sys_ce;
	assign o_fld_outputWave_1_dataout_0 = w_fld_outputWave_1_dataout_0;
	assign w_fld_outputWave_1_addr_0 = ( r_sys_fixedFilter_arbiter0 ? $signed( w_fixedFilter_outputWave_6_addr[10:0] ) : i_fld_outputWave_1_addr_0 ) ;
	assign w_fld_outputWave_1_datain_0 = ( r_sys_fixedFilter_arbiter0 ? w_fixedFilter_outputWave_6_datain : i_fld_outputWave_1_datain_0 ) ;
	assign w_fld_outputWave_1_r_w_0 = ( r_sys_fixedFilter_arbiter0 ? w_fixedFilter_outputWave_6_r_w : i_fld_outputWave_1_r_w_0 ) ;
	assign w_fld_outputWave_1_ce_0 = w_sys_ce;
	assign w_fld_outputWave_1_ce_1 = w_sys_ce;
	assign o_fld_filterCoef_2_dataout_0 = w_fld_filterCoef_2_dataout_0;
	assign w_fld_filterCoef_2_addr_0 = ( r_sys_fixedFilter_arbiter0 ? $signed( w_fixedFilter_filterCoef_7_addr[8:0] ) : i_fld_filterCoef_2_addr_0 ) ;
	assign w_fld_filterCoef_2_datain_0 = ( r_sys_fixedFilter_arbiter0 ? w_fixedFilter_filterCoef_7_datain : i_fld_filterCoef_2_datain_0 ) ;
	assign w_fld_filterCoef_2_r_w_0 = ( r_sys_fixedFilter_arbiter0 ? w_fixedFilter_filterCoef_7_r_w : i_fld_filterCoef_2_r_w_0 ) ;
	assign w_fld_filterCoef_2_ce_0 = w_sys_ce;
	assign w_fld_filterCoef_2_ce_1 = w_sys_ce;
	assign w_fixedFilter_inputWave_5_dataout = ( r_sys_fixedFilter_arbiter0 ? w_fld_inputWave_0_dataout_0 : 16'sh0 ) ;
	assign w_fixedFilter_inputWave_5_addr = r_fixedFilter_inputWave_5_addr;
	assign w_fixedFilter_inputWave_5_datain = r_fixedFilter_inputWave_5_datain;
	assign w_fixedFilter_inputWave_5_r_w = r_fixedFilter_inputWave_5_r_w;
	assign w_fixedFilter_inputWave_5_ce = w_sys_ce;
	assign w_fixedFilter_inputWave_5_cacheHit = ( r_sys_fixedFilter_arbiter0 ? w_sys_boolTrue : w_sys_boolTrue ) ;
	assign w_fixedFilter_outputWave_6_dataout = ( r_sys_fixedFilter_arbiter0 ? w_fld_outputWave_1_dataout_0 : 16'sh0 ) ;
	assign w_fixedFilter_outputWave_6_addr = r_fixedFilter_outputWave_6_addr;
	assign w_fixedFilter_outputWave_6_datain = r_fixedFilter_outputWave_6_datain;
	assign w_fixedFilter_outputWave_6_r_w = r_fixedFilter_outputWave_6_r_w;
	assign w_fixedFilter_outputWave_6_ce = w_sys_ce;
	assign w_fixedFilter_outputWave_6_cacheHit = ( r_sys_fixedFilter_arbiter0 ? w_sys_boolTrue : w_sys_boolTrue ) ;
	assign w_fixedFilter_filterCoef_7_dataout = ( r_sys_fixedFilter_arbiter0 ? w_fld_filterCoef_2_dataout_0 : 16'sh0 ) ;
	assign w_fixedFilter_filterCoef_7_addr = r_fixedFilter_filterCoef_7_addr;
	assign w_fixedFilter_filterCoef_7_datain = r_fixedFilter_filterCoef_7_datain;
	assign w_fixedFilter_filterCoef_7_r_w = r_fixedFilter_filterCoef_7_r_w;
	assign w_fixedFilter_filterCoef_7_ce = w_sys_ce;
	assign w_fixedFilter_filterCoef_7_cacheHit = ( r_sys_fixedFilter_arbiter0 ? w_sys_boolTrue : w_sys_boolTrue ) ;
	assign w_sys_tmp1 = 32'sh00000800;
	assign w_sys_tmp2 = $signed( w_sys_tmp3[15:0] );
	assign w_sys_tmp3 = ($signed( {{16{r_fixedFilter_pointNum_4[15]}}, r_fixedFilter_pointNum_4} ) - w_sys_intOne);
	assign w_sys_tmp4 = (w_sys_intZero < $signed( {{16{r_fixedFilter_i_10[15]}}, r_fixedFilter_i_10} ));
	assign w_sys_tmp5 = (r_fixedFilter_j_16 < r_fld_multNum_3);
	assign w_sys_tmp7 = $signed( w_sys_tmp8[15:0] );
	assign w_sys_tmp8 = ($signed( {{16{r_fixedFilter_i_10[15]}}, r_fixedFilter_i_10} ) + $signed( {{16{r_fixedFilter_j_16[15]}}, r_fixedFilter_j_16} ));
	assign w_sys_tmp9 = $signed( {{16{w_fld_filterCoef_2_dataout_1[15]}}, w_fld_filterCoef_2_dataout_1} );
	assign w_sys_tmp10 = $signed( {{16{w_fld_inputWave_0_dataout_1[15]}}, w_fld_inputWave_0_dataout_1} );
	assign w_sys_tmp11 = (w_sys_tmp12 + w_sys_intOne);
	assign w_sys_tmp12 = $signed( {{16{w_sys_tmp7[15]}}, w_sys_tmp7} );
	assign w_sys_tmp13 = $signed( {{16{w_fixedFilter_filterCoef_7_dataout[15]}}, w_fixedFilter_filterCoef_7_dataout} );
	assign w_sys_tmp14 = $signed( {{16{w_fixedFilter_inputWave_5_dataout[15]}}, w_fixedFilter_inputWave_5_dataout} );
	assign w_sys_tmp16 = (r_fixedFilter_output0_8 + w_sys_tmp17);
	assign w_sys_tmp17 = w_ip_MultInt_product_0;
	assign w_sys_tmp18 = (r_fixedFilter_output1_9 + w_sys_tmp19);
	assign w_sys_tmp19 = w_ip_MultInt_product_1;
	assign w_sys_tmp20 = ($signed( {{16{r_fixedFilter_j_16[15]}}, r_fixedFilter_j_16} ) + w_sys_intOne);
	assign w_sys_tmp4530 = $signed( w_sys_tmp4531[15:0] );
	assign w_sys_tmp4531 = w_sys_tmp4541;
	assign w_sys_tmp4532 = 32'sh00000010;
	assign w_sys_tmp4534 = ($signed( {{16{r_fixedFilter_i_10[15]}}, r_fixedFilter_i_10} ) - w_sys_intOne);
	assign w_sys_tmp4535 = $signed( w_sys_tmp4536[15:0] );
	assign w_sys_tmp4536 = w_sys_tmp4542;
	assign w_sys_tmp4538 = ($signed( {{16{r_fixedFilter_i_10[15]}}, r_fixedFilter_i_10} ) - w_sys_tmp4539);
	assign w_sys_tmp4539 = 32'sh00000002;
	assign w_sys_tmp4540 = 32'sh00000143;
	assign w_sys_tmp4541 = { 16'sh0, r_fixedFilter_output0_8[31 : 16] };
	assign w_sys_tmp4542 = { 16'sh0, r_fixedFilter_output1_9[31 : 16] };


	DualPortRAM #(.DWIDTH(16), .AWIDTH(12), .WORDS(2371) )
		dpram_inputWave_0(
			.clk (clock),
			.ce_0 (w_fld_inputWave_0_ce_0),
			.addr_0 (w_fld_inputWave_0_addr_0),
			.datain_0 (w_fld_inputWave_0_datain_0),
			.dataout_0 (w_fld_inputWave_0_dataout_0),
			.r_w_0 (w_fld_inputWave_0_r_w_0),
			.ce_1 (w_fld_inputWave_0_ce_1),
			.addr_1 (r_fld_inputWave_0_addr_1),
			.datain_1 (r_fld_inputWave_0_datain_1),
			.dataout_1 (w_fld_inputWave_0_dataout_1),
			.r_w_1 (r_fld_inputWave_0_r_w_1)
		);

	DualPortRAM #(.DWIDTH(16), .AWIDTH(11), .WORDS(2048) )
		dpram_outputWave_1(
			.clk (clock),
			.ce_0 (w_fld_outputWave_1_ce_0),
			.addr_0 (w_fld_outputWave_1_addr_0),
			.datain_0 (w_fld_outputWave_1_datain_0),
			.dataout_0 (w_fld_outputWave_1_dataout_0),
			.r_w_0 (w_fld_outputWave_1_r_w_0),
			.ce_1 (w_fld_outputWave_1_ce_1),
			.addr_1 (r_fld_outputWave_1_addr_1),
			.datain_1 (r_fld_outputWave_1_datain_1),
			.dataout_1 (w_fld_outputWave_1_dataout_1),
			.r_w_1 (r_fld_outputWave_1_r_w_1)
		);

	DualPortRAM #(.DWIDTH(16), .AWIDTH(9), .WORDS(323) )
		dpram_filterCoef_2(
			.clk (clock),
			.ce_0 (w_fld_filterCoef_2_ce_0),
			.addr_0 (w_fld_filterCoef_2_addr_0),
			.datain_0 (w_fld_filterCoef_2_datain_0),
			.dataout_0 (w_fld_filterCoef_2_dataout_0),
			.r_w_0 (w_fld_filterCoef_2_r_w_0),
			.ce_1 (w_fld_filterCoef_2_ce_1),
			.addr_1 (r_fld_filterCoef_2_addr_1),
			.datain_1 (r_fld_filterCoef_2_datain_1),
			.dataout_1 (w_fld_filterCoef_2_dataout_1),
			.r_w_1 (r_fld_filterCoef_2_r_w_1)
		);

	MultInt
		MultInt_inst_0(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_MultInt_multiplicand_0),
			.b (r_ip_MultInt_multiplier_0),
			.p (w_ip_MultInt_product_0)
		);

	MultInt
		MultInt_inst_1(
			.clk (clock),
			.ce (w_sys_ce),
			.a (r_ip_MultInt_multiplicand_1),
			.b (r_ip_MultInt_multiplier_1),
			.p (w_ip_MultInt_product_1)
		);

	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedFilter_arbiter0 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h1)) begin
										r_sys_fixedFilter_arbiter0 <= w_sys_boolFalse;

									end
									else
									if((r_sys_run_step==2'h0)) begin
										r_sys_fixedFilter_arbiter0 <= w_sys_boolTrue;

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

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h3<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h145)) begin
										r_ip_MultInt_multiplicand_0 <= r_fixedFilter_tmpCoef0_12;

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

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h3<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h145)) begin
										r_ip_MultInt_multiplier_0 <= r_fixedFilter_inputWave0_13;

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

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h3<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h145)) begin
										r_ip_MultInt_multiplicand_1 <= r_fixedFilter_tmpCoef1_14;

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

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h3<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h145)) begin
										r_ip_MultInt_multiplier_1 <= r_fixedFilter_inputWave1_15;

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
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_processing_methodID <= 2'h2;

									end
								end

							endcase
						end

						3'h4: begin
							r_sys_processing_methodID <= r_sys_run_caller;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'he: begin
							r_sys_processing_methodID <= r_sys_fixedFilter_caller;
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
			r_sys_run_phase <= 3'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h0: begin
							r_sys_run_phase <= 3'h2;
						end

						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h1)) begin
										r_sys_run_phase <= 3'h4;

									end
								end

							endcase
						end

						3'h4: begin
							r_sys_run_phase <= 3'h0;
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
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h1)) begin
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
			r_sys_run_step <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_run_step <= w_sys_run_step_p1;

									end
									else
									if((r_sys_run_step==2'h1)) begin
										r_sys_run_step <= 2'h0;

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
						3'h0: begin
							r_sys_run_busy <= w_sys_boolTrue;
						end

						3'h4: begin
							r_sys_run_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedFilter_caller <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_sys_fixedFilter_caller <= r_sys_processing_methodID;

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
			r_sys_fixedFilter_req <= w_sys_boolFalse;

		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedFilter_phase <= 4'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'h0: begin
							r_sys_fixedFilter_phase <= 4'h2;
						end

						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_phase <= 4'h4;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_phase <= ((w_sys_tmp4) ? 4'h7 : 4'he);

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_phase <= 4'h8;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_phase <= ((w_sys_tmp5) ? 4'hb : 4'hc);

									end
								end

							endcase
						end

						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h147)) begin
										r_sys_fixedFilter_phase <= 4'h8;

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_phase <= 4'h4;

									end
								end

							endcase
						end

						4'he: begin
							r_sys_fixedFilter_phase <= 4'h0;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_fixedFilter_stage <= 2'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h147)) begin
										r_sys_fixedFilter_stage <= 2'h0;

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_stage <= 2'h0;

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
			r_sys_fixedFilter_step <= 9'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_step <= 9'h0;

									end
								end

							endcase
						end

						4'h4: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_step <= 9'h0;

									end
								end

							endcase
						end

						4'h7: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_step <= 9'h0;

									end
								end

							endcase
						end

						4'h8: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_step <= 9'h0;

									end
								end

							endcase
						end

						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h146)) begin
										r_sys_fixedFilter_step <= w_sys_fixedFilter_step_p1;

									end
									else
									if((r_sys_fixedFilter_step==9'h147)) begin
										r_sys_fixedFilter_step <= 9'h0;

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_sys_fixedFilter_step <= 9'h0;

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
			r_sys_fixedFilter_busy <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'h0: begin
							r_sys_fixedFilter_busy <= w_sys_boolTrue;
						end

						4'he: begin
							r_sys_fixedFilter_busy <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_inputWave_0_addr_1 <= 12'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h142)) begin
										r_fld_inputWave_0_addr_1 <= $signed( w_sys_tmp11[11:0] );

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
			r_fld_inputWave_0_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h4: begin
							r_fld_inputWave_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h142)) begin
										r_fld_inputWave_0_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'he: begin
							r_fld_inputWave_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_outputWave_1_addr_1 <= 11'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fld_outputWave_1_addr_1 <= $signed( r_fixedFilter_i_10[10:0] );

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

					case(r_sys_fixedFilter_phase) 
						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fld_outputWave_1_datain_1 <= w_sys_tmp4530;

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
			r_fld_outputWave_1_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h4: begin
							r_fld_outputWave_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fld_outputWave_1_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'he: begin
							r_fld_outputWave_1_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_filterCoef_2_addr_1 <= 9'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h142)) begin
										r_fld_filterCoef_2_addr_1 <= $signed( r_fixedFilter_j_16[8:0] );

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
			r_fld_filterCoef_2_r_w_1 <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h4: begin
							r_fld_filterCoef_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h142)) begin
										r_fld_filterCoef_2_r_w_1 <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'he: begin
							r_fld_filterCoef_2_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fld_multNum_3 <= $signed( w_sys_tmp4540[15:0] );

		end
	end


	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0)) begin
										r_fixedFilter_pointNum_4 <= $signed( w_sys_tmp1[15:0] );

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
			r_fixedFilter_inputWave_5_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h142)) begin
										r_fixedFilter_inputWave_5_addr <= w_sys_tmp12;

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
			r_fixedFilter_inputWave_5_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h4: begin
							r_fixedFilter_inputWave_5_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h142)) begin
										r_fixedFilter_inputWave_5_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'he: begin
							r_fixedFilter_inputWave_5_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fixedFilter_outputWave_6_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fixedFilter_outputWave_6_addr <= w_sys_tmp4534;

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

					case(r_sys_fixedFilter_phase) 
						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fixedFilter_outputWave_6_datain <= w_sys_tmp4535;

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
			r_fixedFilter_outputWave_6_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h4: begin
							r_fixedFilter_outputWave_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fixedFilter_outputWave_6_r_w <= w_sys_boolTrue;

									end
								end

							endcase
						end

						4'he: begin
							r_fixedFilter_outputWave_6_r_w <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_fixedFilter_filterCoef_7_addr <= 32'sh0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h142)) begin
										r_fixedFilter_filterCoef_7_addr <= $signed( {{16{r_fixedFilter_j_16[15]}}, r_fixedFilter_j_16} );

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
			r_fixedFilter_filterCoef_7_r_w <= w_sys_boolFalse;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h4: begin
							r_fixedFilter_filterCoef_7_r_w <= w_sys_boolFalse;
						end

					endcase
				end

				2'h2: begin

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h142)) begin
										r_fixedFilter_filterCoef_7_r_w <= w_sys_boolFalse;

									end
								end

							endcase
						end

						4'he: begin
							r_fixedFilter_filterCoef_7_r_w <= w_sys_boolFalse;
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

					case(r_sys_fixedFilter_phase) 
						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fixedFilter_output0_8 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h5<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h147)) begin
										r_fixedFilter_output0_8 <= w_sys_tmp16;

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fixedFilter_output0_8 <= w_sys_intZero;

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

					case(r_sys_fixedFilter_phase) 
						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fixedFilter_output1_9 <= w_sys_intZero;

									end
								end

							endcase
						end

						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h5<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h147)) begin
										r_fixedFilter_output1_9 <= w_sys_tmp18;

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fixedFilter_output1_9 <= w_sys_intZero;

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

					case(r_sys_fixedFilter_phase) 
						4'h2: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fixedFilter_i_10 <= w_sys_tmp2;

									end
								end

							endcase
						end

						4'hc: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fixedFilter_i_10 <= $signed( w_sys_tmp4538[15:0] );

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

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h142)) begin
										r_fixedFilter_k_11 <= w_sys_tmp7;

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

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h2<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h144)) begin
										r_fixedFilter_tmpCoef0_12 <= $signed( w_sys_tmp9[15:0] );

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

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h2<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h144)) begin
										r_fixedFilter_inputWave0_13 <= $signed( w_sys_tmp10[15:0] );

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

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h2<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h144)) begin
										r_fixedFilter_tmpCoef1_14 <= $signed( w_sys_tmp13[15:0] );

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

					case(r_sys_fixedFilter_phase) 
						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h2<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h144)) begin
										r_fixedFilter_inputWave1_15 <= $signed( w_sys_tmp14[15:0] );

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

					case(r_sys_fixedFilter_phase) 
						4'h7: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((r_sys_fixedFilter_step==9'h0)) begin
										r_fixedFilter_j_16 <= $signed( w_sys_intZero[15:0] );

									end
								end

							endcase
						end

						4'hb: begin

							case(r_sys_fixedFilter_stage) 
								2'h0: begin
									if((9'h0<=r_sys_fixedFilter_step && r_sys_fixedFilter_step<=9'h142)) begin
										r_fixedFilter_j_16 <= $signed( w_sys_tmp20[15:0] );

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
