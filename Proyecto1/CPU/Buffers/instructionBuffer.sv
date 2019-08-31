module instructionBuffer (
		input logic [31:0] data,
		input logic clk, reset,load,
		output logic [31:0] q);
	 
		always_ff@(posedge clk)
			if(reset)
				q = 0;
			else if(load)
				q = data;	 
endmodule
