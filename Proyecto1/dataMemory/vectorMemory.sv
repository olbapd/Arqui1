module vectorMemory (
	input [15:0] pos1,pos2,pos3, WD1, WD2, WD3,
	input OE, wEnable, clock,
	output logic [15:0] register [0:2]
	);
	
	logic [15:0] RD1, RD2, RD3;
	
	dataMemory datamem(pos1,pos2,pos3, WD1, WD2, WD3,OE, wEnable, clock,RD1, RD2, RD3);
	
	assign register[0] = RD1;
	assign register[1] = RD2;
	assign register[2] = RD3;
	

endmodule
