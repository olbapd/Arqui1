module system(input logic clk,
              input logic reset,
              output logic vsync,
              output logic hsync,
				  output logic blank,
				  output logic sync,
				  output logic [7:0] r,
				  output logic [7:0] g,
				  output logic [7:0] b,
				  output logic vga_clk,
				  input logic in1);

		
	logic clk25 = 0;
	logic [7:0] ir,ig,ib;
	logic [9:0] hcount,vcount;
	logic [32:0] timer;

	always @(posedge clk) begin
		if(clk == 1'b1)
		begin
			clk25 = ~clk25;
		end
	end

	logic clkcolor = 0;

	always @(posedge clk25) begin
		if(clk25 == 1'b1)
		begin
			clkcolor = ~clkcolor;
		end
	end


	
	counter Counter(clk,reset,timer);
	

	VGA_Controller vga (ir,ig,ib,r,g,b,hsync,vsync,sync,blank,vga_clk,clk25,reset,hcount,vcount);


endmodule
