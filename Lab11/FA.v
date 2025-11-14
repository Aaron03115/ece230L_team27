module FA (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    // Sum = A XOR B XOR Cin
    assign Sum = A ^ B ^ Cin;

    // Cout = (A AND B) OR (Cin AND (A XOR B))
    assign Cout = (A & B) | (Cin & (A ^ B));

endmodule
