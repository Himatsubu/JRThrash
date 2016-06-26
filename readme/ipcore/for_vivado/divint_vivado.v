`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/07 13:46:37
// Design Name: 
// Module Name: addfloat_JRT
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
module DivInt(

    input clk,
    input ce,
    input  [31:0] dividend,
    input  [31:0] divisor,
    output [31:0] fractional,
    output [31:0] quotient
); 

    wire               s_axis_dividend_tvalid;
    wire               s_axis_divisor_tvalid;
    wire               m_axis_dout_tvalid;
    wire       [63:0]  m_axis_dout_tdata;
    
    assign s_axis_dividend_tvalid=1'b1;
    assign s_axis_divisor_tvalid=1'b1;
    assign m_axis_dout_tvalid=1'b1;
    assign fractional=m_axis_dout_tdata[31:0];
    assign quotient  =m_axis_dout_tdata[63:32];
    
	divint
    divint_inst_0(
        .aclk (clk),
        .aclken (ce),
        .s_axis_divisor_tdata (divisor),
        .s_axis_dividend_tdata(dividend),
        .m_axis_dout_tdata(m_axis_dout_tdata),
        .s_axis_dividend_tvalid(s_axis_dividend_tvalid),
        .s_axis_divisor_tvalid(s_axis_divisor_tvalid),
        .m_axis_dout_tvalid(m_axis_dout_tvalid)
    );
endmodule

