module twos_compliment (
    input [7:0] A, // sw[9:2]
    output [7:0] Y  // led[13:6] (8-bit Two's Complement)
);


    // The two's complement is calculated as (~A) + 1
    // ~A is the one's complement of A.


    // 1. Invert A (calculate one's complement)
    wire [7:0] A_inv = ~A;


    // 2. Add 1 to the inverted result (~A + 1) using a ripple-carry adder
    wire [8:1] C_inter; // Carries: C_inter[1] is Cin for FA1, C_inter[8] is Cout for FA7 (ignored)


    // FA0 (LSB): Cin = 1 for the +1 operation
    full_adder FA0 (
        .A(A_inv[0]),
        .B(1'b0), // Second operand is 0 for +1
        .Cin(1'b1), // Start carry with 1
        .Sum(Y[0]),
        .Cout(C_inter[1])
    );


    // FA1 through FA7 (MSB)
    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : adder_chain
            full_adder FAn (
                .A(A_inv[i]),
                .B(1'b0), // Second operand is 0 for +1
                .Cin(C_inter[i]),
                .Sum(Y[i]),
                .Cout(C_inter[i+1])
            );
        end
    endgenerate

endmodule
