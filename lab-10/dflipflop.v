module dflipflop(
    input D, Clock,
    output reg Q,
    output notQ
);
    
    initial begin
        Q <= 0;
    end
    
    always @(posedge Clock)
        Q <= D;
        
    assign notQ = ~Q;
    
endmodule
