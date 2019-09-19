onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /main_tb/dut/CLK
add wave -noupdate /main_tb/reset
add wave -noupdate -radix binary /main_tb/dut/VGA_CLK
add wave -noupdate -radix binary /main_tb/dut/clkProc
add wave -noupdate -radix unsigned /main_tb/dut/hcount
add wave -noupdate -radix unsigned /main_tb/dut/vcount
add wave -noupdate -radix hexadecimal /main_tb/dut/Instr
add wave -noupdate /main_tb/dut/ReadData
add wave -noupdate /main_tb/dut/MemWrite
add wave -noupdate /main_tb/dut/writeData
add wave -noupdate -radix binary /main_tb/dut/dmem/CLK
add wave -noupdate -radix binary /main_tb/dut/dmem/VGA_CLK
add wave -noupdate /main_tb/dut/dmem/kernel
add wave -noupdate /main_tb/dut/dmem/bounds_draw
add wave -noupdate -radix unsigned /main_tb/dut/dmem/hcount
add wave -noupdate -radix unsigned /main_tb/dut/dmem/vcount
add wave -noupdate /main_tb/dut/dmem/pixel
add wave -noupdate -radix decimal -childformat {{{/main_tb/dut/dmem/ReadDataVec[2]} -radix decimal} {{/main_tb/dut/dmem/ReadDataVec[1]} -radix decimal} {{/main_tb/dut/dmem/ReadDataVec[0]} -radix decimal}} -subitemconfig {{/main_tb/dut/dmem/ReadDataVec[2]} {-height 15 -radix decimal} {/main_tb/dut/dmem/ReadDataVec[1]} {-height 15 -radix decimal} {/main_tb/dut/dmem/ReadDataVec[0]} {-height 15 -radix decimal}} /main_tb/dut/dmem/ReadDataVec
add wave -noupdate -radix decimal /main_tb/dut/dmem/A1
add wave -noupdate -radix decimal /main_tb/dut/dmem/A2
add wave -noupdate -radix decimal /main_tb/dut/dmem/A3
add wave -noupdate /main_tb/dut/dmem/WriteEnable
add wave -noupdate -radix decimal /main_tb/dut/dmem/writeData
add wave -noupdate /main_tb/dut/dmem/cont
add wave -noupdate -radix decimal /main_tb/dut/dmem/addressMem
add wave -noupdate -radix decimal /main_tb/dut/dmem/readData
add wave -noupdate /main_tb/dut/dmem/color
add wave -noupdate /main_tb/dut/FILTERGPU/datapath/decode/registerFile/clk
add wave -noupdate /main_tb/dut/FILTERGPU/datapath/decode/registerFile/reset
add wave -noupdate -childformat {{{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[15]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[14]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[13]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[12]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[11]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[10]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[9]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[8]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[7]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[6]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[5]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[4]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[3]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[2]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[1]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[0]} -radix decimal}} -expand -subitemconfig {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[15]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[14]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[13]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[12]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[11]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[10]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[9]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[8]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[7]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[6]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[5]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[4]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[3]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[2]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[1]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[0]} {-height 15 -radix decimal}} /main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {148 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 221
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
WaveRestoreZoom {135 ps} {194 ps}
