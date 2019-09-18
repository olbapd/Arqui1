module regfileVec (
	input logic clk, reset,
	input logic [1:0] kernel,
	input logic we3,
	input logic [3:0] ra1, ra2, ra3,
	input logic [2:0][17:0]wd3,
	output logic [2:0][17:0] rd1, rd2
    );

// Register Table
logic [2:0][17:0] K1 = '{18'b1,18'b1,18'b1};
logic [2:0][17:0] K2 = '{-1,-1,-1};
logic [2:0][17:0] K3 = '{18'b1,18'b1,18'b1};
logic [2:0][17:0] K4 = '{18'b1,-1,18'b1};
logic [11:0][2:0][17:0] register_table;
logic [15:0][2:0][17:0] fullregister_table;


assign fullregister_table = {K4,K3,K2,K1,register_table};
/*
always_ff @(posedge clk ) begin 
	if(reset) begin
		  register_table[0] <= '{18'b0,18'b0,18'b0};
		  register_table[1] <= '{18'b0,18'b0,18'b0};
		  register_table[2] <= '{18'b0,18'b0,18'b0};
		  register_table[3] <= '{18'b0,18'b0,18'b0};
		  register_table[4] <= '{18'b0,18'b0,18'b0};
		  register_table[5] <= '{18'b0,18'b0,18'b0};
		  register_table[6] <= '{18'b0,18'b0,18'b0};
		  register_table[7] <= '{18'b0,18'b0,18'b0};
		  register_table[8] <= '{18'b0,18'b0,18'b0};
		  register_table[9] <= '{18'b0,18'b0,18'b0};
		  register_table[10] <= '{18'b0,18'b0,18'b0};
		  register_table[11] <= '{18'b0,18'b0,18'b0};
		  register_table[12] <= '{18'b1,18'b1,18'b1};
		  register_table[13] <= '{-1,-1,-1};
		  register_table[14] <= '{18'b1,18'b1,18'b1};
		  register_table[15] <= '{18'b1,-1,18'b1};
	end
	else begin 
		if(we3) register_table[ra3] <= wd3;
	end
end*/

assign rd1 = register_table[ra1];
assign rd2 = register_table[ra2];

always_ff @(negedge clk) begin

	if(we3) register_table[ra3] <= wd3;
end

endmodule

