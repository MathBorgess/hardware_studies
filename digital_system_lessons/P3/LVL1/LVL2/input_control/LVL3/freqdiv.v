// clk -> 100hz ; clk100 -> 1hz
module freqdiv100 (
    input clk, 
    output reg clk100
);
    reg [5:0] count = 6'b000000;
    initial clk100 = 1'b1;
    
    always @(posedge clk) begin
        count = count + 1;
        if(count == 51) begin
            count = 6'b000001;
            clk100 = ~clk100;
        end
    end
endmodule

// clk -> 50Mhz ; clk50m -> 1hz
module freqdiv50M (
    input clk, 
    output reg clk50m
);
    parameter tfm = 25000000;
    reg [21:0] count = 0;
    initial clk50m = 1'b1;
    
    always @(posedge clk) begin
        count = count + 1;
        if(count == (tfm+1)) begin
            count = 1;
            clk50m = ~clk50m;
        end
    end
endmodule
