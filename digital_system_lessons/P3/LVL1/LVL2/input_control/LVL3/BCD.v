module encoder_BCD (
    input [9:0] keypad, wire enablen,
    output reg [3:0] BCD, reg valid_data
);
    initial valid_data = 1'b0;

    always@(keypad)
        if (!enablen) begin
            for ( i = 10'b0000000001; i!=10'b0000000000; i<<1) begin
                if (keypad[9:0] == i) begin
                    BCD = i;
                    valid_data = 1'b1
                end
            end
        end
endmodule