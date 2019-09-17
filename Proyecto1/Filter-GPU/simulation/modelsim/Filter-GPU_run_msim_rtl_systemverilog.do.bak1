transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/and-h/Documents/GitHub/Arqui1/Proyecto1/Filter-GPU {C:/Users/and-h/Documents/GitHub/Arqui1/Proyecto1/Filter-GPU/sdram.v}
vlog -sv -work work +incdir+C:/Users/and-h/Documents/GitHub/Arqui1/Proyecto1/Filter-GPU/TestBenchs {C:/Users/and-h/Documents/GitHub/Arqui1/Proyecto1/Filter-GPU/TestBenchs/ramTB.sv}

