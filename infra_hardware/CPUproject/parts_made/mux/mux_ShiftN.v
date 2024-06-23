module mux_Shift_n (
    input wire         sel,
    input wire  [31:0] data_0, //
    input wire  [15:0] data_1, // 
    output wire [4:0] data_out
);
    always @(sel) begin
        case (sel)
            1'd0: data_out = data_0[4:0];
            1'd1: data_out = data_1[10:6];
        endcase 
    end 

endmodule