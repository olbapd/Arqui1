module ALUBuffer #(parameter N=18)(
		input logic [2:0][N-1:0] ALUResult,
		input logic [18:0] memoryDirection1,
		input logic [18:0] memoryDirection2,
		input logic [18:0] memoryDirection3,
		input logic [2:0][N-1:0] writeData,
		input logic [3:0] WA3,
		input logic clk, reset,load,
		input logic RegWrite, MemtoReg, MemWrite,
		output logic [2:0][N-1:0] ALUResultO,
		output logic [18:0] q1,
		output logic [18:0] q2,
		output logic [18:0] q3,
		output logic [2:0][N-1:0] writeDataO,
		output logic [3:0] WA3O,
		output logic RegWriteO, MemtoRegO, MemWriteO
		);
	 
		always_ff@(posedge clk)
			if(reset) 
				begin
				ALUResultO [0]= 16'b0;
				ALUResultO [1]= 16'b0;
				ALUResultO [2]= 16'b0;
				q1 = 19'b0;
				q2 = 19'b0;
				q3 = 19'b0;
				writeDataO [0]= 16'b0;
				writeDataO [1]= 16'b0;
				writeDataO [2]= 16'b0;
				RegWriteO = 1'b0;
				MemtoRegO = 1'b0;
				MemWriteO = 1'b0;
				WA3O = 4'b0;
				end
			else if(load)
				begin
				ALUResultO = ALUResult;
				q1 = memoryDirection1;
				q2 = memoryDirection2;
				q3 = memoryDirection3;
				RegWriteO = RegWrite;
				MemtoRegO = MemtoReg;
				MemWriteO = MemWrite;
				WA3O = WA3;
				writeDataO = writeData;
				end
endmodule
