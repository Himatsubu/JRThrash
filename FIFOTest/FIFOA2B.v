module fifoA2B(
	input 	clk,
	input 	ce,
	input 	operation_nd,
	input 	[31:0] a,
	input 	[31:0]s_we,
	input 	[31:0]s_re,
	output 	[31:0] p
);

	wire reset;
	wire empty;
	wire full;
	wire [31:0] count;
	

	simple_fifo_32#(.WIDTH(32),.DEPTH(8))U(
		.clk(clk),
		.reset(reset),
		.we(s_we[0]),
		.din(a),
		.re(s_re[0]),
		.dout(p),
		.empty(empty),
		.full(full),
		.count(count)
	);


endmodule
