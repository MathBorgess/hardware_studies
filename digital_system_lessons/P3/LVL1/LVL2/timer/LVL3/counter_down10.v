module counter_down10(in, clk, load, en, clearn, count, tc, count_end);
  input wire [3:0] in;
  input wire clk, load, en, clearn;
  output reg [3:0] count;
  output wire tc; 
  output wire count_end;

  assign count_end = (count == 4'b0000) ? 1'b1 : 1'b0;
  assign tc = en & count_end;

  always @ (posedge clk)
  begin
    if(!clearn)
      count = 4'b0000;
    else if (en) begin
      case (count)
        4'b0000: count <= 4'b1001; // 0 -> 9
        default: count <= count - 4'b0001;
      endcase 
    end else begin
      if(load)
        count <= in;
    end
  end
endmodule
