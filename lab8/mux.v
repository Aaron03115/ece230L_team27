module mux (
    input [15:0] sw,        // 4 x 4-bit data inputs (CEO, You, Fred, Jill)
    input [1:0] mult_sel,   // 2-bit select
    input btnC,             // Global Enable
    output [3:0] internet_line // Single 4-bit data stream output
);

     assign internet_line = btnC ? (
        mult_sel == 2'b00 ? sw[3:0] :
        mult_sel == 2'b01 ? sw[7:4] :
        mult_sel == 2'b10 ? sw[11:8] :
        sw[15:12] // Default to Jill's data if mult_sel == 2'b11
    ) : 4'b0; // Output 0 when disabled

endmodule
