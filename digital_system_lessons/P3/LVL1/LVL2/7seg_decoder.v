
module SevenSegmentsDecoder (
    input wire [3:0] in,
    output reg [6:0] out
);
    //out -> [a,b,c,d,e,f,g], start from the top segment and go clockwise, g is the middle segment
    always @ (in)
    begin
        case (in)
            4'b0000: out = 7'b0000001; //0
            4'b0001: out = 7'b1001111; //1
            4'b0010: out = 7'b0010010; //2
            4'b0011: out = 7'b0000110; //3
            4'b0100: out = 7'b1001100; //4
            4'b0101: out = 7'b0100100; //5
            4'b0110: out = 7'b1100000; //6
            4'b0111: out = 7'b0001111; //7
            4'b1000: out = 7'b0000000; //8 
            4'b1001: out = 7'b0000100; //9
            default: out = 7'b0000000; // OFF
        endcase
    end
endmodule

module SevenSegmentsDecoder_4digits(
    input [3:0] second_unit, second_tens, minute_unit, minute_tens,
    output reg [6:0] out_second_unit, out_second_tens, out_minute_unit, out_minute_tens
);
    
    SevenSegmentsDecoder sevenSegmentsDecoder_second_unit (
        .in(second_unit),
        .out(out_second_unit)
    );
    SevenSegmentsDecoder sevenSegmentsDecoder_second_tens (
        .in(second_tens),
        .out(out_second_tens)
    );
    SevenSegmentsDecoder sevenSegmentsDecoder_minute_unit (
        .in(minute_unit),
        .out(out_minute_unit)
    );
    SevenSegmentsDecoder sevenSegmentsDecoder_minute_tens (
        .in(minute_tens),
        .out(out_minute_tens)
    );
    
endmodule