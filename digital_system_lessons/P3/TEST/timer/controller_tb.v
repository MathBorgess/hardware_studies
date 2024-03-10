`timescale 1ms/1ms
`include "./digital_system_lessons/P3/LVL1/LVL2/timer/controller.v"

module tb_;
    reg clk_tb, rst, enablen, load;
    reg [3:0] in;
    wire [3:0] out_second_unit, out_second_tens, out_minute_unit, out_minute_tens;
    wire finished;

    timer dut (
    .clk(clk_tb), .rst(rst), .enablen(enablen), .load(load), .in(in),
    .out_second_unit(out_second_unit), .out_second_tens(out_second_tens),
    .out_minute_unit(out_minute_unit), .out_minute_tens(out_minute_tens),
    .finished(finished) 
);
    localparam clk_period = 1000;
    always #(clk_period/2) clk_tb=~clk_tb;

    initial
        begin
            $dumpfile("tb.vcd");
            $dumpvars(0, tb_);
                clk_tb = 1'b1;
                enablen = 1'b0;
                rst = 1'b0;
                #10 rst = 1'b1;
                load = 1'b0;
                #10 in = 4'b0010;
                load = 1'b1;
                #100 load = 1'b0;

        #10000 $finish();        
        end

endmodule