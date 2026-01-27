`timescale 1ns/1ps

module tb_iccm_controller;

    localparam ADDR_WIDTH = 11;
    localparam DATA_WIDTH = 32;

    reg clk;
    reg rst_n;

    /* Controller I/F */
    reg                    cntlr_rd;
    reg  [ADDR_WIDTH-1:0]  cntlr_raddr;
    wire [DATA_WIDTH-1:0]  cntlr_rd_data;
    wire                   cntlr_rd_valid;

    reg                    cntlr_wr;
    reg  [ADDR_WIDTH-1:0]  cntlr_waddr;
    reg  [DATA_WIDTH-1:0]  cntlr_wr_data;

    /* SRAM I/F */
    wire                   mem_rd;
    wire [ADDR_WIDTH-1:0]  mem_rd_addr;
    wire [DATA_WIDTH-1:0]  mem_rd_data;

    wire                   mem_wr;
    wire [ADDR_WIDTH-1:0]  mem_wr_addr;
    wire [DATA_WIDTH-1:0]  mem_wr_data;

    /* DUT */
    iccm_controller dut (
        .clk(clk),
        .rst_n(rst_n),

        .cntlr_rd(cntlr_rd),
        .cntlr_raddr(cntlr_raddr),
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

    /* SRAM */
    sram_8kb sram (
        .clk(clk),
        .rd_en(mem_rd),
        .rd_addr(mem_rd_addr),
        .rd_data(mem_rd_data),
        .wr_en(mem_wr),
        .wr_addr(mem_wr_addr),
        .wr_data(mem_wr_data)
    );

    /* Clock */
    always #5 clk = ~clk;

    initial begin
        $dumpfile("iccm_waveform.vcd");
        $dumpvars(0, tb_iccm_controller);
    end

    /* Test */
    initial begin
        clk = 0;
        rst_n = 0;

        cntlr_rd = 0;
        cntlr_wr = 0;
        cntlr_raddr = 0;
        cntlr_waddr = 0;
        cntlr_wr_data = 0;

        #22    rst_n = 1;

        /* Write */
        
        #11; cntlr_wr = 1;
        cntlr_waddr = 11'd10;
        cntlr_wr_data = 32'hDEADBEEF;

        #14;
        cntlr_wr = 0;

        /* Read */
        #10;
        cntlr_rd = 1;
        cntlr_raddr = 11'd10;

        #10;
        cntlr_rd = 0;

        

        #20;
        $finish;
    end


endmodule
