module IDELAYCTRL #(
)(
  output RDY,
  input REFCLK,
  input RST
);

assign RDY = !RST;
endmodule

