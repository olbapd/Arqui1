onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_system/dut/drawer/bounds_draw
add wave -noupdate -radix unsigned /tb_system/dut/drawer/hcount
add wave -noupdate -radix unsigned /tb_system/dut/drawer/vcount
add wave -noupdate -radix hexadecimal /tb_system/dut/drawer/address
add wave -noupdate -radix hexadecimal /tb_system/dut/drawer/index
add wave -noupdate -radix unsigned /tb_system/dut/drawer/horz
add wave -noupdate -radix unsigned /tb_system/dut/drawer/vert
add wave -noupdate -radix unsigned /tb_system/dut/drawer/memResult1
add wave -noupdate -radix hexadecimal /tb_system/dut/drawer/memResult2
add wave -noupdate -radix hexadecimal /tb_system/dut/drawer/memResult3
add wave -noupdate -radix hexadecimal /tb_system/dut/drawer/memResult4
add wave -noupdate /tb_system/dut/drawer/temp
add wave -noupdate -radix unsigned -childformat {{{/tb_system/dut/drawer/pixel[7]} -radix hexadecimal} {{/tb_system/dut/drawer/pixel[6]} -radix hexadecimal} {{/tb_system/dut/drawer/pixel[5]} -radix hexadecimal} {{/tb_system/dut/drawer/pixel[4]} -radix hexadecimal} {{/tb_system/dut/drawer/pixel[3]} -radix hexadecimal} {{/tb_system/dut/drawer/pixel[2]} -radix hexadecimal} {{/tb_system/dut/drawer/pixel[1]} -radix hexadecimal} {{/tb_system/dut/drawer/pixel[0]} -radix hexadecimal}} -subitemconfig {{/tb_system/dut/drawer/pixel[7]} {-height 15 -radix hexadecimal} {/tb_system/dut/drawer/pixel[6]} {-height 15 -radix hexadecimal} {/tb_system/dut/drawer/pixel[5]} {-height 15 -radix hexadecimal} {/tb_system/dut/drawer/pixel[4]} {-height 15 -radix hexadecimal} {/tb_system/dut/drawer/pixel[3]} {-height 15 -radix hexadecimal} {/tb_system/dut/drawer/pixel[2]} {-height 15 -radix hexadecimal} {/tb_system/dut/drawer/pixel[1]} {-height 15 -radix hexadecimal} {/tb_system/dut/drawer/pixel[0]} {-height 15 -radix hexadecimal}} /tb_system/dut/drawer/pixel
add wave -noupdate /tb_system/dut/color
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {77795 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 227
configure wave -valuecolwidth 212
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
WaveRestoreZoom {77769 ps} {77848 ps}
