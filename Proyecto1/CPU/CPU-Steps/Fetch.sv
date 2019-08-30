module Fetch (
		input logic clk, rst, PCSrcW1, PCSrcW2, // PCSrcW2 = BranchE && CondEXE  
		input logic [2:0][17:0] wd3,
		output logic [31:0] Instr,
		output logic [17:0] PC,
		output logic [2:0] [17:0] r15
);

logic [17:0] PCPlus4;
logic [17:0] PCP,PCNext;

n_bit_register #(18) pc_reg(clk, rst, PCNext, 1'b1, PC);;   		//PC register

assign PCPlus4 = PC+ 4;                                  		//PCPLUS4

n_bit_mux #(18, 1) pc_mux1 ({wd3[0], PCPlus4}, PCSrcW1, PCP);  // PC MUX1

n_bit_mux #(18, 1) pc_mux1 ({PCP, PCPlus4}, PCSrcW2, PCNext);  	// PC MUX2

assign r15[0] = PCPlus4 + 4;                 					// PCPlus8

endmodule