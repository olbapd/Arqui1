module imem (
    input logic [17:0] PC,
    output logic [31:0] Instr );

logic [31:0] RAM[64:0];

initial

$readmemh("C://",RAM);

assign Instr = RAM[PC[17:2]];               // word aligned

endmodule