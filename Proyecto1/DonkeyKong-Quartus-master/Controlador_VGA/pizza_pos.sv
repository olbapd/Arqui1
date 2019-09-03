module pizza_pos( input logic [9:0] hcount, vcount, curr_h, curr_v,
					   input logic bounds_draw,
						output logic [1:0] pizza_draw);
	
	logic is_tileV,is_tileH;
	logic [9:0] horz,vert,posV,posH;
	logic [1:0] pizza_result;
	
	assign posV=curr_v+31;
	assign posH=curr_h+31;
 	
	assign is_tileV = ((vcount>curr_v &&  vcount<posV ) && bounds_draw) ? 1 : 0; //Posicion de tile de abajo
	assign is_tileH = ((hcount>curr_h && hcount<posH ) && bounds_draw) ? 1 : 0; //Posicion de tile de abajo
	
	assign vert=(vcount-curr_v);//deberia restar curr_v 
	assign horz=(hcount-curr_h); //deberia restar curr_v
	
	pizzaMem Pizza(horz,vert,pizza_result);
	
	
	always_comb begin		
		if (is_tileV==1) begin
			if (is_tileH==1) begin
				pizza_draw  = pizza_result;
			end
			else begin 
				pizza_draw= 2'b00;
			end
		end
		else begin 
			pizza_draw= 2'b00;
		end
	end

endmodule