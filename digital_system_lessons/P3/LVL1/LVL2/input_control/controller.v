`include "./digital_system_lessons/P3/LVL1/LVL2/input_control/LVL3/BCD.v"
`include "./digital_system_lessons/P3/LVL1/LVL2/input_control/LVL3/counter_up7_NR.v"
`include "./digital_system_lessons/P3/LVL1/LVL2/input_control/LVL3/freqdiv.v"
`include "./digital_system_lessons/P3/LVL1/LVL2/input_control/LVL3/mux2-1.v"

module input_encoder(
    input wire clk, enablen,
    input wire [9:0] keypad,
    output reg load, pgt_1hz,
    output reg [3:0] digit
);
wire counter_out, clk100, tick, load_;
wire [3:0] bcd_digit;

encoder_BCD bcd (
    .keypad(keypad),
    .enablen(enablen),
    .BCD(bcd_digit),
    .valid_data(load_)
);

freqdiv freqdiv100 (
    .clk(clk),
    .clk100(clk100)
);

counter_nr counter (
    .clk(clk),
    .clear(load),
    .keypad(keypad),
    .out(counter_out)
);

MUX2_1 mux2_1 (
    .out_count7NR(counter_out),
    .clk100(clk100),
    .enablen(enablen),
    .pgt_1hz(tick)
);

always @(*) begin
    digit = bcd_digit;
    load = load_ && !enablen;
    pgt_1hz = tick;
end

endmodule