module Fetch (
    input logic CLK, RST, 
    input fetch_decode_t fetch_decode_i,
    output fetch_decode_t fetch_decode_o
);

logic [31:0] PCPlus4;
logic pcCout1, pcCout2;	
logic [31:0] PCP;

n_bit_register #(32) pc_reg(CLK, RST, PCP, 1'b1, fetch_decode_o.PC);

sumador_nbit #(32) pc_adder1 (fetch_decode_o.PC, 4, 0, pcCout1, PCPlus4);

n_bit_mux #(32, 1) pc_mux ({fetch_decode_i.WD3, PCPlus4}, fetch_decode_i.PCSrc, PCP);

sumador_nbit #(32) pc_adder2 (PCPlus4, 4, 0, pcCout2, fetch_decode_o.R15);

imem imem(fetch_decode_o.PC, fetch_decode_o.Instr);

endmodule