`include "LVL2/timer/controller.v"
`include "LVL2/magnetron/controller.v"
`include "LVL2/input_control/controller.v"
`include "LVL2/7-segment/controller.v"

module MWcontroller(
    input wire clk, enablen, [9:0] keypad,
    input wire startn, stopn, clearn, door_closed,
    output reg mag_on,
    output reg [6:0] sec_ones_segs, sec_tens_segs, min_ones_segs, min_tens_segs
);
    wire load, pgt_1hz, timer_done, [3:0] digit;
    wire [3:0] out_second_unit, out_second_tens, out_minute_unit, out_minute_tens;
    wire counter_out, clk100;

    input_encoder input_encoder_inst (
        .clk(clk), .enablen(enablen), .keypad(keypad),
        .load(load), .pgt_1hz(pgt_1hz), .digit(digit)
    );

    timer timer_inst (
        .clk(pgt_1hz), .rst(clearn), .enablen(enablen), .load(load), .in(digit),
        .out_second_unit(out_second_unit), .out_second_tens(out_second_tens),
        .out_minute_unit(out_minute_unit), .out_minute_tens(out_minute_tens),
        .finished(timer_done),
    );

    magnetron magnetron_inst (
        .startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done),
        .mag_on(mag_on)
    );

    seven_segment seven_segment_inst (
        .clk(clk), .enablen(enablen),
        .second_unit(out_second_unit), .second_tens(out_second_tens),
        .minute_unit(out_minute_unit), .minute_tens(out_minute_tens),
        .out_seconds_units(sec_ones_segs), .out_seconds_tens(sec_tens_segs),
        .out_minutes_units(min_ones_segs), .out_minutes_tens(min_tens_segs)
    );

endmodule