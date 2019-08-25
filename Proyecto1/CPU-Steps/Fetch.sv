module Fetch (
    input logic clk, rst, pcsrc,
    input logic [31:0] wd3,
    output logic [31:0] r15,pc
);