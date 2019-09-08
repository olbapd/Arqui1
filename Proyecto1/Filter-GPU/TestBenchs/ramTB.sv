`timescale 1ns / 1ps
module ramTB();

    logic [15:0]address_a = 16'b0;
	logic [15:0]address_b = 16'b0;
	logic clk;
	logic [7:0]data_a = 8'b0;
    logic[7:0] data_b = 8'b0;
    logic wren_a = 1'b0;
    logic wren_b = 1'b0;
	 logic [7:0] q_a;
    logic[7:0] q_b; 

	 
	 
 sdram sdram(address_a,address_b,clk,clk,
				data_a,data_b,wren_a,wren_b,
				q_a,q_b);
	always begin
	    clk <= 1; #5; clk <= 0; #5;
    end
				
				
    initial begin		
		  address_b <= 16'b01;
        address_a <= 16'b10;
        #10;
        
		  address_b <= 16'b00;
        address_a <= 16'b10;
        #10;
    end

   

endmodule