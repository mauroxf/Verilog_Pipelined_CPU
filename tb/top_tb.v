//==============================================================
// File        : top_tb.v
// Description : Testbench for top_module (3-stage CPU)
// Author      : Mauro Ferreira
//==============================================================

`timescale 1ns/1ps

module top_tb;

    reg clk;
    reg rst;

    // Instantiate the CPU
    top_module uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock: 10ns period (100 MHz)
    always #5 clk = ~clk;

    initial begin
      $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        // Initialize signals
        clk = 0;
        rst = 1;
        #10;

        rst = 0; // Release reset

        #320;
        $finish;
    end

endmodule
