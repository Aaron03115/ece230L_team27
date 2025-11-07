module jkflipflop(
    input J, K,
    input Clock,
    output Q,
    output notQ
);

    wire din = (J & ~Q) | (~K & Q);
    
    dflipflop dff(
        .D(din),
        .Clock(Clock),
        .Q(Q),
        .notQ(notQ)
    );
    
endmodule
