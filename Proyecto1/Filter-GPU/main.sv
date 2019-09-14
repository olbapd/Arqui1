module main (input logic clk, reset,
			input logic kernel1, kernel2,kernel3, 
			output logic MemWrite,
			output logic [31:0] DataAdr, WriteData,
			
			//VGA
			output logic vsync,
			output logic hsync,
			output logic blank,
			output logic sync,
			output logic [7:0] r,
			output logic [7:0] g,
			output logic [7:0] b,
			output logic vga_clk);
	//VGA 
	logic clk25 = 0;
	logic [7:0] ir,ig,ib;
	logic [9:0] hcount,vcount;
	logic [32:0] timer;
	
	logic [31:0] PC, Instr, ReadData;
	logic  MemWrite1;
	logic [1:0] kernel;
	
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


	always_ff @(posedge clk) begin
		if(~kernel1) begin
			kernel = 2'b00;
			PC = 0;
		end
		else if (~kernel2) begin
			kernel = 2'b01;
			PC = 0;
		end
		else if (~kernel3) begin
			kernel = 2'b10;
			PC = 0;
		end
		else begin 
			kernel = kernel;
		end
	end

	filtergpu FILTERGPU();


	imem imem(PC,kernel, Instr);

	dmem vectorMemory(clk, MemWrite, DataAdr, WriteData, ReadData);
	
	//Se debe leer de la memoria las posiciones
	
	counter Counter(clk,reset,timer);

	VGA_Controller vga (ir,ig,ib,r,g,b,hsync,vsync,sync,blank,vga_clk,clk25,reset,hcount,vcount);
	

endmodule 