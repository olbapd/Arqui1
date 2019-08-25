module imem (
    input imem_fetch_t imem_fetch_i,
    output imem_fetch_t imem_fetch_o 
);

logic [31:0] RAM[64:0];

initial

$readmemh("C://",RAM);

assign Instr = RAM[pc[31:2]]; // word aligned

endmodule