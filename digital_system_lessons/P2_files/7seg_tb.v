`timescale 1ns/1ps

`include "./digital_system_lessons/P2_files/7segments_decoder.v"
module tb_gate;
  reg A, B, C, D;
  wire a,b,c,d,e,f,g ;

  SevenSegmentsLowDecoder uut (
    .A(A), .B(B), .C(C), .D(D),
    .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g)
  );
  initial begin
    $dumpfile("gate_simulation.vcd");

    $dumpvars(0, tb_gate);
    // Test case 1
    A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0;
      #1;
      $display("in = %b%b%b%b ||| a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", A, B,C,D, a, b, c, d, e, f, g);
    // Test case 2
    A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b1;
      #1;
      $display("in = %b%b%b%b ||| a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", A, B,C,D, a, b, c, d, e, f, g);
    // Test case 3
    A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b0;
      #1;
      $display("in = %b%b%b%b ||| a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", A, B,C,D, a, b, c, d, e, f, g);
    // Test case 4
    A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b1;
      #1;
      $display("in = %b%b%b%b ||| a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", A, B,C,D, a, b, c, d, e, f, g);
    // Test case 5
    A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b0;
      #1;
      $display("in = %b%b%b%b ||| a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", A, B,C,D, a, b, c, d, e, f, g);
    // Test case 6
    A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b1;
      #1;
      $display("in = %b%b%b%b ||| a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", A, B,C,D, a, b, c, d, e, f, g);
    // Test case 7
    A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b0;
      #1;
      $display("in = %b%b%b%b ||| a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", A, B,C,D, a, b, c, d, e, f, g);
    // Test case 8
    A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b1;
      #1;
      $display("in = %b%b%b%b ||| a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", A, B,C,D, a, b, c, d, e, f, g);
    // Test case 9
    A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b0;
      #1;
      $display("in = %b%b%b%b ||| a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", A, B,C,D, a, b, c, d, e, f, g);
    // Test case 10
    A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b1;
      #1;
      $display("in = %b%b%b%b ||| a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b", A, B,C,D, a, b, c, d, e, f, g);



    // Finish simulation
    #10 $finish;
  end

endmodule
