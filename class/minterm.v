module minterm (
    input A, B, C, D,
    output Y
);

assign Y = (D & ~A & ~B) | (C & ~D) | (B & ~D); // Enter your equation here

endmodule
