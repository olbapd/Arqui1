transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA/SDRAMController.v}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA/VGA_Controller.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA/tb_system.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA/system.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA/imageDrawer.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA/draw.sv}

vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Controlador_VGA/tb_system.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_system

add wave *
view structure
view signals
run -all
