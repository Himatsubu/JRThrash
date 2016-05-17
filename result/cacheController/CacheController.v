`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: nakajo lab
// Engineer: koike
// 
// Create Date:    15:05:16 12/05/2013 
// Design Name: 
// Module Name:    LocalMemCntrl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// 
// Additional Comments:
//	
//	
//	!! LIMIT   : latency = 1  (set @JRThrashCacheEnable(cacheLatency=1) )
// !! LIMIT   : (WORDS % NUM_BURST_LEN) == 0
// !! WARNING : After all "o_ready" ports become high, request JRT module
//////////////////////////////////////////////////////////////////////////////////
module CacheController
	#( parameter DWIDTH = 32, 
					 WORDS  = 1024, 
					 AWIDTH = 30, 
					 NUM_BURST_LEN = 64,
					 
		localparam ALIGN_BIT = log2(DWIDTH) - 3,	//shift address to change into byte address form
		localparam OAWIDTH   = AWIDTH+ALIGN_BIT)
(
	input clk,
	input reset_n,
	input [OAWIDTH-1:0] i_offset_addr,  //use for straight mapping
	output				  o_ready,        // high -> completed cache initialization
	input               i_writeBack,    //write back curremt mem data to external memory forcibly

	//connected to JRTmodule
	input [AWIDTH-1:0]  i_addr,
	input [DWIDTH-1:0]  i_dataIn,
	output[DWIDTH-1:0]  o_dataOut,
	input               i_r_or_w,
	input               i_ce,
	output              o_cacheHit,
	
	// read/write command
   output               o_cmdRW,             // READ -> 0,  WRITE -> 1
	output               o_cmdEnable,	      // signal for inputting command to command queue
	input                i_cmdFull,           // high -> command queue in memory controller is full
	output [15:0]        o_burstLen,          // burst read/write as much as DWIDTH*o_burstLen [bit]
	output [OAWIDTH-1:0] o_initial_algnAddr,	// byte addr of external memory
	
	// for mem write
	output              o_wrEnable,  // signal for reading queue in memory controller
   output [DWIDTH-1:0] o_wrData,	   // read data
	input               i_wrEmpty,   // high -> read queue in memory controller is empty

	// for mem read
   output              o_rdEnable, // signal for writing queue in memory controller
   input [DWIDTH-1:0]  i_rdData,   // write data
	input               i_rdEmpty   // high -> read queue in memory controller is empty
);

	localparam INDEX_WIDTH = log2(WORDS);
	localparam TAG_WIDTH   = AWIDTH - INDEX_WIDTH;
	localparam BURST_ACCESS_TIMES = WORDS/NUM_BURST_LEN;

	//state
	localparam S_RESET       = 8'b00000001;
	localparam S_MEM_VALID   = 8'b00000010;
	localparam S_MEM_RO      = 8'b00000100;
	localparam S_MEM_WB      = 8'b00001000;
	
	//state for write external memory
	localparam S_WB_INIT           = 8'b000000001;
	localparam S_READ_LCMEM        = 8'b000000010;
	localparam S_WAIT_LCMEM_RDATA  = 8'b000000100;
	localparam S_INPUT_LCMEM_RDATA = 8'b000001000;
	localparam S_EXEC_WRITE        = 8'b000010000;
	
	//state for read external memory
	localparam S_RO_INIT         = 8'b000000001;
	localparam S_CHECK_EXEC_READ = 8'b000000010;
	localparam S_EXEC_READ       = 8'b000000100;
	localparam S_WRITE_LCMEM     = 8'b000001000;
	
	//bool
	localparam ENABLE   = 1'b1;
	localparam DISABLE  = 1'b0;
	localparam READ     = 1'b0;
	localparam WRITE    = 1'b1;

	wire [127:0]           w_zero = 128'h0;
	wire [127:0]           w_one = 128'h1;
	
	//state manager
	reg  [7:0]             r_state;
	reg  [7:0]             r_wb_state;
	reg  [7:0]             r_ro_state;

	//for read/write cache mem
	wire [INDEX_WIDTH-1:0] w_index = i_addr[INDEX_WIDTH-1 : 0];
	wire [TAG_WIDTH-1:0]   w_tag   = i_addr[AWIDTH-1 : INDEX_WIDTH];
	reg  [TAG_WIDTH-1:0]   r_currentTag;
	reg  [TAG_WIDTH-1:0]   r_nextTag;
	reg  [TAG_WIDTH-1:0]   r_tagAddr;
	reg                    r_cacheMemValid;
	reg                    r_wb_forcibly;
	wire                   w_cacheMemHit = (w_tag==r_currentTag) & r_cacheMemValid & (!r_wb_forcibly);
	wire						  w_cacheMemCe  =  w_cacheMemHit & i_ce;

	//for replace cache mem
	reg  [INDEX_WIDTH-1:0] r_index_rplc;
	wire [INDEX_WIDTH-1:0] w_index_rplc_p1 = r_index_rplc + w_one[INDEX_WIDTH-1:0];
	reg  [INDEX_WIDTH-1:0] r_next_index_rplc;
	reg  [DWIDTH-1:0]      r_dataIn_rplc;
	wire [DWIDTH-1:0]      w_dataOut_rplc;
	reg                    r_r_or_w_rplc;
	reg  [15:0]            r_queueElem_counter;
	wire [15:0]            w_queueElemCounter_m1 = r_queueElem_counter - 16'd1;
	reg  [31:0]            r_burstAccess_counter;
	wire [31:0]            w_burstAccess_counter_m1 = r_burstAccess_counter - 32'd1;

	//for control mem controller
	reg                    r_cmdRW;
	reg                    r_cmdEnable;
	reg  [INDEX_WIDTH-1:0] r_outputAddr_index;
	reg  [INDEX_WIDTH-1:0] r_next_outputAddr_index;
	wire [INDEX_WIDTH-1:0] w_next_outputAddr_index_update = r_next_outputAddr_index + NUM_BURST_LEN;
	reg                    r_wrEnable;
	reg  [DWIDTH-1:0]      r_wrData;
	reg                    r_rdEnable;

   assign o_cmdRW            = r_cmdRW;
	assign o_cmdEnable        = r_cmdEnable;
	assign o_burstLen         = NUM_BURST_LEN;
	// shift for alignment & add offset addr ( DWIDTH==32bit -> 2bit align,    DWIDTH==64bit -> 3bit align)
	assign o_initial_algnAddr = {r_tagAddr, r_outputAddr_index, w_zero[ALIGN_BIT-1:0]} + i_offset_addr;
	assign o_wrEnable         = r_wrEnable;
   assign o_wrData           = r_wrData;
   assign o_rdEnable         = r_rdEnable && (!i_rdEmpty);
	
	assign o_cacheHit         = w_cacheMemHit;
	assign o_ready            = r_cacheMemValid;
	
	assign o_state    = r_state;
	assign o_ro_state = r_ro_state;
	assign o_wb_state = r_wb_state;
	
	DualPortRAM #(.DWIDTH(DWIDTH), .AWIDTH(INDEX_WIDTH), .WORDS(WORDS) )
		cacheMemory(
			.clk       (clk),
			.ce_0      (w_cacheMemCe),
			.addr_0    (w_index),
			.datain_0  (i_dataIn),
			.dataout_0 (o_dataOut),
			.r_w_0     (i_r_or_w),
			
			.ce_1      (ENABLE),
			.addr_1    (r_index_rplc),
			.datain_1  (r_dataIn_rplc),
			.dataout_1 (w_dataOut_rplc),
			.r_w_1     (r_r_or_w_rplc)
		);

	always@(posedge clk)begin
		
		if(!reset_n)begin
			r_state         <= S_RESET;
			r_wb_state      <= S_WB_INIT;
			r_ro_state      <= S_RO_INIT;
			r_currentTag    <= w_zero[TAG_WIDTH-1:0];
			r_cacheMemValid <= DISABLE;
			r_rdEnable      <= DISABLE;
			r_wrEnable      <= DISABLE;
			r_cmdEnable     <= DISABLE;
			r_r_or_w_rplc   <= READ;
			r_wb_forcibly   <= DISABLE;
		end
		else begin
		
			r_rdEnable    <= DISABLE;
			r_wrEnable    <= DISABLE;
			r_cmdEnable   <= DISABLE;
			r_r_or_w_rplc <= READ;
			
			case(r_state)
				
				S_RESET: begin
					r_state   <= S_MEM_RO;
					r_nextTag <= w_tag;
				end
				
				S_MEM_VALID: begin
					r_nextTag     <= w_tag;
					r_state       <= (!w_cacheMemHit || i_writeBack) ? S_MEM_WB : S_MEM_VALID;
					r_ro_state    <= S_RO_INIT;
					r_wb_state    <= S_WB_INIT;
					r_wb_forcibly <= i_writeBack ? ENABLE : DISABLE;
				end
				
				S_MEM_WB: begin
					
					case(r_wb_state)
					
						S_WB_INIT: begin
							r_next_index_rplc       <= w_zero[INDEX_WIDTH-1:0];
							r_next_outputAddr_index <= w_zero[INDEX_WIDTH-1:0];
							r_burstAccess_counter   <= BURST_ACCESS_TIMES;
							r_tagAddr               <= r_currentTag;
							r_wb_state              <= S_READ_LCMEM;
							r_cmdRW                 <= WRITE;
						end
										
						S_READ_LCMEM: begin
							r_index_rplc        <= r_next_index_rplc;
							r_queueElem_counter <= NUM_BURST_LEN;
							r_wb_state          <= i_wrEmpty ? S_WAIT_LCMEM_RDATA : S_READ_LCMEM;	//check whether write queue is empty
						end
											
						S_WAIT_LCMEM_RDATA: begin
							r_index_rplc <= w_index_rplc_p1;
							r_wb_state   <= S_INPUT_LCMEM_RDATA;
						end
						
						S_INPUT_LCMEM_RDATA: begin	// write cahce mem data to queue in memory controller
							r_wrEnable          <= ENABLE;
							r_wrData            <= w_dataOut_rplc;
							r_queueElem_counter <= w_queueElemCounter_m1;
							r_index_rplc        <= w_index_rplc_p1;
							r_wb_state          <= (r_queueElem_counter == 16'd1) ? S_EXEC_WRITE : S_INPUT_LCMEM_RDATA;
						end

						S_EXEC_WRITE: begin	//issue command to write to external memory
							if(!i_cmdFull)begin
								r_cmdEnable             <= ENABLE;
								r_outputAddr_index      <= r_next_outputAddr_index;
								r_next_outputAddr_index <= w_next_outputAddr_index_update;
								r_next_index_rplc       <= r_next_index_rplc + NUM_BURST_LEN;
								r_burstAccess_counter   <= w_burstAccess_counter_m1;
								//(r_burstAccess_counter == 32'd1) -> end of write back
								r_wb_state              <= (r_burstAccess_counter == 32'd1) ? S_WB_INIT : S_READ_LCMEM;
								r_state                 <= (r_burstAccess_counter != 32'd1) ? S_MEM_WB  : (r_wb_forcibly ? S_MEM_VALID : S_MEM_RO);
								r_wb_forcibly           <= (r_burstAccess_counter == 32'd1) ? DISABLE   : r_wb_forcibly;
							end
						end
					endcase
				end
				
				S_MEM_RO:begin
					
					case(r_ro_state)
					
						S_RO_INIT: begin
							r_next_index_rplc       <= w_zero[INDEX_WIDTH-1:0];
							r_next_outputAddr_index <= w_zero[INDEX_WIDTH-1:0];
							r_burstAccess_counter   <= BURST_ACCESS_TIMES;
							r_tagAddr               <= r_nextTag;
							r_cmdRW                 <= READ;
							r_ro_state              <= S_CHECK_EXEC_READ;
						end

						S_CHECK_EXEC_READ: begin	//check whether execute external mem read
							r_burstAccess_counter <= w_burstAccess_counter_m1;
							r_ro_state            <= (r_burstAccess_counter == 32'd0) ? S_RO_INIT   : S_EXEC_READ;
							r_state               <= (r_burstAccess_counter == 32'd0) ? S_MEM_VALID : S_MEM_RO;	//(r_burstAccess_counter == 32'd0) -> end of read out
							r_currentTag          <= (r_burstAccess_counter == 32'd0) ? r_nextTag   : r_currentTag; //update tag
							r_cacheMemValid       <= (r_burstAccess_counter == 32'd0) ? ENABLE      : r_cacheMemValid;
						end
						
						S_EXEC_READ: begin	//issue command to read from external memory
							if(!i_cmdFull) begin
								r_cmdEnable             <= ENABLE;
								r_outputAddr_index      <= r_next_outputAddr_index;
								r_next_outputAddr_index <= w_next_outputAddr_index_update;
								r_queueElem_counter     <= NUM_BURST_LEN;
								r_ro_state              <= S_WRITE_LCMEM;								
							end
						end
						
						S_WRITE_LCMEM: begin	//write queue data to cache mem
							r_rdEnable <= ENABLE;	//assign o_rdEnable = r_rdEnable && (!i_rdEmpty);
							if(!i_rdEmpty) begin
								r_dataIn_rplc       <= i_rdData;
								r_r_or_w_rplc       <= WRITE;
								r_index_rplc        <= r_next_index_rplc;
								r_next_index_rplc   <= r_next_index_rplc + w_one[INDEX_WIDTH-1:0];
								r_queueElem_counter <= w_queueElemCounter_m1;
								r_ro_state          <= (r_queueElem_counter == 16'd1) ? S_CHECK_EXEC_READ : S_WRITE_LCMEM;
							end
						end
					endcase
				end
				
				
			endcase
		end
	end
	
	function integer log2;
		input integer value;
		begin
			value = value-1;
			for (log2=0; value>0; log2=log2+1)
				value = value>>1;
		end
	endfunction

endmodule











