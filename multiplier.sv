// D1 - model solution
// encapsulating module
/*
   author: tjk
   last revision: 17 Oct' 13
*/

module multiplier(input logic start, output logic[15:0] AQ);

logic osc_clk, clock, C, ready, reset, shift, add;
logic [7:0] M,Qin, Sum;
logic seqreset;

assign seqreset = '0;
assign M = 8'b01010101; // multiplicand - hardwired
assign Qin = 8'b01110111; // multiplier - hardwired

//// Internal Oscillator 3.33MHz
	defparam OSCH_inst.NOM_FREQ = "3.33";
	OSCH OSCH_inst
		( 
		.STDBY(1'b0), 		// 0=Enabled, 1=Disabled also Disabled with Bandgap=OFF
		.OSC(osc_clk),
		.SEDSTDBY()     		// this signal is not required if not using SED
		);



counter c(.*); // produces slow clock
adder A(.A(AQ[15:8]), .M(M), .C(C), .Sum(Sum));
register R(.*);
sequencer S(.start(start), .clock(clock), .reset(reset), .Q0(AQ[0]),
 .add(add), .shift(shift), .ready(ready), .seqreset(seqreset));
  
endmodule