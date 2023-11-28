`timescale 1ns/1ps

`include "sys_design.sv"
module tb_gate;

  // Inputs
  reg a, b, c;

  // Instantiate the gate module
  gate uut (
    .a(a),
    .b(b),
    .c(c)
  );

  // Initial block for testbench
  initial begin
    // Open a VCD file for dumping simulation results
    $dumpfile("gate_simulation.vcd");

    // Dump all signals
    $dumpvars(0, tb_gate);

    // Initialize inputs
    a = 0;
    b = 0;
    c = 1;

    // Apply test stimulus
    #10 a = 1;

    // Finish simulation
    #10 $finish;
  end

endmodule
