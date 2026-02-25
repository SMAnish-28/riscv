`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2026 07:54:03 PM
// Design Name: 
// Module Name: iccm_bist
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


module iccm_bist #(
    parameter ADDR_WIDTH = 11,
    parameter DATA_WIDTH = 32,
    parameter NUM_ROWS = 2048
)(
    input clk,
    input rst_n,
    input bist_en,
    output bist_pass,
    output bist_fail,
    
    output cntlr_rd,
    output reg[ADDR_WIDTH-1:0] cntlr_raddr,
    input [DATA_WIDTH-1:0] cntlr_rd_data,
    input cntlr_rd_valid,

    output cntlr_wr,
    output [ADDR_WIDTH-1:0]cntlr_waddr,
    output [DATA_WIDTH-1:0]cntlr_wr_data
    );
    
    reg bist_en_d1;
    wire bist_start;
    reg [ADDR_WIDTH-1:0] bist_addr;
    reg bist_wr_in_progress;
    reg bist_wr_done;
    reg bist_rd_in_progress;
    reg bist_rd_done;
    wire bist_match;
    reg [ADDR_WIDTH:0] bist_match_cntr;
    
    reg [DATA_WIDTH-1:0]expected_rd_data, expected_rd_data_d1;
    reg [ADDR_WIDTH:0] match_count;
    reg bist_done;
    
    always @(posedge clk )begin
        bist_en_d1 <= bist_en;
    end
    
    assign bist_start = bist_en & ~bist_en_d1;

     /*---------------------
            Write Path
      ----------------------*/                  
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n) begin
            bist_addr <= 0;
            bist_wr_in_progress <= 0;
            bist_wr_done <= 0;
        end
        else if(!bist_en) begin
            bist_addr <= 0;
            bist_wr_in_progress <= 0;
            bist_wr_done <= 0;
        end
        else if(bist_start) begin
            bist_addr <= 0;
            bist_wr_in_progress <= 1;
        end
        else begin
            if(bist_addr == NUM_ROWS-1) begin
                bist_wr_done <= 1;
                bist_wr_in_progress <= 0;
            end
            else begin
                bist_addr <= bist_addr + 1;
            end
        end
    end
    
    assign cntlr_wr = bist_wr_in_progress;
    assign cntlr_waddr = bist_addr;
    assign cntlr_wr_data = cntlr_waddr;
    

     /*---------------------
            Read Path
      ----------------------*/ 

    always @(posedge clk or negedge rst_n)begin
          if(!rst_n) begin
            cntlr_raddr <= 0;
            bist_rd_in_progress <= 0;
            bist_rd_done <= 0;
            expected_rd_data <= 0;
            expected_rd_data_d1 <= 0;
        end 
        else begin
            cntlr_raddr <= bist_addr;
            bist_rd_in_progress <= bist_wr_in_progress;
            bist_rd_done <= bist_wr_done;
            expected_rd_data <= cntlr_wr_data;
            expected_rd_data_d1 <= expected_rd_data;
        end 
    end

    assign cntlr_rd = bist_rd_in_progress;
    assign bist_match = bist_en & (bist_rd_in_progress | cntlr_rd_valid ) & (cntlr_rd_data == expected_rd_data_d1);

     always @(posedge clk or negedge rst_n)begin
        if(!rst_n) begin
            match_count <= 0;
            bist_done <= 0;
        end 
        else if (!bist_en) begin
            match_count <= 0;
            bist_done <= 0;
        end
        else if (cntlr_rd_valid & bist_match) begin
            match_count <= match_count +1 ;
        end 
        else begin
            bist_done <= bist_rd_done;
        end
    end
    assign bist_pass = bist_done & (match_count == NUM_ROWS);
    assign bist_fail = bist_done & (match_count != NUM_ROWS);
    
endmodule