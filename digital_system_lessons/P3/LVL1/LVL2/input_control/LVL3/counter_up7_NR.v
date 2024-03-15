module counter_nr(
    input wire clk, clear,
    input wire [9:0] keypad,
    output reg out
);  
    reg [2:0] state, next_state;
    reg [9:0] old_keypad = 10'b0000000000;
    parameter [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

    initial state = S0;
    always @(clk) begin
        if (clk) begin
            state <= next_state;
        end
    end

    always @(state or keypad) begin: NEXT_STATE_LOGIC
        if (old_keypad == keypad) begin
            case (state)
                S0: next_state = S1;
                S1: next_state = S2;
                S2: next_state = S3;
                S3: next_state = S4;
                S4: next_state = S5;
                S5: next_state = S6;
                S6: next_state = S7;
                S7: next_state = S7;
            endcase
            out = (state == S4);
        end else begin
            if (clear) begin
                next_state = S0;
            end
            old_keypad = keypad;
        end
    end
endmodule