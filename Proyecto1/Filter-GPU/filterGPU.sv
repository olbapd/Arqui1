module filterGPU (
	input logic CLK, RST,
	input logic [27:0] Instr,
	input  logic [2:0][17:0] ReadData,
	output logic [31:0] PC,
	output logic MemWriteM,
	output logic [2:0][17:0] writeData,
	output logic [9:0] A1,A2,A3
);
logic RegWrite, MemToReg, MemtoRegE, MemWrite, RegWriteM, RegWriteW, StallF, StallD, FlushE;
logic [1:0] RegSrc;
logic [2:0] ALUControl;
logic [3:0] RA1E, RA2E, WA3M, WA3W, RA1D, RA2D, WA3E;
logic [1:0] ALUSrc, ImmSrc, ForwardAE, ForwardBE;

control_unit controlUnit (CLK,Instr[17:0], RegWrite, MemWrite, MemToReg, ImmSrc, ALUSrc, RegSrc, ALUControl);

DataPath datapath(CLK, RST, FlushE, StallF, StallD, RegWrite, MemToReg, MemWrite, ALUControl, ImmSrc, ALUSrc,Instr, ReadData, ForwardAE, ForwardBE, RegSrc,
	PC, A1,A2,A3, writeData, MemWriteM, RA1D, RA2D, RA1E, RA2E, WA3E, WA3M, WA3W, RegWriteM, RegWriteW, MemtoRegE);

hazard_unit  hazardunit(RA1E,RA2E,WA3M,WA3W,RegWriteM,RegWriteW, ForwardAE, ForwardBE,RA1D,RA2D,WA3E,MemtoRegE,StallF,StallD,FlushE);
	 
endmodule 