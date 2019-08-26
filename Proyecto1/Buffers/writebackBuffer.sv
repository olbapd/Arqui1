module writebackBuffer (
		input logic [15:0] register1 [0:2],
		input logic clk, reset,load,
		input logic PCSrc, RegWrite, MemtoReg,
		output logic [15:0] q1 [0:2],
		output logic PCSrcO, RegWriteO, MemtoRegO
		);
	 
		always_ff@(posedge clk)
			if(reset) 
				begin
				q1 [0]= 16'b0;
				q1 [1]= 16'b0;
				q1 [2]= 16'b0;
				PCSrcO = 1'b0;
				RegWriteO = 1'b0;
				MemtoRegO = 1'b0;
				end
			else if(load)
				begin
				q1 = register1;
				PCSrcO = PCSrcO;
				RegWriteO = RegWriteO;
				MemtoRegO = MemtoRegO;
				end
endmodule
