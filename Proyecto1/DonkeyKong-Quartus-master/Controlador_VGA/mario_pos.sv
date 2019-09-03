module mario_pos( input logic [9:0] hcount, vcount, curr_h, curr_v,
						input logic [1:0] sprite_selec,
					   input logic bounds_draw,
						output logic [1:0] mario_draw);
	
	logic is_tileV,is_tileH;
	logic [9:0] horz,vert,posV,posH;
	logic [1:0] stand_value, move_value, jump_value,temp;
	
	assign posV=curr_v+31;
	assign posH=curr_h+31;
 	
	assign is_tileV = ((vcount>curr_v &&  vcount<posV ) && bounds_draw) ? 1 : 0; //Posicion de tile de abajo
	assign is_tileH = ((hcount>curr_h && hcount<posH ) && bounds_draw) ? 1 : 0; //Posicion de tile de abajo
	
	assign vert=(vcount-curr_v);//deberia restar curr_v 
	assign horz=(hcount-curr_h); //deberia restar curr_v
	
	marioMem mario(horz,vert,stand_value);
	marioMoveMem marioMove(horz,vert,move_value);
	marioJumpMem marioJump(horz,vert,jump_value);
	
	always_comb begin		
		
		if (sprite_selec ==  2'b00)begin
			temp = stand_value;
		end
		else if (sprite_selec ==  2'b01)begin
			temp = move_value;
		end
		else if (sprite_selec ==  2'b10)begin
			temp = jump_value;
		end
		else begin
			temp  = 2'b00;
		end
		

	
		if (is_tileV==1) begin
			if (is_tileH==1) begin
				mario_draw  = temp;
			end
			else begin 
				mario_draw= 2'b00;
			end
		end
		else begin 
			mario_draw= 2'b00;
		end
	end

endmodule