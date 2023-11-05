`timescale 1ns/1ps

`include "sys_design.sv"

module gate_tb;
    // Inputs
    reg a, b, c, d;
    // Output
    reg [3:0] subsets_iten = 0;
    wire y;

    gate uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y(y)
    );

    initial begin
        $display("a \t b \t c \t d | \t y \n");
        for (real count = 0; count < 16; count = count + 1) begin
            a = subsets_iten[3];
            b = subsets_iten[2];
            c = subsets_iten[1];
            d = subsets_iten[0];
            #1; $display("%b \t %b \t %b \t %b | \t %b", a, b, c, d, y);
            subsets_iten = subsets_iten + 1;
        end
        $finish; // End the simulation
    end
endmodule
