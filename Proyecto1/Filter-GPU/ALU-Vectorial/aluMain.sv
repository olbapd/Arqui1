module aluMain #(parameter N=18, parameter V=3) 
					(input logic [V-1:0][N-1:0] A, B,
					 input logic [3:0] Operation,
					 output logic [V-1:0] [N-1:0] Result,
					 output logic /*[2:0]*/[3:0] F); //Overflow,carry,zero,negative

	logic [2:0][3:0] Flags;
	logic [V-1:0][N-1:0] temp;
	logic [V-1:0][N-1:0] resultALU;
	
	assign temp[0] = (Operation==3'b101)? A[0]+A[1]+A[2] : 0;
	assign temp[1] = 0;
	assign temp[2] = 0;

	aluScalar alu1(A[0], B[0], Operation, resultALU[0], Flags[0]);
	aluScalar alu2(A[1], B[1], Operation, resultALU[1], Flags[1]);
 	aluScalar alu3(A[2], B[2], Operation, resultALU[2], Flags[2]);

 	assign Result[0]=  (Operation==3'b101)? temp[0]:resultALU[0];
 	assign Result[1]=  (Operation==3'b101)? temp[1]:resultALU[1];
 	assign Result[2]=  (Operation==3'b101)? temp[2]:resultALU[2];
	always_comb begin
		F<= Flags[0];
	end
	
endmodule