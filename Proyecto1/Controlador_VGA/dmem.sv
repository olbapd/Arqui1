module dmem(
	input logic clk,
	input logic [31:0] vga_addr,
	output logic [31:0]  pixel);

	logic [31:0] rd;
	sdramtest data_mem (16'b0,vga_addr[15:0],clk,~clk,32'b0,32'b0,0,0,rd,pixel);

endmodule