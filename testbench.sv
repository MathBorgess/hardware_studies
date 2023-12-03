`timescale 1ns/1ps

`include "sys_design.sv"
module tb_gate;
  reg [11:0] bits;
  wire [3:0] count;

  LUT_12bit_1s uut (
    .bits(bits),
    .count(count)
  );
  initial begin
    $dumpfile("gate_simulation.vcd");

    $dumpvars(0, tb_gate);

    // for(bits = 0; bits < 10; bits = bits + 1) begin
    //   #10;
    // end

    bits = 12'b111111111111;
    #10;
    bits = 12'b010110101101;
    #10;
    bits = 12'b100001011100;
    #10;

    // Finish simulation
    #10 $finish;
  end

endmodule
