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
	reg clock = 1'b0;
	reg reset = 1'b0;
	reg ce;
	reg run_reqa = 1'b0;
	reg run_reqb = 1'b0;

	// Outputs
	wire run_busya;
	wire run_busyb;
	wire [31:0] returnb;
	
	
	// Monitor
	

	// Instantiate the Unit Under Test (UUT)
	design_1_wrapper uut1 (
		.clock(clock), 
		.reset(reset), 
		.ce(ce),
		.return_b(return_b),
		.run_busya(run_busya),
		.run_busyb(run_busyb),
		.run_reqa(run_reqa),
		.run_reqb(run_reqb) 
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
		if(counter>100&& run_busya == 1'b0)begin
		      run_reqb = 1'b1;
		      run_reqa = 1'b0;
	    end
	    if(counter>250&& run_busyb == 1'b0&&run_busya==1'b0)begin
	           $finish;
	    end
	end


  	// ?V?~?????[?V???????
     	initial begin
		$dumpfile("wave2.vcd");
      		$dumpvars(0, testbench);
    	end


	initial begin
		// Initialize Inputs
		#100
		reset = 1;
		ce = 1;
		run_reqa = 1'b1;
		@(posedge clock);
	 end
      
endmodule
