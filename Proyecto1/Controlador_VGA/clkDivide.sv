module clkDivide(
  		input logic CLK,
		input logic RST,
		output logic VGA_CLK,
		output logic CLK_PROC);

logic int_rst = 1;


always @(posedge CLK or posedge RST)
	if (RST == 1'b1) begin
		VGA_CLK <= 0;
	end else begin
		VGA_CLK <= ~VGA_CLK;
	end

always @(posedge CLK)
	if(int_rst == 1'b1) begin
		int_rst <= 0;
		CLK_PROC <= 0;
	end else begin
		CLK_PROC <= ~CLK_PROC;
	end

   
endmodule