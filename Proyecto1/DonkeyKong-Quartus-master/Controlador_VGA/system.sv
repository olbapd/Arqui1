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

		
	logic clk25 = 0;
	logic [7:0] ir,ig,ib;
	logic [9:0] hcount,vcount, new_h,new_d;
	logic [32:0] timer;
	//Sdram
	logic [15:0] address;
	logic [7:0] data , q;
	logic wren;

	always @(posedge clk) begin
		if(clk == 1'b1)
		begin
			clk25 = ~clk25;
		end
	end


	
	counter Counter(clk,reset,timer);
	
	assign ir = 255;
	assign ig = 0;
	assign ib = 0;
	
	assign address = 0;
	assign wren = 0;
	assign data = 0;
	
	VGA_Controller vga (ir,ig,ib,r,g,b,hsync,vsync,sync,blank,vga_clk,clk25,reset,hcount,vcount);
	
	SDRAMController sdram(address,clk,data,wren,q);

endmodule
