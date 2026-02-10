

`timescale 1ns/1ps

module program_counter_tb;
    reg clk;
    reg rst_n;
    reg pc_en;
    reg [1:0] pc_sel;
    reg [10:0] imm_addr;
    reg [10:0] alu_addr;
    wire [10:0] pc;

    // DUT
    pc_block uut (
        .clk(clk),
        .rst_n(rst_n),
        .pc_en(pc_en),
        .pc_sel(pc_sel),
        .imm_addr(imm_addr),
        .alu_addr(alu_addr),
        .pc(pc)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
    $dumpfile("pc_block.vcd"); 
    $dumpvars (0, program_counter_tb);

    clk = 0;
    rst_n = 0;
    pc_en = 1;
    pc_sel = 2'b00;
    imm_addr = 11'h040;
    alu_addr = 11'h080;

    #10 rst_n = 1;

    #20 pc_sel = 2'b01; imm_addr = 11'h100;
    #20 pc_sel = 2'b10; alu_addr = 11'h200;
    #20 pc_sel = 2'b11;
    #20 pc_sel = 2'b00;
    #20 pc_en = 0;
    #20 pc_en = 1;
    #40 $finish;
end

endmodule
