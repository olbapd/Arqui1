module map(input logic [9:0] hcount, vcount,
			  input logic bounds_draw,
			  output logic tile_draw);
	
	logic is_tileV;
	logic [9:0] horz,vert;
	logic temp_value;
	//assign is_tileV = ((vcount>=450 && vcount<=458) && bounds_draw) ? 1 : 0; //Posicion de tile de abajo
	assign is_tileV = ((vcount>449 && vcount<460) || (vcount>409 && vcount<420) ||
							 (vcount>369 && vcount<380) || (vcount>329 && vcount<340) ||
							 (vcount>289 && vcount<300) || (vcount>249 && vcount<260) && bounds_draw) ? 1 : 0; //Posicion de tile de abajo
	
	assign vert=(vcount-450); 
	assign horz=(hcount-150);
	
	barMem barra(horz,vert,temp_value);
	
	always_comb begin		
		if (is_tileV==1) begin
			tile_draw  = temp_value;
		end
		else begin 
			tile_draw= 0;
		end
	end
endmodule
