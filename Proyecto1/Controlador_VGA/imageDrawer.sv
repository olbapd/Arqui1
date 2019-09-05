module imageDrawer(input logic clk, 
			input logic bounds_draw,
			input logic [9:0] hcount, vcount,
			output logic [7:0] pixel);
	
	logic [15:0] address;
	logic [9:0] horz,vert;
	logic [7:0] temp;
	
	assign vert=(vcount-40); 
	assign horz=(hcount-150);
	
	assign address = (vert*10'b111111111) + horz;
	
	SDRAMController sdramController(address,clk,8'b0,1'b0,temp);
	
	always_comb begin		
		if (bounds_draw == 1) begin
			pixel  = temp;
		end
		else begin 
			pixel = 8'b1111110;
		end
	end
	
	
endmodule