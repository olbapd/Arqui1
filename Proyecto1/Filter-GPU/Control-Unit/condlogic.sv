module condlogic (CLK, RST, PCS, RegW, B, NoWrite, MemW, FlagW, Cond, ALUFlags, PCSrc, RegWrite, MemWrite, BranchTakenE);

	// Inputs
	input logic CLK, RST, PCS, RegW, MemW, NoWrite, B;
	input logic [1:0] FlagW;
	input logic [3:0] Cond, ALUFlags;
	
	// Outputs
	output logic PCSrc, RegWrite, MemWrite, BranchTakenE;
	
	// Wires
	logic [3:0] Flags;
	logic CondEx;
	
	// Condition check
	n_bit_register #(2) flagRegister1 (~CLK, RST, ALUFlags[3:2], (FlagW[1] && CondEx), Flags[3:2]); //FlagW && CondEx = FlagWrite
	n_bit_register #(2) flagRegister2 (~CLK, RST, ALUFlags[1:0], (FlagW[0] && CondEx), Flags[1:0]);
	condcheck conditionCheck(Flags, Cond, CondEx);
	
	// Output logic
	assign PCSrc = PCS && CondEx;
	assign BranchTakenE = B && CondEx;
	assign RegWrite = RegW && CondEx && ~NoWrite;
	assign MemWrite = MemW && CondEx;
	

endmodule 