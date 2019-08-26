
// Fetch - Decode Pipeline Register Data
typedef struct packed {
    logic PCSrc;                        // Branch
	logic[31:0] Instruction;			// Raw instruction data
	logic [31:0] PC;					// Program counter
    logic [31:0] WD3;                   // Write Data

} fetch_decode_t;

// Decode - Execute Pipeline Register Data
typedef struct packed {
	//Main pipe
	logic 				PCSrc; 				//If branch 
	logic 				RegWrite; 			//Indicates if it's instruction that will store value in register when completed
	logic 				MemToReg; 			//Indicates if value of alu is address, in other words if its a read from memory the final result
	logic 				MemWrite; 			//Indicates if it's an instruction with memory writing
	operation_t 	ExeControl;			//Selection for the execution unit operation
	logic					Branch; 				//Indicates whether or not instruction is a branch
	operand_type_t 	ExeSrc; 				//Selects between Forward/Register source or immediate for input B
	operand_type_t 	ExeSrc2; 			//Selects between Forward/Register source or immediate for input A
	flags_t 	FlagsCondition; 	//Tells the control unit the condition flags, saved from previous result

	logic [23:0] 		immediate;			//Immediate1 with 14 bits
	logic [31:0] PC;					//Program counter
	
	
	//Forward and stall
	logic [31:0]		R1_data;	//Data from first lecture from register file
	logic [31:0] 		R2_data; 	//Data from second register lecture from register file

	logic [3:0] 		Rd_addr;	//Address of destination register if RegWrite
	logic [3:0] 		R1_addr;	//Address of first register read
	logic [3:0]			R2_addr;	//Address of second register read


} decode_execute_t;