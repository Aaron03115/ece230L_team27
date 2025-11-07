module top(
    input [3:0]sw,
    input btnC,
    output [5:0]led
    );
    
    dflipflop dff(
        .D(sw[0]),
        .Clock(btnC),
        .Q(led[0]),
        .notQ(led[1])
    );
    
    jkflipflop jkff(
        .J(sw[1]),
        .K(sw[2]),
        .Clock(btnC),
        .Q(led[2]),
        .notQ(led[3])
    );
    
    tflipflop tff(
        .T(sw[3]),
        .Clock(btnC),
        .Q(led[4]),
        .notQ(led[5])
    );
    
    
endmodule
