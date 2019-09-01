module regfileVectorial #(parameter N=18, parameter V=3)(input logic clk,
				input logic WriteEnable,
				input logic [3:0] ra1, ra2, WriteAddr,
				input logic [N-1:0] WriteData, r15,
				output logic [N-1:0] rd1, rd2);
	
	logic [V-1:0][N-1:0] registerVector[14:0];
	// three ported register file
	// read two ports combinationally
	// write third port on rising edge of clock
	// register 15 reads PC + 8 instead
	always_ff @(posedge clk)
		if (WriteEnable) registerVector[WriteAddr] <= WriteData;
	assign rd1 = (ra1 == 4'b1111) ? r15 : registerVector[ra1];
	assign rd2 = (ra2 == 4'b1111) ? r15 : registerVector[ra2];

endmodule

/*module regfileVectorial #(parameter N = 18)
						(input locgic clk, reset, WrtiteEnable
						input logic [N-1:0] WriteData,
						output logic ReadData);
	
	
	// Register
	logic [N-1:0] register;
	
	// Read data
	assign ReadData = register;
	
	// Write Data
	always_ff @(posedge clk) begin
		if(reset == 0)begin
			register <= 0;
		end
		else if (WrtiteEnable == 1) begin
			register <= WriteData;
		end
	end
	
endmodule
*/
/*
module ram #(parameter N = 6, M = 32)
			(input logic clk,
			input logic we,
			input logic [N–1:0] adr,
			input logic [M–1:0] din,
			output logic [M–1:0] dout);
	logic [M–1:0] mem [2**N–1:0];
	
	always_ff @(posedge clk)
		if (we) mem [adr] <= din;
	
	assign dout = mem[adr];
endmodule

module regfile(input logic clk,
				input logic we3,
				input logic [3:0] ra1, ra2, wa3,
				input logic [31:0] wd3, r15,
				output logic [31:0] rd1, rd2);
	logic [31:0] rf[14:0];
	// three ported register file
	// read two ports combinationally
	// write third port on rising edge of clock
	// register 15 reads PC + 8 instead
	always_ff @(posedge clk)
		if (we3) rf[wa3] <= wd3;
	assign rd1 = (ra1 == 4'b1111) ? r15 : rf[ra1];
	assign rd2 = (ra2 == 4'b1111) ? r15 : rf[ra2];

endmodule

*/