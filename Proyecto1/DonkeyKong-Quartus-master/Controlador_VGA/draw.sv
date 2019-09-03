module draw(input logic [9:0] hcount, vcount,
				output logic draw);
	
	always_comb begin		
		if (hcount === 10'bx) begin
			 draw = 0;
		end
		else if(hcount < 150) begin	
			 draw =0;
		end
		else if (hcount > 662) begin
			 draw = 0;
		end
		else begin 
			 draw = 1;
		end
	end
	
endmodule
