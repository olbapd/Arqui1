module draw #(parameter Width=640, parameter Height = 480)(input logic [9:0] hcount, vcount,
				output logic draw);
	
	always_comb begin		
		if (hcount === 10'bx) begin
			 draw = 0;
		end
		else if(hcount <  10'b0001110000) begin	//112
			 draw =0;
		end
		else if (hcount > 10'b1011110000) begin //752
			 draw = 0;
		end
		else if (hcount > Width+10'b0001110000) begin
			 draw = 0;
		end
		else if (vcount < 10'b0000001101) begin //13
			 draw = 0;
		end
		else if (vcount > 10'b0111101101) begin//493
			 draw = 0;
		end
		else if (vcount > Height+10'b0000001101) begin
			 draw = 0;
		end
		else begin 
			 draw = 1;
		end
	end
	
endmodule