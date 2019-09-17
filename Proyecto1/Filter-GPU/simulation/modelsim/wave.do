onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /main_tb/clk
add wave -noupdate -radix binary /main_tb/dut/CLK
add wave -noupdate /main_tb/dut/VGA_CLK
add wave -noupdate /main_tb/dut/clkProc
add wave -noupdate /main_tb/dut/hcount
add wave -noupdate /main_tb/dut/vcount
add wave -noupdate /main_tb/dut/bounds_draw
add wave -noupdate /main_tb/dut/dmem/CLK
add wave -noupdate -radix binary /main_tb/dut/dmem/VGA_CLK
add wave -noupdate -radix binary /main_tb/dut/dmem/bounds_draw
add wave -noupdate -radix unsigned /main_tb/dut/dmem/hcount
add wave -noupdate -radix unsigned /main_tb/dut/dmem/vcount
add wave -noupdate -radix hexadecimal /main_tb/dut/dmem/pixel
add wave -noupdate /main_tb/dut/dmem/ReadDataVec
add wave -noupdate -radix binary /main_tb/dut/dmem/WriteEnable
add wave -noupdate /main_tb/dut/dmem/writeData
add wave -noupdate /main_tb/dut/dmem/A1
add wave -noupdate /main_tb/dut/dmem/A2
add wave -noupdate /main_tb/dut/dmem/A3
add wave -noupdate /main_tb/dut/dmem/cont
add wave -noupdate /main_tb/dut/dmem/addressMem
add wave -noupdate /main_tb/dut/dmem/readData
add wave -noupdate /main_tb/dut/dmem/color
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 207
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {120 ps}
