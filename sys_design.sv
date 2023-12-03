module LUT_4bit_1s (
    input wire [3:0] bits,
    output reg [2:0] count
);
reg [2:0] data [7:0];
initial begin
    data[0] = 3'd00;
    data[1] = 3'd01;
    data[2] = 3'd01;
    data[3] = 3'd02;
    data[4] = 3'd01;
    data[5] = 3'd02;
    data[6] = 3'd02;
    data[7] = 3'd03;
end

  always @(bits) begin
    count = data[bits];
  end
endmodule

module LUT_12bit_1s(
    input wire [11:0] bits,
    output reg [3:0] count
);

// module LUT_12bit_1s(
//     input wire [11:0] bits,
//     output reg [3:0] count
// );
//     wire [2:0] count0;
//     wire [2:0] count1;
//     wire [2:0] count2;

//     LUT_4bit_1s uut0 (
//         .bits(bits[3:0]),
//         .count(count0)
//     );

//     LUT_4bit_1s uut1 (
//         .bits(bits[7:4]),
//         .count(count1)
//     );

//     LUT_4bit_1s uut2 (
//         .bits(bits[11:8]),
//         .count(count2)
//     );
    
// always @(bits) begin
//   count = count0 + count1 + count2;
// end

// endmodule
