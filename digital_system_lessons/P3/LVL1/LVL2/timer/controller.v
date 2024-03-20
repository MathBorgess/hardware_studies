`include "./LVL1/LVL2/timer/LVL3/counter_down10.v"
`include "./LVL1/LVL2/timer/LVL3/counter_down6.v"

module timer(
    input wire clk, rst, enablen, load, 
    input wire [3:0] in,
    output reg [3:0] out_second_unit, out_second_tens, out_minute_unit, out_minute_tens, 
    output reg finished 
);
    wire [3:0] second_unit_load, second_tens_load, minute_unit_load, minute_tens_load;
    wire [3:0] second_unit, second_tens, minute_unit, minute_tens;
    wire rco_L_second_unit, rco_L_second_tens, rco_L_minute_unit, rco_L_minute_tens;

    counter_down10 counter_down10_second_unit (
        .clk(clk),
        .rst(rst),
        .enablen(enablen),
        .load(load),
        .in(in),
        .next_count_state(second_tens),
        .count(second_unit),
        .rco_L(rco_L_second_unit)
    );
    counter_down6 counter_down6_second_tens (
        .clk(clk),
        .rst(rst),
        .enablen(rco_L_second_unit),
        .load(load),
        .in(second_unit),
        .next_count_state(minute_unit),
        .count(second_tens),
        .rco_L(rco_L_second_tens)
    );
    counter_down10 counter_down10_minutes_unit (
        .clk(clk),
        .rst(rst),
        .enablen(rco_L_second_tens),
        .load(load),
        .in(second_tens),
        .next_count_state(minute_tens),
        .count(minute_unit),
        .rco_L(rco_L_minute_unit)
    );
    counter_down6 counter_down6_minutes_tens (
        .clk(clk),
        .rst(rst),
        .enablen(rco_L_minute_unit),
        .load(load),
        .in(minute_unit),
        .count(minute_tens),
        .next_count_state(4'b0000),
        .rco_L(rco_L_minute_tens)
    );
    parameter [3:0] S0 = 4'b0000;

    always @(*) begin
        if ( second_unit == S0 && second_tens == S0 && minute_unit == S0 && minute_tens == S0 ) begin
            finished = 1'b1;
        end else begin
            finished = 1'b0;
        end
        out_second_unit = second_unit;
        out_second_tens = second_tens;
        out_minute_unit = minute_unit;
        out_minute_tens = minute_tens;
    end

endmodule