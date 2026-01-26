`timescale 1ns/1ps

module fetch #(
    parameter ADDR_WIDTH = 11,   // 2048 words
    parameter DATA_WIDTH = 32
)(
    input [1:0] pc_sel,
    input [ADDR_WIDTH-1:0] alu_addr,
    input [ADDR_WIDTH-1:0] imm_addr,
    
    input clk,
    input rst_n,

    input cntlr_rd,
    output reg [DATA_WIDTH-1:0] cntlr_rd_data,
    output reg cntlr_rd_valid,

    input cntlr_wr,
    input [ADDR_WIDTH-1:0]cntlr_waddr,
    input [DATA_WIDTH-1:0]cntlr_wr_data,

    output reg mem_rd,
    output reg [ADDR_WIDTH-1:0]mem_rd_addr,
    input [DATA_WIDTH-1:0]mem_rd_data,

    output reg mem_wr,
    output reg [ADDR_WIDTH-1:0]mem_wr_addr,
    output reg [DATA_WIDTH-1:0]mem_wr_data
);

    wire [ADDR_WIDTH-1:0] cntlr_raddr;

    pc_block pc_inst (
        .clk(clk),
        .rst_n(rst_n),
        .pc_en(1'b1),
        .pc_sel(pc_sel),
        .imm_addr(imm_addr),
        .alu_addr(alu_addr),
        .pc(cntlr_raddr)
    );
    
    reg mem_rd_ff;
    reg mem_wr_ff;
    reg [ADDR_WIDTH-1:0]mem_wr_addr_ff;
    reg [DATA_WIDTH-1:0]mem_wr_data_ff;


    always @(*) begin
        mem_rd      = 1'b0;
        mem_wr      = 1'b0;
        mem_rd_addr = {ADDR_WIDTH{1'b0}};
        mem_wr_addr = {ADDR_WIDTH{1'b0}};
        mem_wr_data = {DATA_WIDTH{1'b0}};

        if (cntlr_wr) begin
            mem_wr_ff      = 1'b1;
            mem_wr_addr_ff = cntlr_waddr;
            mem_wr_data_ff = cntlr_wr_data;
        end
        else if (cntlr_rd) begin
            mem_rd      = 1'b1;
            mem_rd_addr = cntlr_raddr;
            mem_rd_ff = 1'b1;
        end
    end

    /* -----------------------------
       Read Data Return (1-cycle)
       ----------------------------- */
    always @(posedge clk or negedge rst_n) begin


        if (!rst_n) begin
            cntlr_rd_data  <= 32'h00000000;
            cntlr_rd_valid <= 1'b0;
            
        end 
        else if(cntlr_rd) begin
            cntlr_rd_data  <= mem_rd_data;
            cntlr_rd_valid <= mem_rd_ff;  // valid one cycle after rd
        end
        else if(cntlr_wr)begin
            mem_wr <= mem_wr_ff;
            mem_wr_addr <= mem_wr_addr_ff;
            mem_wr_data <= mem_wr_data_ff;
        end
        else begin
            mem_wr <= 1'b0;
            cntlr_rd_valid <= 1'b0;
        end
    end

endmodule