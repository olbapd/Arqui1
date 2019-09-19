onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /main_tb/dut/CLK
add wave -noupdate -radix binary /main_tb/dut/reset
add wave -noupdate -radix binary /main_tb/dut/kernel1
add wave -noupdate -radix binary /main_tb/dut/kernel2
add wave -noupdate -radix binary /main_tb/dut/kernel3
add wave -noupdate -radix binary /main_tb/dut/identity
add wave -noupdate /main_tb/dut/vsync
add wave -noupdate /main_tb/dut/hsync
add wave -noupdate /main_tb/dut/blank
add wave -noupdate /main_tb/dut/sync
add wave -noupdate /main_tb/dut/r
add wave -noupdate /main_tb/dut/g
add wave -noupdate /main_tb/dut/b
add wave -noupdate /main_tb/dut/VGA_CLK
add wave -noupdate /main_tb/dut/clkProc
add wave -noupdate /main_tb/dut/hcount
add wave -noupdate /main_tb/dut/vcount
add wave -noupdate /main_tb/dut/bounds_draw
add wave -noupdate -radix unsigned /main_tb/dut/PC
add wave -noupdate -radix binary /main_tb/dut/imem/reset
add wave -noupdate -radix unsigned /main_tb/dut/imem/PC
add wave -noupdate /main_tb/dut/imem/Instr
add wave -noupdate -radix unsigned /main_tb/dut/imem/cont
add wave -noupdate -radix decimal /main_tb/dut/imem/temp
add wave -noupdate -radix unsigned /main_tb/dut/imem/finalPC
add wave -noupdate /main_tb/dut/imem/useCont
add wave -noupdate -radix hexadecimal /main_tb/dut/Instr
add wave -noupdate /main_tb/dut/ReadData
add wave -noupdate /main_tb/dut/MemWrite
add wave -noupdate /main_tb/dut/kernel
add wave -noupdate /main_tb/dut/A1
add wave -noupdate /main_tb/dut/A2
add wave -noupdate /main_tb/dut/A3
add wave -noupdate /main_tb/dut/writeData
add wave -noupdate /main_tb/dut/color
add wave -noupdate /main_tb/dut/finalPC
add wave -noupdate /main_tb/dut/FILTERGPU/datapath/decode/registerFile/clk
add wave -noupdate /main_tb/dut/FILTERGPU/datapath/decode/registerFile/reset
add wave -noupdate /main_tb/dut/FILTERGPU/datapath/decode/registerFile/kernel
add wave -noupdate -childformat {{{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[15]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[14]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[13]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[12]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[11]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[10]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[9]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[8]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[7]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[6]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[5]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[4]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[3]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[2]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[1]} -radix decimal} {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[0]} -radix decimal}} -expand -subitemconfig {{/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[15]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[14]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[13]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[12]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[11]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[10]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[9]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[8]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[7]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[6]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[5]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[4]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[3]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[2]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[1]} {-height 15 -radix decimal} {/main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table[0]} {-height 15 -radix decimal}} /main_tb/dut/FILTERGPU/datapath/decode/registerFile/fullregister_table
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {427 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 212
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
WaveRestoreZoom {358 ps} {479 ps}
