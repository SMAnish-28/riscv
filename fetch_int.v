`timescale 1ns/1ps

module fetch_int #(
    parameter ADDR_WIDTH = 11,   // 2048 words
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst_n,
    
    input [1:0] pc_sel,
    input [ADDR_WIDTH-1:0] alu_addr,
    input [ADDR_WIDTH-1:0] imm_addr,
    
    input   cntlr_rd,
    output  [DATA_WIDTH-1:0]cntlr_rd_data,
    output  cntlr_rd_valid,

    input cntlr_wr,
    input [ADDR_WIDTH-1:0]cntlr_waddr,
    input [DATA_WIDTH-1:0]cntlr_wr_data,

    output   mem_rd,
    output  [ADDR_WIDTH-1:0]mem_rd_addr,
    input   [DATA_WIDTH-1:0]mem_rd_data,

    output   mem_wr,
    output  [ADDR_WIDTH-1:0]mem_wr_addr,
    output  [DATA_WIDTH-1:0]mem_wr_data
);

    wire [ADDR_WIDTH-1:0] cntlr_raddr;

    //instantiate pc_module & ccm_controller

    pc_block pc_uut (
        .clk(clk), 
        .rst_n(rst_n),
        .pc_en(1'b1),
        .pc_sel(pc_sel),
        .imm_addr(imm_addr),
        .alu_addr(alu_addr),
        .pc(cntlr_raddr)
    );

    ccm_controller ccm_uut (
        .clk(clk),
        .rst_n(rst_n),

        .cntlr_rd(cntlr_rd),
        .cntlr_raddr(cntlr_raddr), // address coming from pc
        .cntlr_rd_data(cntlr_rd_data),
        .cntlr_rd_valid(cntlr_rd_valid),

        .cntlr_wr(cntlr_wr),
        .cntlr_waddr(cntlr_waddr),
        .cntlr_wr_data(cntlr_wr_data),

        .mem_rd(mem_rd),
        .mem_rd_addr(mem_rd_addr),
        .mem_rd_data(mem_rd_data),

        .mem_wr(mem_wr),
        .mem_wr_addr(mem_wr_addr),
        .mem_wr_data(mem_wr_data)
    );


    


endmodule