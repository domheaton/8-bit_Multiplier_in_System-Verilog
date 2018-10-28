// D1 - model solution
// registers C and AQ, code as suggested in the briefing lecture
/*
   author: tjk
   last revision: 17 Oct' 13
*/

module register (input logic clock, reset, add, shift, C,
              input logic[7:0] Qin, Sum, output logic[15:0] AQ);

//assign Qin = 4'b0111;
//assign Sum = 4'b0101;
//assign reset = '0;
//assign add = '0;
//assign shift = 1;
//assign Creg2 = '1;
//assign AQ[7:4] = 4'b0101;
//assign AQ2[7:0] = 8'b01010111;

logic Creg; // MSB carry bit storage

always_ff @ (posedge clock)
  if (reset)  // clear C,A and load Q
  	begin
	   Creg <= 0;
	   AQ[15:8] <= 0;
	   AQ[7:0] <= Qin; // load multiplier into Q
	end
  else if (add) // store Sum in C,A
  	begin
      	   Creg <= C;
 	   AQ[15:8] <= Sum;
 	end
  else if (shift) // shift A, Q
  	begin
  	  {Creg,AQ} <= {1'b0,Creg,AQ[15:1]};
  	end
endmodule
