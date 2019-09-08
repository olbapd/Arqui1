module registersBuffer #(parameter N=18)(
		input logic [2:0][N-1:0] rd1,
		input logic [2:0][N-1:0] rd2,
		input logic [3:0] ra1,ra2,
		input logic [2:0][N-1:0] extend,
		input logic clk, reset,load,
		input logic RegWrite, MemtoReg, MemWrite, Branch, ALUSrc, FlagWrite,
		input logic [3:0] ALUControl, WA3,
		output logic [2:0][N-1:0] rd1o,
		output logic [2:0][N-1:0] rd2o,
		output logic [3:0] ra1o, ra2o,
		output logic [2:0][N-1:0] extendO,
		output logic RegWriteO, MemtoRegO, MemWriteO, BranchO, ALUSrcO, FlagWriteO,
		output logic [3:0] ALUControlO, WA3O
		);
	 
		always_ff@(posedge clk)
			if(reset) 
				begin
				rd1o [0]= 16'b0;
				rd1o [1]= 16'b0;
				rd1o [2]= 16'b0;
				rd2o [0]= 16'b0;
				rd2o [1]= 16'b0;
				rd2o [2]= 16'b0;
				ra1 = 4'b0;
				ra2 = 4'b0;
				extendO[0] = 16'b0;
				extendO[1] = 16'b0;
				extendO[2] = 16'b0;
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
				rd1o = rd1;
				rd2o = rd2;
				ra1o = ra1;
				ra2o = ra2;
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
