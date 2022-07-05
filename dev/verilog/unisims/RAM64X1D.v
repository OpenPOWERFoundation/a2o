`timescale  1 ps / 1 ps

module RAM64X1D #(
   parameter  [63:0] INIT = 64'h0
) (
   input         WCLK,
   input         WE,
   input         A0, A1, A2, A3, A4, A5,
   input         D,
   output        SPO,
   input         DPRA0, DPRA1, DPRA2, DPRA3, DPRA4, DPRA5,
   output        DPO
);

   reg    [63:0] mem;
   wire   [5:0]  A;
   wire   [5:0]  DPRA;

   assign A = {A5, A4, A3, A2, A1, A0};
   assign DPO = mem[{DPRA5, DPRA4, DPRA3, DPRA2, DPRA1, DPRA0}];

   initial begin : INIT_STATE
      mem = INIT;
   end

   always @(posedge WCLK) begin
      if (WE == 1'b1) begin
         mem[A] <= D;
      end
   end

   assign SPO = mem[A];

endmodule
