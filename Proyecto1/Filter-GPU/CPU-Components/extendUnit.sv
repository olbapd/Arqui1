module extendUnit #(parameter N=18)(
	input logic [9:0] immediate,
	output logic [2:0][N-1:0] extended 
	);
	
	assign extended[0] = {8'b0,immediate};
	assign extended[1] = 18'b0;
	assign extended[2] = 18'b0;


endmodule 