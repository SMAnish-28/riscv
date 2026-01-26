// `timescale 1ns / 1ps

// module tb_pc_block;

//     // ------------------------------------------------
//     // Testbench signals
//     // ------------------------------------------------
//     reg         clk;
//     reg         rst;
//     reg         pc_en;
//     reg  [1:0]  pc_sel;
//     reg  [31:0] imm_addr;
//     reg  [31:0] alu_addr;
//     wire [31:0] pc;

//     // ------------------------------------------------
//     // DUT instantiation
//     // ------------------------------------------------
//     pc_block dut (
//         .clk(clk),
//         .rst(rst),
//         .pc_en(pc_en),
//         .pc_sel(pc_sel),
//         .imm_addr(imm_addr),
//         .alu_addr(alu_addr),
//         .pc(pc)
//     );

//     // ------------------------------------------------
//     // Clock generation (10 ns period)
//     // ------------------------------------------------
//     always #5 clk = ~clk;

//     // ------------------------------------------------
//     // Test sequence
//     // ------------------------------------------------
//     initial begin
//         // Initialize signals
//         clk      = 0;
//         rst      = 1;
//         pc_en   = 1;
//         pc_sel  = 2'b00;
//         imm_addr = 32'h0000_1000;
//         alu_addr = 32'h0000_2000;

//         // Hold reset
//         #12;
//         rst = 0;

//         // --------------------------------------------
//         // 1. Normal PC + 4 operation
//         // --------------------------------------------
//         pc_sel = 2'b00;
//         #40;

//         // --------------------------------------------
//         // 2. Branch / JAL (Immediate address)
//         // --------------------------------------------
//         pc_sel   = 2'b01;
//         imm_addr = 32'h0000_0040;
//         #10;

//         // --------------------------------------------
//         // 3. JALR (ALU address)
//         // --------------------------------------------
//         pc_sel   = 2'b10;
//         alu_addr = 32'h0000_0080;
//         #10;

//         // --------------------------------------------
//         // 4. Hold PC (stall)
//         // --------------------------------------------
//         pc_sel = 2'b11;
//         #30;

//         // --------------------------------------------
//         // 5. Resume PC + 4
//         // --------------------------------------------
//         pc_sel = 2'b00;
//         #20;

//         // --------------------------------------------
//         // 6. Disable PC enable (pipeline stall)
//         // --------------------------------------------
//         pc_en = 0;
//         #30;

//         // --------------------------------------------
//         // 7. Re-enable PC
//         // --------------------------------------------
//         pc_en = 1;
//         #20;

//         $finish;
//     end

//     // ------------------------------------------------
//     // Monitor
//     // ------------------------------------------------
//     initial begin
//         $monitor("T=%0t | rst=%b | pc_en=%b | pc_sel=%b | PC=%h",
//                  $time, rst, pc_en, pc_sel, pc);
//     end

// endmodule


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