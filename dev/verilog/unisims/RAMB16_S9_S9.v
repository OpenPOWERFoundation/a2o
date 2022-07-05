`timescale  1 ps / 1 ps

module RAMB16_S9_S9 (DOA, DOB, DOPA, DOPB, ADDRA, ADDRB, CLKA, CLKB, DIA, DIB, DIPA, DIPB, ENA, ENB, SSRA, SSRB, WEA, WEB);

   parameter bramAddrWidth = 9;
   parameter SIM_COLLISION_CHECK = "";

   output [7:0]   DOA;
   output [7:0]   DOB;
   output         DOPA;
   output         DOPB;

   input  [10:0]  ADDRA;
   input  [10:0]  ADDRB;
   input          CLKA;
   input          CLKB;
   input  [7:0]   DIA;
   input  [7:0]   DIB;
   input          DIPA;
   input          DIPB;
   input          ENA;
   input          ENB;
   input          SSRA;
   input          SSRB;
   input  		   WEA;
   input 		   WEB;

   wire   [8:0]   dina;
   wire   [8:0]   dinb;
   wire   [8:0]   douta;
   wire   [8:0]   doutb;
   wire   [bramAddrWidth-1:0] bAddrA;
   wire   [bramAddrWidth-1:0] bAddrB;
   wire           unused;

   assign unused = |ADDRA[10:bramAddrWidth] | |ADDRB[10:bramAddrWidth];

   assign dina[8:0]   = {DIPA, DIA[7:0]};

   assign dinb[8:0]   = {DIPB, DIB[7:0]};

   assign DOA[7:0]   = douta[7:0];

   assign DOPA = douta[8];

   assign DOB[7:0]   = doutb[7:0];

   assign DOPB = doutb[8];

   assign bAddrA = ADDRA[(bramAddrWidth)-1:0];
   assign bAddrB = ADDRB[(bramAddrWidth)-1:0];

   generate begin
     genvar i;
     for (i = 0; i >= 0; i = i - 1) begin : ra
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
