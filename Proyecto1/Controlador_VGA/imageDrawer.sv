module imageDrawer #(parameter Width=640)(input logic clk, 
			input logic bounds_draw,
			input logic [9:0] hcount, vcount,
			output logic [7:0] pixel);
	
	logic [2:0] address;
	logic [15:0] index;
	logic [9:0] horz,vert;
	logic [7:0] memResult1,memResult2,memResult3,memResult4;
	logic [31:0] temp;
	
	assign vert=(vcount-10'b0000001101);  //13
	assign horz=(hcount-10'b0001110000);  //112
	assign temp=((vert*Width) + horz);
	//assign address = (vert*10'b1000000000) + horz;
	assign {address, index}= (bounds_draw)? temp: 19'b0;
	//assign address = (horz*10'b111111111) + vert;
	
	datamem1 Datamem1(index,clk,8'b0,1'b0,memResult1);
	datamem2 Datamem2(index,clk,8'b0,1'b0,memResult2);
	datamem3 Datamem3(index,clk,8'b0,1'b0,memResult3);
	datamem4 Datamem4(index,clk,8'b0,1'b0,memResult4);
	
	always_ff@(posedge clk) begin		
		if (bounds_draw == 1'b1) begin
			case(address)
				3'b000: pixel = memResult1;
				3'b001: pixel = memResult2;
				3'b010: pixel = memResult3;
				3'b011: pixel = memResult4;
				default: pixel = 8'b0;
			endcase
		end
		else begin 
			pixel = 8'b0;
		end
	end
	
	
endmodule