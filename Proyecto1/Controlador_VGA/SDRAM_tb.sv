`timescale 1 ps / 1 ps
module SDRAM_tb();
					  
	logic clk;
	logic [9:0] hcount, vcount;
	logic [7:0] pixel;
	logic [15:0] addr;

	SDRAMController dutsd(addr,clk,8'b0,1'b0,pixel);

	imem dut (hcount,vcount,pixel);

			

	initial begin
		clk=0;
		hcount=0;
		vcount=0;
		pixel=0;
		addr=0;
		#25;
		

	end
	always begin
		#15 clk=~clk; // Codigo para la senal de reloj que cambia cada 5
		if(vcount ==256) 
		begin
			vcount = 0;
			hcount=0;
		end
		
		if (hcount==512) 
		begin
			hcount = 0;
			vcount= vcount +1;
		end
		else begin
			hcount = hcount +1;
		end
		addr = (vcount*511) + hcount;
			
	end
		initial
		#1600 $stop; // Despues de 150 el testbench se detiene para que no corra infinitamente
		
endmodule
