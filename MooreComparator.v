// 4-State Moore state machine

// A Moore machine's outputs are dependent only on the current state.
// The output is written only when the state changes.  (State
// transitions are synchronous.)

module comp(reset, clk, a, b, greater,equal,less);
	input reset, clk, a, b;
	output reg greater,equal,less;
	// Declare state register
	reg		[1:0]state;
	
	// Declare states
	parameter S0 = 0, S1 = 1, S2 = 2;
	
	// Output depends only on the state
	always @ (state) begin
		case (state)
				
			S0: begin
				greater <= 0;
				equal <= 0;
				less <= 1;
			end
			
			S1: begin
				greater <= 0;
				equal <= 1;
				less <= 0; 
			end 
			
			S2: begin
				greater <= 1;
				equal <= 0;
				less <= 0;
			end 
			
			default: begin 
				greater <= 0;
				equal <= 0;
				less <= 1;
			end
		endcase
	end
	
	// Determine the next state
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
	
endmodule



