// `timescale 1ns/1ps

// module sram_8kb_tb;
//     reg clk;
//     reg we;
//     reg oe;
//     reg [10:0] addr;
//     reg [31:0] data_in;

//     wire [31:0] data_out;
//     integer random_addr;
//     integer random_data;

//     sram_8kb uut (
//         .clk(clk),
//         .we(we),
//         .oe(oe),
//         .addr(addr),
//         .data_in(data_in),
//         .data_out(data_out)
//     );

//     initial begin
//         clk = 0;
//         forever #5 clk = ~clk;
//     end

//     initial begin
//         $dumpfile("sram_gtk10.vcd");
//         $dumpvars(0, sram_8kb_tb);

//         // Initializing...
//         we = 0;
//         oe = 0;
//         addr = 0;
//         data_in = 0;

//         // global reset
//         #15;

//         // Test write operation
//         $display("Testing write operations...");
//         #1 we = 1;
//         oe = 0;
//         addr = 11'd0;
//         data_in = 32'hAAAAAAAA;
//         #10; 

//         random_addr = $random % 2048;
//         random_data = $random;
//         addr = random_addr;
//         // addr = 11'd1;
//         data_in = random_data;
//         #10;

//         addr = 11'd2047; 
//         data_in = 32'h55555555;
//         #10;

//         // Test read operation
//         $display("Testing read operations...");
//         we = 0;
//         oe = 1;
//         addr = 11'd0;
//         #10;
//         // #1;
//         $display("%tps: Read addr 0: expected 0xAAAAAAAA, got 0x%h", $time, data_out);

//         // addr = 11'd1;
//         addr = random_addr;
//         #10;
//         $display("%tps: Read addr 0x%h: expected 0x%h, got 0x%h", $time, random_addr, random_data, data_out);

//         addr = 11'd2047;
//         #10;
//         $display("%tps: Read addr 2047: expected 0x55555555, got 0x%h", $time, data_out);

//         // Test read when oe is low
//         oe = 0;
//         addr = 11'd0;
//         #10;
//         $display("%tps: Read with oe=0: expected Z, got 0x%h", $time, data_out);

//         $finish;
//     end

// endmodule

`timescale 1ns/1ps

module sram_8kb_tb;

    reg clk;
    reg we;
    reg oe;
    reg [10:0] addr;
    reg [31:0] data_in;
    wire [31:0] data_out;

    // LFSR registers
    reg [10:0] lfsr_addr;
    reg [31:0] lfsr_data;

    integer i;

    sram_8kb uut (
        .clk(clk),
        .we(we),
        .oe(oe),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // LFSR update task
    task lfsr_next;
        begin
            // 11-bit LFSR: x^11 + x^9 + 1
            lfsr_addr <= {lfsr_addr[9:0],
                          lfsr_addr[10] ^ lfsr_addr[8]};

            // 32-bit LFSR: x^32 + x^22 + x^2 + x + 1
            lfsr_data <= {lfsr_data[30:0],
                          lfsr_data[31] ^ lfsr_data[21] ^
                          lfsr_data[1]  ^ lfsr_data[0]};
        end
    endtask

    initial begin
        $dumpfile("sram_gtk.vcd");
        $dumpvars(0, sram_8kb_tb);

        // Initial values
        we = 0;
        oe = 0;
        addr = 0;
        data_in = 0;

        // Seed values (must be non-zero)
        lfsr_addr = 11'h5A3;
        lfsr_data = 32'hABCDE123;

        #20;

        // ============================
        // WRITE TEST (LFSR-based)
        // ============================
        $display("---- LFSR WRITE TEST ----");
        we = 1;
        oe = 0;

        for (i = 0; i < 20; i = i + 1) begin
            lfsr_next();
            addr    = lfsr_addr;
            data_in = lfsr_data;
            #10;
            $display("%tps: WRITE addr=%0d data=0x%h",
                     $time, addr, data_in);
        end

        // ============================
        // READ TEST (LFSR-based)
        // ============================
        $display("---- LFSR READ TEST ----");
        we = 0;
        oe = 1;

        // Re-seed to regenerate same sequence
        lfsr_addr = 11'h5A3;
        lfsr_data = 32'hABCDE123;

        for (i = 0; i < 20; i = i + 1) begin
            lfsr_next();
            addr = lfsr_addr;
            data_in = lfsr_data;
            #10;
            $display("%tps: READ addr=%0d expected=0x%h got=0x%h",
                     $time, addr, data_in, data_out);
        end

        // ============================
        // OE LOW TEST
        // ============================
        oe = 0;
        addr = 11'd0;
        #10;
        $display("%tps: Read with oe=0, data_out=%h",
                 $time, data_out);

        $finish;
    end

endmodule
