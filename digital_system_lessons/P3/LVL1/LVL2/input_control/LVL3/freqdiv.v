// clk -> 50mhz ; clk10 -> 10hz
module freqdiv5M (
    input clk, 
    output reg clk10
);
    parameter limit = 2500000;
    reg [24:0] count = 0;
    initial clk10 = 1'b1;
    
    always @(posedge clk) begin
        count = count + 1;
        if(count == (limit+1)) begin
            count = 1;
            clk10 = ~clk10;
        end
    end
endmodule

// clk -> 50Mhz ; clk1 -> 1hz
module freqdiv50M (
    input clk, 
    output reg clk1
);
    parameter limit = 25000000;
    reg [24:0] count = 0;
    initial clk1 = 1'b1;
    
    always @(posedge clk) begin
        count = count + 1;
        if(count == (limit+1)) begin
            count = 1;
            clk1 = ~clk1;
        end
    end
endmodule
