module main_decoder(Op, Funct_FO, B, RegW, MemW, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUOp);

	// Inputs
	input logic [1:0] Op, Funct_FO;
	
	// Outputs
	output logic B, RegW, MemW, MemToReg, ALUSrc, ALUOp;
	output logic [1:0] ImmSrc, RegSrc;
	
	// For ease of assigment
	logic [9:0] logicOutputs;
	assign {B, MemToReg, MemW, ALUSrc, ImmSrc, RegW, RegSrc, ALUOp} = logicOutputs;
	
	logic [3:0] caseCond;
	assign caseCond = {Op, Funct_FO};
	always @(*) begin
		logicOutputs <= 0;
		casex (caseCond)
		  4'b000x : logicOutputs <= 10'b0000111001;
		  4'b001x : logicOutputs <= 10'b0001001001;
		  4'b01x0 : logicOutputs <= 10'b0011010100; //STR
		  4'b01x1 : logicOutputs <= 10'b0101011000; //LDR
		  4'b10xx : logicOutputs <= 10'b1001100010;
		  default : logicOutputs <= 0;
		endcase
	end

endmodule 