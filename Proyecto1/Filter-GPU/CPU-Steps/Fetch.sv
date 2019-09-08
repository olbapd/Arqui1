module Fetch (
		input logic clk, rst, EN, PCSrcW, BranchTakenE, // BranchTakenE = BranchE && CondEXE  
		input logic [2:0][17:0] wd3,
		output logic [31:0] PC
);

logic [17:0] PCP, PCNext, PCPlus4;

initial 
PC = 32'b0;

n_bit_register #(32) pc_reg(clk, rst, PCNext, EN, PC);   			//PC register

assign PCPlus4 = PC+ 18'd4;                                  			//PCPLUS4

n_bit_mux #(18, 1) pc_mux1 ({wd3[0], PCPlus4}, PCSrcW, PCNext); 		// PC MUX1

//n_bit_mux #(18, 1) pc_mux2 ({PCP, PCPlus4}, BranchTakenE, PCNext);  // PC MUX2

endmodule