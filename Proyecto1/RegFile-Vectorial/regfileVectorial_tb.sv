module regfileVectorial_tb ()
	
	logic clk, reset, WriteEnable;
	logic [3:0] ra1, ra2, WriteAddr;
	logic [17:0] WriteData, r15;
	logic [17:0] rd1, rd2;
	
	regfileVectorial dut(clk, WriteEnable, ra1,ra2,WriteAddr, WriteData,r15, rd1,rd2);

	initial begin
		reset <= 1; #5; reset <=0;
	end
	
	always begin
		clk <=1; #5; clk<=0; #5;
	end
	
	always @(posedge clk)
	begin
		
	end
		
endmodule
