// full_adder.v
// Implements a standard Full Adder
module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);


    // Sum is the XOR of all three inputs: Sum = A XOR B XOR Cin
    assign Sum = A ^ B ^ Cin;


    // Carry Out is true if (A AND B) OR (A AND Cin) OR (B AND Cin)
    // Simplified to: Cout = (A AND B) OR (Cin AND (A XOR B))
    assign Cout = (A & B) | (Cin & (A ^ B));


endmodule
