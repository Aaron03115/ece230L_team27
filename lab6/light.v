// light.v
module light(
    input  downstairs,
    input  upstairs,
    output stair_light
);

    // Implement the XOR operation
    assign stair_light = downstairs ^ upstairs;

endmodule
