module imem (input logic [31:0] PC,
			input logic [1:0] kernel,
    		output logic [27:0] Instr );

	logic [31:0] RAM[64:0];

initial
	case(kernel)
		2'b00: $readmemh("C://Users//Jose Rivera//Arqui1//Proyecto1//Filter-GPU//Mems//memfile.dat",RAM);
		2'b01: $readmemh("C://Users//Jose Rivera//Arqui1//Proyecto1//Filter-GPU//Mems//memfile.dat",RAM);
		2'b10: $readmemh("C://Users//Jose Rivera//Arqui1//Proyecto1//Filter-GPU//Mems//memfile.dat",RAM); 
		default: $readmemh("C://Users//Jose Rivera//Arqui1//Proyecto1//Filter-GPU//Mems//memfile.dat",RAM);
	
	//$readmemh("C://",RAM);
	endcase
	assign Instr = RAM[PC[27:2]]; 


endmodule