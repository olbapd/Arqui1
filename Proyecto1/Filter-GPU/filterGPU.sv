module filterGPU (
	input logic CLK, RST,
	input logic [31:0] Instr,
	input  logic [2:0][17:0] ReadData,
	output logic [31:0] PC,
	output logic MemWrite,
	output logic [2:0][17:0] writeData,
	output logic [9:0] A1,A2,A3,
	
);
logic [3:0] Cond;
//logic [1:0] FlagW;
logic RegWrite, MemToReg, PCSrc;
logic [2:0] RegSrc;
logic [3:0] ALUControl;
logic [1:0] ALUSrc,ImmSrc;	
control_unit controlUnit (clk, reset,Instr[31:12], Instr[6:4], PCSrc, RegWrite, MemWrite, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUControl, Cond);

DataPath datapath(CLK, RST, CLR1, CLR2, EN1, EN2, PCSrc, RegWrite, MemtoReg, MemWrite, ALUSrc, ALUControl, Cond, ImmSrc, Instr, ReadData,
	PC, A1,A2,A3, writeData, MemWrite);

//Hazard Unit va aqui

endmodule 