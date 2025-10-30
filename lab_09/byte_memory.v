module byte_memory(
    input [7:0] data,
    input store,
    output reg [7:0] memory
);

    // Implement D-Latch style memory for 8 bits
    always @(data, store) begin
        if (store) begin 
            // When 'store' is high, latch the input data
            memory <= data;
        end
        // When 'store' is low, 'memory' holds its value (implied memory)
    end

endmodule
