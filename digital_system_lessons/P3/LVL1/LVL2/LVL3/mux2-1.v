
// pgt: positive going transition
// enablen = mag_on
module MUX2_1(
    input out_count7NR, clk100, enablen,
    output reg pgt_1hz
);
    always @(*) begin
        if (!enablen)
            pgt_1hz = out_count7NR;
        else
            pgt_1hz = clk100;
    end
    
endmodule