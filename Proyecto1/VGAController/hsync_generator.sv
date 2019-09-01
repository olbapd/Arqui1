module hsync_generator (input logic vga_clock,
						output logic [9:0] h_count,
						output logic vga_hs, enable);
	logic reset=1'b0;
	logic [9:0] h_count_temp;
	logic [9:0] result1;
	logic [9:0] result2;

	nBitCounter #(10) nb1(vga_clock,reset,h_count_temp);
	assign h_count=h_count_temp;
	
	Comparador #(10) c1(10'b0001011111,h_count_temp,vga_hs,result1);
	
	Comparador #(10) c2(10'b1100011001,h_count_temp,reset,result2);
	
	assign enable=reset;
	
	
endmodule
