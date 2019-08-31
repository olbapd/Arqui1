module ALUBuffer #(parameter N=18)(
		input logic [2:0][N-1:0] ALUResult,
		input logic [2:0][N-1:0] memoryDirection2,
		input logic [2:0][N-1:0] memoryDirection3,
		input logic [2:0][N-1:0] writeData,
		input logic [3:0] WA3,
		input logic clk, reset,load,
		input logic PCSrc, RegWrite, MemtoReg, MemWrite,
		output logic [2:0][N-1:0] q1,
		output logic [2:0][N-1:0] q2,
		output logic [2:0][N-1:0] q3,
		output logic [2:0][N-1:0] writeDataO,
		output logic [3:0] WA3O,
		output logic PCSrcO, RegWriteO, MemtoRegO, MemWriteO
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
				q3 [0]= 16'b0;
				q3 [1]= 16'b0;
				q3 [2]= 16'b0;
				writeDataO [0]= 16'b0;
				writeDataO [1]= 16'b0;
				writeDataO [2]= 16'b0;
				PCSrcO = 1'b0;
				RegWriteO = 1'b0;
				MemtoRegO = 1'b0;
				MemWriteO = 1'b0;
				WA3O = 4'b0;
				end
			else if(load)
				begin
				q1 = ALUResult;
				q2 = memoryDirection2;
				q3 = memoryDirection3;
				PCSrcO = PCSrc;
				RegWriteO = RegWrite;
				MemtoRegO = MemtoReg;
				MemWriteO = MemWrite;
				WA3O = WA3;
				writeDataO = writeData;
				end
endmodule
