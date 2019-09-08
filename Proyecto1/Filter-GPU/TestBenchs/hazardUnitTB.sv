`timescale 1ns / 1ps
module hazardUnitTB();

    logic [3:0] RA1E;
    logic [3:0] RA2E;
    logic [3:0] WA3M;
    logic [3:0] WA3W;
    logic RegWriteM;
    logic RegWriteW;
    logic [1:0] ForwardAE;
    logic [1:0] ForwardBE;
    logic [3:0] RA1D;
    logic [3:0] RA2D;
    logic [3:0] WA3E;
    logic MemtoRegE;
    logic StallF;
    logic StallD;
    logic FlushE;
	 


	 hazard_unit  hazardunit(RA1E,RA2E,WA3M,WA3W,RegWriteM,RegWriteW,
    ForwardAE,ForwardBE,RA1D,RA2D,WA3E,MemtoRegE,StallF,StallD,FlushE);
	 
	initial begin 

    //Fordwarding 
	 
    RA1E = 4'b0;
    RA2E = 4'b0;
    WA3M = 4'b0;
    WA3W = 4'b0;
    RegWriteM = 1;
    #15; 

    RA1E = 4'b0;
    RA2E = 4'b0;
    WA3M = 4'b0;
    WA3W = 4'b0;
    RegWriteM = 1;
    #15; 

    RA1E = 4'b0;
    RA2E = 4'b0;
    WA3M = 4'b0;
    WA3W = 4'b0;
    RegWriteM = 1;
    #15; 

    RA1E = 4'b0;
    RA2E = 4'b0;
    WA3M = 4'b0;
    WA3W = 4'b0;
    RegWriteM = 1;
    #15; 

    RA1E = 4'b0;
    RA2E = 4'b0;
    WA3M = 4'b0;
    WA3W = 4'b0;
    RegWriteM = 1;
    #15; 
    
    end 

endmodule 