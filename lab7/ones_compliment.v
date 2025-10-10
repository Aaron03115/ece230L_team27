// ones_compliment.v
// Implements a 4-bit One's Complement Adder with End-Around Carry.
// Inputs A and B are 4 bits each.
module ones_compliment (
    input [3:0] A, // sw[5:2]
    input [3:0] B, // sw[9:6]
    output [3:0] Y  // led[5:2] (4-bit Sum)
);




    wire [3:0] Sum_initial; 
    wire C_out;          // Final carry out (the end-around carry)
    wire C_inter[3:1];   // Intermediate carries between full adders
     wire C_eac[4:1]; // Carries for the End-Around Carry (EAC) addition step


    full_adder FA0_init (
        .A(A[0]),
        .B(B[0]),
        .Cin(1'b0),     // End-around carry connection
        .Sum(Sum_initial[0]),
        .Cout(C_inter[1])
    );


    // FA1
    full_adder FA1_init (
        .A(A[1]),
        .B(B[1]),
        .Cin(C_inter[1]),
        .Sum(Sum_initial[1]),
        .Cout(C_inter[2])
    );


    // FA2
    full_adder FA2_init (
        .A(A[2]),
        .B(B[2]),
        .Cin(C_inter[2]),
        .Sum(Sum_initial[2]),
        .Cout(C_inter[3])
    );


    // FA3 (MSB): Cout is the final carry-out C_out
    full_adder FA3_init (
        .A(A[3]),
        .B(B[3]),
        .Cin(C_inter[3]),
        .Sum(Sum_initial[3]),
        .Cout(C_out) // Final carry-out feeds back to Cin of FA0
    );

    full_adder FA0(
        .A(Sum_initial[0]), 
        .B(C_out),
        .Cin(1'b0),
        .Sum(Y[0]),
        .Cout(C_eac[1]) // Final carry-out feeds back to Cin of FA0
    );
    full_adder FA1 (
        .A(Sum_initial[1]),
        .B(1'b0),
        .Cin(C_eac[1]),
        .Sum(Y[1]),
        .Cout(C_eac[2]) // Final carry-out feeds back to Cin of FA0
    );
    full_adder FA2 (
        .A(Sum_initial[2]),
        .B(1'b0),
        .Cin(C_eac[2]),
        .Sum(Y[2]),
        .Cout(C_eac[3]) // Final carry-out feeds back to Cin of FA0
    );
    full_adder FA3 (
        .A(Sum_initial[3]),
        .B(1'b0),
        .Cin(C_eac[3]),
        .Sum(Y[3]),
        .Cout(C_eac[4]) // Final carry-out feeds back to Cin of FA0
    );




endmodule
