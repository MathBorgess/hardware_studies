module div (
    input wire [31:0] srcA, // numerator 
    input wire [31:0] srcB, // denominator
    input wire clk,
    input wire reset,
    input wire divCtrl, // DivInit 
    output wire divZero,
    output wire [31:0] hi,
    output wire [31:0] lo
);

/*
- DivInit = 1 -> Load srcs and set divRun=1
- DivInit = 0 -> Do 1 operation; 32 cycles to finish 
    -- On cycle 32 set divRun=0
*Steps:
    1. quotient and remainder starts with zero; currDigit (of numerator) starts with 31
    2. shift remainder left and fill with the currDigit, then compare it with denominator
    3.  if denominator>remainder: shift left with 0 as the new LSB of the quotient 
        else: subtract to get new remainder and shift left with 1 as the new LSB of the quotient
    4.  if currDigit>0: do currDigit-=1 then goto 2.
        else: divRun = 0
*/	
    reg divRun = 0;
    reg [31:0] numerator, quotient = 32'b0;
    reg [31:0] denominator, remainder = 32'b0;
    reg [5:0] cycleCount, currDigit;

    assign hi = remainder;
	assign lo = quotient;

    always @ (posedge clk) begin
		if (reset) begin
			remainder=32'b0;
			denominator=32'b0;
			numerator=32'b0;
			quotient=32'b0;
			currDigit=5'b11111;
			cycleCount=5'b0;
			divRun = 0;
		end
        else if(divCtrl) begin
            if(srcB == 32'b0) begin
                divZero = 0;
            end 
            else begin
                numerator = srcA;
                denominator = srcB;
                divRun = 1;
                currDigit = srcA[31];
                cycleCount = 5'b0;
            end
        end
        else if(!divCtrl & divRun) begin 
            remainder = {remainder[30:0],numerator[currDigit]};
            if(denominator>remainder) begin
                quotient = {quotient[30:0],1'b0};
            end
            else begin
                remainder = remainder - denominator;
                quotient = {quotient[30:0],1'b1};  
            end
            cycleCount <= cycleCount+1'b1;
            if(cycleCount==5'b11111) begin  // stop div
                divRun=0;
            end
            else begin //-1
                currDigit <= currDigit-1'b1;
            end
        end
    end
endmodule