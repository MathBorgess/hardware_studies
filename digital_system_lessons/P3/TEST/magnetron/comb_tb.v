`include "./LVL1/LVL2/magnetron/LVL3/comb_logic.v"
`timescale 1ms/1ms

module mag_comb_logic_tb;

    reg startn, stopn, clearn, door_closed, timer_done;
    wire set, reset;

    mag_comb_logic dut (
        .startn(startn),
        .stopn(stopn),
        .clearn(clearn),
        .door_closed(door_closed),
        .timer_done(timer_done),
        .set(set),
        .reset(reset)
    );

    initial begin
        startn = 1'b1;
        stopn = 1'b1;
        clearn = 1'b1;
        door_closed = 1'b1;
        timer_done = 1'b1;

        // case 1: Valid condition for set, all inputs are true except startn
        #10 startn = 1'b0;
        #20 stopn = 1'b0;
        #30 timer_done = 1'b0;

        // case 2: Valid condition for reset, all inputs are false except startn
        #40 startn = 1'b1;
        #50 stopn = 1'b1;
        #60 clearn = 1'b0;
        #70 timer_done = 1'b1;
        #80 door_closed = 1'b0;

        // case 3: Combination of set and reset conditions
        #90 startn = 1'b0;
        #100 stopn = 1'b0;
        #110 timer_done = 1'b1;
        #120 door_closed = 1'b1;
        #130 clearn = 1'b0;

        // End simulation
        #140 $finish;
    end
endmodule