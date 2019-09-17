module imageDrawer #(parameter Width=640)(input logic clk,VGA_CLK,
			input logic bounds_draw,
			input logic [9:0] hcount, vcount,
			output logic [7:0] pixel,
			output logic [17:0] ReadData,
			input logic WriteEnable,
			input logic [17:0] writeData,
			input logic [18:0] adreesMem);
	
	logic [2:0] addrY,addrYData;
	logic [15:0] addrPixel,addrData;
	//logic [9:0] horz,vert;
	logic [7:0] memPixel1,memPixel2,memPixel3,memPixel4,memPixel5;
	logic [19:0] position;
	logic writeEn1,writeEn2,writeEn3,writeEn4,writeEn5;
	logic [7:0] memData1,memData2, memData3, memData4, memData5;
	
	/*assign vert=(vcount-10'b0000001101);  //13
	assign horz=(hcount-10'b0001110000);  //112*/
	assign position=((vcount*Width) + hcount);

	//assign address = (vert*10'b1000000000) + horz;
	assign {addrY, addrPixel}= (bounds_draw)? position: 19'b0;
	assign {addrYData, addrData}= (WriteEnable)? adreesMem: 19'b0;
 
	//assign addrY = (horz*10'b111111111) + vert;
	always_ff @(posedge clk ) begin
		if(WriteEnable==1'b1) begin
			case(addrYData)
				3'b000: begin
				 	writeEn1=1'b1;
				 	writeEn2=1'b0;
				 	writeEn3=1'b0;
				 	writeEn4=1'b0;
				 	writeEn5=1'b0;
				end
				3'b001: begin
				 	writeEn1=1'b0;
				 	writeEn2=1'b1;
				 	writeEn3=1'b0;
				 	writeEn4=1'b0;
				 	writeEn5=1'b0;
				end
				3'b010: begin
				 	writeEn1=1'b0;
				 	writeEn2=1'b0;
				 	writeEn3=1'b1;
				 	writeEn4=1'b0;
				 	writeEn5=1'b0;
				end
				3'b011: begin
				 	writeEn1=1'b0;
				 	writeEn2=1'b0;
				 	writeEn3=1'b0;
				 	writeEn4=1'b1;
				 	writeEn5=1'b0;
				end
				3'b100: begin
				 	writeEn1=1'b0;
				 	writeEn2=1'b0;
				 	writeEn3=1'b0;
				 	writeEn4=1'b0;
				 	writeEn5=1'b1;
				end
				default: begin
					writeEn1=1'b0;
				 	writeEn2=1'b0;
				 	writeEn3=1'b0;
				 	writeEn4=1'b0;
				 	writeEn5=1'b0;
				end
			endcase
		end
	end
	
	SDRam1 datamem1 (addrData,addrPixel,clk,VGA_CLK,writeData,8'b0,writeEn1,1'b0,memData1,memPixel1);
	SDRam2 datamem2 (addrData,addrPixel,clk,VGA_CLK,writeData,8'b0,writeEn2,1'b0,memData2,memPixel2);
	SDRam3 datamem3 (addrData,addrPixel,clk,VGA_CLK,writeData,8'b0,writeEn3,1'b0,memData3,memPixel3);
	SDRam4 datamem4 (addrData,addrPixel,clk,VGA_CLK,writeData,8'b0,writeEn4,1'b0,memData4,memPixel4);
	SDRam5 datamem5 (addrData,addrPixel,clk,VGA_CLK,writeData,8'b0,writeEn5,1'b0,memData5,memPixel5);
	
	always_ff@(posedge clk) begin		
		if (bounds_draw == 1'b1) begin
			case(addrY)
				3'b000: pixel = memPixel1;
				3'b001: pixel = memPixel2;
				3'b010: pixel = memPixel3;
				3'b011: pixel = memPixel4;
				3'b100: pixel = memPixel5;
				default: pixel = 8'b0;
			endcase
		end
		else begin 
			pixel = 8'b0;
		end
	end
	
	always_ff@(posedge clk) begin		
		case(addrYData)
			3'b000: ReadData = memData1;
			3'b001: ReadData = memData2;
			3'b010: ReadData = memData3;
			3'b011: ReadData = memData4;
			3'b100: ReadData = memData5;
			default: ReadData = 18'b0;
		endcase
	end
	
	
endmodule