onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /main_tb/dut/CLK
add wave -noupdate -radix binary /main_tb/dut/VGA_CLK
add wave -noupdate -radix binary /main_tb/dut/clkProc
add wave -noupdate -radix hexadecimal /main_tb/dut/Instr
add wave -noupdate -radix unsigned -childformat {{{/main_tb/dut/ReadData[2]} -radix unsigned} {{/main_tb/dut/ReadData[1]} -radix unsigned} {{/main_tb/dut/ReadData[0]} -radix unsigned}} -expand -subitemconfig {{/main_tb/dut/ReadData[2]} {-height 15 -radix unsigned} {/main_tb/dut/ReadData[1]} {-height 15 -radix unsigned} {/main_tb/dut/ReadData[0]} {-height 15 -radix unsigned}} /main_tb/dut/ReadData
add wave -noupdate -radix binary /main_tb/dut/MemWrite
add wave -noupdate -radix unsigned /main_tb/dut/A1
add wave -noupdate -radix unsigned /main_tb/dut/A2
add wave -noupdate -radix unsigned /main_tb/dut/A3
add wave -noupdate /main_tb/dut/writeData
add wave -noupdate -radix unsigned /main_tb/dut/dmem/hcount
add wave -noupdate -radix unsigned /main_tb/dut/dmem/vcount
add wave -noupdate -radix unsigned /main_tb/dut/dmem/pixel
add wave -noupdate -radix binary /main_tb/dut/dmem/WriteEnable
add wave -noupdate /main_tb/dut/dmem/writeData
add wave -noupdate -radix unsigned /main_tb/dut/dmem/A1
add wave -noupdate -radix unsigned /main_tb/dut/dmem/A2
add wave -noupdate -radix unsigned /main_tb/dut/dmem/A3
add wave -noupdate /main_tb/dut/dmem/cont
add wave -noupdate -radix unsigned /main_tb/dut/dmem/addressMem
add wave -noupdate -radix unsigned /main_tb/dut/dmem/readData
add wave -noupdate -radix unsigned -childformat {{{/main_tb/dut/dmem/ReadDataVec[2]} -radix unsigned} {{/main_tb/dut/dmem/ReadDataVec[1]} -radix unsigned} {{/main_tb/dut/dmem/ReadDataVec[0]} -radix unsigned}} -subitemconfig {{/main_tb/dut/dmem/ReadDataVec[2]} {-height 15 -radix unsigned} {/main_tb/dut/dmem/ReadDataVec[1]} {-height 15 -radix unsigned} {/main_tb/dut/dmem/ReadDataVec[0]} {-height 15 -radix unsigned}} /main_tb/dut/dmem/ReadDataVec
add wave -noupdate -radix binary /main_tb/dut/dmem/drawer/clk
add wave -noupdate -radix binary /main_tb/dut/dmem/drawer/VGA_CLK
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/ReadData
add wave -noupdate /main_tb/dut/dmem/drawer/WriteEnable
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/writeData
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/adreesMem
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/addrYData
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/addrData
add wave -noupdate -radix binary /main_tb/dut/dmem/drawer/writeEn1
add wave -noupdate -radix binary /main_tb/dut/dmem/drawer/writeEn2
add wave -noupdate -radix binary /main_tb/dut/dmem/drawer/writeEn3
add wave -noupdate -radix binary /main_tb/dut/dmem/drawer/writeEn4
add wave -noupdate -radix binary /main_tb/dut/dmem/drawer/writeEn5
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memData1
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memData2
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memData3
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memData4
add wave -noupdate -radix unsigned /main_tb/dut/dmem/drawer/memData5
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {62 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 263
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
WaveRestoreZoom {43 ps} {103 ps}
