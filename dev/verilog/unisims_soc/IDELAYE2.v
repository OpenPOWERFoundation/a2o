// wtf didn't check what it actually does!

module IDELAYE2 #(
	parameter CINVCTRL_SEL,
	parameter DELAY_SRC,
	parameter HIGH_PERFORMANCE_MODE,
	parameter IDELAY_TYPE,
	parameter IDELAY_VALUE,
	parameter PIPE_SEL,
	parameter REFCLK_FREQUENCY,
	parameter SIGNAL_PATTERN
)(
  input C,
  input CE,
  input IDATAIN,
  input INC,
  input LD,
  input LDPIPEEN,
  output DATAOUT
);

assign DATAOUT = IDATAIN;
endmodule

