module DataPath (
    input logic CLK, RST, CLR1, CLR2, EN1, EN2, PCSrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, NoWrite, DirSrc,
    input logic [3:0] ALUControlD, Cond,
    input logic [1:0] ALUSrcD, ImmSrcD, FlagWriteD,
    input logic [31:0] InstrF,
    output logic [31:0] PC
);

logic [2:0] [17:0] wd3, rd1, rd2;
logic [31:0] InstrD;

//Fetch-Decode
Fetch fetch(CLK, RST, ~EN1, PCSrcW, BranchTakenE, wd3, PC);
instructionBuffer instbuff(InstrF, CLK, CLR1, ~EN2, InstrD);
Decode decode(CLK, RegWriteW, ImmSrcD, InstrD, wd3, wa3w, RegSrc, rd1, rd2, ExtImm);

//Decode-Execute
logic [3:0] ALUFlags;
logic PCSrc, RegWrite, MemWrite, BranchTakenE;
registersBuffer regbuff(rd1, rd2, ExtImm, CLK, CLR2, 1'b1, PCSrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, ALUSrcD, FlagWriteD, ALUControlD, InstrF[15:12],    //Revisar load creo que no se ocupa
		                rd1E, rd2E, ExtImmE, PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE, FlagWriteE, ALUControlE, WA3E);                                // ALUSrcD, FlagWriteD, ALUSrcE, FlagWriteE  Son 2 bits corregir
                                                                                                                                                                        //Revisar rd1,rd2,rd1E,rd2E, extend, ExtImmE xq tengo entendido que es de 18 bits no de 16.
condlogic conditionLogic (CLK, RST, PCSrcE, RegWriteE, BranchE, NoWrite, MemWriteE, FlagWriteE, Cond, ALUFlags, PCSrc, RegWrite, MemWrite,BranchTakenE);

mux_3to1 muxAlu1(rd1E, ResultW, ALUResultM, ForwardAE, SrcAE); 
mux_3to1 muxAlu2(rd2E, ResultW, ALUResultM, ForwardBE, out);
mux_2to1 muxAlu3(out, ExtImmE, ALUSrcE, SrcBE);
//Tambien hay que revisar la unidad de extend porque tiene que tirar un vector porque en muxAlu3 debe de elegir entre 2 vectores, no entre vector y escalar
//AQUI VIENE EL ALU

mux_2to1_esc m21esc(9'b1, 9'b1101,DirSrc, res);

//logic [8:0] A2 = AluResultE[8:0] + res; 
//logic [8:0] A3 = AluResultE[8:0] - res; 


ALUBuffer alubuff (AluResultE, out, WA3E, CLK, RST, 1'b1, PCSrc, RegWrite, MemtoRegD, MemWrite, ALUResultM, writeDataM, WA3M, PCSrcM, RegWriteM, MemtoRegM, MemWriteM); //Falta agregar las otras 2 entradas y salidas A2,A3, donde A1 es AluResult

endmodule
