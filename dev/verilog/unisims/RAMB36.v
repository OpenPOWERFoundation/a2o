`timescale 1 ps / 1 ps

module RAMB36(CASCADEOUTLATA, CASCADEOUTLATB, CASCADEOUTREGA, CASCADEOUTREGB, DOA, DOB, DOPA, DOPB, ADDRA, ADDRB, CASCADEINLATA, CASCADEINLATB, CASCADEINREGA, CASCADEINREGB,
              CLKA, CLKB, DIA, DIB, DIPA, DIPB, ENA, ENB, REGCEA, REGCEB, SSRA, SSRB, WEA, WEB);

   parameter bramAddrWidth = 10;
   parameter READ_WIDTH_A = 0;
   parameter READ_WIDTH_B = 0;
   parameter WRITE_WIDTH_A = 0;
   parameter WRITE_WIDTH_B = 0;
   parameter SIM_COLLISION_CHECK = "";
   parameter WRITE_MODE_A = "";
   parameter WRITE_MODE_B = "";

   output         CASCADEOUTLATA;
   output         CASCADEOUTLATB;
   output         CASCADEOUTREGA;
   output         CASCADEOUTREGB;
   output [31:0]  DOA;
   output [31:0]  DOB;
   output [3:0]   DOPA;
   output [3:0]   DOPB;

   input  [15:0]  ADDRA;
   input  [15:0]  ADDRB;
   input          CASCADEINLATA;
   input          CASCADEINLATB;
   input          CASCADEINREGA;
   input          CASCADEINREGB;
   input          CLKA;
   input          CLKB;
   input  [31:0]  DIA;
   input  [31:0]  DIB;
   input  [3:0]   DIPA;
   input  [3:0]   DIPB;
   input          ENA;
   input          ENB;
   input          REGCEA;
   input          REGCEB;
   input          SSRA;
   input          SSRB;
   input  [3:0]   WEA;
   input  [3:0]   WEB;

   wire   [35:0]  dina;
   wire   [35:0]  dinb;
   wire   [35:0]  douta;
   wire   [35:0]  doutb;
   wire   [bramAddrWidth-1:0] bAddrA;
   wire   [bramAddrWidth-1:0] bAddrB;

   wire			    unused;

   assign dina[35:27] = {DIPA[3], DIA[31:24]};
   assign dina[26:18] = {DIPA[2], DIA[23:16]};
   assign dina[17:9] = {DIPA[1], DIA[15:8]};
   assign dina[8:0] = {DIPA[0], DIA[7:0]};

   assign dinb[35:27] = {DIPB[3], DIB[31:24]};
   assign dinb[26:18] = {DIPB[2], DIB[23:16]};
   assign dinb[17:9] = {DIPB[1], DIB[15:8]};
   assign dinb[8:0] = {DIPB[0], DIB[7:0]};

   assign DOA[31:24] = douta[34:27];
   assign DOA[23:16] = douta[25:18];
   assign DOA[15:8] = douta[16:9];
   assign DOA[7:0] = douta[7:0];

   assign DOPA[3:0] = {douta[35], douta[26], douta[17], douta[8]};

   assign DOB[31:24] = doutb[34:27];
   assign DOB[23:16] = doutb[25:18];
   assign DOB[15:8] = doutb[16:9];
   assign DOB[7:0] = doutb[7:0];

   assign DOPB[3:0] = {doutb[35], doutb[26], doutb[17], doutb[8]};

   assign bAddrA = ADDRA[(bramAddrWidth+5)-1:5];
   assign bAddrB = ADDRB[(bramAddrWidth+5)-1:5];

   generate begin
     genvar  i;
     for (i = 3; i >= 0; i = i - 1) begin: ra
            bram_model #(.data_w(9), .addr_w(bramAddrWidth)) bram_model(
               .DIA(dina[((i + 1) * 9) - 1:i * 9]),
               .DIB(dinb[((i + 1) * 9) - 1:i * 9]),
               .ADDRA(bAddrA),
               .ADDRB(bAddrB),
               .CLKA(CLKA),
               .CLKB(CLKB),
               .DOA(douta[((i + 1) * 9) - 1:i * 9]),
               .DOB(doutb[((i + 1) * 9) - 1:i * 9]),
               .SSRA(SSRA),
               .SSRB(SSRB),
               .WEA(WEA[i]),
               .WEB(WEB[i]),
               .ENA(ENA),
               .ENB(ENB)
            );
     end
   end
   endgenerate

   assign CASCADEOUTLATA = 1'b0;
   assign CASCADEOUTLATB = 1'b0;
   assign CASCADEOUTREGA = 1'b0;
   assign CASCADEOUTREGB = 1'b0;

   assign unused = CASCADEINLATA | CASCADEINLATB | CASCADEINREGA | CASCADEINREGB | |ADDRA[15:14] | |ADDRA[4:0] | |ADDRB[15:14] | |ADDRB[4:0] | REGCEA | REGCEB;

endmodule
