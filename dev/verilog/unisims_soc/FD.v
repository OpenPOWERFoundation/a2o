
`timescale  1 ps / 1 ps

module FD (Q, C, D);

    parameter INIT = 1'b0;

    output Q;
    input  C, D;

    wire Q;
    reg q_out;

    initial q_out = INIT;

    always @(posedge C)
       q_out <=  D;

    assign Q = q_out;

endmodule
