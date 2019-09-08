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

//Forwarding input/output
logic [3:0] RA1E;
logic [3:0] RA2E;
logic [3:0] WA3M;
logic [3:0] WA3W;
logic RegWriteM;
logic RegWriteW;
logic [1:0] ForwardAE;
logic [1:0] ForwardBE;
//Stall input/output LDR
logic [3:0] RA1D;
logic [3:0] RA2D;
logic [3:0] WA3E;
logic MemtoRegE;
logic StallF;
logic StallD;
logic FlushE;
//Stall input/output B
logic PCSrcD;
logic PCSrcE;
logic PCSrcM;
logic BranchTakenE;
logic PCSrcW;
logic FlushD;

control_unit controlUnit (clk, reset,Instr[31:12], Instr[6:4], PCSrc, RegWrite, MemWrite, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUControl, Cond);

DataPath datapath(CLK, RST, CLR1, CLR2, EN1, EN2, PCSrc, RegWrite, MemtoReg, MemWrite, ALUSrc, ALUControl, Cond, ImmSrc, Instr, ReadData,
	PC, A1,A2,A3, writeData, MemWrite);

//Hazard Unit va aqui

module hazard_unit(
		//Forwarding input/output
		input logic [3:0] RA1E,
		input logic [3:0] RA2E,
		input logic [3:0] WA3M,
		input logic [3:0] WA3W,
		input logic RegWriteM,
		input logic RegWriteW,
		output logic [1:0] ForwardAE,
		output logic [1:0] ForwardBE,
		//Stall input/output LDR
		input logic [3:0] RA1D,
		input logic [3:0] RA2D,
		input logic [3:0] WA3E,
		input logic MemtoRegE,
		output logic StallF,
		output logic StallD,
		output logic FlushE,
		//Stall input/output B
		input logic PCSrcD,
		input logic PCSrcE,
		input logic PCSrcM,
		input logic BranchTakenE,
		input logic PCSrcW,
		output logic FlushD
	);

endmodule 