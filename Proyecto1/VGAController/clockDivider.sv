module clockDivider #(parameter DIVISOR = 28'd2)
					(input logic inclock,
					output logic outclock);

	logic[27:0] counter=28'd0;

	always @(posedge inclock)
	begin
	 counter <= counter + 28'd1;
	 if(counter>=(DIVISOR-1))
	  counter <= 28'd0;
	end
	
	assign outclock = (counter<DIVISOR/2)?1'b0:1'b1;

endmodule