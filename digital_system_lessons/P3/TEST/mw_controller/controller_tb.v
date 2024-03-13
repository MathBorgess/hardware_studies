`timescale 1ms/1ms
`include "./digital_system_lessons/P3/LVL1/MWcontroller.v"

module tb_;
    reg clk_tb, enablen, startn, stopn, clearn, door_closed;
    reg [9:0] keypad;
    wire [6:0] sec_ones_segs, sec_tens_segs, min_ones_segs, min_tens_segs;
    wire mag_on;

    MWcontroller dut(
    .clk(clk_tb), .enablen(enablen), .keypad(keypad),
    .startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed),
    .mag_on(mag_on),
    .sec_ones_segs(sec_ones_segs), .sec_tens_segs(sec_tens_segs), .min_ones_segs(min_ones_segs), .min_tens_segs(min_tens_segs)
);
    localparam clk_period = 10;
    always #(clk_period/2) clk_tb=~clk_tb;

    initial
        begin
            $dumpfile("tb.vcd");
            $dumpvars(0, tb_);
                clk_tb = 1'b1;
                clearn = 1'b0;
                clearn = 1'b1;
                enablen = 1'b1;
                #10;
                keypad = 10'b0000000000;
                #10;
                enablen = 1'b0;
                #10;
                keypad = 10'b0000000001;
                #10;
                keypad = 10'b0000000010;
                #10;
                startn = 1'b1;
                #13000;
         $finish();        
        end

endmodule