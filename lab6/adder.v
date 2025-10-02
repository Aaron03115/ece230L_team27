// adder.v
module adder(
    input  A,
    input  B,
    output Y,      // Sum output
    output Carry   // Carry out
);

    // Sum (Y) is the XOR of A and B
    assign Y = A ^ B;

    // Carry is the AND of A and B
    assign Carry = A & B;

endmodule
