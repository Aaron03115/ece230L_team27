module d_latch(
    input D, E,
    output reg Q,
    output NotQ
);

    // D-Latch behavior: sequential to D and E
    always @(D, E) begin 
        if (E) begin
            // When Enable (E) is high, the latch is transparent: Q <= D
            Q <= D;
        end
        // When E is low, Q holds its last value (implied memory)
    end

    // The inverted output (~Q) is a continuous assignment
    assign NotQ = ~Q; 

endmodule
