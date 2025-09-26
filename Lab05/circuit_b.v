module circuit_b(
    input A, B, C, D,
    output Y
);

    // Enter logic equation here
    assign Y = (~C & ~D) | (A & B) | (B & ~D);

endmodule
