module Decode (
    input logic clk, RegWriteW, ImmSrcD,
    input logic [31:0] Instr,
    input logic [2:0][17:0] wd3,
    input logic [3:0] wa3w,
    input logic [2:0] RegSrc,
    output logic [2:0][17:0] rd1, rd2,
    output logic [2:0][17:0] ExtImm,
    output logic [3:0] ra1, ra2
    );


n_bit_mux #(4, 1) ra1_mux ({4'b1111, Instr[19:16]}, RegSrc[0], ra1);

n_bit_mux #(4, 1) ra2_mux ({Instr[15:12], Instr[3:0]}, RegSrc[1], ra2);

regfileVec registerFile(clk, RegWriteW, ra1, ra2, wa3w, wd3, rd1, rd2);

extendUnit #(18) extend(Instr[23:0], ExtImm); // le falta ImmSrc



endmodule

