// `timescale 1ns/1ps

// module sram_8kb(input wire clk,
//                 input wire we,
//                 input wire oe,
//                 input wire [10:0] addr,
//                 input wire [31:0] data_in,
//                 output reg [31:0] data_out
//                );

// reg [31:0] mem [0:2047]; // 8KB memory

// always @(posedge clk) begin
//     if(we) begin
//         mem[addr] <= data_in;
//     end
//     else if(oe) begin
//         data_out <= #1 mem[addr];
//     end
//     else begin
//         data_out <= #1 32'bz;
//     end
// end

// endmodule

module sram_8kb #(
    parameter ADDR_WIDTH = 11,
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rd_en,
    input [ADDR_WIDTH-1:0]rd_addr,
    output reg [DATA_WIDTH-1:0]rd_data,

    input wr_en,
    input [ADDR_WIDTH-1:0]wr_addr,
    input [DATA_WIDTH-1:0]wr_data
);

    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    /* Write */
    always @(posedge clk) begin
        if (wr_en)
            mem[wr_addr] <= wr_data;
    end

    /* Read  */
    always @(*) begin
        if (rd_en)
            rd_data <= mem[rd_addr];
    end

endmodule
