
module regfileVec #(parameter N=18)(input logic clk,
					input logic we3,
					input logic [3:0] ra1, ra2, wa3,
					input logic [2:0][N-1:0] wd3, r15,
					output logic [2:0][N-1:0] rd1, rd2);
	
	logic [2:0][N-1:0] rf[14:0];
	
	// three ported register file
	// read two ports combinationally
	// write third port on rising edge of clock
	// register 15 reads PC + 8 instead
	always_ff @(posedge clk)
	if (we3) rf[wa3] <= wd3;
	
	assign rd1 = (ra1 == 4'b1111) ? r15 : rf[ra1];
	assign rd2 = (ra2 == 4'b1111) ? r15 : rf[ra2];
endmodule