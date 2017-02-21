/*
TimeStamp:	2017/1/30		14:1
*/


module bramtest(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	input  signed         i_fld_a_0_addr_0,	
	input  signed  [31:0] i_fld_a_0_datain_0,	
	output signed  [31:0] o_fld_a_0_dataout_0,	
	input                 i_fld_a_0_r_w_0	
);

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
	wire signed        w_fld_a_0_addr_0;
	wire signed [31:0] w_fld_a_0_datain_0;
	wire signed [31:0] w_fld_a_0_dataout_0;
	wire               w_fld_a_0_r_w_0;
	wire               w_fld_a_0_ce_0;
	reg  signed        r_fld_a_0_addr_1;
	reg  signed [31:0] r_fld_a_0_datain_1;
	wire signed [31:0] w_fld_a_0_dataout_1;
	reg                r_fld_a_0_r_w_1;
	wire               w_fld_a_0_ce_1;
	wire signed [31:0] w_sys_tmp3;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 2'h1);
	assign o_fld_a_0_dataout_0 = w_fld_a_0_dataout_0;
	assign w_fld_a_0_addr_0 = i_fld_a_0_addr_0;
	assign w_fld_a_0_datain_0 = i_fld_a_0_datain_0;
	assign w_fld_a_0_r_w_0 = i_fld_a_0_r_w_0;
	assign w_fld_a_0_ce_0 = w_sys_ce;
	assign w_fld_a_0_ce_1 = w_sys_ce;
	assign w_sys_tmp3 = 32'sh00000002;


	DualPortRAM #(.DWIDTH(32), .AWIDTH(1), .WORDS(2) )
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
						3'h4: begin
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
			r_fld_a_0_addr_1 <= 1'sh0;

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
										r_fld_a_0_addr_1 <= $signed( w_sys_intZero[0:0] );

									end
									else
									if((r_sys_run_step==2'h1)) begin
										r_fld_a_0_addr_1 <= $signed( w_sys_intOne[0:0] );

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
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h1)) begin
										r_fld_a_0_datain_1 <= w_sys_tmp3;

									end
									else
									if((r_sys_run_step==2'h0)) begin
										r_fld_a_0_datain_1 <= w_sys_intOne;

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
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==2'h0) || (r_sys_run_step==2'h1)) begin
										r_fld_a_0_r_w_1 <= w_sys_boolTrue;

									end
								end

							endcase
						end

						3'h4: begin
							r_fld_a_0_r_w_1 <= w_sys_boolFalse;
						end

					endcase
				end

			endcase
		end
	end


endmodule
