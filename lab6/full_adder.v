// full_adder.v
module full_adder(
    input  A,
    input  B,
    input  Cin,    // Carry in
    output Y,      // Sum output
    output Cout    // Carry out
);

    // Sum (Y) is the XOR of all three inputs
    assign Y = A ^ B ^ Cin;

    // Carry out (Cout) equation
    // Cout = (A & B) | (Cin & (A ^ B));
    assign Cout = (A & B) | (Cin & A) | (Cin & B);
    
endmodule
