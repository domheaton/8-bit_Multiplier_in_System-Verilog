// D1 - model solution

// adder code as suggested in the briefing lecture

/*
   author: tjk
   last revision: 17 Oct' 13
*/



module adder#(parameter n=8) (input logic[n-1:0] A,M, output logic C, output logic [n-1:0] Sum);
 

//assign A = 4'b0011;
//assign M = 4'b1101;

// 9-bit arithmetic addition allows to extract carry
 assign 

{C,Sum} = {1'b0,A} + {1'b0,M};


endmodule