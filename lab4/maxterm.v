module maxterm (
    input A, B, C, D,
    output Y
);

assign Y = (C | D | B) & (~A | ~D) & (~B | ~D) ;// Enter your equation here

endmodule
