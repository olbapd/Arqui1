module dk_tb();
					  
	logic clk,reset;
	logic [9:0] hcount, vcount;
	logic [9:0] curr_h, curr_v;
	logic bounds_draw;
	logic [1:0] sprite_selec;
	logic [2:0] dk_draw;
	

	dk_pos dut (hcount,vcount, curr_h, curr_v,sprite_selec,bounds_draw, dk_draw);

			

	initial begin
		clk=0;
		reset=1;
		#25;
		reset=0;
		
		#49 hcount=10'b010010110; vcount=10'b0110000110; curr_h=10'b010010110; curr_v=10'b0110000110; bounds_draw = 1; sprite_selec = 0; 
			assert (dk_draw==3'b000) else begin $display("Error in test 0.");end  //Count: (150,390) Curr: (150,390)
		#49 hcount=10'b010100101; vcount=10'b0110001110; curr_h=10'b010010110; curr_v=10'b0110000110; bounds_draw = 1; sprite_selec = 0; 
			assert (dk_draw==3'b000) else begin $display("Error in test 1.");end  //Count: (165,398) Curr: (150,390)
		#49 hcount=10'b010100101; vcount=10'b0110001111; curr_h=10'b010010110; curr_v=10'b0110000110; bounds_draw = 1; sprite_selec = 0; 
			assert (dk_draw==3'b011) else begin $display("Error in test 2.");end  //Count: (150,399) Curr: (150,390)
		#49 hcount=10'b010110110; vcount=10'b0110000110; curr_h=10'b010010110; curr_v=10'b0110000110; bounds_draw = 1; sprite_selec = 0; 
			assert (dk_draw==3'b000) else begin $display("Error in test 3.");end  //Count: (182,390) Curr: (150,390)
		#49 hcount=10'b010110111; vcount=10'b0110000110; curr_h=10'b010010110; curr_v=10'b0110000110; bounds_draw = 1; sprite_selec = 0; 
			assert (dk_draw==3'b000) else begin $display("Error in test 4.");end  //Count: (183,390) Curr: (150,390)
			
		#49 hcount=10'b011000101; vcount=10'b0110001110; curr_h=10'b010010110; curr_v=10'b0110000110; bounds_draw = 1; sprite_selec = 0; 
			assert (dk_draw==3'b000) else begin $display("Error in test 5.");end  //Count: (197,398) Curr: (150,390)

	end
	always
		#25 clk=~clk; // Codigo para la senal de reloj que cambia cada 5
		initial
		#1600 $stop; // Despues de 150 el testbench se detiene para que no corra infinitamente
endmodule
