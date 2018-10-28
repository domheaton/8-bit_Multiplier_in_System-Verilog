module test_sequencer;

logic add, shift, reset, ready;
logic start, clock, Q0, seqreset;

sequencer s(.*);

initial
  begin
      clock = '0;
      forever #5ns clock = ~clock;
  end

initial
  begin
      seqreset = '0;
      Q0 = '0;
      start = '0;

//      #100ns start = '1; //jump to B
//      #100ns start = '0;
//      #50ns  Q0 = '1;    //jumpt to C
//      #100ns Q0 = '0;
//      #200ns begin start = '1; Q0 = '1; end  //wait for count to decrement enough, then start goes high to jump to B
//      #50ns  start = '0;

	#100ns start = '1;
	#20ns start = '0; 				//currently decrementing count
	//#100ns start = '1; 				//should exit state D here
	//#100ns begin start = '0; seqreset = '1; end 	//reset whole sequencer
	//#100ns seqreset = '0;
	#400ns begin start = '1; Q0 = '1; end 		//leave state A following the reset with add and shift (instead of only shift)
	#20ns start = '0;
	#300ns seqreset = '1; 				
  end

endmodule
