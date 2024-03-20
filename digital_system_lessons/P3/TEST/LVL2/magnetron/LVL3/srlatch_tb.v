`timescale 1ms/1ms
`include "./LVL1/LVL2/magnetron/LVL3/sr_latch.v"

module tb_;
    reg rst, set;
    wire mag_on;
    
    srlatch dut ( .rst(rst), .set(set), .mag_on(mag_on) );

    initial
        begin
            $dumpfile("tb.vcd");
            $dumpvars(0, tb_);

            rst = 0; set = 0;
            #2 rst = 1; set = 0;
            #10 rst = 0; set = 1;
            #10 rst = 0; set = 0;
            #100 rst = 1; set = 0;
            #100 rst = 1; set = 1;
            
            $finish();
        end

endmodule