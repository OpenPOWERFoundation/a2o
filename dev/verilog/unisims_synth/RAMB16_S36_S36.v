(* blackbox *)
module RAMB16_S36_S36 #(
    parameter SIM_COLLISION_CHECK = "ALL",
) (
    input         ENA, CLKA, WEA, SSRA,
    input  [8:0]  ADDRA,
    input  [31:0] DIA,
    input  [3:0]  DIPA,
    output [31:0] DOA,
    output [3:0]  DOPA,
    input  [8:0]  ADDRB,
    input  [31:0] DIB,
    input  [3:0]  DIPB,
    input         ENB, CLKB, WEB, SSRB,
    output [31:0] DOB,
    output [3:0]  DOPB
);
endmodule
