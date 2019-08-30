module condcheck (Flags, Cond, CondEx);

	// Inputs
	input logic [3:0] Flags, Cond;
	
	
	// Outputs
	output logic CondEx;
	always @(*) begin
		case (Cond)
		  0 : CondEx <= Flags[2];
		  1 : CondEx <= !Flags[2];
		  2 : CondEx <= Flags[1];
		  3 : CondEx <= !Flags[1];
		  4 : CondEx <= Flags[3];
		  5 : CondEx <= !Flags[3];
		  6 : CondEx <= Flags[0];
		  7 : CondEx <= !Flags[0];
		  8 : CondEx <= !Flags[2] && Flags[1];
		  9 : CondEx <= Flags[2] || !Flags[1];
		  10 : CondEx <= Flags[3] ~^ Flags[0];
		  11 : CondEx <= Flags[3] ^ Flags[0];
		  12 : CondEx <= !Flags[2] && (Flags[3] ~^ Flags[0]);
		  13 : CondEx <= Flags[2] || (Flags[3] ^ Flags[0]);
		  14 : CondEx <= 1;
		  default :  CondEx <= 0;
		endcase
	end
	
endmodule 