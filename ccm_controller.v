`timescale 1ns/1ps

module ccm_controller #(
    parameter ADDR_WIDTH = 11,   // 2048 words
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst_n,

    input cntlr_rd,
    input [ADDR_WIDTH-1:0] cntlr_raddr,
    output reg [DATA_WIDTH-1:0] cntlr_rd_data,
    output reg cntlr_rd_valid,

    input cntlr_wr,
    input [ADDR_WIDTH-1:0]cntlr_waddr,
    input [DATA_WIDTH-1:0]cntlr_wr_data,

    //2 port sram 
    
    output reg mem_rd,
    output reg [ADDR_WIDTH-1:0]mem_rd_addr,
    input [DATA_WIDTH-1:0]mem_rd_data,

    output reg mem_wr,
    output reg [ADDR_WIDTH-1:0]mem_wr_addr,
    output reg [DATA_WIDTH-1:0]mem_wr_data
);

     /* -----------------------------
       Write path
       ----------------------------- */
    always @(posedge clk or negedge rst_n) begin

        if (!rst_n) begin
            mem_wr <= 0;
            mem_wr_addr <= 0;
            mem_wr_data <= 0;
        end
        else begin
            mem_wr <= cntlr_wr;
            mem_wr_addr <= cntlr_waddr;
            mem_wr_data <= cntlr_wr_data;
        end 
        
    end
    /* -----------------------------
       Read Path
       - Read data from memory comes back with 1 clock delay
       ----------------------------- */
    
    /*
    assign mem_rd = cntlr_rd;
    assign mem_rd_addr = cntlr_raddr;
    assign cntlr_rd_data = mem_rd_data;
    */
    
    always @(*)begin
            mem_rd = cntlr_rd;
            mem_rd_addr = cntlr_raddr;
            cntlr_rd_data = mem_rd_data;
    end
    
    always @(posedge clk) begin
        cntlr_rd_valid <= cntlr_rd; 
    end

endmodule
