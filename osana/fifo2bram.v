module fifo2bram(
	input clk,
	input reset,

	//FIFOからの信号線
	input [31:0] dout,
	input empty,
	input full,
	input [31:0] count,
	output re,

	//JRTへの信号線
	output ce,
	output i_average_req,
	input  o_average_busy,
	output [31:0] o_average_addr_0,
	output [31:0] datain_0,
	output r_w_0

);

	parameter START = 3'b000, FIFO_R = 3'b001, BRAM_W = 3'b010 ,JRTRUN = 3'b011, WAIT = 3'b100;

	reg [31:0] addr;
	reg [2:0]  state;
	reg [1:0]  sub_state = 1'b0;

	reg ce;
	reg re;
	reg r_w_0;
	reg i_average_req;
	//reg [31:0] datain_0;
	reg [31:0] o_average_addr_0;

	assign datain_0 = dout;

	
	always@(posedge clk) begin
		if((!reset)) begin
		 	addr  <= 32'h0;
			state <= START;
		end


		r_w_0   <= 1'b0; 
		ce <= 1'b0;
		i_average_req <= 1'b0;
		re <= 1'b0;
		

		//FIFOが溜まってかつJRTが動作中でない場合読みだす
		if(state==START) begin
			//if(o_average_busy == 1'b1) state = WAIT;
			//else  state = FIFO_R;
			state = FIFO_R;
		end

		else if(state== FIFO_R) begin
			  re <= 1'b1;
			  ce <= 1'b1;
			  r_w_0  <= 1'b1;
			  state <= BRAM_W;
		end

		else if(state == BRAM_W)begin
			if(sub_state == 2'b01) begin
				sub_state <= 2'b00;
				o_average_addr_0 = addr;
				addr   = addr+32'h01;
				r_w_0  <= 1'b1;
				ce <= 1'b1;
				re <=1'b1;
			end

			else begin
				sub_state <= sub_state +2'b01;
			end


			if(addr>32'h05) begin 
				state = JRTRUN;
			end
			else  begin
				state = BRAM_W;
			end
		end

		//JRTモジュールを実行       
		else if(state == JRTRUN) begin
			  i_average_req <= 1'b1;
		          state <= WAIT;
		end
		else if(state == WAIT) begin
		          i_average_req <= 1'b0;
		end 


		
	end
endmodule
