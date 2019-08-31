transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/ALU-Vectorial {C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/ALU-Vectorial/aluMain.sv}
vlog -sv -work work +incdir+C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/ALU-Vectorial {C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/ALU-Vectorial/aluVectorial.sv}
vlog -sv -work work +incdir+C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/ALU-Vectorial {C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/ALU-Vectorial/aluMain_tb.sv}

