// Implement one-hot state machine
module onehot(
    input w,     // Input from sw[0]
    input clk,   // Clock from btnC
    input reset, // Reset from btnU
    output z,    // Output to led[0]
    output Q_A,  // Output to led[2]
    output Q_B,  // Output to led[3]
    output Q_C,  // Output to led[4]
    output Q_D,  // Output to led[5]
    output Q_E   // Output to led[6]
);

    wire D_A, D_B, D_C, D_D, D_E;
    wire Q_A_w, Q_B_w, Q_C_w, Q_D_w, Q_E_w; // Wires for Q outputs, mapped to specific names

    // State A D-FF (Initial state on reset is A=1, all others 0)
    // Map to Q_A for top module
    dff dff_A(
        .Default(1'b1),
        .D(D_A),
        .clk(clk),
        .reset(reset),
        .Q(Q_A_w)
    );

    // State B D-FF
    dff dff_B(
        .Default(1'b0),
        .D(D_B),
        .clk(clk),
        .reset(reset),
        .Q(Q_B_w)
    );

    // State C D-FF
    dff dff_C(
        .Default(1'b0),
        .D(D_C),
        .clk(clk),
        .reset(reset),
        .Q(Q_C_w)
    );

    // State D D-FF
    dff dff_D(
        .Default(1'b0),
        .D(D_D),
        .clk(clk),
        .reset(reset),
        .Q(Q_D_w)
    );

    // State E D-FF
    dff dff_E(
        .Default(1'b0),
        .D(D_E),
        .clk(clk),
        .reset(reset),
        .Q(Q_E_w)
    );

    // --- Output Logic: z = Q_C + Q_E
    assign z = Q_C_w | Q_E_w;

    // --- Next State Logic
    // D_A = 0 (State A is never the next state)
    assign D_A = 1'b0;
    
    // D_B = ~w * (Q_A + Q_D + Q_E)
    assign D_B = ~w & (Q_A_w | Q_D_w | Q_E_w);
    
    // D_C = ~w * (Q_B + Q_C)
    assign D_C = ~w & (Q_B_w | Q_C_w);
    
    // D_D = w * (Q_A + Q_B + Q_C)
    assign D_D = w & (Q_A_w | Q_B_w | Q_C_w);
    
    // D_E = w * (Q_D + Q_E)
    assign D_E = w & (Q_D_w | Q_E_w);

    // Wire up outputs to top module ports
    assign Q_A = Q_A_w;
    assign Q_B = Q_B_w;
    assign Q_C = Q_C_w;
    assign Q_D = Q_D_w;
    assign Q_E = Q_E_w;

endmodule