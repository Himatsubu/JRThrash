/*
TimeStamp:	2016/6/6		15:51
*/


module addfloat(
	input                 clock,	
	input                 reset_n,	
	input                 ce,	
	input                 i_run_req,	
	output                o_run_busy,	
	output signed  [31:0] o_run_return,	
	input          [31:0] i_run_input_a_0	
);

	reg         [31:0] r_ip_AddFloat_portA_0;
	reg         [31:0] r_ip_AddFloat_portB_0;
	wire        [31:0] w_ip_AddFloat_result_0;
	wire               s_axis_a_tready;
	wire               s_axis_a_tvalid;
	wire               s_axis_b_tready;
    wire               s_axis_b_tvalid;
   	wire               m_axis_result_tready;
    wire               m_axis_result_tvalid;
	reg         [ 1:0] r_sys_processing_methodID;
	wire               w_sys_boolTrue;
	wire               w_sys_boolFalse;
	wire signed [31:0] w_sys_intOne;
	wire signed [31:0] w_sys_intZero;
	wire               w_sys_ce;
	reg         [31:0] r_sys_run_return;
	reg         [ 1:0] r_sys_run_caller;
	reg                r_sys_run_req;
	reg         [ 2:0] r_sys_run_phase;
	reg         [ 1:0] r_sys_run_stage;
	reg         [ 2:0] r_sys_run_step;
	reg                r_sys_run_busy;
	wire        [ 1:0] w_sys_run_stage_p1;
	wire        [ 2:0] w_sys_run_step_p1;
	reg         [31:0] r_run_input_a_0;
	reg         [31:0] r_run_input_b_1;
	reg         [31:0] r_run_result_2;
	wire        [31:0] w_sys_tmp1;
	wire        [31:0] w_sys_tmp2;
	wire        [31:0] w_sys_tmp3;

	assign w_sys_boolTrue = 1'b1;
	assign w_sys_boolFalse = 1'b0;
	assign w_sys_intOne = 32'sh1;
	assign w_sys_intZero = 32'sh0;
	assign w_sys_ce = w_sys_boolTrue & ce;
	assign o_run_busy = r_sys_run_busy;
	assign o_run_return = r_sys_run_return;
	assign w_sys_run_stage_p1 = (r_sys_run_stage + 2'h1);
	assign w_sys_run_step_p1 = (r_sys_run_step + 3'h1);
	assign w_sys_tmp1 = 32'h3fa66666;
	assign w_sys_tmp2 = r_run_result_2;
	assign w_sys_tmp3 = w_ip_AddFloat_result_0;
	assign s_axis_a_tready=1'b1;
    assign s_axis_a_tvalid=1'b1;
    assign s_axis_b_tready=1'b1;
    assign s_axis_b_tvalid=1'b1;
    assign m_axis_result_tready=1'b1;
    assign m_axis_result_tvalid=1'b1; 


	AddFloat
		AddFloat_inst_0(
			.aclk (clock),
			.aclken (w_sys_ce),
			.s_axis_a_tdata (r_ip_AddFloat_portA_0),
			.s_axis_b_tdata (r_ip_AddFloat_portB_0),
			.m_axis_result_tdata (w_ip_AddFloat_result_0),
			.s_axis_a_tready(s_axis_a_tready),
            .s_axis_a_tvalid(s_axis_a_tvalid),
            .s_axis_b_tready(s_axis_b_tready),
            .s_axis_b_tvalid(s_axis_b_tvalid),
            .m_axis_result_tready(m_axis_result_tready),
            .m_axis_result_tvalid(m_axis_result_tvalid)
		);
	always@(posedge clock)begin

		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_ip_AddFloat_portA_0 <= r_run_input_a_0;

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
						3'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_ip_AddFloat_portB_0 <= r_run_input_b_1;

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
						3'h6: begin
							r_sys_processing_methodID <= r_sys_run_caller;
						end

					endcase
				end

			endcase
		end
	end


	always@(posedge clock)begin

		if(( !reset_n )) begin
			r_sys_run_return <= 32'h0;

		end
		else
		if(w_sys_ce) begin

			case(r_sys_processing_methodID) 
				2'h1: begin

					case(r_sys_run_phase) 
						3'h3: begin
							r_sys_run_return <= w_sys_tmp2;
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
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_phase <= 3'h4;

									end
								end

							endcase
						end

						3'h3: begin
							r_sys_run_phase <= 3'h6;
						end

						3'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h5)) begin
										r_sys_run_phase <= 3'h3;

									end
								end

							endcase
						end

						3'h6: begin
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
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_stage <= 2'h0;

									end
								end

							endcase
						end

						3'h4: begin

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
				2'h1: begin

					case(r_sys_run_phase) 
						3'h2: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h0)) begin
										r_sys_run_step <= 3'h0;

									end
								end

							endcase
						end

						3'h4: begin

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
				2'h0: begin
					r_sys_run_busy <= ((i_run_req) ? w_sys_boolTrue : w_sys_boolFalse);
				end

				2'h1: begin

					case(r_sys_run_phase) 
						3'h0: begin
							r_sys_run_busy <= w_sys_boolTrue;
						end

						3'h6: begin
							r_sys_run_busy <= w_sys_boolFalse;
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
					r_run_input_a_0 <= ((i_run_req) ? i_run_input_a_0 : r_run_input_a_0);
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
									if((r_sys_run_step==3'h0)) begin
										r_run_input_b_1 <= w_sys_tmp1;

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
						3'h4: begin

							case(r_sys_run_stage) 
								2'h0: begin
									if((r_sys_run_step==3'h5)) begin
										r_run_result_2 <= w_sys_tmp3;

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