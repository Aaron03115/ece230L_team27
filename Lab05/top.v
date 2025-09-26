module top (
    input [7:0] sw,
    output [1:0] led
);


    // Wire to connect the output of circuit_a to the input of circuit_b
    //wire a_out_to_b_in;


    // Instantiate Circuit A module
    circuit_a a_inst(
        .A(sw[0]),
        .B(sw[1]),
        .C(sw[2]),
        .D(sw[3]),
        .Y(led[0]) // Connect the output to the intermediate wire
    );


    // Instantiate Circuit B module
    circuit_b b_inst(
        .A(a_inst.Y), // Connect the intermediate wire to input 'a'
        .B(sw[4]),
        .C(sw[5]),
        .D(sw[6]),
        .Y(led[1]) // Connect the output to led[1]
    );


    // Connect Circuit A's output directly to led[0] for lab demonstration
    //assign led[0] = a_out_to_b_in;


endmodule



