
// 4-State Mealy state machine

// A Mealy machine has outputs that depend on both the state and 
// the inputs.  When the inputs change, the outputs are updated
// immediately, without waiting for a clock edge.  The outputs
// can be written more than once per state or per clock cycle.

module comp (reset, clk, a, b, greater, equal, less);

	input reset, clk, a, b;
	output reg greater,equal,less;
	
	// Declare state register
	reg [1:0]state;
	
	// Declare states
	parameter S0 = 0, S1 = 1, S2 = 2;
	
	// Determine the next state synchronously, based on the
	// current state and the input
	always @ (posedge clk or posedge reset) begin
		if (reset)
			state <= S1;
		else
			case (state)
			
				S0: 
					if (a && ~b)
						state <= S2;
					else
						state <= S0;
						
				S1: 
					if (~a && b)
						state <= S0;
					else if (a && ~b) 
						state <= S2;
					else 
						state <= S1;
						
				S2: 
					if (~a && b)
						state <= S0;
					else
						state <= S2;
			endcase
	end
	
	// Determine the output based only on the current state
	// and the input (do not wait for a clock edge).
	always @ (state or a or b or ~a or ~b)
	begin
		case (state)
			S0:
				if (a && ~b)
				begin
					greater = 1;
					equal = 0;
					less = 0;
				end
				else
				begin
					greater = 0;
					equal = 0;
					less = 1;
				end
			S1:
				if (~a && b)
				begin
					greater = 0;
					equal = 0;
					less = 1;
				end
				else if (a && ~b)
				begin
					greater = 1;
					equal = 0;
					less = 0;
				end
				
				else 
				begin
					greater = 0;
					equal = 1;
					less = 0;
				end 
			S2:
				if (~a && b)
				begin
					greater = 0;
					equal = 0;
					less = 1;
				end
				else
				begin
					greater = 1;
					equal = 0;
					less = 0;
				end
				
		endcase
	end

endmodule
