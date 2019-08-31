transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib sdram
vmap sdram sdram
vlog -vlog01compat -work sdram +incdir+C:/Users/and-h/Documents/GitHub/Arqui1/Proyecto1/Filter-GPU/sdram/synthesis/submodules {C:/Users/and-h/Documents/GitHub/Arqui1/Proyecto1/Filter-GPU/sdram/synthesis/submodules/sdram_sram_0.v}

