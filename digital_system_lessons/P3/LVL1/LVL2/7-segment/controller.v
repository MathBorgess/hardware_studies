`include "./digital_system_lessons/P3/LVL1/LVL2/7-segment/LVL3/7_segments_decoder.v"

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