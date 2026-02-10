// `timescale 1ns/1ps

// module mux(pc_sel, immediate, from_alu, hold, pc_next, pc_in);

// input [1:0] pc_sel;
// input [31:0] immediate;
// input [31:0] from_alu;
// input [31:0] hold;
// input [31:0] pc_next;
// output reg [31:0] pc_in;

// always @(*) begin
//     case(pc_sel)
//         2'b00: pc_in = immediate;
//         2'b01: pc_in = from_alu;
//         2'b10: pc_in = hold;
//         2'b11: pc_in = pc_next;
//         default: pc_in = 32'b0;
//     endcase
// end

// endmodule

// module program_counter(pc, pc_next, pc_en, clk, rst);

// input clk;
// input rst;
// input pc_en;
// input [31:0] pc_next;
// output reg [31:0] pc;

// initial begin
//     pc = 32'b0;
// end

// always @(posedge clk or posedge rst) begin
//     if (rst) begin
//         pc <= 32'b0;
//     end 
//     else if (pc_en) begin
//         pc <= pc_next;
//     end
// end

// endmodule

// module next_program_counter(pc, pc_next);

// input [31:0] pc;
// output [31:0] pc_next;

// assign pc_next = pc + 32'd4;

// endmodule

`timescale 1ns/1ps

module pc_block (
    input wire clk,
    input wire rst_n,
    input wire pc_en,
    input wire [1:0] pc_sel,
    input wire [10:0] imm_addr,
    input wire [10:0] alu_addr,
    output reg [10:0] pc
);
    wire [10:0] pc_plus4;
    reg [10:0] pc_next;
    wire [10:0] hold;
    assign hold = pc;

    assign pc_plus4 = pc + 11'd4;

    always @(*) begin
    case (pc_sel)
        2'b00: pc_next = pc_plus4;
        2'b01: pc_next = imm_addr;
        2'b10: pc_next = alu_addr;
        2'b11: pc_next = hold;
        default: pc_next = pc_plus4;
    endcase
    end
    always @(posedge clk or negedge rst_n) 
    begin
        if (!rst_n)
        pc <= 11'd0;
        else if (pc_en)
        pc <= pc_next;
    end

endmodule
