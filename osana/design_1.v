//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.1 (lin64) Build 1215546 Mon Apr 27 19:07:21 MDT 2015
//Date        : Mon Jan 30 18:08:25 2017
//Host        : yanai-B85H3-M4 running 64-bit Ubuntu 15.10
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

//(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipProduct=Vivado 2015.1,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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

  wire [31:0]DualPortRAM_0_dataout_1;
  wire PE_0_o_average_busy;
  wire [31:0]PE_0_o_average_matX_1_addr;
  wire PE_0_o_average_matX_1_ce;
  wire [31:0]PE_0_o_average_matX_1_datain;
  wire PE_0_o_average_matX_1_r_w;
  wire [31:0]PE_0_o_average_return;
  wire ce_1;
  wire clk_1;
  wire [31:0]din_1;
  wire fifo2bram_0_ce;
  wire [31:0]fifo2bram_0_datain_0;
  wire fifo2bram_0_i_average_req;
  wire [31:0]fifo2bram_0_o_average_addr_0;
  wire fifo2bram_0_r_w_0;
  wire fifo2bram_0_re;
  wire [31:0]i_average_dataNum_0_1;
  wire reset_1;
  wire [31:0]simple_fifo_32_0_count;
  wire [31:0]simple_fifo_32_0_dout;
  wire simple_fifo_32_0_empty;
  wire simple_fifo_32_0_full;
  wire we_1;

  assign ce_1 = ce;
  assign clk_1 = clk;
  assign din_1 = din[31:0];
  assign i_average_dataNum_0_1 = i_average_dataNum_0[31:0];
  assign o_average_return[31:0] = PE_0_o_average_return;
  assign reset_1 = reset;
  assign we_1 = we;
  DualPortRAM DualPortRAM
       (.addr_0(fifo2bram_0_o_average_addr_0[9:0]),
        .addr_1(PE_0_o_average_matX_1_addr[9:0]),
        .ce_0(fifo2bram_0_ce),
        .ce_1(PE_0_o_average_matX_1_ce),
        .clk(clk_1),
        .datain_0(fifo2bram_0_datain_0),
        .datain_1(PE_0_o_average_matX_1_datain),
        .dataout_1(DualPortRAM_0_dataout_1),
        .r_w_0(fifo2bram_0_r_w_0),
        .r_w_1(PE_0_o_average_matX_1_r_w));
  PE PE
       (.ce(ce_1),
        .clock(clk_1),
        .i_average_dataNum_0(i_average_dataNum_0_1),
        .i_average_matX_1_dataout(DualPortRAM_0_dataout_1),
        .i_average_req(fifo2bram_0_i_average_req),
        .o_average_busy(PE_0_o_average_busy),
        .o_average_matX_1_addr(PE_0_o_average_matX_1_addr),
        .o_average_matX_1_ce(PE_0_o_average_matX_1_ce),
        .o_average_matX_1_datain(PE_0_o_average_matX_1_datain),
        .o_average_matX_1_r_w(PE_0_o_average_matX_1_r_w),
        .o_average_return(PE_0_o_average_return),
        .reset_n(reset_1));
  fifo2bram fifo2bram
       (.ce(fifo2bram_0_ce),
        .clk(clk_1),
        .count(simple_fifo_32_0_count),
        .datain_0(fifo2bram_0_datain_0),
        .dout(simple_fifo_32_0_dout),
        .empty(simple_fifo_32_0_empty),
        .full(simple_fifo_32_0_full),
        .i_average_req(fifo2bram_0_i_average_req),
        .o_average_addr_0(fifo2bram_0_o_average_addr_0),
        .o_average_busy(PE_0_o_average_busy),
        .r_w_0(fifo2bram_0_r_w_0),
        .re(fifo2bram_0_re),
        .reset(reset_1));
  simple_fifo_32 simple_fifo_32
       (.clk(clk_1),
        .count(simple_fifo_32_0_count),
        .din(din_1),
        .dout(simple_fifo_32_0_dout),
        .empty(simple_fifo_32_0_empty),
        .full(simple_fifo_32_0_full),
        .re(fifo2bram_0_re),
        .reset(reset_1),
        .we(we_1));
endmodule

