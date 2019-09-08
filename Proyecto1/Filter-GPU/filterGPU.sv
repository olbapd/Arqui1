module filterGPU (
	input logic CLK, RST,
	input logic [31:0] Instr,
	input  logic [2:0][17:0] ReadData,
	output logic [31:0] PC,
	output logic MemWriteM,
	output logic [2:0][17:0] writeData,
	output logic [9:0] A1,A2,A3,
	
);
logic RegWrite, MemToReg;
logic [2:0] RegSrc;
logic [3:0] ALUControl;
logic [1:0] ALUSrc,ImmSrc;
logic MemWrite;

logic [3:0] RA1E;
logic [3:0] RA2E;
logic [3:0] WA3M;
logic [3:0] WA3W;
logic RegWriteM;
logic RegWriteW;
logic [1:0] ForwardAE;
logic [1:0] ForwardBE;
logic [3:0] RA1D;
logic [3:0] RA2D;
logic [3:0] WA3E;
logic MemtoRegE;
logic StallF;
logic StallD;
logic FlushE;

control_unit controlUnit (clk, reset,Instr[31:12], Instr[6:4], RegWrite, MemWrite, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUControl);

DataPath datapath(CLK, RST, CLR1, FlushE, StallF, StallD, RegWrite, MemtoReg, MemWrite, ALUSrc, ALUControl, ImmSrc, Instr, ReadData, ForwardAE, ForwardBE, RegSrc,
	PC, A1,A2,A3, writeData, MemWriteM, RA1D, RA2D, RA1E, RA2E, WA3E, WA3M, WA3W, RegWriteM, RegWriteW, MemtoRegE);

hazard_unit  hazardunit(RA1E,RA2E,WA3M,WA3W,RegWriteM,RegWriteW, ForwardAE, ForwardBE,RA1D,RA2D,WA3E,MemtoRegE,StallF,StallD,FlushE);
	 


endmodule 