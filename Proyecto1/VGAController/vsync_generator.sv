module vsync_generator (input logic enable,
						output logic [9:0] v_count,
						output logic vga_vs);
	
	logic reset=1'b0;
	logic [9:0] v_count_temp;
	logic [9:0] result1;//No se usa
	logic [9:0] result2;//No se usa

	nBitCounter #(10) nb1(enable,reset,v_count_temp);
	assign v_count=v_count_temp;
	
	Comparador #(10) c1(10'b0000000010,v_count_temp,vga_vs,result1);
	
	Comparador #(10) c2(10'b1000001101,v_count_temp,reset,result2);
	
	
endmodule
