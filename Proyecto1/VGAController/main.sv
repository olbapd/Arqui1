module main(input logic clk,
			output logic [7:0] VGA_R,VGA_G,VGA_B,
			output logic VGA_SYNC_N, VGA_BLANK_N, VGA_HS, VGA_VS,
			output logic [9:0] H_COUNT,V_COUNT);
	
	logic [7:0] R,G,B;
	assign R=100;
	assign B=200;
	assign G=56;
	

	VGA_Controller controller(clk,R,G,B,VGA_R,VGA_G,VGA_B,VGA_Clock,VGA_SYNC_N,VGA_BLANK_N,VGA_HS,VGA_VS,H_COUNT,V_COUNT);


endmodule 