module top(
    input  [7:0] sw,    // Switches as inputs
    output [5:0] led    // LEDs as outputs
);

    // Internal wire for the carry signal between the two full adders
    wire carry_bit;

    // 1. Stairway Lights Module
    // Inputs: sw[0], sw[1]
    // Output: led[0]
    light light_inst (
        .downstairs(sw[0]),
        .upstairs(sw[1]),
        .stair_light(led[0])
    );

    // 2. Single-Bit Adder (Half Adder) Module
    // Inputs: sw[2], sw[3]
    // Outputs: led[1] (Sum), led[2] (Carry)
    adder half_adder_inst (
        .A(sw[2]),
        .B(sw[3]),
        .Y(led[1]),
        .Carry(led[2])
    );

    // 3. Two-Bit Adder (using two Full Adders)

    // Full Adder 1 (LSB: A[0] + B[0] + Cin=0)
    // Inputs: sw[4] (A_LSB), sw[6] (B_LSB), Cin=0
    // Outputs: led[3] (Y_LSB), carry_bit (Cout)
    full_adder FA1_LSB (
        .A(sw[4]),        // A_LSB
        .B(sw[6]),        // B_LSB
        .Cin(1'b0),       // Cin for LSB is always 0
        .Y(led[3]),       // LSB Sum
        .Cout(carry_bit)  // Cout feeds the next stage
    );

    // Full Adder 2 (MSB: A[1] + B[1] + carry_bit)
    // Inputs: sw[5] (A_MSB), sw[7] (B_MSB), carry_bit (Cin)
    // Outputs: led[4] (Y_MSB), led[5] (Cout_MSB)
    full_adder FA2_MSB (
        .A(sw[5]),        // A_MSB
        .B(sw[7]),        // B_MSB
        .Cin(carry_bit),  // Cin comes from the LSB stage's Cout
        .Y(led[4]),       // MSB Sum
        .Cout(led[5])     // Final Carry Out
    );

endmodule
