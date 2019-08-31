module vdisplayareaverificator(input logic [9:0] v_count,
							   output logic v_display_area);
	
	logic [1:0] carrys;
	logic [9:0] result1, result2;
	Comparador #(10) c1(10'b100011,v_count,carrys[0],result1);
	Comparador #(10) c2(v_count,10'b1000000011,carrys[1],result2);
	
	and n1(v_display_area,carrys[0],carrys[1]);
	
endmodule
