module dk_pos( input logic [9:0] hcount, vcount, curr_h, curr_v,
						input logic sprite_selec, 
						input logic bounds_draw,
						output logic [2:0] dk_draw);
	
	logic is_tileV,is_tileH;
	logic [9:0] horz,vert,posV,posH;
	logic [2:0] stand_value, side_value,temp;
	
	assign posV=curr_v+32;
	assign posH=curr_h+64;
 	
	assign is_tileV = ((vcount>curr_v &&  vcount<posV ) && bounds_draw) ? 1 : 0; //Posicion de tile de abajo
	assign is_tileH = ((hcount>curr_h && hcount<posH ) && bounds_draw) ? 1 : 0; //Posicion de tile de abajo
	
	assign vert=(vcount-curr_v);//deberia restar curr_v 
	assign horz=(hcount-curr_h); //deberia restar curr_v
	
	dkStandMem dk(horz,vert,stand_value);
	dkSideMem dkSide(horz,vert,side_value);
	
	
	always_comb begin		
		
		if (sprite_selec == 1'b0)begin
			temp =  stand_value;
		end
		else if (sprite_selec ==  1'b1)begin
			temp  =  side_value;
		end
		else begin
			temp = 3'b000;
		end

	
		if (is_tileV==1) begin
			if (is_tileH==1) begin
				dk_draw  = temp;
			end
			else begin 
				dk_draw = 3'b000;
			end
		end
		else begin 
			dk_draw= 3'b000;
		end
	end

endmodule