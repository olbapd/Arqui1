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
		
	
	logic [31:0] PC, Instr, ReadData;
	logic  MemWrite1;
	logic [1:0] kernel;


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

	system VGA( clk,reset,in1,mario_pos, barril_pos,vsync,hsync,blank,sync,r,g,b,vga_clk);

endmodule 