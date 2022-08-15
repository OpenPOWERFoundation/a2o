`timescale  1 ps / 1 ps

module FDPE (Q, C, CE, D, PRE);

    parameter INIT = 1'b1;

    output Q;

    input  C, CE, D, PRE;

    wire Q;
    reg q_out;

    initial q_out = INIT;

    assign Q = q_out;

    always @(posedge C or posedge PRE)
        if (PRE)
             q_out <= 1;
        else if (CE)
	         q_out <= D;

endmodule
