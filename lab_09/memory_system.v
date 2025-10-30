module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    // Array of wires for memory block interfaces (4 signals, 8 bits wide)
    wire [7:0] data_in[3:0]; 
    // Array of wires for store inputs (4 signals, 1 bit wide)
    wire store_in[3:0];      
    // Array of wires for outputs from the four memory blocks
    wire [7:0] byte_out[3:0];  

    // Generator variable for looping
    genvar i;
        generate
        for (i = 0; i < 4; i = i + 1) begin : demux_logic
            // Data Demux: Data is passed only if addr == i, otherwise 0
            assign data_in[i] = (addr == i) ? data : 8'h00;
            
            // Store/Enable Demux: Store signal is passed only if addr == i, otherwise 0
            // Note: Since 'store' is the Enable line, if it's '0', the memory holds state.
            assign store_in[i] = (addr == i) ? store : 1'b0;
        end
    endgenerate
    
    generate
        for (i = 0; i < 4; i = i + 1) begin : byte_inst
            byte_memory byte_mem_instance (
                .data(data_in[i]),
                .store(store_in[i]),
                .memory(byte_out[i])
            );
        end
    endgenerate

    // --- Output Multiplexer Logic (4-to-1) ---
    // The output is the byte from the array selected by the 'addr'
    assign memory = byte_out[addr]; 

endmodule
