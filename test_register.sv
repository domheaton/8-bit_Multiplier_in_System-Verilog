/* test_register -- testbench for the register module   */

/* Loads AQ to 01110111 and then shifts, adds 0111,
	shifts, adds 0111 and then shifts continuously
	until reset goes high.
   This tests all the states of the always_ff block's
	if loop, to prove they work.		        */

module test_register;

logic clock, reset, add, shift, C;
logic [7:0] Qin, Sum;
logic [15:0] AQ;

register r(.*);

initial  // 50MHz clock
	begin
    		clock = '0;
    		forever #10ns clock = ~clock;
 	end

initial
	begin
		reset = '1; //immediately reset
		shift = '0;
		C     = '0;
		add   = '0;
		Qin = 8'b01110111; //hardwired
		Sum = 8'b01010101; //hardwired

		#100ns reset = '0;
		#100ns shift = '1;
		#100ns shift = '0;
		#100ns add = '1;
		#100ns add = '0;
		#100ns reset = '1;
		#100ns reset = '0;
		#100ns C = '1;
		#100ns add = '1;
		#100ns begin add = '0; C = '0; end
		#100ns reset = '1;
	end
endmodule
