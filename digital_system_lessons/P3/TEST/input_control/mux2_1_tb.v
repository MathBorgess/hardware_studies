`include "./LVL1/LVL2/input_control/LVL3/mux2-1.v"
`timescale 1ms/1ms

module MUX2_1_tb;

    reg out_count7NR, clk100, enablen;
    wire pgt_1hz;

    MUX2_1 dut (
        .out_count7NR(out_count7NR),
        .clk100(clk100),
        .enablen(enablen),
        .pgt_1hz(pgt_1hz)
    );

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, MUX2_1_tb);

        out_count7NR = 0;
        clk100 = 0;
        enablen = 0;

        // case 1: enablen = 1, expect pgt_1hz to be clk100
        #10 enablen = 1;
        #20 clk100 = 1;

        // case 2: enablen = 0, expect pgt_1hz to be out_count7NR
        #30 enablen = 0;
        #40 out_count7NR = 1; clk100 = 0;

        // case 3: enablen = 1, expect pgt_1hz to be clk100 again
        #50 enablen = 1;
        #60 clk100 = 0;

        #70 $finish;
    end
endmodule
