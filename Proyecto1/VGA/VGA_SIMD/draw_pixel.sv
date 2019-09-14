//////////////////////////////////////////////////////////////////////////////////
//
// Developer: David Gomez Vargas (2015028430)
// 
// Create Date:    07:00:00 16/10/2018 
//
// Module Name:    draw_pixel
//
// Description:   This module reads pixels of the vector memory 
//						and send them to the video controller.
//
// Reference:	Own idea.
//////////////////////////////////////////////////////////////////////////////////

module draw_pixel(
		hcount, 
		vcount,
		clk,
		pixel,
		pixel_r,
		pixel_g,
		pixel_b,
		adr
);
input [9:0] hcount;
input [9:0]  vcount;
input clk;
input [31:0] pixel;
output logic [31:0] adr = 25;
output logic [7:0] pixel_r = 0;
output logic [7:0] pixel_g = 0;
output logic [7:0] pixel_b = 0;
logic [1:0] counter = 0;


always @(posedge clk) begin
	if(hcount < 640 && vcount < 480) begin
		adr = 25 + ((vcount * 640 + hcount + 3) >>  2);
		
		if(hcount == 0 && vcount == 0) begin
			counter = 0;
		end
		counter = counter + 1;
		case (counter)
		  2'b00 : 
		  begin
			pixel_r <= pixel[31:24];
			pixel_g <= pixel[31:24];
			pixel_b <= pixel[31:24];
		  end
		  2'b01 : 
		  begin
			pixel_r <= pixel[23:16];
			pixel_g <= pixel[23:16];
			pixel_b <= pixel[23:16];
			
		  end
		  2'b10 : 
		  begin
			pixel_r <= pixel[15:8];
			pixel_g <= pixel[15:8];
			pixel_b <= pixel[15:8];
		  end
		  2'b11 : 
		  begin
			pixel_r <= pixel[7:0];
			pixel_g <= pixel[7:0];
			pixel_b <= pixel[7:0];
		  end
		endcase
	end else begin
		pixel_r <= 7'b00;
		pixel_g <= 7'h00;
		pixel_b <= 7'h00;
	end
	
end
endmodule