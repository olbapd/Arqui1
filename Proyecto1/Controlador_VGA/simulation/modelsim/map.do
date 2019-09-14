onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /map_tb/clk
add wave -noupdate -radix decimal /map_tb/hcount
add wave -noupdate -radix decimal /map_tb/vcount
add wave -noupdate /map_tb/tile_draw
add wave -noupdate -radix decimal /map_tb/dut/hcount
add wave -noupdate -radix decimal /map_tb/dut/vcount
add wave -noupdate /map_tb/dut/tile_draw
add wave -noupdate /map_tb/dut/temp_value
add wave -noupdate -radix decimal /map_tb/dut/barra/horz
add wave -noupdate -radix decimal /map_tb/dut/barra/vert
add wave -noupdate -radix binary /map_tb/dut/barra/draw_tile
add wave -noupdate -radix binary /map_tb/dut/barra/temp
add wave -noupdate -radix binary /map_tb/dut/barra/RAM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {60 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 197
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
WaveRestoreZoom {0 ps} {224 ps}
