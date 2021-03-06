module n_bit_register #(parameter N = 4) (CLK, RST, WD, WE, RD);
	
	// Inputs
	input logic CLK, RST, WE;
	input logic [N-1:0] WD;
	
	// Outputs
	output logic [N-1:0] RD;
	
	// Register
	logic [N-1:0] register;
	
	// Read data
	assign RD = register;
	
	// Write Data
	always_ff @(posedge CLK) begin
		if(RST)begin
			register <= 0;
		end
		else if (~WE) begin
			register <= WD;
		end
	end
	
endmodule