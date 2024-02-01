module SevenSegmentsHighDecoder (
    input wire [3:0] in,
    output reg [6:0] out
);
//out -> [a,b,c,d,e,f,g], start from the top segment and go clockwise, g is the middle segment
always @ (in)
begin
    case (in)
        4'b0000: out = 7'b1111110; // 0
        4'b0001: out = 7'b0110000; // 1
        4'b0010: out = 7'b1101101; // 2
        4'b0011: out = 7'b1111001; // 3
        4'b0100: out = 7'b0110011; // 4
        4'b0101: out = 7'b1011011; // 5
        4'b0110: out = 7'b0011111; // 6
        4'b0111: out = 7'b1110000; // 7
        4'b1000: out = 7'b1111111; // 8
        4'b1001: out = 7'b1111011; // 9
        default: out = 7'b0000000; // OFF
    endcase
end
endmodule


//https://www.electricaltechnology.org/2018/05/bcd-to-7-segment-display-decoder.html
module SevenSegmentsLowDecoder (
    input wire [3:0] in,
    output reg [6:0] out
);
//out -> [a,b,c,d,e,f,g], start from the top segment and go clockwise, g is the middle segment
always @ (in)
begin
    out[0] = in[0] | in[2] | (in[1] & in[3]) | (~in[1] & ~in[3])
    out[1] = ~in[1] | (~in[2] & ~in[3]) | (in[2] & in[3])
    out[2] = in[1] | ~in[2] | in[3]
    out[3] = in[0] | (~in[1] & ~in[3]) |  (~in[1] & in[2]) | {in[2] & ~in[3]} | (in[1] & ~in[2] & in[3])
    out[4] = (~in[1] & ~in[3]) | (in[2] & ~in[3])
    out[5] = in[0] | (in[1] & ~in[2]) |(in[1] & ~in[3]) | (in[2] & ~in[3])
    out[6] = in[0] | (in[1] & ~in[2])  | (~in[1] & in[2]) | (in[2] & ~in[3]) 
end
endmodule

