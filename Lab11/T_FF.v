module T_FF (
    input clk,
    input rst,
    input T,
    output Q
);
    wire D_in;

    // T-FF logic: D = T XOR Q_prev
    assign D_in = T ^ Q;

    // Instance of the D-FF
    D_FF dff_inst (
        .clk(clk),
        .rst(rst),
        .D(D_in),
        .Q(Q)
    );

endmodule
