module top(
    input sw, // w
    output [9:0] led, 
    input btnC, // clk
    input btnU // reset
);

    // Wires for One-Hot FSM
    wire z_onehot;
    wire onehot_A;
    wire onehot_B;
    wire onehot_C;
    wire onehot_D;
    wire onehot_E;

    // Wires for Binary FSM
    wire z_binary;
    wire [2:0] binary_state;

    // Hook up One-Hot state machine
    onehot u_onehot (
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_onehot),
        .Q_A(onehot_A),
        .Q_B(onehot_B),
        .Q_C(onehot_C),
        .Q_D(onehot_D),
        .Q_E(onehot_E)
    );
    
    // Hook up Binary state machine
    binary u_binary (
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_binary),
        .State(binary_state)
    );
    
    // Connect FSM outputs to LED bus
    // led[0]   <- One-hot Z
    // led[1]   <- Binary Z
    // led[2]   <- One-hot state A
    // led[3]   <- One-hot state B
    // led[4]   <- One-hot state C
    // led[5]   <- One-hot state D
    // led[6]   <- One-hot state E
    // led[9:7] <- Binary State (MSB is led[9])
    assign led = {
        binary_state,      // led[9:7]
        onehot_E,          // led[6]
        onehot_D,          // led[5]
        onehot_C,          // led[4]
        onehot_B,          // led[3]
        onehot_A,          // led[2]
        z_binary,          // led[1]
        z_onehot           // led[0]
    };

//    assign led = {
//        z_onehot,
//        z_binary,
//        onehot_A,
//        onehot_B,
//        onehot_C,
//        onehot_D,
//        onehot_E,
//        binary_state
//    };

endmodule