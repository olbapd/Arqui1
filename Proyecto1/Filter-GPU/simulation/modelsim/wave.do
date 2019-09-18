onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /main_tb/dut/dmem/drawer/clk
add wave -noupdate /main_tb/dut/dmem/drawer/VGA_CLK
add wave -noupdate /main_tb/dut/dmem/drawer/kernel
add wave -noupdate /main_tb/dut/dmem/drawer/bounds_draw
add wave -noupdate /main_tb/dut/dmem/drawer/hcount
add wave -noupdate /main_tb/dut/dmem/drawer/vcount
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/pixel
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/ReadData
add wave -noupdate /main_tb/dut/dmem/drawer/WriteEnable
add wave -noupdate /main_tb/dut/dmem/drawer/writeData
add wave -noupdate /main_tb/dut/dmem/drawer/adreesMem
add wave -noupdate /main_tb/dut/dmem/drawer/addrY
add wave -noupdate /main_tb/dut/dmem/drawer/addrYData
add wave -noupdate /main_tb/dut/dmem/drawer/addrPixel
add wave -noupdate /main_tb/dut/dmem/drawer/addrData
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memPixel1
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memPixel2
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memPixel3
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memPixel4
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memPixel5
add wave -noupdate /main_tb/dut/dmem/drawer/position
add wave -noupdate /main_tb/dut/dmem/drawer/writeEn1
add wave -noupdate /main_tb/dut/dmem/drawer/writeEn2
add wave -noupdate /main_tb/dut/dmem/drawer/writeEn3
add wave -noupdate /main_tb/dut/dmem/drawer/writeEn4
add wave -noupdate /main_tb/dut/dmem/drawer/writeEn5
add wave -noupdate /main_tb/dut/dmem/drawer/memData1
add wave -noupdate /main_tb/dut/dmem/drawer/memData2
add wave -noupdate /main_tb/dut/dmem/drawer/memData3
add wave -noupdate /main_tb/dut/dmem/drawer/memData4
add wave -noupdate /main_tb/dut/dmem/drawer/memData5
add wave -noupdate /main_tb/dut/dmem/drawer/memData1_K
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memPixel1_K
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memData2_K
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memPixel2_K
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memData3_K
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memPixel3_K
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memData4_K
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memPixel4_K
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memData5_K
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memPixel5_K
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {60 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 246
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
WaveRestoreZoom {0 ps} {116 ps}
