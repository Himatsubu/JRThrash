//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
//Date        : Thu Jan 05 17:57:35 2017
//Host        : Yanai-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (busyA,
    busyB,
    ce,
    clock,
    reset_n,
    returnA,
    returnB,
    run_req);
  output busyA;
  output busyB;
  input ce;
  input clock;
  input reset_n;
  output [31:0]returnA;
  output [31:0]returnB;
  input run_req;

  wire busyA;
  wire busyB;
  wire ce;
  wire clock;
  wire reset_n;
  wire [31:0]returnA;
  wire [31:0]returnB;
  wire run_req;

  design_1 design_1_i
       (.busyA(busyA),
        .busyB(busyB),
        .ce(ce),
        .clock(clock),
        .reset_n(reset_n),
        .returnA(returnA),
        .returnB(returnB),
        .run_req(run_req));
endmodule
