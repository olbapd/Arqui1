module extend_module(
    input logic [23:0] immIn, 
    input logic [1:0] immSrc,
    output logic [31:0] extImm
);
	
n_bit_mux #(32,2) mux1({{27'b0, immIn[11:7]}, {immIn[23], immIn[23], immIn[23], immIn[23], immIn[23], immIn[23], immIn, 2'b0}, {20'b0,immIn[11:0]}, {24'b0,immIn[7:0]}}, immSrc, extImm);
	
endmodule 