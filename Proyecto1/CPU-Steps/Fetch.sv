module Fetch (
		input logic CLK, RST, PCSrc,
		input logic [2:0][17:0] WD3,
		output logic [31:0] R15, PC, Instr
        );

logic [31:0] PCPlus4;
logic [31:0] PCP;

n_bit_register #(32) pc_reg(CLK, RST, PCP, 1'b1, PC);;   //PC register

assign PCPlus4 = PC+ 4;                                  //PCPLUS4

n_bit_mux #(32, 1) pc_mux ({WD3[0], PCPlus4}, PCSrc, PCP);  // PC MUX

assign R15 = PCPlus4 + 4;                 				 // PCPlus8

imem imem(PC, Instr);                                    // Intruction Memory

endmodule