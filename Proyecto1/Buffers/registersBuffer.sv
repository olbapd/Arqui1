module registersBuffer (
		input logic [15:0] register1 [0:2],
		input logic [15:0] register2 [0:2],
		input logic [15:0] extend [0:2],
		input logic clk, reset,load,
		input logic PCSrc, RegWrite, MemtoReg, MemWrite, Branch, ALUSrc, FlagWrite,
		input logic [3:0] ALUControl, WA3,
		output logic [15:0] q1 [0:2],
		output logic [15:0] q2 [0:2],
		output logic [15:0] extendO [0:2],
		output logic PCSrcO, RegWriteO, MemtoRegO, MemWriteO, BranchO, ALUSrcO, FlagWriteO,
		output logic [3:0] ALUControlO, WA3O
		);
	 
		always_ff@(posedge clk)
			if(reset) 
				begin
				q1 [0]= 16'b0;
				q1 [1]= 16'b0;
				q1 [2]= 16'b0;
				q2 [0]= 16'b0;
				q2 [1]= 16'b0;
				q2 [2]= 16'b0;
				extendO[0] = 16'b0;
				extendO[1] = 16'b0;
				extendO[2] = 16'b0;
				PCSrcO = 1'b0;
				RegWriteO = 1'b0;
				MemtoRegO = 1'b0;
				MemWriteO = 1'b0;
				BranchO = 1'b0;
				ALUSrcO = 1'b0;
				FlagWriteO = 1'b0;
				ALUControlO = 4'b0;
				WA3O = 4'b0;
				end
			else if(load)
				begin
				q1 = register1;
				q2 = register2;
				PCSrcO = PCSrc;
				extendO = extend;
				RegWriteO = RegWrite;
				MemtoRegO = MemtoReg;
				MemWriteO = MemWrite;
				BranchO = Branch;
				ALUSrcO = ALUSrc;
				FlagWriteO = FlagWrite;
				ALUControlO = ALUControl;
				WA3O = WA3;
				end
endmodule
