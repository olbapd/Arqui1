module barril_pos( input logic [9:0] hcount, vcount, curr_h, curr_v,
					   input logic bounds_draw,display_barril,
						output logic [1:0] barril_draw);
	
	logic is_tileV,is_tileH;
	logic [9:0] horz,vert,posV,posH;
	logic [1:0] barril_result;
	
	assign posV=curr_v+16;
	assign posH=curr_h+16;
 	
	assign is_tileV = ((vcount>curr_v &&  vcount<posV ) && bounds_draw && display_barril) ? 1 : 0; //Posicion de tile de abajo
	assign is_tileH = ((hcount>curr_h && hcount<posH ) && bounds_draw && display_barril) ? 1 : 0; //Posicion de tile de abajo
	
	assign vert=(vcount-curr_v);//deberia restar curr_v 
	assign horz=(hcount-curr_h); //deberia restar curr_v
	
	barrilMem Barril(horz,vert,barril_result);
	
	
	always_comb begin		
		if (is_tileV==1) begin
			if (is_tileH==1) begin
				barril_draw  = barril_result;
			end
			else begin 
				barril_draw= 2'b00;
			end
		end
		else begin 
			barril_draw= 2'b00;
		end
	end

endmodule