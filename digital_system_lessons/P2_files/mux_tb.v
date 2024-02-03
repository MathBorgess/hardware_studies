`timescale 1ns/1ps

module tb_gate;
  reg [2:0] Sel;
  reg [7:0] A;
  wire F;

  mux8_1cond uut1 (
    .Sel(Sel),
    .A(A),
    .F(F)
  );

  mux8_1logic uut2 (
    .Sel(Sel),
    .A(A),
    .F(F)
  );

  initial begin
    $dumpfile("gate_simulation.vcd");

    $dumpvars(0, tb_gate);
    for (Sel = 0; Sel < 8; Sel = Sel + 1) begin
      for (A = 0; A < 256; A = A + 1) begin
        #1;
      end
    end

    $finish;
  end

endmodule
