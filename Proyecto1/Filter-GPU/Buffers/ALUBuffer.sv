module ALUBuffer #(parameter N=18)(
		input logic [N-1:0] register1 [0:2],
		input logic [N-1:0] writeData [0:2],
		input logic [3:0] WA3,
		input logic clk, reset,load,
		input logic PCSrc, RegWrite, MemtoReg, MemWrite,
		output logic [N-1:0] q1 [0:2],
		output logic [N-1:0] writeDataO [0:2],
		output logic [3:0] WA3O,
		output logic PCSrcO, RegWriteO, MemtoRegO, MemWriteO
		);
	 
		always_ff@(posedge clk)
			if(reset) 
				begin
				q1 [0]= 16'b0;
				q1 [1]= 16'b0;
				q1 [2]= 16'b0;
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
				q1 = register1;
				PCSrcO = PCSrc;
				RegWriteO = RegWrite;
				MemtoRegO = MemtoReg;
				MemWriteO = MemWrite;
				WA3O = WA3;
				writeDataO = writeData;
				end
endmodule
