// clk -> 100hz ; clk100 -> 1hz
module freq100div (
    input clk, 
    output reg clk100
);
    reg [5:0] count = 6'b000000;
    initial clk100 = 1'b0;
    
    always@(posedge clk) begin
        count = count + 1;
        if(a == 99) begin
            a = 6'b000000;
            clk100 = ~clk100;
        end
    end
endmodule