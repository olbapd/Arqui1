module extendUnit #(parameter N=18)(
	input logic [23:0] immediate,
	output logic [N-1:0] extended [0:2]
	);
	
	
	assign extended[0] = immediate[17:0];
	assign extended[1] = immediate[23:18];
	assign extended[2] = 18'b0;


endmodule 