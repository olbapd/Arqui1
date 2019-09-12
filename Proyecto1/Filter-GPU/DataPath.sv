module DataPath (
    input logic CLK, RST, CLR2, EN1, EN2, RegWriteD, MemtoRegD, MemWriteD,
    input logic [2:0] ALUControlD,
    input logic [1:0] ImmSrcD, ALUSrcD, //ALUSrc cambiar tamano en buffers
    input logic [27:0] InstrF, //ARREGLAR TAMANO EN  BUFFERS
    input logic [2:0][17:0] RDM,
    input logic [1:0] ForwardAE,
    input logic [1:0] ForwardBE,
	input logic [1:0] RegSrc,
    output logic [31:0] PC,
    output logic [9:0] A1M,A2M,A3M,
    output logic [2:0][17:0] writeDataM,
    output logic MemWriteM,
    output logic [3:0] ra1D, ra2D, ra1E, ra2E,
    output logic [3:0] WA3E, WA3M, WA3W,
    output logic RegWriteM, RegWriteW,
    output logic MemtoRegE
);
logic [2:0] [17:0] wd3, rd1, rd2;
logic [27:0] InstrD;
logic [2:0][17:0] ExtImm, ExtImmE;

//Fetch-Decode
Fetch fetch(CLK, RST, ~EN1, PC);
instructionBuffer instbuff(InstrF, CLK, 1'b0, EN2, InstrD);
Decode decode(CLK, RegWriteW, ImmSrcD, InstrD, ResultW, WA3W, RegSrc, rd1, rd2, ExtImm, ra1D, ra2D); 

//Decode-Execute
logic [2:0] [17:0] rd1E, rd2E;
logic [1:0] ALUSrcE;
logic RegWriteE, MemWriteE, MemtoRegM, MemtoRegW, ALUOutW;
logic [2:0] ALUControlE;
logic [2:0] [17:0] SrcA1, SrcAE, writeDataE, SrcBE, Zeros;
logic [3:0] ALUFlags;
logic [2:0] [17:0] AluResultE, ALUResultM;
logic [9:0] A1, A2, A3;
logic [2:0][17:0] ReadDataW; //ResultW;

registersBuffer regbuff(rd1, rd2, ra1D, ra2D, ExtImm, CLK, CLR2, 1'b1, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, ALUControlD, InstrF[7:4],  
                        rd1E, rd2E, ra1E, ra2E, ExtImmE, RegWriteE, MemtoRegE, MemWriteE, ALUSrcE, ALUControlE, WA3E);    
                        
assign Zeros[0] = 18'b0;
assign Zeros[1] = 18'b0;
assign Zeros[2] = 18'b0;

mux_3to1 muxAlu1(rd1E, ResultW, ALUResultM, ForwardAE, SrcA1); 
mux_2to1 mux2to1Alu(SrcA1, Zeros, ALUSrcE[0], SrcAE); 
mux_3to1 muxAlu2(rd2E, ResultW, ALUResultM, ForwardBE, writeDataE);
mux_2to1 muxAlu3(writeDataE, ExtImmE, ALUSrcE[1], SrcBE); 

aluMain #(18, 3) alu(SrcAE, SrcBE, ALUControlE, AluResultE, ALUFlags);

assign A1 = AluResultE[0][9:0];
assign A2 = A1 + 1; 
assign A3 = A1 - 1; 

ALUBuffer alubuff(AluResultE, A1, A2, A3, writeDataE, WA3E, CLK, 1'b0, 1'b1, RegWriteE, MemtoRegE, MemWriteE, ALUResultM, A1M, A2M, A3M, writeDataM, WA3M, RegWriteM, MemtoRegM, MemWriteM); 

writebackBuffer #(18) wrbBuff(RDM, ALUResultM, CLK, 1'b0, 1'b1, WA3M, RegWriteM, MemtoRegM, ReadDataW, RegWriteW, MemtoRegW, WA3W, ALUOutW);
mux_2to1 mux2to1WB(ReadDataW, ALUOutW, MemtoRegW,ResultW); 

endmodule
