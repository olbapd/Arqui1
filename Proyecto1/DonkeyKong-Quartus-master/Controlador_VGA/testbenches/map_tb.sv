module map_tb();
					  
	logic clk,reset;
	logic [9:0] hcount, vcount;
	logic bounds_draw,tile_draw;

	map dut (hcount,vcount,bounds_draw,tile_draw);


	initial begin
		clk=0;
		reset=1;
		#25;
		reset=0;
		
		#49 hcount=10'b010010110; vcount=10'b0111000010;	 bounds_draw = 1; assert (tile_draw==1) else begin $display("Error in test 0.");end  //(150,450)
		#49 hcount=10'b010100000; vcount=10'b0111000010;	 bounds_draw = 1; assert (tile_draw==1) else begin $display("Error in test 1.");end  //(160,450)
		#49 hcount=10'b011001000; vcount=10'b0111000010;	 bounds_draw = 1; assert (tile_draw==1) else begin $display("Error in test 2.");end  //(200,450)
		#49 hcount=10'b011010000; vcount=10'b0111000010;	 bounds_draw = 1; assert (tile_draw==1) else begin $display("Error in test 3.");end  //(208,450)
		#49 hcount=10'b011111010; vcount=10'b0111000010;	 bounds_draw = 1; assert (tile_draw==1) else begin $display("Error in test 4.");end  //(150,450)
		
		
		#49 hcount=10'b010010110; vcount=10'b0111000100;	 bounds_draw = 1; assert (tile_draw==0) else begin $display("Error in test 5.");end  //(150,452)
		#49 hcount=10'b010100000; vcount=10'b0111000100;	 bounds_draw = 1; assert (tile_draw==0) else begin $display("Error in test 6.");end  //(160,452)
		#49 hcount=10'b010011001; vcount=10'b0111000100;	 bounds_draw = 1; assert (tile_draw==1) else begin $display("Error in test 7.");end  //(153,452)
		#49 hcount=10'b010011010; vcount=10'b0111000100;	 bounds_draw = 1; assert (tile_draw==1) else begin $display("Error in test 8.");end  //(154,452)
		#49 hcount=10'b010011011; vcount=10'b0111000100;	 bounds_draw = 1; assert (tile_draw==1) else begin $display("Error in test 9.");end  //(155,452)

	end
	always
		#25 clk=~clk; // Codigo para la senal de reloj que cambia cada 5
		initial
		#1600 $stop; // Despues de 150 el testbench se detiene para que no corra infinitamente
endmodule
