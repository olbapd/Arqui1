module aluMain #(parameter N=18, parameter V=3) 
					(input logic [V-1:0][N-1:0] A, B,
					 input logic [3:0] Operation,
					 output logic [V-1:0] [N-1:0] Result,
					 output logic /*[2:0]*/[3:0] F); //Overflow,carry,zero,negative

	logic [2:0][3:0] Flags;

	aluScalar alu1(A[0], B[0], Operation, Result[0], Flags[0]);
	aluScalar alu2(A[1], B[1], Operation, Result[1], Flags[1]);
	aluScalar alu3(A[2], B[2], Operation, Result[2], Flags[2]);
	always_comb begin
		F<= Flags[0];
	end
	
endmodule