// Implement binary state machine
module binary(
    input w,     // Input from sw[0]
    input clk,   // Clock from btnC
    input reset, // Reset from btnU
    output z,    // Output to led[1]
    output [2:0] State // Output to led[9:7]
);

    wire [2:0] Next;

    // Default state 000 (State A) on reset
    
    // D-FF for LSB (State[0])
    dff dff_0(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .reset(reset),
        .Q(State[0])
    );

    // D-FF for middle bit (State[1])
    dff dff_1(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(reset),
        .Q(State[1])
    );

    // D-FF for MSB (State[2])
    dff dff_2(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(reset),
        .Q(State[2])
    );

    // Current State Wires
    wire y2 = State[2];
    wire y1 = State[1];
    wire y0 = State[0];

assign z = (y2 & ~y1 & ~y0) | (~y2 & y1 & ~y0);
assign Next[0] = (w & ~y2 & ~y1) | (~w & ~y1 & ~y0) |(~w & ~y2 & y1 & y0) | (w & ~y2 & y1 & ~y0);
assign Next[1] = (w & ~y2 & ~y1) | (~y2 & ~y1 & y0) | (~y2 & y1 & ~y0);
assign Next[2] = (w & y2 & ~y1 & ~y0) | (w & ~y2 & y1 & y0);



endmodule