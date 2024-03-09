module counter_down10(
    input wire clk, rst, enabled, load, [3:0] in,
    output reg [3:0] count, reg rco_L
);
    reg [3:0] state, next_state;
    parameter [3:0] S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110;
    parameter [3:0] S7 = 4'b0111, S8 = 4'b1000, S9 = 4'b1001;

    always @(load) begin
        if (load) begin
            state = in;
        end
    end

    always @(posedge clk) begin: STATE_MEMORY
        if (enabled) begin
            state <= next_state;
        end
    end
    always @(rst) begin: RESET_ASYNC
        if (!rst) begin
            state = S0;
        end
    end
    
    always @(state) begin: NEXT_STATE_LOGIC
        case (state)
            S0: next_state = S9;
            S1: next_state = S0;
            S2: next_state = S1;
            S3: next_state = S2;
            S4: next_state = S3;
            S5: next_state = S4;
            S6: next_state = S5;
            S7: next_state = S6;
            S0: next_state = S7;
            S9: next_state = S8;
        endcase
    end

    always @(state) begin: OUTPUT_LOGIC
        count = state;
        rco_L = !(state == S0);
    end
endmodule

