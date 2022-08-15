module DNA_PORT (DOUT, CLK, DIN, READ, SHIFT);

    parameter [56:0] SIM_DNA_VALUE = 57'h0;

    output DOUT;
    input  CLK, DIN, READ, SHIFT;

    assign DOUT = 1'b0;

endmodule