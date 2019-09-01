module VGA_Controller(
							//	Host Side
							input logic [7:0] iRed,
							input logic [7:0] iGreen,
							input logic [7:0] iBlue,
							//	VGA Side
							output logic [7:0] oVGA_R,
							output logic [7:0] oVGA_G,
							output logic [7:0] oVGA_B,
							output logic oVGA_H_SYNC,
							output logic oVGA_V_SYNC,
							output logic oVGA_SYNC,
							output logic oVGA_BLANK,
							output logic oVGA_CLK,

							//	Control Signal
							input logic iCLK,
							input logic iRST_N,
							output logic	[9:0] H_Cont,
							output logic	[9:0] V_Cont);

	// Horizontal Parameter

	parameter	H_SYNC_CYC	=	45;         
	parameter	H_SYNC_BACK	=	95;
	parameter	H_SYNC_ACT	=	640;
	parameter	H_SYNC_FRONT=	20;
	parameter	H_SYNC_TOTAL=	800;
	//	Virtical Parameter	
	parameter	V_SYNC_CYC	=	32;
	parameter	V_SYNC_BACK	=	2;
	parameter	V_SYNC_ACT	=	480;
	parameter	V_SYNC_FRONT=	14;
	parameter	V_SYNC_TOTAL=	528;
	//	Start Offset
	parameter	X_START		=	H_SYNC_CYC+H_SYNC_BACK;
	parameter	Y_START		=	V_SYNC_CYC+V_SYNC_BACK;

	logic	[7:0]	mVGA_R;
	logic	[7:0]	mVGA_G;
	logic	[7:0]	mVGA_B;
	/*logic	[7:0]	final_red;
	logic	[7:0]	final_green;
	logic	[7:0]	final_blue;*/
	logic mVGA_H_SYNC;
	logic	mVGA_V_SYNC;
	logic	mVGA_SYNC;
	logic	mVGA_BLANK;

	//	Internal Registers and Wires
	assign oVGA_CLK = iCLK;

	////////////////////////////////////////////////////////

	assign	mVGA_BLANK =	mVGA_H_SYNC & mVGA_V_SYNC;
	assign	mVGA_SYNC	=	1'b0;

	/*assign	mVGA_R	=	(	H_Cont>=X_START 	&& H_Cont<X_START+H_SYNC_ACT &&
							V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
							?	iRed	:	0;
	assign	mVGA_G	=	(	H_Cont>=X_START 	&& H_Cont<X_START+H_SYNC_ACT &&
							V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
							?	iGreen	:	0;
	assign	mVGA_B	=	(	H_Cont>=X_START 	&& H_Cont<X_START+H_SYNC_ACT &&
							V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
							?	iBlue	:	0;*/
								
	assign	mVGA_R	=	(	H_Cont>=150 	&& H_Cont<=662 &&
							V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
							?	iRed	:	0;
							
	assign	mVGA_G	=	(	H_Cont>150 	&& H_Cont<662 &&
							V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
							?	iGreen	:	0;
	assign	mVGA_B	=	(	H_Cont>150 	&& H_Cont<662 &&
							V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
							?	iBlue	:	0;
							
	
	

	//	H_Sync Generator
	always@(posedge iCLK)
	begin	
		if(!iRST_N) //If reset
		begin
			H_Cont		<=	0;
			mVGA_H_SYNC	<=	0;
		end
		else begin
			//	H_Sync Counter
			if( H_Cont < H_SYNC_TOTAL )
				H_Cont<=	H_Cont+1;
			else
				H_Cont<=	0;
			
			//	H_Sync Generator
			if( H_Cont < H_SYNC_CYC )
				mVGA_H_SYNC	<=	0;
			else
				mVGA_H_SYNC	<=	1;
		end
	end
	
	

	//	V_Sync Generator
	always@(posedge iCLK or negedge iRST_N) begin
		if(!iRST_N) //If reset
		begin
			V_Cont		<=	0;
			mVGA_V_SYNC	<=	0;
		end
		else
		begin
			//	When H_Sync Re-start
			if(H_Cont==0)
			begin
				//	V_Sync Counter
				if( V_Cont < V_SYNC_TOTAL )
					V_Cont	<=	V_Cont+1;
				else
					V_Cont	<=	0;
				//	V_Sync Generator
				if(	V_Cont < V_SYNC_CYC )
					mVGA_V_SYNC	<=	0;
				else
					mVGA_V_SYNC	<=	1;
			end
		end
	end
	
	//Width of 32*16
	always@(posedge iCLK or negedge iRST_N)
	begin
		if (!iRST_N) //If I want to reset
			begin
				oVGA_R <= 0;
				oVGA_G <= 0;
				oVGA_B <= 0;
				oVGA_BLANK <= 0;
				oVGA_SYNC <= 0;
				oVGA_H_SYNC <= 0;
				oVGA_V_SYNC <= 0;
			end
		/*else if (H_Cont <150) //If I want to reset
			begin
				oVGA_R <= 8'b00000000;
				oVGA_G <= 8'b00000000;
				oVGA_B <= 8'b00000000;
				oVGA_BLANK <= mVGA_BLANK;
				oVGA_SYNC <= mVGA_SYNC;
				oVGA_H_SYNC <= mVGA_H_SYNC;
				oVGA_V_SYNC <= mVGA_V_SYNC;
			end
		else if (H_Cont >662) 
			begin
				oVGA_R <= 8'b00000000;
				oVGA_G <= 8'b00000000;
				oVGA_B <= 8'b00000000;
				oVGA_BLANK <= mVGA_BLANK;
				oVGA_SYNC <= mVGA_SYNC;
				oVGA_H_SYNC <= mVGA_H_SYNC;
				oVGA_V_SYNC <= mVGA_V_SYNC;
			end*/
		else
			begin
				oVGA_BLANK <= mVGA_BLANK;
				oVGA_SYNC <= mVGA_SYNC;
				oVGA_H_SYNC <= mVGA_H_SYNC;
				oVGA_V_SYNC <= mVGA_V_SYNC;
				
				oVGA_R <= mVGA_R;
				oVGA_G <= mVGA_G;
				oVGA_B <= mVGA_B;
				
			end
	end

endmodule
