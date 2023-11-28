module gate (
    input wire a,
    output wire b,
    output wire c
);
  assign #3 b = a & c;  
  assign #2 c = !b;
endmodule
