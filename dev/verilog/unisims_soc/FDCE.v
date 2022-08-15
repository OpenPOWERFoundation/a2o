`timescale  1 ps / 1 ps

module FDCE (C, CE, CLR, D, Q);

    parameter INIT = 1'b1;

    output Q;

    input  C, CE, D, CLR;

    wire Q;
    reg q_out;

    initial q_out = INIT;

    assign Q = q_out;

    always @(posedge C or posedge CLR)
        if (CLR)
             q_out <= 0;
        else if (CE)
	         q_out <= D;

endmodule
