module mux_2to1 ( input [2:0][17:0] a,                 
    input [2:0][17:0] b,                                 
    input logic sel,             
    output reg [2:0][17:0] out);         

always @ (a or b or sel) begin
case (sel)
1'b0 : out <= a;
1'b1 : out <= b;
endcase
end
endmodule