(* blackbox *)
module RAMB36 #(
    parameter integer READ_WIDTH_A = 0,
    parameter integer READ_WIDTH_B = 0,
    parameter SIM_COLLISION_CHECK = "ALL",
    parameter WRITE_MODE_A = "WRITE_FIRST",
    parameter WRITE_MODE_B = "WRITE_FIRST",
    parameter integer WRITE_WIDTH_A = 0,
    parameter integer WRITE_WIDTH_B = 0
) (
    input         ENA, CLKA, SSRA, CASCADEINLATA, CASCADEINREGA, REGCEA,
    input  [3:0]  WEA,
    input  [15:0] ADDRA,
    input  [31:0] DIA,
    input  [3:0]  DIPA,
    output [31:0] DOA,
    output [3:0]  DOPA,
    output [3:0]  DOPB,
    input         ENB, CLKB, SSRB, CASCADEINLATB, CASCADEINREGB, REGCEB,
    input  [15:0] ADDRB,
    input  [31:0] DIB,
    input  [3:0]  DIPB,
    input  [3:0]  WEB,
    output [31:0] DOB,
    output        CASCADEOUTLATA, CASCADEOUTREGA,
    output        CASCADEOUTLATB, CASCADEOUTREGB
);
endmodule
