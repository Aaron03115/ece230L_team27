// half_sub.v
// Implements a Half Subtractor
// Y (Difference) = A XOR B
// Borrow Out = NOT A AND B
module half_sub (
    input  A,    // sw[0]
    input  B,    // sw[1]
    output Y,    // led[0] (Difference)
    output Borrow // led[1] (Borrow Out)
);

    // Difference (Y): Y = A XOR B
    assign Y = A ^ B;


    // Borrow Out (Borrow): Borrow = (NOT A) AND B
    assign Borrow = (~A) & B;


endmodule


