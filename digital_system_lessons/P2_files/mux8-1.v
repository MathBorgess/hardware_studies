module mux8_1cond (
    input wire [2:0] Sel,
    input wire [7:0] A,
    output reg F
);
always @ (Sel)
begin
    if (Sel == 3'b000)
        F = A[0];
    else if (Sel == 3'b001)
        F = A[1];
    else if (Sel == 3'b010)
        F = A[2];
    else if (Sel == 3'b011)
        F = A[3];
    else if (Sel == 3'b100)
        F = A[4];
    else if (Sel == 3'b101)
        F = A[5];
    else if (Sel == 3'b110)
        F = A[6];
    else if (Sel == 3'b111)
        F = A[7];
end
endmodule

module mux8_1logic (
    input wire [2:0] Sel,
    input wire [7:0] A,
    output reg F
);
always @ (Sel)
begin
    F = A[0] & ~Sel[0] & ~Sel[1] & ~Sel[2] |
          A[1] & ~Sel[0] & ~Sel[1] & Sel[2] |
          A[2] & ~Sel[0] & Sel[1] & ~Sel[2] |
          A[3] & ~Sel[0] & Sel[1] & Sel[2] |
          A[4] & Sel[0] & ~Sel[1] & ~Sel[2] |
          A[5] & Sel[0] & ~Sel[1] & Sel[2] |
          A[6] & Sel[0] & Sel[1] & ~Sel[2] |
          A[7] & Sel[0] & Sel[1] & Sel[2];
end
endmodule