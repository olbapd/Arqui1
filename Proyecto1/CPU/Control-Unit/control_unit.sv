module control_unit(
	input logic CLK, RST, B,
	input logic [31:12] Instr, 
	input [3:0] ALUFlags,
	input logic [2:0] ShiftSel,
	output logic PCSrc, RegWrite, MemWrite,MemToReg,
 	output logic [1:0] ALUSrc,ImmSrc,
	output logic [2:0] RegSrc,
	output logic [3:0] ALUControl,
	output logic [1:0] FlagW
	);
	
	// Wires
	logic PCS, RegW, MemW, NoWrite;
	logic [1:0] FlagW, ALUSrc1, RegSrc1;
	logic [3:0] ALUControl0, ALUControl1;
	
	decoder decoderUnit (Instr[15:12], Instr[27:26], Instr[25:20], PCS, RegW, MemW, MemToReg, ALUSrc1, ImmSrc, RegSrc1, NoWrite, ALUControl0, FlagW, B);

	condlogic conditionLogic (CLK, RST, PCS, RegW, B, NoWrite, MemW, FlagW, Instr[31:28], ALUFlags, PCSrc, RegWrite, MemWrite,BranchTakenE);
	
	n_bit_mux #(4,2) mux1({4'b1011, 4'b1010, 4'b1000}, ShiftSel[2:1], ALUControl1);
	n_bit_mux #(4,1) mux2({ALUControl1, ALUControl0}, ALUControl0[3], ALUControl);
	n_bit_mux #(2,1) mux3({{~ShiftSel[0], ALUSrc1[0]}, ALUSrc1}, ALUControl0[3], ALUSrc);
	
	assign RegSrc = {ALUControl0[3], RegSrc1};
	
endmodule 