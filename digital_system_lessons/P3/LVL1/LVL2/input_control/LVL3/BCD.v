module encoder_BCD (
    input wire [9:0] keypad,
    input wire enablen,
    output reg [3:0] BCD,
    output reg valid_data
);

    reg [9:0] old_keypad = 10'b0000000000;
    initial begin
        valid_data = 1'b0;
        BCD = 4'b1111;
    end

    always@(keypad or enablen) begin
        if (!enablen && old_keypad != keypad) begin
            case (keypad)
                10'b0000000001: BCD = 4'b0000;
                10'b0000000010: BCD = 4'b0001;
                10'b0000000100: BCD = 4'b0010;
                10'b0000001000: BCD = 4'b0011;
                10'b0000010000: BCD = 4'b0100;
                10'b0000100000: BCD = 4'b0101;
                10'b0001000000: BCD = 4'b0110;
                10'b0010000000: BCD = 4'b0111;
                10'b0100000000: BCD = 4'b1000;
                10'b1000000000: BCD = 4'b1001;
                default: BCD = 4'b1111;
            endcase
            if(BCD != 4'b1111)
                valid_data = 1'b1;
            else
                valid_data = 1'b0;
            old_keypad = keypad;
        end else begin
            valid_data = 1'b0;
        end
    end

endmodule