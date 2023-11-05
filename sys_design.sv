module gate (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output reg y
);
    always @(a or b or c or d) begin
      y = a & b & c & d;
    end
endmodule
