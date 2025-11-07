module tflipflop(
    input T,
    input Clock,
    output Q,
    output notQ
    );
    
        jkflipflop jkff(
            .J(T),
            .K(T),
            .Clock(Clock),
            .Q(Q),
            .notQ(notQ)
        );
          
endmodule
