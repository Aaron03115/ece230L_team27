module top(
    input [15:0] sw,
    input btnC,
    output [15:0] led
);
    
    // Part 1: Single Bit Memory (D-Latch)
    // sw[0] = D, btnC = E, led[0] = Q, led[1] = ~Q
    d_latch part1(
        .D(sw[0]),
        .Q(led[0]),
        .NotQ(led[1]),
        .E(btnC)
    );

    // Part 2: Four Bytes (Memory System)
    // sw[15:8] = 8 data bits, sw[7:6] = Address Select, btnC = Store, led[15:8] = 8 output bits
    memory_system part2(
        .data(sw[15:8]),
        .addr(sw[7:6]),
        .store(btnC),
        .memory(led[15:8]) // Connects to the higher 8 bits of led
    );

endmodule
