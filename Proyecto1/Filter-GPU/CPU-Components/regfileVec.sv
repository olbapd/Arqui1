
module regfileVec (
    input logic clk, 
    input logic we3,
	input logic [3:0] ra1, ra2, ra3,
	input logic [2:0][17:0] wd3,
	output logic [2:0][17:0] rd1, rd2
    );

// Register Table
logic [15:0][2:0][17:0] register_table;
logic [15:0][2:0][17:0] full_register_table;

assign full_register_table = { register_table};

assign rd1 = full_register_table[ra1];
assign rd2 = full_register_table[ra2];

always_ff @(posedge clk) begin

	if(we3) register_table[ra3] <= wd3;
end

endmodule

