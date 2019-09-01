module filterGPU (input logic clk, reset,
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




endmodule 