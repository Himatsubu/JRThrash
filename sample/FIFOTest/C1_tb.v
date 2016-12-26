`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:11:27 04/10/2014
// Design Name:   Top
// Module Name:   C:/Xilinx/workdir/fluid_140317/testbench.v
// Project Name:  fluid_140317
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg clock;
	reg reset_n;
	reg ce;
	reg i_run_req;

	// Outputs
	wire o_run_busy;

	
	// Monitor
	

	// Instantiate the Unit Under Test (UUT)
	fifotesta uut1 (
		.clock(clock), 
		.reset_n(reset_n), 
		.ce(ce), 
		.i_run_req(i_run_req), 
		.o_run_busy(o_run_busy)
	);
/*
	FIFOTestB uut2 (
		.clock(clock), 
		.reset_n(reset_n), 
		.ce(ce), 
		.i_run_req(i_run_req), 
		.o_run_busy(o_run_busy)
	);
*/	
	
	//make clock
	parameter CLOCK = 10;
	always #(CLOCK/2) begin
		clock <= ~clock;
	end
	
	//counter
	reg [31:0] counter=0;
	always @(posedge clock)begin
		counter <= counter + 1;
	end


  	// シミュレーション設定
     	initial begin
		$dumpfile("wave2.vcd");
      		$dumpvars(0, testbench);
    	end


	initial begin
		// Initialize Inputs
		clock = 0;
		reset_n = 0;
		ce = 0;
		i_run_req = 0;

		// Wait 100 ns for global reset to finish
		#100;
		@(posedge clock);
        
		// Add stimulus here
		reset_n = 1;
		ce = 1;
		i_run_req = 1;
		@(posedge clock);
		i_run_req = 0;
		//@(posedge clock);
		while(~o_run_busy)
			@(posedge clock);
		while(o_run_busy)
			@(posedge clock);
		$display("%d",counter);
		$finish;

	end
      
endmodule

