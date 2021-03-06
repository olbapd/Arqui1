module aluScalar #(parameter N=18)(input logic [N-1:0] A, B,
 				 input logic [2:0] F,
				 output logic [N-1:0] Result,
				 output logic Negative, Zero, Carry,Overflow);
	logic [N-1:0] S, Bout;
	logic Cout;
	
	assign Bout = F[2] ? ~B : B;
	
	assign {Cout, S} = A +Bout + F[2];
	
	always_comb
		case (F[2:0])
			3'b000: Result <= A + B; //add
			3'b001: Result <= A | Bout;
			3'b010: Result <= S;
			3'b011: Result <= A-B; //sub
			3'b100: Result <= A*B;
			3'b111: Result <= A+18'b0;
			default: Result <= A*B; 
		endcase

	assign Zero = (Result == 0);
	assign Negative = (Result[N-1]==18'b1);
	/*assign Overflow = ~F[2] & (A & B & ~S[N-1] | ~A & ~B & S[N-1]) |
							 F[2] & (~A & B & S[N-1] | A & ~B & ~S[N-1]);*/
	always_comb
		case (F[2:1])
			2'b01: Overflow <= A[N-1] & (B[N-1] & ~S[N-1] | ~A[N-1] & ~B[N-1] & S[N-1]);
			2'b11: Overflow <= ~A[N-1] & (B[N-1] & S[N-1] | A[N-1] & ~B[N-1] & ~S[N-1]);
		default: Overflow <= 1'b0;
	endcase

	always_comb
		case (F[1:0])
			2'b10: Carry <= Cout;
			2'b11: Carry <= Cout;
		default: Carry <= 1'b0;
	endcase
	
endmodule