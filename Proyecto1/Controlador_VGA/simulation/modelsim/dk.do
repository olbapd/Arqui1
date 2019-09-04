onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /dk_tb/dut/hcount
add wave -noupdate -radix decimal /dk_tb/dut/vcount
add wave -noupdate -radix decimal /dk_tb/dut/curr_h
add wave -noupdate -radix decimal /dk_tb/dut/curr_v
add wave -noupdate /dk_tb/dut/sprite_selec
add wave -noupdate /dk_tb/dut/dk_draw
add wave -noupdate /dk_tb/dut/is_tileV
add wave -noupdate /dk_tb/dut/is_tileH
add wave -noupdate -radix decimal /dk_tb/dut/horz
add wave -noupdate -radix decimal /dk_tb/dut/vert
add wave -noupdate -radix decimal /dk_tb/dut/posV
add wave -noupdate -radix decimal /dk_tb/dut/posH
add wave -noupdate /dk_tb/dut/stand_value
add wave -noupdate /dk_tb/dut/side_value
add wave -noupdate /dk_tb/dut/temp
add wave -noupdate -radix decimal /dk_tb/dut/dk/horz
add wave -noupdate -radix decimal /dk_tb/dut/dk/vert
add wave -noupdate /dk_tb/dut/dk/draw_dk
add wave -noupdate /dk_tb/dut/dk/RAM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {131 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 189
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
WaveRestoreZoom {0 ps} {579 ps}
