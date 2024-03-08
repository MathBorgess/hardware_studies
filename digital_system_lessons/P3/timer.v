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

module SevenSegmentsDecoder (
    input wire [3:0] in,
    output reg [6:0] out
);
//out -> [a,b,c,d,e,f,g], start from the top segment and go clockwise, g is the middle segment
always @ (in)
begin
    case (in)
        4'b0000: out = 7'b1111110; // 0
        4'b0001: out = 7'b0110000; // 1
        4'b0010: out = 7'b1101101; // 2
        4'b0011: out = 7'b1111001; // 3
        4'b0100: out = 7'b0110011; // 4
        4'b0101: out = 7'b1011011; // 5
        4'b0110: out = 7'b0011111; // 6
        4'b0111: out = 7'b1110000; // 7
        4'b1000: out = 7'b1111111; // 8
        4'b1001: out = 7'b1111011; // 9
        default: out = 7'b0000000; // OFF
    endcase
end
endmodule

// Entrada async do load forma de bus, enabled para o magneton, 
module timer(
    input wire clk, rst, enabled, load, [3:0] in,
    output reg [6:0] out_second_unit, out_second_tens, out_minute_unit, out_minute_tens, finished
);
    reg [3:0] second_unit_load, second_tens_load, minute_unit_load, minute_tens_load;
    reg [3:0] second_unit, second_tens, minute_unit, minute_tens;
    wire rco_L_second_unit, rco_L_second_tens, rco_L_minute_unit, rco_L_minute_tens;

    counter_down10 counter_down10_second_unit (
        .clk(clk),
        .rst(rst),
        .enabled(enabled),
        .load(load),
        .in(in),
        .count(second_unit),
        .rco_L(rco_L_second_unit)
    );
    counter_down6 counter_down6_second_tens (
        .clk(clk),
        .rst(rst),
        .enabled(rco_L_second_unit),
        .load(load),
        .in(second_unit),
        .count(second_tens),
        .rco_L(rco_L_second_tens)
    );
    counter_down10 counter_down10_minutes_unit (
        .clk(clk),
        .rst(rst),
        .enabled(rco_L_second_tens),
        .load(load),
        .in(second_tens),
        .count(minute_unit),
        .rco_L(rco_L_minute_unit)
    );
    counter_down6 counter_down6_second_tens (
        .clk(clk),
        .rst(rst),
        .enabled(rco_L_minute_unit),
        .load(load),
        .in(minute_unit),
        .count(minute_tens),
        .rco_L(rco_L_minute_tens)
    );


    SevenSegmentsDecoder sevenSegmentsDecoder_second_unit (
        .in(second_unit),
        .out(out_second_unit)
    );
    SevenSegmentsDecoder sevenSegmentsDecoder_second_tens (
        .in(second_tens),
        .out(out_second_tens)
    );
    SevenSegmentsDecoder sevenSegmentsDecoder_minute_unit (
        .in(minute_unit),
        .out(out_minute_unit)
    );
    SevenSegmentsDecoder sevenSegmentsDecoder_minute_tens (
        .in(minute_tens),
        .out(out_minute_tens)
    );

    always @(posedge clk) begin
        if (!(rco_L_minute_tens | rco_L_minute_unit | rco_L_second_tens | rco_L_second_unit)) begin
            finished = 1'b1;
        end
    end

endmodule