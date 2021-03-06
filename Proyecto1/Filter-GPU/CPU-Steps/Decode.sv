module Decode (
    input logic clk, RST, RegWriteW, ImmSrcD,
    input logic [27:0] Instr,
    input logic [2:0][17:0] wd3,
    input logic [3:0] wa3w,
    input logic [1:0] RegSrc, kernel,
    output logic [2:0][17:0] rd1, rd2,
    output logic [2:0][17:0] ExtImm,
    output logic [3:0] ra1, ra2
    );


n_bit_mux #(4, 1) ra1_mux ({4'b1111, Instr[3:0]}, RegSrc[0], ra1);

n_bit_mux #(4, 1) ra2_mux ({Instr[7:4], Instr[11:8]}, RegSrc[1], ra2);

regfileVec registerFile(clk, RST, kernel, RegWriteW, ra1, ra2, wa3w, wd3, rd1, rd2);

extendUnit #(18) extend(Instr[27:18], ExtImm); // le falta ImmSrc



endmodule

