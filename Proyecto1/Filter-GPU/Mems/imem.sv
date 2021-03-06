module imem #(parameter N=18) (
			input logic [31:0] PC,
    		output logic [27:0] Instr );
	
	logic [31:0] RAM[100:0];
	
	/*assign temp =(temp==32'bx)? 0 :(PC-4)%(cont*N);
	assign finalPC= (PC>22)? (temp<<2):PC;
	assign cont=(reset)? 0 : (temp==0)? cont : cont+1;*/

initial 
	//$readmemb("C://Users//Pablo//Documents//1-TEC//Arqui1//Proyecto1//Filter-GPU//Mems//memfile.dat",RAM);

	$readmemb("C://Users//Jose Rivera//Arqui1//Proyecto1//Filter-GPU//Mems//memfile.dat",RAM);
		
	assign Instr = RAM[PC[27:2]]; 


endmodule