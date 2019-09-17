//`timescale 1 ps / 1 ns
module system(input logic clk,
              input logic reset,
              output logic vsync,
              output logic hsync,
				  output logic blank,
				  output logic sync,
				  output logic [7:0] r,
				  output logic [7:0] g,
				  output logic [7:0] b,
				  output logic vga_clk);

		
	//logic bounds_draw;
	//logic [9:0] X,Y;
	
	logic [7:0] temp_r,temp_g,temp_b;
	logic [31:0] pixel, vga_addr;
	logic clk_proc;
	
	
	reg t_blank = 1;
	reg t_sync = 0;
	
	
	assign blank=t_blank;
	assign sync = t_sync;
	
	clkDivide clkDivision(clk,reset,vga_clk,clk_proc);
	vga_contollerTest vgaTest (vga_clk,temp_r,temp_g,temp_b,hcount,vcount,vsync,hsync,r,g,b);
	
	draw_pixel Draw(hcount,vcount,vga_clk,pixel,temp_r,temp_g,temp_b,vga_addr);

	//draw  #(640,480)Draw (hcount, vcount, bounds_draw);

	dmem DataMem(~clk_proc,vga_addr,pixel);
	
	//imageDrawer #(640) drawer(clk,bounds_draw,hcount,vcount, color);
	//imem Imem(hcount,vcount,color);
	
	//assign color = 8'b1111111;
	//VGA_Controller vga (color,color,color,r,g,b,hsync,vsync,sync,blank,vga_clk,clk25,reset,hcount,vcount);
	
	


endmodule
