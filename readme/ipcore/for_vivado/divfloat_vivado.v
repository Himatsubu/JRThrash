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


module DivFloat(

    input clk,
    input ce,
    input [31:0] a,
    input [31:0] b,
    output [31:0] result
); 

    wire               s_axis_a_tready;
    wire               s_axis_a_tvalid;
    wire               s_axis_b_tready;
    wire               s_axis_b_tvalid;
    wire               m_axis_result_tready;
    wire               m_axis_result_tvalid;
    
    assign s_axis_a_tready=1'b1;
    assign s_axis_a_tvalid=1'b1;
    assign s_axis_b_tready=1'b1;
    assign s_axis_b_tvalid=1'b1;
    assign m_axis_result_tready=1'b1;
    assign m_axis_result_tvalid=1'b1;
    
    

	divfloat
    fivfloat_inst_0(
        .aclk (clk),
        .aclken (ce),
        .s_axis_a_tdata (a),
        .s_axis_b_tdata (b),
        .m_axis_result_tdata (result),
        .s_axis_a_tready(s_axis_a_tready),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tready(s_axis_b_tready),
        .s_axis_b_tvalid(s_axis_b_tvalid),
        .m_axis_result_tready(m_axis_result_tready),
        .m_axis_result_tvalid(m_axis_result_tvalid)
    );
endmodule
