module tb_system ();
				  
logic clk;
logic reset;
logic vsync;
logic hsync;
logic blank;
logic sync;
logic [7:0] r;
logic [7:0] g;
logic [7:0] b;
logic vga_clk;
logic in1;


system SYSTEM (clk,reset,vsync,hsync,blank,sync,r,g,b,vga_clk,in1);


initial begin
	clk=0; reset=0;
	#25
	g=8'b11111111;
	r=8'b00000000;
	b=8'b00000000;
	#25
	g=8'b00000000;
	r=8'b11111111;
	b=8'b00000000;
	#25;
	reset=1;
	#25;
	reset=0;
	#52;
end
always
	#40 clk=~clk; // Codigo para la senal de reloj que cambia cada 5
	initial
	#160000000 $stop; // Despues de 150 el testbench se detiene para que no corra infinitamente
endmodule
