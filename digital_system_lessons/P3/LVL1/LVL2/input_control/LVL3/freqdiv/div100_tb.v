`timescale 1ms/1ns
`include "freqdiv.v"

module divi_teste;
    reg clk_tb;
    wire clk100_tb;
    
    freqdiv100 dut100(.clk(clk_tb), .clk100(clk100_tb));
    localparam clk_period = 10;
    always #(clk_period/2) clk_tb=~clk_tb;    

    initial
        begin
            $dumpfile("divi_teste.vcd");
            $dumpvars(0, divi_teste);
                clk_tb = 1'b1;
        #1000 $finish();        
        end

endmodule


