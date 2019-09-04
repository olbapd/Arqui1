module draw_tb();
					  
	logic clk,reset;
	logic [9:0] hcount, vcount;
	logic draw;

	draw dut (hcount,vcount,draw);


	initial begin
		clk=0;
		reset=1;
		#25;
		reset=0;
		#49 hcount=10'bxxxxxxxxxx;	vcount=10'b0000000000; assert (draw==0) else begin $display("Error Sum in test 1.");end 
		#49 hcount=10'b0000000000;	vcount=10'b0000000000; assert (draw==0) else begin $display("Error Sum in test 2.");end 
		#49 hcount=10'b0000000010;	vcount=10'b0000000000; assert (draw==0) else begin $display("Error Sum in test 3.");end
		#49 hcount=10'b0000000110;	vcount=10'b0000000000; assert (draw==0) else begin $display("Error Sum in test 4.");end 
		#49 hcount=10'b0111110100;	vcount=10'b0000000000; assert (draw==1) else begin $display("Error Sum in test 5.");end 
		#49 hcount=10'b0111110101;	vcount=10'b0000000000; assert (draw==1) else begin $display("Error Sum in test 6.");end 
		#49 hcount=10'b1010010101;	vcount=10'b0000000000; assert (draw==1) else begin $display("Error Sum in test 7.");end  
		#49 hcount=10'b1010010110;	vcount=10'b0000000000; assert (draw==0) else begin $display("Error Sum in test 8.");end 
		#49 hcount=10'b1010111100;	vcount=10'b0000000000; assert (draw==0) else begin $display("Error Sum in test 9.");end 
		
	end
	always
		#25 clk=~clk; // Codigo para la senal de reloj que cambia cada 5
		initial
		#1600 $stop; // Despues de 150 el testbench se detiene para que no corra infinitamente
endmodule
