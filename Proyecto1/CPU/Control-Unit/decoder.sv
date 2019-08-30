module decoder(Rd, Op, Funct, PCS, RegW, MemW, MemToReg, ALUSrc, ImmSrc, RegSrc, NoWrite, ALUControl, FlagW);

	// Inputs
	input logic [3:0] Rd;
	input logic [1:0] Op;
	input logic [5:0] Funct;
	
	// Outputs
	output logic PCS, RegW, MemW, MemToReg, NoWrite;
	output logic [1:0] ImmSrc, RegSrc, FlagW, ALUSrc;
	output logic [3:0] ALUControl;
	
	// Wires
	logic B, ALUOp;
	
	// PCS logic
	assign PCS = ((Rd == 4'b1111) & RegW) || B;
	
	// Main decoder logic
	main_decoder mainDecoder (Op, {Funct[5], Funct[0]}, B, RegW, MemW, MemToReg, ALUSrc[1], ImmSrc, RegSrc, ALUOp);
	
	// ALU decoder logic
	alu_decoder aluDecoder (ALUOp, Funct, NoWrite, ALUControl, FlagW, ALUSrc[0]);
	
endmodule 