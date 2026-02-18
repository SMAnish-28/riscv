`timescale 1ns/1ps

module fetch_top();
    parameter ADDR_WIDTH = 11;   // 2048 words
    parameter DATA_WIDTH = 32;

    reg clk;
    reg rst_n;
    
    reg bist_en;

    reg [1:0] pc_sel;
    reg [ADDR_WIDTH-1:0] alu_addr;
    reg [ADDR_WIDTH-1:0] imm_addr;
    
    reg cntlr_rd;
    wire [DATA_WIDTH-1:0] cntlr_rd_data;
    wire cntlr_rd_valid;

    reg cntlr_wr;
    reg [ADDR_WIDTH-1:0]cntlr_waddr;
    reg [DATA_WIDTH-1:0]cntlr_wr_data;

    

    fetch #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) fetch_inst (
        .clk(clk),
        .rst_n(rst_n),
        
        .bist_en(bist_en),
        .bist_pass(),
        .bist_fail(),

        .pc_sel(pc_sel),
        .alu_addr(alu_addr),
        .imm_addr(imm_addr),
    
        .cntlr_rd(cntlr_rd),
        .cntlr_rd_data(cntlr_rd_data),
        .cntlr_rd_valid(cntlr_rd_valid),
        .cntlr_wr(cntlr_wr),
        .cntlr_waddr(cntlr_waddr),
        .cntlr_wr_data(cntlr_wr_data)
        );



    always #5 clk = ~clk;

    initial begin
        $dumpfile("fetch_top.vcd"); 
        $dumpvars (0, fetch_top);

        // Initialize signals
        clk = 0;
        rst_n = 1;
        bist_en = 0;
        pc_sel = 2'b00;
        alu_addr = 11'b0;
        imm_addr = 11'b0;
        cntlr_rd = 0;
        cntlr_wr = 0;
        cntlr_waddr = 11'b0;
        cntlr_wr_data = 32'b0;
        // Apply reset
        #17;
        rst_n = 0;
        // Release reset
        #17;
        rst_n = 1;
        #30;
        bist_en = 1;
        #20500;

        // =====================================================
        // TEST SEQUENCES
        // =====================================================

        // -----------------------------
        // 1) Controller Write Sequence
        // -----------------------------
        $display("\n==== TEST 1: CONTROLLER WRITES ====");

        @(negedge clk);
        cntlr_wr = 1;
        cntlr_waddr = 11'd5;
        cntlr_wr_data = 32'hA5A5_0001;
        @(negedge clk);
        cntlr_wr = 0;

        @(negedge clk);
        cntlr_wr = 1;
        cntlr_waddr = 11'd6;
        cntlr_wr_data = 32'hA5A5_0002;
        @(negedge clk);
        cntlr_wr = 0;

        @(negedge clk);
        cntlr_wr = 1;
        cntlr_waddr = 11'd7;
        cntlr_wr_data = 32'hA5A5_0003;
        @(negedge clk);
        cntlr_wr = 0;

        // -----------------------------
        // 2) Controller Read Sequence
        // -----------------------------
        

        @(negedge clk);
        cntlr_rd = 1;
        @(negedge clk);
        cntlr_rd = 0;

        // Wait for valid read data
        wait(cntlr_rd_valid == 1);


        // -----------------------------
        // 3) PC based fetch (pc_sel=0)
        // -----------------------------
        $display("\n==== TEST 3: PC BASED FETCH ====");

        pc_sel = 2'b00;   // PC mode
        // let PC increment and fetch some cycles
        repeat(5) @(negedge clk);

        // -----------------------------
        // 4) ALU based fetch (pc_sel=1)
        // -----------------------------
        $display("\n==== TEST 4: ALU BASED FETCH ====");

        pc_sel = 2'b01;
        imm_addr = 11'd5;  // should fetch 32'hA5A5_0001
         
        @(negedge clk);
        cntlr_rd = 1;
        @(negedge clk);
        cntlr_rd = 0;

        pc_sel = 2'b01;
        imm_addr = 11'd6;

        @(negedge clk);
        cntlr_rd = 1;
        @(negedge clk);
        cntlr_rd = 0;

        pc_sel = 2'b01;
        imm_addr = 11'd6;

        @(negedge clk);
        cntlr_rd = 1;
        @(negedge clk);
        cntlr_rd = 0;

        pc_sel = 2'b01;
        imm_addr = 11'd7;

        @(negedge clk);
        cntlr_rd = 1;
        @(negedge clk);
        cntlr_rd = 0;

        


        // Finish
        #50;
        $display("\n==== ALL TESTS DONE ====");
        $finish;
    end

endmodule
