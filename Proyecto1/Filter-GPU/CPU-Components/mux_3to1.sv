module mux_3to1 ( input [2:0][17:0] a,                 
    input [2:0][17:0] b,                 
    input [2:0][17:0] c,                
    input [1:0] sel,             
    output logic [2:0][17:0] out);         

always_comb begin
case (sel)
2'b00 : out <= a;
2'b01 : out <= b;
2'b10 : out <= c;
default: out <= 0;
endcase
end

endmodule