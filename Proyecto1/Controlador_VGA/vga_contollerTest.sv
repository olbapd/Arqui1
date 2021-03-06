module vga_contollerTest(
	input logic clk,
	input logic [7:0] final_pixel_r,
	input logic [7:0] final_pixel_g,
	input logic [7:0] final_pixel_b,
	output logic [9:0] hcount,
	output logic [9:0] vcount,
	output logic vsync,
	output logic hsync,
	output logic [7:0] VGA_R,
	output logic [7:0] VGA_G,
	output logic [7:0] VGA_B );
	
	initial hcount = 0;
	initial vcount = 0;
   logic	hblank = 0;
	logic	vblank = 0;
	logic	vs = 1;
	logic	hs = 1;
	logic	hsyncon;
	logic	hsyncoff;
	logic	hreset;
	logic	hblankon;
	logic	next_hblank;
	logic	next_vblank;
	logic [7:0] pixel_r;
	logic [7:0] pixel_g;
	logic [7:0] pixel_b;


	// horizontal: 799 pixels total
	// display 640 pixels per line
	assign hblankon = (hcount == 639);    
	assign hsyncon = (hcount == 655);
	assign hsyncoff = (hcount == 751);
	assign hreset = (hcount == 799);

	// vertical: 523 lines total
	// display 480 lines
	logic vsyncon,vsyncoff,vreset,vblankon;
	assign vblankon = hreset & (vcount == 479);    
	assign vsyncon = hreset & (vcount == 489);
	assign vsyncoff = hreset & (vcount == 491);
	assign vreset = hreset & (vcount == 524);


	// sync and blanking
	assign next_hblank = hreset ? 1'b0 : hblankon ? 1'b1 : hblank;
	assign next_vblank = vreset ? 1'b0 : vblankon ? 1'b1 : vblank;
	
	always @(posedge clk) begin
		hcount <= hreset ? 10'b0 : hcount + 10'b1;
		hblank <= next_hblank;
		hs <= hsyncon ? 1'b0 : hsyncoff ? 1'b1 : hs;  // active low
		vcount <= hreset ? (vreset ? 1'b0 : vcount + 1'b1) : vcount;
		vblank <= next_vblank;
		vs <= vsyncon ? 1'b0 : vsyncoff ? 1'b1 : vs;  // active low
	end


	assign pixel_r = final_pixel_r;
	assign pixel_g = final_pixel_g;
	assign pixel_b = final_pixel_b;
	assign VGA_R = pixel_r;
	assign VGA_G = pixel_g;
	assign VGA_B = pixel_b;
	assign vsync = ~vs;
	assign hsync = ~hs;
		
endmodule
