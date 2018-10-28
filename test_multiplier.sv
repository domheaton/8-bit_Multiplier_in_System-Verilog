/* Testbench for the entire multiplier */

module test_multiplier;

logic start;
logic [15:0] AQ;
//logic [n-1:0] Sum;
//logic [n-1:0] A,M;
//logic ready;

multiplier m(.*);

initial
  begin
    start = '0;
    #4s start = '1;	//wait for first two clock cycles to have passed
    #4s start = '0;
//    #15s start = '1;
//    #5.1s start = '0;
  end

endmodule
