//////////////////////////////////////////////////////////////////////////////////
// Group: Grupo Maravilla 
//
// Developer: Dennis Porras Barrantes (2015084004)
// 
// Create Date:    02:56:00 12/03/2018 
//
// Module Name:    dmem
//
// Description:    This module is in charge of keep the values of data stored by the procesador 
//					and also of addressing the correct values of data solicited.
// 					We use like a basic reference the code of the book specified in the next point
//
// Reference: 	   Harris, S. L., & Harris, D. M. (2015). Digital design and computer 
// 					architecture. Amsterdam : Elsevier/Morgan Kaufmann.
//
//////////////////////////////////////////////////////////////////////////////////

module dmem(
		input logic clk, we,
		input logic [31:0] a, wd, va,
      input logic [3:0] button,
      input logic [1:0] switch,
		output logic [31:0] rd, pixel
	);

	logic reset = 1;

    logic [31:0] rd_0;
    logic [31:0] rd_1;

    logic [31:0] BTN[5:0];
	
    always_comb begin
        if(a[31:2] < 6)  rd_0 = BTN[a[31:2]];
        else rd_0 = 0;
    end

    always_comb begin
        if(reset) begin
            reset <= 0;
            for(int i = 0; i < 4; i++)
                BTN[i] <= 0;
        end
		  reset <= 0;
        if (button[0]) begin
            BTN[0] <= 1;
        end
        if (button[1]) begin
            BTN[1] <= 1;
        end
        if (button[2]) begin
            BTN[2] <= 1;
        end
        if (button[3]) begin
            BTN[3] <= 1;
        end
        BTN[4] <= {31'b0,switch[0]};
        BTN[5] <= {31'b0,switch[1]};
        if(we) begin
            if(a[31:2] < 4) begin
               BTN[a[31:2]] <= wd; 
            end
        end
	 end
	
	data_memory_dual_clock	data_memory_dual_clock_inst (
	.address_a(a[18:2]),
   .address_b(va[16:0]),
	.clock_a (clk),
	.clock_b (~clk),
	.data_a(wd),
	.data_b(0),
	.wren_a(we),
	.wren_b(0),
	.q_a(rd_1),
	.q_b(pixel)
	);


    mux2#(32) mux_out(
        .s(a[31:2] > 5),
        .d0(rd_0),
        .d1(rd_1),
        .y(rd)
    );
endmodule
`timescale 1ns / 1ps
module dmem_testbench;

    logic clk, we;
    logic [31:0] a, wd;
    logic [3:0] button;
    logic [1:0] switch;
    logic [31:0] rd;

    dmem memory(
        .clk(clk), 
        .we(we),
        .a(a), 
        .wd(wd),
        .button(button),
        .switch(switch),
        .rd(rd)
    );

    initial begin
        //First test
        button <= 4'b0000;
        switch <= 2'b11;
        we <= 0;
        a <= 0;
        wd <= 0;
        #10;

        //Second test
        button <= 4'b0010;
        switch <= 2'b11;
        we <= 0;
        a <= 4;
        wd <= 0;
        #10;

        //Third test
        button <= 4'b0100;
        switch <= 2'b01;
        we <= 0;
        a <= 8;
        wd <= 0;
        #10;

        //Fourth test
        button <= 4'b0000;
        switch <= 2'b01;
        we <= 0;
        a <= 12;
        wd <= 0;
        #10;

        //Fifth test
        button <= 4'b0000;
        switch <= 2'b10;
        we <= 0;
        a <= 16;
        wd <= 0;
        #10;

       //Sixth test
        button <= 4'b0000;
        switch <= 2'b10;
        we <= 0;
        a <= 20;
        wd <= 0;
        #10;

       //Seventh test
        button <= 4'b0000;
        switch <= 2'b10;
        we <= 1;
        a <= 24;
        wd <= 255;
        #10;

      //Seventh test
        button <= 4'b0000;
        switch <= 2'b10;
        we <= 1;
        a <= 28;
        wd <= 128;
        #10;

      //Seventh test
        button <= 4'b0000;
        switch <= 2'b10;
        we <= 1;
        a <= 32;
        wd <= 511;
        #10;

      //Seventh test
        button <= 4'b0000;
        switch <= 2'b10;
        we <= 0;
        a <= 24;
        wd <= 0;
        #10;

      //Seventh test
        button <= 4'b0000;
        switch <= 2'b10;
        we <= 0;
        a <= 28;
        wd <= 0;
        #10;

      //Seventh test
        button <= 4'b0000;
        switch <= 2'b10;
        we <= 0;
        a <= 100;
        wd <= 0;
    end

    always begin
	    clk <= 1; #5; clk <= 0; #5;
    end

endmodule
