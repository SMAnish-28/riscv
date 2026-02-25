`timescale 1ns/1ps

module ccm_controller #(
    parameter ADDR_WIDTH = 11,   // 2048 words
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst_n,

    input cntlr_rd,
    input [ADDR_WIDTH-1:0] cntlr_raddr,
    output [DATA_WIDTH-1:0] cntlr_rd_data,
    output reg cntlr_rd_valid,

    input cntlr_wr,
    input [ADDR_WIDTH-1:0]cntlr_waddr,
    input [DATA_WIDTH-1:0]cntlr_wr_data,

    //2 port sram 
    
    output  mem_rd,
    output [ADDR_WIDTH-1:0]mem_rd_addr,
    input [DATA_WIDTH-1:0]mem_rd_data,

    output  mem_wr,
    output  [ADDR_WIDTH-1:0]mem_wr_addr,
    output  [DATA_WIDTH-1:0]mem_wr_data
);

     /* -----------------------------
              Write path
       ----------------------------- */
        assign  mem_wr = cntlr_wr;
        assign  mem_wr_addr = cntlr_waddr;
        assign  mem_wr_data = cntlr_wr_data;


    
    /* -------------------------------------------------------
                          Read Path
        - Read data from memory comes back with 1 clock delay
       ------------------------------------------------------- */
    
    
    assign mem_rd = cntlr_rd;
    assign mem_rd_addr = cntlr_raddr;
    assign cntlr_rd_data = mem_rd_data;
    
    
    
    always @(posedge clk) begin
        cntlr_rd_valid <= cntlr_rd; 
    end

endmodule
