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
        $dumpfile("tb.vcd");
        $dumpvars(0, mag_comb_logic_tb);

        startn = 1;
        stopn = 1;
        clearn = 1;
        door_closed = 1;
        timer_done = 0;

        // case 1: door opened while timer not done and startn=0
        #10 door_closed = 0;
            startn = 0;

        // case 2: valid conditions for reset
        #20 startn = 1;
            stopn = 0;
            clearn = 0;
            timer_done = 1;
            door_closed = 0;
        
        // case 3: set condition
        #30 clearn = 1;
            startn = 0;
            stopn = 1;
            timer_done = 0;
            door_closed = 1;

        // end simulation
        #50 $finish;
    end
endmodule