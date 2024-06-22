module mux_RegDest (
    input wire [1:0] sel,
    input wire [4:0] data_0, // inst [20,16]
    input wire [3:0] data_3, // inst [15,11]
    output wire [31:0] data_out
);

    always @(sel) begin
        case (sel)
            2'd0: data_out = data_0;
            2'd1: data_out = 5'd31;
            2'd2: data_out = 5'd29;
            2'd3: data_out = data_3;
            default: data_out = data_0;
        endcase 
    end 

endmodule