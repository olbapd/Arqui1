module hdisplayareaverificator(input logic [9:0] h_count,
							output logic h_display_area);
	
	logic [1:0] carrys;
	logic [9:0] result1, result2;

	Comparador #(10) c1(10'b10001111,h_count,carrys[0],result1);
	
	Comparador #(10) c2(h_count,10'h30A,carrys[1],result2);
	
	and n1(h_display_area,carrys[0],carrys[1]);

	
endmodule
