module Execute(
    input logic [2:0] [17:0] rd1E, rd2E, ResultW, ALUResultM, ExtImmE,
    input logic [1:0] ForwardAE, ForwardBE, ALUSrcE,
    input logic [2:0] ALUControlE,
    output logic [18:0] A1, A2, A3,
    output logic [2:0] [17:0] writeDataE, AluResultE
);
    logic [2:0] [17:0] Zeros, SrcA1, SrcAE, SrcBE;
    logic [3:0] ALUFlags;
    assign Zeros[0] = 18'b0;
    assign Zeros[1] = 18'b0;
    assign Zeros[2] = 18'b0; 
    
    mux_3to1 muxAlu1(rd1E, ResultW, ALUResultM, ForwardAE, SrcA1); 
    mux_2to1 mux2to1Alu(SrcA1, Zeros, ALUSrcE[0], SrcAE); 
    mux_3to1 muxAlu2(rd2E, ResultW, ALUResultM, ForwardBE, writeDataE);
    mux_2to1 muxAlu3(writeDataE, ExtImmE, ALUSrcE[1], SrcBE); 

    aluMain #(18, 3) alu(SrcAE, SrcBE, ALUControlE, AluResultE, ALUFlags);

    assign A1 = {AluResultE[1][0], AluResultE[0][17:0]};
    assign A2 = A1 + 19'b1; 
    assign A3 = A1 - 19'b1;

endmodule
