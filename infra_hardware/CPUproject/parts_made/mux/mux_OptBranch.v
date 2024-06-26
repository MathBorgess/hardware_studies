module mux_opt_branch (
    input wire  sel,
    input wire  data_0, // from flag option
    output reg data_out

);
    always @(*) begin
        case (sel)
            1'd0: data_out = data_0;
            1'd1: data_out = ~data_0;
            default: data_out = data_0;
        endcase 
    end 

endmodule