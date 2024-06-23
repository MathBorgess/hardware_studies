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
- DivInit = 1 -> Load srcs
- DivInit = 0 -> Do 1 operation; 32 cycles to finish 
    --  while it's not a DivOp. state , may have dumps in it. 
        Has no effect on HI/LO since Ctrl_Unit needs to allow load in this registers
*Steps:
    1. quotient and remainder starts with zero; currDigit (of numerator) starts with 31
    2. shift remainder left and fill with the currDigit, then compare it with denominator
    3.  if denominator>remainder: shift left with 0 as the new LSB of the quotient 
        else: subtract to get new remainder and shift left with 1 as the new LSB of the quotient
    4. do currDigit-=1
    5. repeat 2->4 31 more times

    shift divisor right and compare it with current dividend 
    if divisor is larger, shift 0 as the next bit of the quotient 
    if divisor is smaller, subtract to get new dividend and shift 1 as the next bit of the quotient

*/	
    reg divRun, fim, stop;
    reg [31:0] numerator, quotient = 32'b0;
    reg [31:0] denominator, remainder = 32'b0;
    reg [5:0] currDigit = 5'd31;
    reg [5:0] cycleCount;

    assign hi = remainder;
	assign lo = quotient;

    assign divStop = stop;
    always @ (posedge clk) begin
        if(srcB == 32'b0)begin
            divZero = 1;
        end
        // if(divZero)begin
		//     divZero = 0;
	    // end
        // else if(divStop)begin
		// 	stop = 0;
		// end
		else if (reset)begin
			remainder=32'b0;
			denominator=32'b0;
			numerator=32'b0;
			quotient=32'b0;
			currDigit=5'b0;
			cycleCount=5'b0;
			// fim = 0;
			// divRun = 0;
            // stop = 0;
		end
        else if(!divCtrl)begin
            if(divRun) begin
                if(currDigit!=6'b111111) begin //-1
                    remainder = {remainder[30:0],numerator[currDigit]};
                    if(remainder>=denominator)begin
                        remainder = remainder - denominator;
                        quotient = {quotient[30:0],1'b1};  
                    end
                    else begin
                        quotient = {quotient[30:0],1'b0};
                    end
                    currDigit <= currDigit-1'b1;
                    cycleCount <= cycleCount+1'b1;
                end
                else begin
                    divRun=0;
                    fim=1;
                    stop = 1;
                end
            end
        else begin
            if(fim==0)begin
                else begin
                    numerator = value_A;
                    denominator  = value_B;
                    currDigit = 5'b11111; //31
                    divRun = 1;
                end
            end
            else begin
                fim = 0;
            end
            end
        end
    end
endmodule