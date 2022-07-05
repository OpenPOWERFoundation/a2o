`timescale  1 ps / 1 ps

module RAMB16_S18_S18 (DOA, DOB, DOPA, DOPB, ADDRA, ADDRB, CLKA, CLKB, DIA, DIB, DIPA, DIPB, ENA, ENB, SSRA, SSRB, WEA, WEB);

   parameter bramAddrWidth = 9;
   parameter SIM_COLLISION_CHECK = "";

   output [15:0]  DOA;
   output [15:0]  DOB;
   output [1:0]   DOPA;
   output [1:0]   DOPB;
   input  [9:0]   ADDRA;
   input  [9:0]   ADDRB;
   input          CLKA;
   input          CLKB;
   input  [15:0]  DIA;
   input  [15:0]  DIB;
   input  [1:0]   DIPA;
   input  [1:0]   DIPB;
   input          ENA;
   input          ENB;
   input          SSRA;
   input          SSRB;
   input  	      WEA;
   input  	      WEB;

   wire   [17:0]  dina;
   wire   [17:0]  dinb;
   wire   [17:0]  douta;
   wire   [17:0]  doutb;
   wire   [bramAddrWidth-1:0] bAddrA;
   wire   [bramAddrWidth-1:0] bAddrB;
   wire   unused;

   assign unused = |ADDRA[9:bramAddrWidth] | |ADDRB[9:bramAddrWidth];

   assign dina[17:9]  = {DIPA[1], DIA[15:8]};
   assign dina[8:0]   = {DIPA[0], DIA[7:0]};

   assign dinb[17:9]  = {DIPB[1], DIB[15:8]};
   assign dinb[8:0]   = {DIPB[0], DIB[7:0]};

   assign DOA[15:8]  = douta[16:9];
   assign DOA[7:0]   = douta[7:0];

   assign DOPA[1:0] = {douta[17], douta[8]};

   assign DOB[15:8]  = doutb[16:9];
   assign DOB[7:0]   = doutb[7:0];

   assign DOPB[1:0] = {doutb[17], doutb[8]};

   assign bAddrA = ADDRA[(bramAddrWidth)-1:0];
   assign bAddrB = ADDRB[(bramAddrWidth)-1:0];

   generate begin
     genvar i;
     for (i = 1; i >= 0; i = i - 1) begin : ra
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
               .WEA(WEA),
               .WEB(WEB),
               .ENA(ENA),
               .ENB(ENB)
            );
     end
   end
   endgenerate

endmodule
