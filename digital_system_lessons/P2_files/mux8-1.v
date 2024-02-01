module mux8_1cond (
    input wire [2:0] address,
    input wire [7:0] data,
    output reg out
);
always @ (address)
begin
    if (address == 3'b000)
        out = data[0];
    else if (address == 3'b001)
        out = data[1];
    else if (address == 3'b010)
        out = data[2];
    else if (address == 3'b011)
        out = data[3];
    else if (address == 3'b100)
        out = data[4];
    else if (address == 3'b101)
        out = data[5];
    else if (address == 3'b110)
        out = data[6];
    else if (address == 3'b111)
        out = data[7];
end
endmodule

module mux8_1logic (
    input wire [2:0] address,
    input wire [7:0] data,
    output reg out
);
always @ (address)
begin
    out = data[0] & ~address[0] & ~address[1] & ~address[2] |
          data[1] & ~address[0] & ~address[1] & address[2] |
          data[2] & ~address[0] & address[1] & ~address[2] |
          data[3] & ~address[0] & address[1] & address[2] |
          data[4] & address[0] & ~address[1] & ~address[2] |
          data[5] & address[0] & ~address[1] & address[2] |
          data[6] & address[0] & address[1] & ~address[2] |
          data[7] & address[0] & address[1] & address[2];
end
endmodule