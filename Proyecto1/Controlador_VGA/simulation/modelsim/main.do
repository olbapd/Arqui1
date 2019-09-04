onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_system/clk
add wave -noupdate /tb_system/r
add wave -noupdate /tb_system/g
add wave -noupdate /tb_system/b
add wave -noupdate /tb_system/vga_clk
add wave -noupdate /tb_system/SYSTEM/Draw/clk
add wave -noupdate -radix decimal /tb_system/SYSTEM/Draw/hcount
add wave -noupdate -radix decimal /tb_system/SYSTEM/Draw/vcount
add wave -noupdate /tb_system/SYSTEM/Draw/draw
add wave -noupdate /tb_system/SYSTEM/mc/bounds_draw
add wave -noupdate /tb_system/SYSTEM/mc/tile_draw
add wave -noupdate /tb_system/SYSTEM/mc/r
add wave -noupdate /tb_system/SYSTEM/mc/g
add wave -noupdate /tb_system/SYSTEM/mc/b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 245
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
WaveRestoreZoom {0 ps} {714 ps}
