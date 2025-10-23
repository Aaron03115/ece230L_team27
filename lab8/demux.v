module demux (
    input [3:0] internet_line,  // Single 4-bit data stream input
    input [1:0] demult_sel,     // 2-bit select
    input btnC,                 // Global Enable
    output [15:0] led           // 4 x 4-bit data stream outputs
);

    // Use internal wires to define the separate led segments
    wire [3:0] local_lib_out;
    wire [3:0] fire_dept_out;
    wire [3:0] school_out;
    wire [3:0] rib_shack_out;

    // The demultiplexer logic using four separate ternary statements

    // 00: local_lib (Library)
    assign local_lib_out = btnC && (demult_sel == 2'b00) ? internet_line : 4'b0;

    // 01: Fire Department
    assign fire_dept_out = btnC && (demult_sel == 2'b01) ? internet_line : 4'b0;

    // 10: School
    assign school_out = btnC && (demult_sel == 2'b10) ? internet_line : 4'b0;

    // 11: Rib Shack
    assign rib_shack_out = btnC && (demult_sel == 2'b11) ? internet_line : 4'b0;

    // Concatenate the separate 4-bit outputs into the single 16-bit 'led' port
    assign led = {rib_shack_out, school_out, fire_dept_out, local_lib_out};

endmodule
