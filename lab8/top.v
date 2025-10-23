module top(
    // Inputs from the Basys3 Board
    input [15:0] sw,     // Data inputs
    input btnL,          // MUX Select Bit 0
    input btnU,          // MUX Select Bit 1
    input btnD,          // DEMUX Select Bit 0
    input btnR,          // DEMUX Select Bit 1
    input btnC,          // Global Enable
    
    // Outputs to the Basys3 Board
    output [15:0] led    // Data outputs
);

    // MUX Select: {btnU, btnL} (High-to-Low bit order)
    wire [1:0] mult_sel = {btnU, btnL};
    
    // DEMUX Select: {btnR, btnD} (High-to-Low bit order)
    wire [1:0] demult_sel = {btnR, btnD};
    
    // Wire connecting the MUX output to the DEMUX input
    wire [3:0] internet_line;

    // --- Instantiate the 4-to-1 Multiplexer (mux.v) ---
    mux Mux_Inst (
        .sw(sw),
        .mult_sel(mult_sel),
        .btnC(btnC),
        .internet_line(internet_line)
    );

    // --- Instantiate the 1-to-4 Demultiplexer (demux.v) ---
    demux Demux_Inst (
        .internet_line(internet_line),
        .demult_sel(demult_sel),
        .btnC(btnC),
        .led(led)
    );

endmodule
