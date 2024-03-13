module counter_nr(
    input wire clk, clear,
    input wire [9:0] keypad,
    output reg out
);  
    reg [2:0] state, next_state;
    parameter [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

    initial state = S0;
    always @(posedge clk) begin: STATE_MEMORY
        state <= next_state;
    end

    always @(keypad) begin
        if(clear) begin
            next_state = S0;
        end
    end

    always @(state) begin: NEXT_STATE_LOGIC
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
    end

    always @(state) begin: OUTPUT_LOGIC
        out = (state == S4);
    end
endmodule