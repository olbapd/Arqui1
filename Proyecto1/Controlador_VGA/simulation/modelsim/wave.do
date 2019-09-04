onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_system/SYSTEM/clk
add wave -noupdate /tb_system/SYSTEM/reset
add wave -noupdate /tb_system/SYSTEM/hcount
add wave -noupdate /tb_system/SYSTEM/vcount
add wave -noupdate /tb_system/SYSTEM/r
add wave -noupdate /tb_system/SYSTEM/g
add wave -noupdate /tb_system/SYSTEM/b
add wave -noupdate /tb_system/SYSTEM/ir
add wave -noupdate /tb_system/SYSTEM/ig
add wave -noupdate /tb_system/SYSTEM/ib
add wave -noupdate /tb_system/SYSTEM/bounds_draw
add wave -noupdate /tb_system/SYSTEM/tile_draw
add wave -noupdate /tb_system/SYSTEM/Draw/hcount
add wave -noupdate /tb_system/SYSTEM/Draw/vcount
add wave -noupdate /tb_system/SYSTEM/Draw/draw
add wave -noupdate /tb_system/SYSTEM/Map/clk
add wave -noupdate /tb_system/SYSTEM/Map/hcount
add wave -noupdate /tb_system/SYSTEM/Map/vcount
add wave -noupdate /tb_system/SYSTEM/Map/bounds_draw
add wave -noupdate /tb_system/SYSTEM/Map/tile_draw
add wave -noupdate /tb_system/SYSTEM/Map/is_tileV
add wave -noupdate /tb_system/SYSTEM/Map/x
add wave -noupdate /tb_system/SYSTEM/Map/y
add wave -noupdate /tb_system/SYSTEM/Map/temp_value
add wave -noupdate /tb_system/SYSTEM/mc/bounds_draw
add wave -noupdate /tb_system/SYSTEM/mc/tile_draw
add wave -noupdate /tb_system/SYSTEM/mc/r
add wave -noupdate /tb_system/SYSTEM/mc/g
add wave -noupdate /tb_system/SYSTEM/mc/b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {68 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 233
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
WaveRestoreZoom {0 ps} {848 ps}
