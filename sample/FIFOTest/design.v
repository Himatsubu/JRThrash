//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
//Date        : Thu Jan 05 17:57:35 2017
//Host        : Yanai-PC running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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

  wire FIFOTestA_0_o_run_busy;
  wire [31:0]FIFOTestA_0_o_run_return;
  wire [31:0]FIFOTestA_0_r_obj_enque_n_in;
  wire FIFOTestA_0_r_obj_enque_req;
  wire FIFOTestA_0_r_obj_is_finished_in_finished;
  wire FIFOTestA_0_r_obj_is_finished_req;
  wire FIFOTestB_0_o_run_busy;
  wire [31:0]FIFOTestB_0_o_run_return;
  wire FIFOTestB_0_r_obj_check_finished_req;
  wire FIFOTestB_0_r_obj_deque_req;
  wire ce_1;
  wire clock_1;
  wire fifoa2b_0_o_check_finished_busy;
  wire fifoa2b_0_o_check_finished_return;
  wire fifoa2b_0_o_deque_busy;
  wire [31:0]fifoa2b_0_o_deque_return;
  wire fifoa2b_0_o_enque_busy;
  wire fifoa2b_0_o_is_finished_busy;
  wire reset_1;
  wire run_req_1;

  assign busyA = FIFOTestB_0_o_run_busy;
  assign busyB = FIFOTestA_0_o_run_busy;
  assign ce_1 = ce;
  assign clock_1 = clock;
  assign reset_1 = reset_n;
  assign returnA[31:0] = FIFOTestA_0_o_run_return;
  assign returnB[31:0] = FIFOTestB_0_o_run_return;
  assign run_req_1 = run_req;
  design_1_FIFOTestA_0_0 FIFOTestA_0
       (.ce(ce_1),
        .clock(clock_1),
        .i_run_req(run_req_1),
        .o_run_busy(FIFOTestA_0_o_run_busy),
        .o_run_return(FIFOTestA_0_o_run_return),
        .r_obj_enque_n_in(FIFOTestA_0_r_obj_enque_n_in),
        .r_obj_enque_req(FIFOTestA_0_r_obj_enque_req),
        .r_obj_is_finished_in_finished(FIFOTestA_0_r_obj_is_finished_in_finished),
        .r_obj_is_finished_req(FIFOTestA_0_r_obj_is_finished_req),
        .reset_n(reset_1),
        .w_obj_enque_busy(fifoa2b_0_o_enque_busy),
        .w_obj_is_finished_busy(fifoa2b_0_o_is_finished_busy));
  design_1_FIFOTestB_0_0 FIFOTestB_0
       (.ce(ce_1),
        .clock(clock_1),
        .i_run_req(run_req_1),
        .o_run_busy(FIFOTestB_0_o_run_busy),
        .o_run_return(FIFOTestB_0_o_run_return),
        .r_obj_check_finished_req(FIFOTestB_0_r_obj_check_finished_req),
        .r_obj_deque_req(FIFOTestB_0_r_obj_deque_req),
        .reset_n(reset_1),
        .w_obj_check_finished_busy(fifoa2b_0_o_check_finished_busy),
        .w_obj_checl_finished_return(fifoa2b_0_o_check_finished_return),
        .w_obj_deque_busy(fifoa2b_0_o_deque_busy),
        .w_obj_deque_return(fifoa2b_0_o_deque_return));
  design_1_fifoa2b_0_0 fifoa2b_0
       (.ce(ce_1),
        .clock(clock_1),
        .i_check_finished_req(FIFOTestB_0_r_obj_check_finished_req),
        .i_deque_req(FIFOTestB_0_r_obj_deque_req),
        .i_enque_n_in_5(FIFOTestA_0_r_obj_enque_n_in),
        .i_enque_req(FIFOTestA_0_r_obj_enque_req),
        .i_is_finished_in_finished_4(FIFOTestA_0_r_obj_is_finished_in_finished),
        .i_is_finished_req(FIFOTestA_0_r_obj_is_finished_req),
        .o_check_finished_busy(fifoa2b_0_o_check_finished_busy),
        .o_check_finished_return(fifoa2b_0_o_check_finished_return),
        .o_deque_busy(fifoa2b_0_o_deque_busy),
        .o_deque_return(fifoa2b_0_o_deque_return),
        .o_enque_busy(fifoa2b_0_o_enque_busy),
        .o_is_finished_busy(fifoa2b_0_o_is_finished_busy),
        .reset_n(reset_1));
endmodule
