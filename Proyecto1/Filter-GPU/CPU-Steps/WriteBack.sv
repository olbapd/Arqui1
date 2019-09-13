module WriteBack(
    input logic [2:0] [17:0] ALUOutW, ReadDataW,
    input logic MemtoRegW,
    output logic [2:0] [17:0] ResultW
);
    mux_2to1 mux2to1WB(ALUOutW, ReadDataW, MemtoRegW,ResultW); 
    
endmodule
