
// P3_chapter (pg. [en]800 ou [pt]616 ): 
//             [...] If a person enters an initial value for seconds that is greater than 59 (i.e., 60 to 99)
//             the seconds counter should still count down from that value to 00.
module counter_down6(
    input wire clk, rst, enabled, load, [3:0] in,
    output reg [3:0] count, reg rco_L
);
    reg [4:0] state, next_state;
    parameter [4:0] S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, S4 = 4'b0100, S5 = 4'b0101;

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
            S0: next_state = S5;
            S1: next_state = S0;
            S2: next_state = S1;
            S3: next_state = S2;
            S4: next_state = S3;
            S5: next_state = S4;
        endcase
    end

    always @(state) begin: OUTPUT_LOGIC
        count = state;
        rco_L = !(state == S0);
    end
endmodule
