`include "./digital_system_lessons/P3/LVL1/LVL2/input_control/LVL3/BCD.v"
`include "./digital_system_lessons/P3/LVL1/LVL2/input_control/LVL3/counter_up7_NR.v"
`include "./digital_system_lessons/P3/LVL1/LVL2/input_control/LVL3/freqdiv100.v"
`include "./digital_system_lessons/P3/LVL1/LVL2/input_control/LVL3/mux2-1.v"

module input_encoder(
    input wire clk, enablen, [9:0] keypad,
    output reg load, pgt_1hz, [3:0] digit
);
wire counter_out, clk100;

encoder_BCD bcd (
    .keypad(keypad),
    .enablen(enablen),
    .BCD(digit),
    .valid_data(load),
);

freq100div freqdiv100 (
    .clk(clk),
    .clk100(clk100)
);

counter_nr counter (
    .clk(clk),
    .clear(load),
    .out(counter_out)
);

MUX2_1 mux2_1 (
    .out_count7NR(counter_out),
    .clk100(clk100),
    .enablen(enablen),
    .pgt_1hz(pgt_1hz)
);

endmodule