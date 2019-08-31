module extendUnitTB();

	logic [23:0] immediate;
	logic [17:0] extended [0:2];
	
	extendUnit uut(immediate, extended);
	
	initial begin 
	
	immediate = 24'b111100001111000011110000;
	#200;
	immediate = 24'b111111111111000000000000;
	#200;
	immediate = 24'b110011001100110011001100;
	
	end

endmodule
