// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:fifoa2b:1.0
// IP Revision: 2

(* X_CORE_INFO = "fifoa2b,Vivado 2016.3" *)
(* CHECK_LICENSE_TYPE = "design_1_fifoa2b_0_0,fifoa2b,{}" *)
(* CORE_GENERATION_INFO = "design_1_fifoa2b_0_0,fifoa2b,{x_ipProduct=Vivado 2016.3,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=fifoa2b,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_fifoa2b_0_0 (
  clock,
  reset_n,
  ce,
  i_is_finished_req,
  o_is_finished_busy,
  i_check_finished_req,
  o_check_finished_busy,
  o_check_finished_return,
  i_enque_req,
  o_enque_busy,
  i_deque_req,
  o_deque_busy,
  o_deque_return,
  i_is_finished_in_finished_4,
  i_enque_n_in_5
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock CLK" *)
input wire clock;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_n RST" *)
input wire reset_n;
input wire ce;
input wire i_is_finished_req;
output wire o_is_finished_busy;
input wire i_check_finished_req;
output wire o_check_finished_busy;
output wire o_check_finished_return;
input wire i_enque_req;
output wire o_enque_busy;
input wire i_deque_req;
output wire o_deque_busy;
output wire [31 : 0] o_deque_return;
input wire i_is_finished_in_finished_4;
input wire [31 : 0] i_enque_n_in_5;

  fifoa2b inst (
    .clock(clock),
    .reset_n(reset_n),
    .ce(ce),
    .i_is_finished_req(i_is_finished_req),
    .o_is_finished_busy(o_is_finished_busy),
    .i_check_finished_req(i_check_finished_req),
    .o_check_finished_busy(o_check_finished_busy),
    .o_check_finished_return(o_check_finished_return),
    .i_enque_req(i_enque_req),
    .o_enque_busy(o_enque_busy),
    .i_deque_req(i_deque_req),
    .o_deque_busy(o_deque_busy),
    .o_deque_return(o_deque_return),
    .i_is_finished_in_finished_4(i_is_finished_in_finished_4),
    .i_enque_n_in_5(i_enque_n_in_5)
  );
endmodule
