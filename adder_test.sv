/* adder_test.sv  --  testbench for adder module*/

module test_adder #(parameter n=4);

logic [n-1:0] A,M;
logic C;
logic [n-1:0] Sum;

adder a(.*);

initial
	begin
		A = 4'b0000;
		M = 4'b0000;

		#50ns M = 4'b0001;
		#50ns M = 4'b0010;
		#50ns M = 4'b0011;
		#50ns M = 4'b0100;
		#50ns M = 4'b0101;
		#50ns M = 4'b0110;
		#50ns M = 4'b0111;
		#50ns M = 4'b1000;
		#50ns M = 4'b1001;
		#50ns M = 4'b1010;
		#50ns M = 4'b1011;
		#50ns M = 4'b1100;
		#50ns M = 4'b1101;
		#50ns M = 4'b1110;
		#50ns M = 4'b1111;
		
		#200ns A = 4'b0001;
		#50ns A = 4'b0010;
		#50ns A = 4'b0011;
	end
endmodule
