/*
TimeStamp:	2013/12/16		12:56
*/


module DualPortRAM
	#( parameter DWIDTH = 32, AWIDTH = 10, WORDS =1024 )
(
	input clk,
	input r_w_0,
	input r_w_1,
	input [AWIDTH-1:0] addr_0,
	input [AWIDTH-1:0] addr_1,
	input [DWIDTH-1:0] datain_0,
	input [DWIDTH-1:0] datain_1,
	output [DWIDTH-1:0] dataout_0,
	output [DWIDTH-1:0] dataout_1,
	input ce_0,
	input ce_1
);

// (* RAM_STYLE="BLOCK" *)	//If Xilinx xst doesn't regard this source code as Block RAM, remove the left comment
	reg [DWIDTH-1:0] mem [WORDS-1:0];
	reg [DWIDTH-1:0] r_dataout_0;
	reg [DWIDTH-1:0] r_dataout_1;
	assign dataout_0 = r_dataout_0;
	assign dataout_1 = r_dataout_1;

	always@(posedge clk) begin
		if(ce_0) begin
			if(r_w_0) 
				mem[addr_0] <= datain_0;

			r_dataout_0 <= mem[addr_0];
		end
	end

	always@(posedge clk) begin
		if(ce_1) begin
			if(r_w_1) 
				mem[addr_1] <= datain_1;

			r_dataout_1 <= mem[addr_1];
		end
	end

endmodule
