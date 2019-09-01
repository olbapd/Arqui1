transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/vsync_generator.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/VGA_Controller.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/vdisplayareaverificator.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/Restador.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/nBitCounter.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/hsync_generator.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/hdisplayareaverificator.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/displayAreaVerificator.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/Comparador.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/clockDivider.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/VGAController/VGA_ControllerTB.sv}

