(* blackbox *)
module RAMB16_S18_S18 #(
    parameter SIM_COLLISION_CHECK = "ALL",
) (
    input         ENA, CLKA, WEA, SSRA,
    input  [9:0]  ADDRA,
    input  [15:0] DIA,
    input  [1:0]  DIPA,
    output [15:0] DOA,
    output [1:0]  DOPA,
    input         ENB, CLKB, WEB, SSRB,
    input  [9:0]  ADDRB,
    input  [15:0] DIB,
    input  [1:0]  DIPB,
    output [15:0] DOB,
    output [1:0]  DOPB
);
endmodule
