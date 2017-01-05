////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: AddInt.v
// /___/   /\     Timestamp: MON 15 FEB 17:57:23 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/Yanai/c1_JRT/ipcore_dir/tmp/_cg/AddInt.ngc C:/Users/Yanai/c1_JRT/ipcore_dir/tmp/_cg/AddInt.v 
// Device	: 7k70tfbg676-1
// Input file	: C:/Users/Yanai/c1_JRT/ipcore_dir/tmp/_cg/AddInt.ngc
// Output file	: C:/Users/Yanai/c1_JRT/ipcore_dir/tmp/_cg/AddInt.v
// # of Modules	: 1
// Design Name	: AddInt
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module AddInt (
  clk, add, a, b, s
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input add;
  input [31 : 0] a;
  input [31 : 0] b;
  output [31 : 0] s;
  
  // synthesis translate_off
  
  wire \blk00000001/sig000000c2 ;
  wire \blk00000001/sig000000c1 ;
  wire \blk00000001/sig000000c0 ;
  wire \blk00000001/sig000000bf ;
  wire \blk00000001/sig000000be ;
  wire \blk00000001/sig000000bd ;
  wire \blk00000001/sig000000bc ;
  wire \blk00000001/sig000000bb ;
  wire \blk00000001/sig000000ba ;
  wire \blk00000001/sig000000b9 ;
  wire \blk00000001/sig000000b8 ;
  wire \blk00000001/sig000000b7 ;
  wire \blk00000001/sig000000b6 ;
  wire \blk00000001/sig000000b5 ;
  wire \blk00000001/sig000000b4 ;
  wire \blk00000001/sig000000b3 ;
  wire \blk00000001/sig000000b2 ;
  wire \blk00000001/sig000000b1 ;
  wire \blk00000001/sig000000b0 ;
  wire \blk00000001/sig000000af ;
  wire \blk00000001/sig000000ae ;
  wire \blk00000001/sig000000ad ;
  wire \blk00000001/sig000000ac ;
  wire \blk00000001/sig000000ab ;
  wire \blk00000001/sig000000aa ;
  wire \blk00000001/sig000000a9 ;
  wire \blk00000001/sig000000a8 ;
  wire \blk00000001/sig000000a7 ;
  wire \blk00000001/sig000000a6 ;
  wire \blk00000001/sig000000a5 ;
  wire \blk00000001/sig000000a4 ;
  wire \blk00000001/sig000000a3 ;
  wire \blk00000001/sig000000a2 ;
  wire \blk00000001/sig000000a1 ;
  wire \blk00000001/sig000000a0 ;
  wire \blk00000001/sig0000009f ;
  wire \blk00000001/sig0000009e ;
  wire \blk00000001/sig0000009d ;
  wire \blk00000001/sig0000009c ;
  wire \blk00000001/sig0000009b ;
  wire \blk00000001/sig0000009a ;
  wire \blk00000001/sig00000099 ;
  wire \blk00000001/sig00000098 ;
  wire \blk00000001/sig00000097 ;
  wire \blk00000001/sig00000096 ;
  wire \blk00000001/sig00000095 ;
  wire \blk00000001/sig00000094 ;
  wire \blk00000001/sig00000093 ;
  wire \blk00000001/sig00000092 ;
  wire \blk00000001/sig00000091 ;
  wire \blk00000001/sig00000090 ;
  wire \blk00000001/sig0000008f ;
  wire \blk00000001/sig0000008e ;
  wire \blk00000001/sig0000008d ;
  wire \blk00000001/sig0000008c ;
  wire \blk00000001/sig0000008b ;
  wire \blk00000001/sig0000008a ;
  wire \blk00000001/sig00000089 ;
  wire \blk00000001/sig00000088 ;
  wire \blk00000001/sig00000087 ;
  wire \blk00000001/sig00000086 ;
  wire \blk00000001/sig00000085 ;
  wire \blk00000001/sig00000084 ;
  wire \blk00000001/sig00000083 ;
  wire \blk00000001/sig00000082 ;
  wire \blk00000001/sig00000081 ;
  wire \blk00000001/sig00000080 ;
  wire \blk00000001/sig0000007f ;
  wire \blk00000001/sig0000007e ;
  wire \blk00000001/sig0000007d ;
  wire \blk00000001/sig0000007c ;
  wire \blk00000001/sig0000007b ;
  wire \blk00000001/sig0000007a ;
  wire \blk00000001/sig00000079 ;
  wire \blk00000001/sig00000078 ;
  wire \blk00000001/sig00000077 ;
  wire \blk00000001/sig00000076 ;
  wire \blk00000001/sig00000075 ;
  wire \blk00000001/sig00000074 ;
  wire \blk00000001/sig00000073 ;
  wire \blk00000001/sig00000072 ;
  wire \blk00000001/sig00000071 ;
  wire \blk00000001/sig00000070 ;
  wire \blk00000001/sig0000006f ;
  wire \blk00000001/sig0000006e ;
  wire \blk00000001/sig0000006d ;
  wire \blk00000001/sig0000006c ;
  wire \blk00000001/sig0000006b ;
  wire \blk00000001/sig0000006a ;
  wire \blk00000001/sig00000069 ;
  wire \blk00000001/sig00000068 ;
  wire \blk00000001/sig00000067 ;
  wire \blk00000001/sig00000066 ;
  wire \blk00000001/sig00000065 ;
  wire \blk00000001/sig00000064 ;
  wire \blk00000001/sig00000063 ;
  INV   \blk00000001/blk00000081  (
    .I(add),
    .O(\blk00000001/sig000000c2 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000080  (
    .I0(a[9]),
    .I1(b[9]),
    .I2(add),
    .O(\blk00000001/sig00000098 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000007f  (
    .I0(a[8]),
    .I1(b[8]),
    .I2(add),
    .O(\blk00000001/sig00000099 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000007e  (
    .I0(a[7]),
    .I1(b[7]),
    .I2(add),
    .O(\blk00000001/sig0000009a )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000007d  (
    .I0(a[6]),
    .I1(b[6]),
    .I2(add),
    .O(\blk00000001/sig0000009b )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000007c  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(add),
    .O(\blk00000001/sig0000009c )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000007b  (
    .I0(a[4]),
    .I1(b[4]),
    .I2(add),
    .O(\blk00000001/sig0000009d )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000007a  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(add),
    .O(\blk00000001/sig0000009e )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000079  (
    .I0(a[31]),
    .I1(b[31]),
    .I2(add),
    .O(\blk00000001/sig000000a1 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000078  (
    .I0(a[30]),
    .I1(b[30]),
    .I2(add),
    .O(\blk00000001/sig00000083 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000077  (
    .I0(a[2]),
    .I1(b[2]),
    .I2(add),
    .O(\blk00000001/sig0000009f )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000076  (
    .I0(a[29]),
    .I1(b[29]),
    .I2(add),
    .O(\blk00000001/sig00000084 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000075  (
    .I0(a[28]),
    .I1(b[28]),
    .I2(add),
    .O(\blk00000001/sig00000085 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000074  (
    .I0(a[27]),
    .I1(b[27]),
    .I2(add),
    .O(\blk00000001/sig00000086 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000073  (
    .I0(a[26]),
    .I1(b[26]),
    .I2(add),
    .O(\blk00000001/sig00000087 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000072  (
    .I0(a[25]),
    .I1(b[25]),
    .I2(add),
    .O(\blk00000001/sig00000088 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000071  (
    .I0(a[24]),
    .I1(b[24]),
    .I2(add),
    .O(\blk00000001/sig00000089 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000070  (
    .I0(a[23]),
    .I1(b[23]),
    .I2(add),
    .O(\blk00000001/sig0000008a )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000006f  (
    .I0(a[22]),
    .I1(b[22]),
    .I2(add),
    .O(\blk00000001/sig0000008b )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000006e  (
    .I0(a[21]),
    .I1(b[21]),
    .I2(add),
    .O(\blk00000001/sig0000008c )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000006d  (
    .I0(a[20]),
    .I1(b[20]),
    .I2(add),
    .O(\blk00000001/sig0000008d )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000006c  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(add),
    .O(\blk00000001/sig000000a0 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000006b  (
    .I0(a[19]),
    .I1(b[19]),
    .I2(add),
    .O(\blk00000001/sig0000008e )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk0000006a  (
    .I0(a[18]),
    .I1(b[18]),
    .I2(add),
    .O(\blk00000001/sig0000008f )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000069  (
    .I0(a[17]),
    .I1(b[17]),
    .I2(add),
    .O(\blk00000001/sig00000090 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000068  (
    .I0(a[16]),
    .I1(b[16]),
    .I2(add),
    .O(\blk00000001/sig00000091 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000067  (
    .I0(a[15]),
    .I1(b[15]),
    .I2(add),
    .O(\blk00000001/sig00000092 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000066  (
    .I0(a[14]),
    .I1(b[14]),
    .I2(add),
    .O(\blk00000001/sig00000093 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000065  (
    .I0(a[13]),
    .I1(b[13]),
    .I2(add),
    .O(\blk00000001/sig00000094 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000064  (
    .I0(a[12]),
    .I1(b[12]),
    .I2(add),
    .O(\blk00000001/sig00000095 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000063  (
    .I0(a[11]),
    .I1(b[11]),
    .I2(add),
    .O(\blk00000001/sig00000096 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000062  (
    .I0(a[10]),
    .I1(b[10]),
    .I2(add),
    .O(\blk00000001/sig00000097 )
  );
  LUT3 #(
    .INIT ( 8'h69 ))
  \blk00000001/blk00000061  (
    .I0(a[0]),
    .I1(b[0]),
    .I2(add),
    .O(\blk00000001/sig000000a2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000060  (
    .C(clk),
    .D(\blk00000001/sig00000082 ),
    .Q(s[0])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005f  (
    .C(clk),
    .D(\blk00000001/sig00000081 ),
    .Q(s[1])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005e  (
    .C(clk),
    .D(\blk00000001/sig00000080 ),
    .Q(s[2])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005d  (
    .C(clk),
    .D(\blk00000001/sig0000007f ),
    .Q(s[3])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005c  (
    .C(clk),
    .D(\blk00000001/sig0000007e ),
    .Q(s[4])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005b  (
    .C(clk),
    .D(\blk00000001/sig0000007d ),
    .Q(s[5])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005a  (
    .C(clk),
    .D(\blk00000001/sig0000007c ),
    .Q(s[6])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000059  (
    .C(clk),
    .D(\blk00000001/sig0000007b ),
    .Q(s[7])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000058  (
    .C(clk),
    .D(\blk00000001/sig0000007a ),
    .Q(s[8])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000057  (
    .C(clk),
    .D(\blk00000001/sig00000079 ),
    .Q(s[9])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000056  (
    .C(clk),
    .D(\blk00000001/sig00000078 ),
    .Q(s[10])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000055  (
    .C(clk),
    .D(\blk00000001/sig00000077 ),
    .Q(s[11])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000054  (
    .C(clk),
    .D(\blk00000001/sig00000076 ),
    .Q(s[12])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000053  (
    .C(clk),
    .D(\blk00000001/sig00000075 ),
    .Q(s[13])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000052  (
    .C(clk),
    .D(\blk00000001/sig00000074 ),
    .Q(s[14])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000051  (
    .C(clk),
    .D(\blk00000001/sig00000073 ),
    .Q(s[15])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000050  (
    .C(clk),
    .D(\blk00000001/sig00000072 ),
    .Q(s[16])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004f  (
    .C(clk),
    .D(\blk00000001/sig00000071 ),
    .Q(s[17])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004e  (
    .C(clk),
    .D(\blk00000001/sig00000070 ),
    .Q(s[18])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004d  (
    .C(clk),
    .D(\blk00000001/sig0000006f ),
    .Q(s[19])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004c  (
    .C(clk),
    .D(\blk00000001/sig0000006e ),
    .Q(s[20])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004b  (
    .C(clk),
    .D(\blk00000001/sig0000006d ),
    .Q(s[21])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004a  (
    .C(clk),
    .D(\blk00000001/sig0000006c ),
    .Q(s[22])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000049  (
    .C(clk),
    .D(\blk00000001/sig0000006b ),
    .Q(s[23])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000048  (
    .C(clk),
    .D(\blk00000001/sig0000006a ),
    .Q(s[24])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000047  (
    .C(clk),
    .D(\blk00000001/sig00000069 ),
    .Q(s[25])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000046  (
    .C(clk),
    .D(\blk00000001/sig00000068 ),
    .Q(s[26])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000045  (
    .C(clk),
    .D(\blk00000001/sig00000067 ),
    .Q(s[27])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000044  (
    .C(clk),
    .D(\blk00000001/sig00000066 ),
    .Q(s[28])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000043  (
    .C(clk),
    .D(\blk00000001/sig00000065 ),
    .Q(s[29])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000042  (
    .C(clk),
    .D(\blk00000001/sig00000064 ),
    .Q(s[30])
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000041  (
    .C(clk),
    .D(\blk00000001/sig00000063 ),
    .Q(s[31])
  );
  MUXCY   \blk00000001/blk00000040  (
    .CI(\blk00000001/sig000000c2 ),
    .DI(a[0]),
    .S(\blk00000001/sig000000a2 ),
    .O(\blk00000001/sig000000c1 )
  );
  MUXCY   \blk00000001/blk0000003f  (
    .CI(\blk00000001/sig000000c1 ),
    .DI(a[1]),
    .S(\blk00000001/sig000000a0 ),
    .O(\blk00000001/sig000000c0 )
  );
  MUXCY   \blk00000001/blk0000003e  (
    .CI(\blk00000001/sig000000c0 ),
    .DI(a[2]),
    .S(\blk00000001/sig0000009f ),
    .O(\blk00000001/sig000000bf )
  );
  MUXCY   \blk00000001/blk0000003d  (
    .CI(\blk00000001/sig000000bf ),
    .DI(a[3]),
    .S(\blk00000001/sig0000009e ),
    .O(\blk00000001/sig000000be )
  );
  MUXCY   \blk00000001/blk0000003c  (
    .CI(\blk00000001/sig000000be ),
    .DI(a[4]),
    .S(\blk00000001/sig0000009d ),
    .O(\blk00000001/sig000000bd )
  );
  MUXCY   \blk00000001/blk0000003b  (
    .CI(\blk00000001/sig000000bd ),
    .DI(a[5]),
    .S(\blk00000001/sig0000009c ),
    .O(\blk00000001/sig000000bc )
  );
  MUXCY   \blk00000001/blk0000003a  (
    .CI(\blk00000001/sig000000bc ),
    .DI(a[6]),
    .S(\blk00000001/sig0000009b ),
    .O(\blk00000001/sig000000bb )
  );
  MUXCY   \blk00000001/blk00000039  (
    .CI(\blk00000001/sig000000bb ),
    .DI(a[7]),
    .S(\blk00000001/sig0000009a ),
    .O(\blk00000001/sig000000ba )
  );
  MUXCY   \blk00000001/blk00000038  (
    .CI(\blk00000001/sig000000ba ),
    .DI(a[8]),
    .S(\blk00000001/sig00000099 ),
    .O(\blk00000001/sig000000b9 )
  );
  MUXCY   \blk00000001/blk00000037  (
    .CI(\blk00000001/sig000000b9 ),
    .DI(a[9]),
    .S(\blk00000001/sig00000098 ),
    .O(\blk00000001/sig000000b8 )
  );
  MUXCY   \blk00000001/blk00000036  (
    .CI(\blk00000001/sig000000b8 ),
    .DI(a[10]),
    .S(\blk00000001/sig00000097 ),
    .O(\blk00000001/sig000000b7 )
  );
  MUXCY   \blk00000001/blk00000035  (
    .CI(\blk00000001/sig000000b7 ),
    .DI(a[11]),
    .S(\blk00000001/sig00000096 ),
    .O(\blk00000001/sig000000b6 )
  );
  MUXCY   \blk00000001/blk00000034  (
    .CI(\blk00000001/sig000000b6 ),
    .DI(a[12]),
    .S(\blk00000001/sig00000095 ),
    .O(\blk00000001/sig000000b5 )
  );
  MUXCY   \blk00000001/blk00000033  (
    .CI(\blk00000001/sig000000b5 ),
    .DI(a[13]),
    .S(\blk00000001/sig00000094 ),
    .O(\blk00000001/sig000000b4 )
  );
  MUXCY   \blk00000001/blk00000032  (
    .CI(\blk00000001/sig000000b4 ),
    .DI(a[14]),
    .S(\blk00000001/sig00000093 ),
    .O(\blk00000001/sig000000b3 )
  );
  MUXCY   \blk00000001/blk00000031  (
    .CI(\blk00000001/sig000000b3 ),
    .DI(a[15]),
    .S(\blk00000001/sig00000092 ),
    .O(\blk00000001/sig000000b2 )
  );
  MUXCY   \blk00000001/blk00000030  (
    .CI(\blk00000001/sig000000b2 ),
    .DI(a[16]),
    .S(\blk00000001/sig00000091 ),
    .O(\blk00000001/sig000000b1 )
  );
  MUXCY   \blk00000001/blk0000002f  (
    .CI(\blk00000001/sig000000b1 ),
    .DI(a[17]),
    .S(\blk00000001/sig00000090 ),
    .O(\blk00000001/sig000000b0 )
  );
  MUXCY   \blk00000001/blk0000002e  (
    .CI(\blk00000001/sig000000b0 ),
    .DI(a[18]),
    .S(\blk00000001/sig0000008f ),
    .O(\blk00000001/sig000000af )
  );
  MUXCY   \blk00000001/blk0000002d  (
    .CI(\blk00000001/sig000000af ),
    .DI(a[19]),
    .S(\blk00000001/sig0000008e ),
    .O(\blk00000001/sig000000ae )
  );
  MUXCY   \blk00000001/blk0000002c  (
    .CI(\blk00000001/sig000000ae ),
    .DI(a[20]),
    .S(\blk00000001/sig0000008d ),
    .O(\blk00000001/sig000000ad )
  );
  MUXCY   \blk00000001/blk0000002b  (
    .CI(\blk00000001/sig000000ad ),
    .DI(a[21]),
    .S(\blk00000001/sig0000008c ),
    .O(\blk00000001/sig000000ac )
  );
  MUXCY   \blk00000001/blk0000002a  (
    .CI(\blk00000001/sig000000ac ),
    .DI(a[22]),
    .S(\blk00000001/sig0000008b ),
    .O(\blk00000001/sig000000ab )
  );
  MUXCY   \blk00000001/blk00000029  (
    .CI(\blk00000001/sig000000ab ),
    .DI(a[23]),
    .S(\blk00000001/sig0000008a ),
    .O(\blk00000001/sig000000aa )
  );
  MUXCY   \blk00000001/blk00000028  (
    .CI(\blk00000001/sig000000aa ),
    .DI(a[24]),
    .S(\blk00000001/sig00000089 ),
    .O(\blk00000001/sig000000a9 )
  );
  MUXCY   \blk00000001/blk00000027  (
    .CI(\blk00000001/sig000000a9 ),
    .DI(a[25]),
    .S(\blk00000001/sig00000088 ),
    .O(\blk00000001/sig000000a8 )
  );
  MUXCY   \blk00000001/blk00000026  (
    .CI(\blk00000001/sig000000a8 ),
    .DI(a[26]),
    .S(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig000000a7 )
  );
  MUXCY   \blk00000001/blk00000025  (
    .CI(\blk00000001/sig000000a7 ),
    .DI(a[27]),
    .S(\blk00000001/sig00000086 ),
    .O(\blk00000001/sig000000a6 )
  );
  MUXCY   \blk00000001/blk00000024  (
    .CI(\blk00000001/sig000000a6 ),
    .DI(a[28]),
    .S(\blk00000001/sig00000085 ),
    .O(\blk00000001/sig000000a5 )
  );
  MUXCY   \blk00000001/blk00000023  (
    .CI(\blk00000001/sig000000a5 ),
    .DI(a[29]),
    .S(\blk00000001/sig00000084 ),
    .O(\blk00000001/sig000000a4 )
  );
  MUXCY   \blk00000001/blk00000022  (
    .CI(\blk00000001/sig000000a4 ),
    .DI(a[30]),
    .S(\blk00000001/sig00000083 ),
    .O(\blk00000001/sig000000a3 )
  );
  XORCY   \blk00000001/blk00000021  (
    .CI(\blk00000001/sig000000c2 ),
    .LI(\blk00000001/sig000000a2 ),
    .O(\blk00000001/sig00000082 )
  );
  XORCY   \blk00000001/blk00000020  (
    .CI(\blk00000001/sig000000c1 ),
    .LI(\blk00000001/sig000000a0 ),
    .O(\blk00000001/sig00000081 )
  );
  XORCY   \blk00000001/blk0000001f  (
    .CI(\blk00000001/sig000000c0 ),
    .LI(\blk00000001/sig0000009f ),
    .O(\blk00000001/sig00000080 )
  );
  XORCY   \blk00000001/blk0000001e  (
    .CI(\blk00000001/sig000000bf ),
    .LI(\blk00000001/sig0000009e ),
    .O(\blk00000001/sig0000007f )
  );
  XORCY   \blk00000001/blk0000001d  (
    .CI(\blk00000001/sig000000be ),
    .LI(\blk00000001/sig0000009d ),
    .O(\blk00000001/sig0000007e )
  );
  XORCY   \blk00000001/blk0000001c  (
    .CI(\blk00000001/sig000000bd ),
    .LI(\blk00000001/sig0000009c ),
    .O(\blk00000001/sig0000007d )
  );
  XORCY   \blk00000001/blk0000001b  (
    .CI(\blk00000001/sig000000bc ),
    .LI(\blk00000001/sig0000009b ),
    .O(\blk00000001/sig0000007c )
  );
  XORCY   \blk00000001/blk0000001a  (
    .CI(\blk00000001/sig000000bb ),
    .LI(\blk00000001/sig0000009a ),
    .O(\blk00000001/sig0000007b )
  );
  XORCY   \blk00000001/blk00000019  (
    .CI(\blk00000001/sig000000ba ),
    .LI(\blk00000001/sig00000099 ),
    .O(\blk00000001/sig0000007a )
  );
  XORCY   \blk00000001/blk00000018  (
    .CI(\blk00000001/sig000000b9 ),
    .LI(\blk00000001/sig00000098 ),
    .O(\blk00000001/sig00000079 )
  );
  XORCY   \blk00000001/blk00000017  (
    .CI(\blk00000001/sig000000b8 ),
    .LI(\blk00000001/sig00000097 ),
    .O(\blk00000001/sig00000078 )
  );
  XORCY   \blk00000001/blk00000016  (
    .CI(\blk00000001/sig000000b7 ),
    .LI(\blk00000001/sig00000096 ),
    .O(\blk00000001/sig00000077 )
  );
  XORCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig000000b6 ),
    .LI(\blk00000001/sig00000095 ),
    .O(\blk00000001/sig00000076 )
  );
  XORCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig000000b5 ),
    .LI(\blk00000001/sig00000094 ),
    .O(\blk00000001/sig00000075 )
  );
  XORCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig000000b4 ),
    .LI(\blk00000001/sig00000093 ),
    .O(\blk00000001/sig00000074 )
  );
  XORCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig000000b3 ),
    .LI(\blk00000001/sig00000092 ),
    .O(\blk00000001/sig00000073 )
  );
  XORCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig000000b2 ),
    .LI(\blk00000001/sig00000091 ),
    .O(\blk00000001/sig00000072 )
  );
  XORCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig000000b1 ),
    .LI(\blk00000001/sig00000090 ),
    .O(\blk00000001/sig00000071 )
  );
  XORCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig000000b0 ),
    .LI(\blk00000001/sig0000008f ),
    .O(\blk00000001/sig00000070 )
  );
  XORCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig000000af ),
    .LI(\blk00000001/sig0000008e ),
    .O(\blk00000001/sig0000006f )
  );
  XORCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig000000ae ),
    .LI(\blk00000001/sig0000008d ),
    .O(\blk00000001/sig0000006e )
  );
  XORCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig000000ad ),
    .LI(\blk00000001/sig0000008c ),
    .O(\blk00000001/sig0000006d )
  );
  XORCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig000000ac ),
    .LI(\blk00000001/sig0000008b ),
    .O(\blk00000001/sig0000006c )
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig000000ab ),
    .LI(\blk00000001/sig0000008a ),
    .O(\blk00000001/sig0000006b )
  );
  XORCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig000000aa ),
    .LI(\blk00000001/sig00000089 ),
    .O(\blk00000001/sig0000006a )
  );
  XORCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig000000a9 ),
    .LI(\blk00000001/sig00000088 ),
    .O(\blk00000001/sig00000069 )
  );
  XORCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig000000a8 ),
    .LI(\blk00000001/sig00000087 ),
    .O(\blk00000001/sig00000068 )
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig000000a7 ),
    .LI(\blk00000001/sig00000086 ),
    .O(\blk00000001/sig00000067 )
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig000000a6 ),
    .LI(\blk00000001/sig00000085 ),
    .O(\blk00000001/sig00000066 )
  );
  XORCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig000000a5 ),
    .LI(\blk00000001/sig00000084 ),
    .O(\blk00000001/sig00000065 )
  );
  XORCY   \blk00000001/blk00000003  (
    .CI(\blk00000001/sig000000a4 ),
    .LI(\blk00000001/sig00000083 ),
    .O(\blk00000001/sig00000064 )
  );
  XORCY   \blk00000001/blk00000002  (
    .CI(\blk00000001/sig000000a3 ),
    .LI(\blk00000001/sig000000a1 ),
    .O(\blk00000001/sig00000063 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on