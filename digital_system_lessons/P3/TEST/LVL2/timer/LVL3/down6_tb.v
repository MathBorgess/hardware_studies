
`timescale 100ms/100ms
`include "./LVL1/LVL2/timer/LVL3/counter_down6.v"

module down6_tb;
    reg clk, rst, enablen, load;
    reg [3:0] in, next_count_state;
    wire [3:0] count;
    wire rco_L;

    counter_down6 down6_inst (
        .clk(clk),
        .rst(rst),
        .enablen(enablen),
        .load(load),
        .in(in),
        .next_count_state(next_count_state),
        .count(count),
        .rco_L(rco_L)
    );


localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, down6_tb);


        // case 0: in = 4'bxxxx -> state = S0
        clk = 1;
        rst = 1;
        enablen = 0;
        load = 0;
        next_count_state = 4'b0000;

        // case 1: n>5 as in, no rco_L
        in = 4'b1001;
        #3 load = 1;
        #1 load = 0; 

        // case 2: std, no rco_L
        #100 in = 4'b0101;
        #3 load = 1;
        #3 load = 0;

        // case 3: rco_L = 0
        #60 in = 4'b0111;
        #3 load = 1; next_count_state = 4'b1001;
        #1 load = 0; 

        // case 4: test S0 -> S5 and rco_L = 0  
        #40 in = 4'b0001;
        #3 load = 1; 
        #3 load = 0;

        #100 $finish;
    end
endmodule