module control_unit(
	input logic CLK, RST,
	input logic [31:12] Instr, 
	input logic [2:0] ShiftSel,
	output logic RegW, MemW, MemToReg,ALUSrc,
 	output logic [1:0] ImmSrc,
	output logic [2:0] RegSrc,
	output logic [3:0] ALUControl,
	output logic [3:0] Cond
	);
	
	// Wires
	logic [1:0] ALUSrc1, RegSrc1;
	logic [3:0] ALUControl0, ALUControl1;

	decoder decoderUnit (Instr[15:12], Instr[27:26], Instr[25:20], RegW, MemW, MemToReg, ALUSrc, ImmSrc, RegSrc1, ALUControl0);

	n_bit_mux #(4,2) mux1({4'b1011, 4'b1010, 4'b1000}, ShiftSel[2:1], ALUControl1);
	n_bit_mux #(4,1) mux2({ALUControl1, ALUControl0}, ALUControl0[3], ALUControl);

	assign RegSrc = {ALUControl0[3], RegSrc1};
	assign Cond =  Instr[31:28];
	
endmodule 