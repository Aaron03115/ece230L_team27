module top (
    input  [9:0] sw,    // Switches used: sw[0] through sw[9] (10 total)
    output [13:0] led   // LEDs used: led[0] through led[13] (14 total)
);


    // ==========================================================
    // 1. Half sub (sw[1:0] -> led[1:0])
    // ==========================================================
    half_sub UUT_HALF_SUB (
        .A     (sw[0]),
        .B     (sw[1]),
        .Y     (led[0]), // Difference
        .Borrow(led[1])  // Borrow Out
    );


    // ==========================================================
    // 2. One's Compliment Adder (sw[9:2] -> led[5:2])
    // Inputs A: sw[5:2], Inputs B: sw[9:6]
    // ==========================================================
    // Inputs are grouped: A = sw[5:2], B = sw[9:6]
    wire [3:0] ones_A = sw[5:2];
    wire [3:0] ones_B = sw[9:6];


    ones_compliment UUT_ONES_COMP (
        .A (ones_A),
        .B (ones_B),
        .Y (led[5:2]) // 4-bit Sum
    );


    // ==========================================================
    // 3. Two's Compliment Converter (sw[9:2] -> led[13:6])
    // Input A: sw[9:2] (8 bits)
    // ==========================================================
    // Input is the 8-bit number: sw[9:2]
    wire [7:0] twos_A = sw[9:2];


    twos_compliment UUT_TWOS_COMP (
        .A (twos_A),
        .Y (led[13:6]) // 8-bit Two's Complement Result
    );



endmodule
