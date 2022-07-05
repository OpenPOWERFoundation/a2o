(* blackbox *)
module RAMB16_S9_S9 #(
   parameter SIM_COLLISION_CHECK = "ALL",
) (
    input         ENA, CLKA, WEA, SSRA,
    input  [10:0] ADDRA,
    input  [7:0]  DIA,
    input  [0:0]  DIPA,
    output [7:0]  DOA,
    output [0:0]  DOPA,
    input         ENB, CLKB, WEB, SSRB,
    input  [10:0] ADDRB,
    input  [7:0]  DIB,
    input  [0:0]  DIPB,
    output [7:0]  DOB,
    output [0:0]  DOPB
);
endmodule
