transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/Testing {C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/Testing/aluMain_tb.sv}
vlog -sv -work work +incdir+C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/Testing {C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/Testing/aluScalar.sv}
vlog -sv -work work +incdir+C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/Testing {C:/Users/pablo/Documents/1-TEC/Arqui1/Proyecto1/Testing/aluMain.sv}

