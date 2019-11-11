transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/SDRam1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/SDRam2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/SDRam3.v}
vlog -vlog01compat -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/SDRam6.v}
vlog -vlog01compat -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/SDRam7.v}
vlog -vlog01compat -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/SDRam8.v}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/main.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/filterGPU.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/DataPath.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/VGA-Controller {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/VGA-Controller/vga_contollerTest.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/VGA-Controller {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/VGA-Controller/imageDrawer.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/VGA-Controller {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/VGA-Controller/draw.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Mems {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Mems/vectorMemory.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Pipeline {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Pipeline/hazard_unit.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Steps {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Steps/WriteBack.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Steps {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Steps/Execute.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Steps {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Steps/Fetch.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Steps {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Steps/Decode.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components/extendUnit.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components/regfileVec.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components/n_bit_register.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components/n_bit_mux.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components/mux_3to1.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/CPU-Components/mux_2to1.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Control-Unit {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Control-Unit/main_decoder.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Control-Unit {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Control-Unit/decoder.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Control-Unit {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Control-Unit/control_unit.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Control-Unit {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Control-Unit/alu_decoder.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Buffers {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Buffers/writebackBuffer.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Buffers {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Buffers/registersBuffer.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Buffers {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Buffers/instructionBuffer.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Buffers {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Buffers/ALUBuffer.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/ALU-Vectorial {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/ALU-Vectorial/aluScalar.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/ALU-Vectorial {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/ALU-Vectorial/aluMain.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/TestBenchs {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/TestBenchs/main_tb.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/clkDivide.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/preImem.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Mems {C:/Users/Pablo/Documents/1-TEC/Arqui1/Proyecto1/Filter-GPU/Mems/imem.sv}
