//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.1 (lin64) Build 1215546 Mon Apr 27 19:07:21 MDT 2015
//Date        : Mon Jan 30 18:08:25 2017
//Host        : yanai-B85H3-M4 running 64-bit Ubuntu 15.10
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (ce,
    clk,
    din,
    i_average_dataNum_0,
    o_average_return,
    reset,
    we);
  input ce;
  input clk;
  input [31:0]din;
  input [31:0]i_average_dataNum_0;
  output [31:0]o_average_return;
  input reset;
  input we;

  wire ce;
  wire clk;
  wire [31:0]din;
  wire [31:0]i_average_dataNum_0;
  wire [31:0]o_average_return;
  wire reset;
  wire we;

  design_1 design_1_i
       (.ce(ce),
        .clk(clk),
        .din(din),
        .i_average_dataNum_0(i_average_dataNum_0),
        .o_average_return(o_average_return),
        .reset(reset),
        .we(we));
endmodule

