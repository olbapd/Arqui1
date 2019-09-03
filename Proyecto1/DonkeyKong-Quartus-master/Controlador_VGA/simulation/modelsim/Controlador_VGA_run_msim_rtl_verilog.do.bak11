transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Taller/DonkeyKong-Quartus/Controlador_VGA/sprite {C:/Users/Pablo/Documents/1-TEC/Taller/DonkeyKong-Quartus/Controlador_VGA/sprite/dkStandMem.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Taller/DonkeyKong-Quartus/Controlador_VGA {C:/Users/Pablo/Documents/1-TEC/Taller/DonkeyKong-Quartus/Controlador_VGA/dk_pos.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Taller/DonkeyKong-Quartus/Controlador_VGA/testbenches {C:/Users/Pablo/Documents/1-TEC/Taller/DonkeyKong-Quartus/Controlador_VGA/testbenches/dk_tb.sv}

vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Taller/DonkeyKong-Quartus/Controlador_VGA {C:/Users/Pablo/Documents/1-TEC/Taller/DonkeyKong-Quartus/Controlador_VGA/tb_system.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_system

add wave *
view structure
view signals
run -all
