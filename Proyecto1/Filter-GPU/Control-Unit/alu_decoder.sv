module alu_decoder(ALUOp, Funct, NoWrite, ALUControl, FlagW);

	// Inputs
	input logic ALUOp;
	input logic [5:0] Funct;
	
	// Outputs
	output logic [3:0] ALUControl;
	output logic [1:0] FlagW;
	output logic NoWrite;
	

	logic [6:0] logicOutputs;
	assign {ALUControl, FlagW, NoWrite} = logicOutputs;
	
	logic [6:0] caseCond;
	assign caseCond = {ALUOp, Funct};
	always @(*) begin
		casex (caseCond)
		  7'b0Xxxxxx : begin // NOT DP
				logicOutputs <= 0;
		  end
		  7'b1X01000 : begin // ADD
				logicOutputs <= 0;
		  end
		  7'b1X01001 : begin // ADD
				logicOutputs <= 7'b0000110;
		  end
		  7'b1X00100 : begin // SUB
				logicOutputs <= 7'b0001000;
		  end
		  7'b1X00101 : begin // SUB
				logicOutputs <= 7'b0001110;
		  end
		  7'b1X00000 : begin // AND
				logicOutputs <= 7'b0010000;
		  end
		  7'b1X00001 : begin // AND
				logicOutputs <= 7'b0010100;
		  end
		  7'b1X11000 : begin // ORR
				logicOutputs <= 7'b0011000;
		  end
		  7'b1X11001 : begin // ORR
				logicOutputs <= 7'b0011100;
		  end
		  7'b1X10101 : begin // CMP
				logicOutputs <= 7'b0001111;
		  end
		  7'b1X00010 : begin // XOR => MUL, CAMBIAR
				logicOutputs <= 7'b0101000;
		  end
		  7'b1011010 : begin // LSR
				logicOutputs <= 7'b1001000;
		  end
		  7'b1111010 : begin // MOV pos
				logicOutputs <= 01; // cambiar uno xq era de SrcA
		  end
		  7'b1111110 : begin // MOV neg
				logicOutputs <= 7'b0001000;
		  end
		  7'b1010010 : begin // B
				logicOutputs <= 7'b0111000;
		  end
		  default : begin
		  end
		endcase
	end

endmodule 