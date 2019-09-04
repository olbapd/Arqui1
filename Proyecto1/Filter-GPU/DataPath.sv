module DataPath (
    input logic CLK, RST, CLR1, CLR2, EN1, EN2, PCSrcD, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD,
    input logic [3:0] ALUControlD, Cond,
    input logic [1:0] ImmSrcD,
    input logic [31:0] InstrF,
    input  logic [2:0][17:0] RDE,
    output logic [31:0] PC,
    output logic [9:0] A1M,A2M,A3M,
    output logic [2:0][17:0] writeDataM,
    output logic MemWriteM
);

logic [2:0] [17:0] wd3, rd1, rd2;
logic [31:0] InstrD;
logic [2:0] [17:0] AluResultE;
logic [9:0] A1, A2, A3;


//Fetch-Decode
Fetch fetch(CLK, RST, ~EN1, PCSrcW, BranchTakenE, ResultW, PC);
instructionBuffer instbuff(InstrF, CLK, CLR1, ~EN2, InstrD);
Decode decode(CLK, RegWriteW, ImmSrcD, InstrD, ResultW, WA3W, RegSrc, rd1, rd2, ExtImm);

//Decode-Execute
//logic [3:0] ALUFlags;
//logic PCSrc, RegWrite, MemWrite, BranchTakenE;
registersBuffer regbuff(rd1, rd2, ExtImm, CLK, CLR2, 1'b1, PCSrcD, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, ALUControlD, InstrF[15:12],  
		                rd1E, rd2E, ExtImmE, PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE, FlagWriteE, ALUControlE, WA3E);                                //, ALUSrcE, FlagWriteE  Son 2 bits corregir
                                                                                                                                                                        //Revisar rd1,rd2,rd1E,rd2E, extend, ExtImmE xq tengo entendido que es de 18 bits no de 16.

mux_3to1 muxAlu1(rd1E, ResultW, ALUResultM, ForwardAE, SrcAE); 
mux_3to1 muxAlu2(rd2E, ResultW, ALUResultM, ForwardBE, out);
mux_2to1 muxAlu3(out, ExtImmE, ALUSrcE, SrcBE); 
//Tambien hay que revisar la unidad de extend porque tiene que tirar un vector porque en muxAlu3 debe de elegir entre 2 vectores, no entre vector y escalar

aluMain #(18, 3) alu(SrcAEA, SrcBE, ALUControlE, ALUResultE, ALUFlags);

assign A1 = AluResultE[0][9:0];
assign A2 = A1 + 1; 
assign A3 = A1 - 1; 

ALUBuffer alubuff(AluResultE, A2, A3, out, WA3E, CLK, 1'b0, 1'b1, PCSrcD, RegWriteD, MemtoRegD, MemWriteD, ALUResultM, writeDataM, WA3M, PCSrcM, RegWriteM, MemtoRegM, MemWriteM); //Falta agregar las otras 2 entradas y salidas A2,A3, donde A1 es AluResult

//DATAMEM

writebackBuffer #(18) wrbBuff(RDE, ALUResultM, CLK, 1'b0, 1'b1, WA3M, PCSrcM, RegWriteM, MemtoRegM, ReadDataW, PCSrcW, RegWriteW, MemtoRegW, WA3W, ALUOutW);
mux_2to1 mux2to1(ReadDataW, ALUOutW, MemtoRegW,ResultW); 
endmodule
