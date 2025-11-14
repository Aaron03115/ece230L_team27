module top (
    input btnC,
    input btnU,
    output [6:0] led
);
    wire clk = btnC;
    wire rst = btnU;

    // --- Modulo Counter (MC) Signals ---
    wire [2:0] mc_state;
    wire [2:0] mc_D_increment; 
    wire mc_Cin_1, mc_Cin_2;
    // wire mc_Cout_reset; // Removed unused signal
    wire [2:0] mc_D_final; 
    wire reset_cond;
    
    wire mc_out; 

    // Reset condition: Count is 6 (3'b101)
    assign reset_cond = mc_state[2] & ~mc_state[1] & mc_state[0];
    assign led[6] = mc_out; // Use mc_out instead of mc_Q_prev

    // --- Ripple Counter (RC) Signals ---
    wire [2:0] rc_state;
    wire rc_clk_1 = rc_state[0];
    wire rc_clk_2 = rc_state[1];

    // Connect state outputs to LEDs
    assign led[5:3] = mc_state;
    assign led[2:0] = rc_state;

// =========================================================================
// 1. Modulo Counter (Count-to-6)
// =========================================================================

    // Full Adders for mc_state + 1 increment logic
    FA fa_0 (.A(mc_state[0]), .B(1'b1), .Cin(1'b0), .Sum(mc_D_increment[0]), .Cout(mc_Cin_1));
    FA fa_1 (.A(mc_state[1]), .B(1'b0), .Cin(mc_Cin_1), .Sum(mc_D_increment[1]), .Cout(mc_Cin_2));
    // mc_Cout_reset is not needed, output of C2 is ignored
    FA fa_2 (.A(mc_state[2]), .B(1'b0), .Cin(mc_Cin_2), .Sum(mc_D_increment[2])); 

    // Next State Logic with Reset (Multiplexer):
    assign mc_D_final[0] = reset_cond ? 1'b0 : mc_D_increment[0];
    assign mc_D_final[1] = reset_cond ? 1'b0 : mc_D_increment[1];
    assign mc_D_final[2] = reset_cond ? 1'b0 : mc_D_increment[2];

    // D-FlipFlops for State Storage
    D_FF mc_ff_0 (.clk(clk), .rst(rst), .D(mc_D_final[0]), .Q(mc_state[0]));
    D_FF mc_ff_1 (.clk(clk), .rst(rst), .D(mc_D_final[1]), .Q(mc_state[1]));
    D_FF mc_ff_2 (.clk(clk), .rst(rst), .D(mc_D_final[2]), .Q(mc_state[2]));

    // D-FlipFlop for Output Toggling 
    wire mc_D_out_toggle = reset_cond ? ~mc_out : mc_out;
    // Renamed mc_Q_prev to mc_out
    D_FF mc_ff_out (.clk(clk), .rst(rst), .D(mc_D_out_toggle), .Q(mc_out)); 

// =========================================================================
// 2. Ripple Counter (Div-by-8)
// =========================================================================

    // Stage 0 
    T_FF rc_ff_0 (.clk(clk), .rst(rst), .T(1'b1), .Q(rc_state[0]));

    // Stage 1
    T_FF rc_ff_1 (.clk(rc_clk_1), .rst(rst), .T(1'b1), .Q(rc_state[1]));

    // Stage 2 
    T_FF rc_ff_2 (.clk(rc_clk_2), .rst(rst), .T(1'b1), .Q(rc_state[2]));

endmodule


