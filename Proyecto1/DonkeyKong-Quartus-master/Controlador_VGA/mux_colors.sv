module mux_colors(input logic bounds_draw, tile_draw,
						input logic [1:0] mario_draw, pizza_draw, barril_draw,
						input logic [2:0]	dk_draw,
						output logic [7:0] r,g,b); 
	
	always_latch begin
		//Out of bounds
		if(bounds_draw == 0) begin
			r = 8'b00000000;
			g = 8'b00000000;
			b = 8'b00000000;
		end
		
		//Barril
		else if (barril_draw == 2'b01)begin //Rojo
			r = 8'b10111101;
			g = 8'b00101100;
			b = 8'b00100010;
		end
		else if (barril_draw == 2'b10)begin //Naranja
			r = 8'b11110101;
			g = 8'b01111111;
			b = 8'b00010111;
		end
		else if (barril_draw == 2'b11)begin //Azul 
			r = 8'b00000001;
			g = 8'b01010111;
			b = 8'b10011011;
		end
		
		
		//Mario
		else if (mario_draw == 2'b01)begin //piel
			r = 8'b00000000;
			g = 8'b00010100;
			b = 8'b10101000;
		end
		else if (mario_draw == 2'b10)begin //Azul
			r = 8'b11011111;
			g = 8'b10011111;
			b = 8'b01011011;
		end
		else if (mario_draw == 2'b11)begin //Rojo 
			r = 8'b11101100;
			g = 8'b00000000;
			b = 8'b00000000;
		end
		
		//Pizza
		else if (pizza_draw == 2'b01)begin //Crust
			r = 8'b10000111;
			g = 8'b01001111;
			b = 8'b00100101;
		end
		else if (pizza_draw == 2'b10)begin //Rojo
			r = 8'b11100110;
			g = 8'b00001110;
			b = 8'b00001110;
		end
		else if (pizza_draw == 2'b11)begin //Yellow
			r = 8'b11110011;
			g = 8'b11011011;
			b = 8'b00000101;
		end
		
		//Donkey Kong
		else if (dk_draw == 3'b001)begin //Rojo
			r = 8'b10111101;
			g = 8'b00101100;
			b = 8'b00100010;
		end
		else if (dk_draw == 3'b010)begin //Piel
			r = 8'b11110101;
			g = 8'b11000100;
			b = 8'b10000000;
		end
		else if (dk_draw == 3'b011)begin //Blanco
			r = 8'b11111111;
			g = 8'b11111111;
			b = 8'b11111111;
		end
		else if (dk_draw == 3'b100)begin //Naranja
			r = 8'b11110101;
			g = 8'b01111111;
			b = 8'b00010111;
		end
		else if (dk_draw == 3'b101)begin //Azul 
			r = 8'b00000001;
			g = 8'b01010111;
			b = 8'b10011011;
		end	
		
		//Tile
		else if (tile_draw == 1)begin
			r = 8'b10110000;
			g = 8'b00000111;
			b = 8'b01101111;
		end
		else if (tile_draw == 0)begin
			r = 8'b00000000;
			g = 8'b00000000;
			b = 8'b00000000;
		end
		
		
		
	end
							
endmodule
