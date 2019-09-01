module imem (input logic [31:0] PC,
			input logic [1:0] kernel,
    		output logic [31:0] Instr );

	logic [31:0] RAM[64:0];

	initial
	case(kernel)
		2'b00: $readmemh("C://",RAM);
		2'b01: $readmemh("C://",RAM);
		2'b10: $readmemh("C://",RAM); 
		default: $readmemh("C://",RAM);
	
	//$readmemh("C://",RAM);

	assign Instr = RAM[PC[17:2]]; 

endmodule