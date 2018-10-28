/*	Sequencer Module - Dominic Heaton - 2777 9009   */
module sequencer(output logic add, shift, reset, ready, input logic start, clock, Q0, seqreset);

enum {A,B,C,D} present_state, next_state;

shortint count;

always_ff@(posedge clock, posedge seqreset)
//seqreset allows just the sequencer to be reset into idle state (A)
  begin
    if(seqreset)
      present_state <= A;
    else
	begin
	 present_state <= next_state;
	  case(present_state)
		  A: count <= 8;
		  B: count <= count - 1;
		  D: count <= 8;
	  endcase
	end
  end

always_comb
  begin
    add = '0;
    shift ='0;
    reset = '0;
    ready = '0;

    case(present_state)
      default: next_state = A;            //To cover all bases
      A: begin				  //Case A: Idle State
	   $info("1st Count: %d", count);    //Command line print out for testing
           reset = '1;
           if(start)
             next_state = B;
           else
             next_state = A;
         end

      B: begin				  //Case B: Adding State
            seqreset = '0;
	    reset = '0;
            if(Q0)
	     begin
              add = '1;
              next_state = C;
	     end
            else
             next_state = C;
         end

       C: begin				  //Case C: Shifting State
            add = '0;
            shift = '1;
	    $info("Count: %d", count);	  //Command line print out for testing
            if(count > 0)       	  //Count is a local variable for this module
             next_state = B;
            else
             next_state = D;
          end

        D: begin			  //Case D: Stopped (waiting) State
            shift = '0;
            ready = '1;
            if(start)
	     begin
	      seqreset = '1;
              next_state = B;
	     end
            else
             next_state = D;
          end
     endcase
  end
endmodule
