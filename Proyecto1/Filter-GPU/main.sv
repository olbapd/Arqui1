module main (input logic CLK, reset,
			input logic kernel1, kernel2,kernel3,
			input logic identity, 
			//output logic MemWrite,
			//output logic [31:0] DataAdr, WriteData,
			
			//VGA
			output logic vsync,
			output logic hsync,
			output logic blank,
			output logic sync,
			output logic [7:0] r,
			output logic [7:0] g,
			output logic [7:0] b,
			output logic VGA_CLK);
	//VGA 
	logic clkProc;
	logic [9:0] hcount,vcount;
	logic bounds_draw;
	
	logic [31:0] PC;
	logic [27:0] Instr;
	logic [2:0][17:0] ReadData;
	logic  MemWrite;
	logic [1:0] kernel;
	logic [18:0] A1,A2,A3;
	logic [2:0][17:0] writeData;
	logic [7:0] color;

	assign blank = 1;
	assign sync = 0;
	
	clkDivide vgaclk(CLK,~reset,VGA_CLK,clkProc);
	
	draw  Draw (VGA_CLK,hcount, vcount, bounds_draw);
	
	//Verifica el tipo de kernel a utlizar
	/*always_ff @(posedge clk) begin
		if(~kernel1) begin
			kernel = 2'b00;
			//PC = 0;
		end
		else if (~kernel2) begin
			kernel = 2'b01;
			//PC = 0;
		end
		else if (~kernel3) begin
			kernel = 2'b10;
			//PC = 0;
		end
		else if (kernel==1'bx) begin
			kernel = 2'b00;
			//PC = 0;
		end
		else begin 
			kernel = kernel;
		end
	end*/
	
	
	imem imem(PC,kernel, Instr);

	filterGPU FILTERGPU(clkProc,~reset,Instr,ReadData,PC,MemWrite,writeData,A1,A2,A3);

	//VGA
	
	//this is actually a DataMem
	//imageDrawer  drawer(clk,bounds_draw,hcount,vcount,color,ReadData,MemWrite,writeData,A2);
	//vectorMemory #(640) dmem(clkProc,bounds_draw,hcount,vcount,color,ReadData,MemWrite,writeData,A1,A2,A3);
	
	
	
	vectorMemory dmem (CLK,VGA_CLK,bounds_draw,hcount,vcount,color,ReadData, MemWrite, WriteData, A1,A2,A3);
	
	vga_contollerTest vgaTest (VGA_CLK,color,color,color,hcount,vcount,vsync,hsync,r,g,b);

	
	//Se debe leer de la memoria las posiciones

	//VGA_Controller vga (color,color,color,r,g,b,hsync,vsync,sync,blank,VGA_CLK,clk25,reset,hcount,vcount);
	

endmodule 