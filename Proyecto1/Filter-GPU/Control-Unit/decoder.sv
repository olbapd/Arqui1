module decoder(Rd, Op, Funct, RegW, MemW, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUControl);

	// Inputs
	input logic [3:0] Rd;
	input logic [1:0] Op;
	input logic [5:0] Funct;
	
	// Outputs
	output logic RegW, MemW, MemToReg, ALUSrc;
	output logic [1:0] ImmSrc, RegSrc;
	output logic [3:0] ALUControl;
	
	// Wires
	logic ALUOp;
	
	// PCS logic
	//assign PCS = ((Rd == 4'b1111) & RegW);
	
	// Main decoder logic
	main_decoder mainDecoder (Op, {Funct[5], Funct[0]}, RegW, MemW, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUOp);
	
	// ALU decoder logic
	alu_decoder aluDecoder (ALUOp, Funct, ALUControl);
	
endmodule 