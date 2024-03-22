`include "./LVL3/BCD.v"
`include "./LVL3/counter_up7_NR.v"
`include "./LVL3/freqdiv.v"
`include "./LVL3/mux2-1.v"

module input_encoder(
    input wire clk, enablen,
    input wire [9:0] keypad,
    output reg load, pgt_1hz,
    output reg [3:0] digit
);
wire counter_out, clk1, clk10, tick;
reg keypad_pressed;
wire [3:0] bcd_digit;

encoder_BCD bcd (
    .keypad(keypad),
    .enablen(enablen),
    .BCD(bcd_digit)
);

freqdiv50M freqdiv50Mto1 (
    .clk(clk),
    .clk1(clk1)
);
freqdiv5M freqdiv50Mto10(
    .clk(clk),
    .clk10(clk10)
); 

counter_up7_NR counter (
    .clk(clk10),
    .clear(keypad_pressed),
    .out(counter_out)
);

MUX2_1 mux2_1 (
    .out_count7NR(counter_out),
    .clk1(clk1),
    .enablen(enablen),
    .pgt_1hz(tick)
);

always @(keypad) begin
        if(keypad == 10'b00000_00000)
            keypad_pressed <= 0;
        else
            keypad_pressed <= 1;
    end

always @(*) begin
    digit = bcd_digit;
    load = keypad_pressed && !enablen;
    pgt_1hz = tick;
end

endmodule