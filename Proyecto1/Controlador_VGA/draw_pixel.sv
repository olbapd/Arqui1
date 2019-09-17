module draw_pixel(
		input logic [9:0] hcount, 
		input logic [9:0] vcount,
		input logic clk,
		input logic [31:0] pixel,
		output logic [7:0]pixel_r,
		output logic [7:0]pixel_g,
		output logic [7:0]pixel_b,
		output logic [31:0]adr =0);

	logic [1:0] counter = 0;


	always @(posedge clk) begin
		if(hcount < 640 && vcount < 480) begin
			adr = ((vcount * 640 + hcount) >>  2);
			
			if(hcount == 0 && vcount == 0) begin
				counter = 0;
			end
			counter = counter + 2'b1;
			
			case (counter)
			  2'b00 : begin
				pixel_r <= pixel[31:24];
				pixel_g <= pixel[31:24];
				pixel_b <= pixel[31:24];
			  end
			  2'b01 : begin
				pixel_r <= pixel[23:16];
				pixel_g <= pixel[23:16];
				pixel_b <= pixel[23:16];
			  end
			  2'b10 : begin
				pixel_r <= pixel[15:8];
				pixel_g <= pixel[15:8];
				pixel_b <= pixel[15:8];
			  end
			  2'b11 : begin
				pixel_r <= pixel[7:0];
				pixel_g <= pixel[7:0];
				pixel_b <= pixel[7:0];
			  end
			endcase
		end 
		else begin
			pixel_r <= 8'b11111111;
			pixel_g <= 8'b0;
			pixel_b <= 8'b0;
		end	
	end
endmodule