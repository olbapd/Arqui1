module Control_UnitTB();

logic Clock, reset, RegWrite, MemWrite, MemToReg;
logic [1:0] ALUSrc, ImmSrc, RegSrc;
logic [2:0] ALUControl;
logic [27:0] Instr;

  // Clock generator
always
  begin
    #10 Clock = 1;
    #10 Clock = 0;
  end
  
control_unit controlUnitTB (Clock,Instr[17:0], RegWrite, MemWrite, MemToReg, ImmSrc, ALUSrc, RegSrc, ALUControl);

initial begin 
	reset=0;
	//Instr= 28'b0000000000000000010100110011; // ADD
	//Instr= 28'b0000000000000011010100110001; //MUL
	//Instr= 28'b0000000000000100010100110001; //CONV
	Instr= 28'b0000000110001010000000110000; //MOV
	//Instr= 28'b0000000000010001000000110101; //LDR
	//Instr= 28'b0000000000010000000010000010; //STR
end

endmodule
