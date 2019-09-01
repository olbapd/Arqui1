module alu_decoder(ALUOp, Funct, NoWrite, ALUControl, FlagW, SrcA);

	// Inputs
	input logic ALUOp;
	input logic [5:0] Funct;
	
	// Outputs
	output logic [3:0] ALUControl;
	output logic [1:0] FlagW;
	output logic NoWrite, SrcA;
	

	logic [7:0] logicOutputs;
	assign {ALUControl, FlagW, NoWrite, SrcA} = logicOutputs;
	
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
				logicOutputs <= 8'b00001100;
		  end
		  7'b1X00100 : begin // SUB
				logicOutputs <= 8'b00010000;
		  end
		  7'b1X00101 : begin // SUB
				logicOutputs <= 8'b00011100;
		  end
		  7'b1X00000 : begin // AND
				logicOutputs <= 8'b00100000;
		  end
		  7'b1X00001 : begin // AND
				logicOutputs <= 8'b00101000;
		  end
		  7'b1X11000 : begin // ORR
				logicOutputs <= 8'b00110000;
		  end
		  7'b1X11001 : begin // ORR
				logicOutputs <= 8'b00111000;
		  end
		  7'b1X10101 : begin // CMP
				logicOutputs <= 8'b00011110;
		  end
		  7'b1X00010 : begin // XOR => MUL, CAMBIAR
				logicOutputs <= 8'b01010000;
		  end
		  7'b1011010 : begin // LSR
				logicOutputs <= 8'b10010000;
		  end
		  7'b1111010 : begin // MOV pos
				logicOutputs <= 01;
		  end
		  7'b1111110 : begin // MOV neg
				logicOutputs <= 8'b00010001;
		  end
		  7'b1010010 : begin // B
				logicOutputs <= 8'b01110000;
		  end
		  default : begin
		  end
		endcase
	end

endmodule 