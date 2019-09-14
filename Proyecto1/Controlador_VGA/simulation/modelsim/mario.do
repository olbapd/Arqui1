onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /mario_tb/dut/hcount
add wave -noupdate -radix decimal /mario_tb/dut/vcount
add wave -noupdate -radix decimal /mario_tb/dut/curr_h
add wave -noupdate -radix decimal /mario_tb/dut/curr_v
add wave -noupdate /mario_tb/dut/mario_draw
add wave -noupdate /mario_tb/dut/sprite_selec
add wave -noupdate /mario_tb/dut/is_tileV
add wave -noupdate /mario_tb/dut/is_tileH
add wave -noupdate -radix decimal /mario_tb/dut/horz
add wave -noupdate -radix decimal /mario_tb/dut/vert
add wave -noupdate -radix decimal /mario_tb/dut/posV
add wave -noupdate -radix decimal /mario_tb/dut/posH
add wave -noupdate /mario_tb/dut/stand_value
add wave -noupdate /mario_tb/dut/move_value
add wave -noupdate /mario_tb/dut/jump_value
add wave -noupdate /mario_tb/dut/temp
add wave -noupdate -radix decimal /mario_tb/dut/mario/horz
add wave -noupdate -radix decimal /mario_tb/dut/mario/vert
add wave -noupdate -radix binary /mario_tb/dut/mario/draw_mario
add wave -noupdate /mario_tb/dut/mario/RAM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {132 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 230
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
WaveRestoreZoom {120 ps} {521 ps}
