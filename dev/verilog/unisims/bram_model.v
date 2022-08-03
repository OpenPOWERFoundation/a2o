`timescale 1 ps / 1 ps

module bram_model (DIA, DIB, ENA, ENB, WEA, WEB, SSRA, SSRB, CLKA, CLKB, ADDRA, ADDRB, DOA, DOB);

   parameter           data_w = 2;
   parameter           addr_w = 13;
   input [data_w-1:0]  DIA;
   input [data_w-1:0]  DIB;
   input               ENA;
   input               ENB;
   input               WEA;
   input               WEB;
   input               SSRA;
   input               SSRB;
   input               CLKA;
   input               CLKB;
   input [addr_w-1:0]  ADDRA;
   input [addr_w-1:0]  ADDRB;
   output [data_w-1:0] DOA;
   output [data_w-1:0] DOB;

   reg [data_w-1:0]    MEM[2**addr_w-1:0];
   reg [data_w-1:0]    DOA_q;
   reg [data_w-1:0]    DOB_q;


   initial begin: init
      integer i;
      for (i = 0; i < 2**addr_w; i = i + 1)
         MEM[i] = 0;
   end

   always @(posedge CLKA) begin: BRAM_MODEL
      if (ENA) begin
         if (WEA) begin
            MEM[ADDRA] <= DIA;
         end
      end
   end

   always @(posedge CLKB) begin: BRAM_MODEL_B
      if (ENB) begin
         if (WEB) begin
            MEM[ADDRB] <= DIB;
         end
      end
   end

   always @(posedge CLKA) begin
      if (SSRA)
         DOA_q <= {data_w{1'b0}};
      else
         DOA_q <= MEM[ADDRA];
   end

   always @(posedge CLKB) begin
      if (SSRB)
         DOB_q <= {data_w{1'b0}};
      else
         DOB_q <= MEM[ADDRB];
   end

   assign DOA = DOA_q;
   assign DOB = DOB_q;

endmodule
