module dataMemory(
	input [15:0] pos1,pos2,pos3, WD1, WD2, WD3,
	input OE, wEnable, clock,
	output logic [15:0] RD1, RD2, RD3
	);

	logic [15:0] memory [0:999];
	
	
	assign RD1 = (OE==1'b0) ? 16'bz : memory[pos1[15:2]];
	assign RD2 = (OE==1'b0) ? 16'bz : memory[pos2[15:2]];
	assign RD3 = (OE==1'b0) ? 16'bz : memory[pos3[15:2]];
		
	always @ (posedge clock)
	begin
		if (wEnable==1'b1)
			begin
			 memory [pos1[15:2]] = WD1;
			 memory [pos2[15:2]] = WD2;
			 memory [pos3[15:2]] = WD3;
			end
	end
	
endmodule
