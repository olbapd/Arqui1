module displayAreaVerificator(input logic [9:0] H_COUNT, V_COUNT,
							output logic DisplayArea);

	
	logic H_DISPLAY_AREA;
	logic V_DISPLAY_AREA;

	hdisplayareaverificator hdv(H_COUNT,H_DISPLAY_AREA);

	vdisplayareaverificator vdv(V_COUNT,V_DISPLAY_AREA);
	
	and n1(DisplayArea,H_DISPLAY_AREA,V_DISPLAY_AREA);

endmodule
