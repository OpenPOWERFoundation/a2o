(* blackbox *)
module RAM64X1D #(
    parameter  [63:0] INIT = 64'h0
)
(
    input  WCLK,
    input  WE,
    input  A0, A1, A2, A3, A4, A5,
    input  DPRA0, DPRA1, DPRA2, DPRA3, DPRA4, DPRA5,
    input  D,
    output SPO,
    output DPO
);
endmodule
