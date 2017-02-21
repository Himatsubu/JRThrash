`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/01/30 16:47:29
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench;


  //Inputs
  reg clk = 1'b0;
  reg reset = 1'b0;
  reg ce;
  reg [31:0] din = 32'h01;
  reg [31:0] i_average_dataNum_0;
  reg we;
  
  //outputs
  wire [31:0] o_average_return;
  
  design_1_wrapper uut1(
    .clk(clk),
    .reset(reset),
    .ce(ce),
    .din(din),
    .i_average_dataNum_0(i_average_dataNum_0),
    .o_average_return(o_average_return),
    .we(we)
 );
 	//make clock
     parameter CLOCK = 10;
     always #(CLOCK/2) begin
         clk <= ~clk;
     end
     
 	//counter
     reg [31:0] counter=0;
     always @(posedge clk)begin
         counter <= counter + 1;
         if(i_average_dataNum_0 != 32'hz) begin
                $finish;
         end
     end

     initial begin
	$dumpfile("wave.vcd");
	$dumpvars(0,uut1);
     end

  
    initial begin
        ce = 0;
        #100
        reset = 1;
        ce = 1;
        i_average_dataNum_0 = 32'h05;
        //#100
        //reset = 0;
    end


    
    always@(posedge clk)begin
        if(din>32'h05) begin
		we = 1'b1;
	end
	din = din + 32'h01;
        we = 1'b1;
    end
endmodule

