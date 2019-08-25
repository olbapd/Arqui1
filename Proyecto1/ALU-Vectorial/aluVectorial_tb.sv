module aluVectorial_tb();
	
	logic clk,reset;
	logic [2:0][17:0] A, B, Result;
	logic [2:0] Operation;
	logic [3:0] Flags; //Overflow,carry,zero,negative
	

	// instantiate device to be tested
	aluVectorial dut(A, B, Operation, Result, Flags);

	initial begin
		A[0]=0; A[1]=0; A[2]=0;
		B[0]=0; B[1]=0; B[2]=0;
		Operation = 0;
		reset <= 1; #22; reset <=0;
	end
	
	always begin
		clk <=1; #5; clk<=0; #5;
	end
	
	always @(posedge clk)
	begin
		A[0]=0; A[1]=0; A[2]=0;
		B[0]=0; B[1]=0; B[2]=0;
		Operation = 0;
		if(Result==0) begin
			
				$display("Simulation succeeded");
				$stop;
		end 
		else begin 
				$display("Simulation failed");
				$stop;
			
		end
	end
	// initialize test
	/*initial begin
		clk=0;
		reset=1;
		#25;
		reset=0;
		
		A[0] = 17'b1; B[0] = 17'h1; Operation = 17'b00;
		//aluVectorial dut(A, B, Operation, Result, Flags);
		assert (Result == 32'd2) $display (" 1+1 equals 2");
		
	end
	
	always begin
	
		#25 clk=~clk; // Codigo para la senal de reloj que cambia cada 5
		
		#1600 $stop; // Despues de 150 el testbench se detiene para que no corra infinitamente
	end*/
	
endmodule