onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_system/clk
add wave -noupdate /tb_system/reset
add wave -noupdate /tb_system/r
add wave -noupdate /tb_system/g
add wave -noupdate /tb_system/b
add wave -noupdate /tb_system/vga_clk
add wave -noupdate -radix decimal /tb_system/dut/Draw/hcount
add wave -noupdate -radix decimal /tb_system/dut/Draw/vcount
add wave -noupdate /tb_system/dut/Draw/draw
add wave -noupdate -radix binary /tb_system/dut/drawer/clk
add wave -noupdate -radix binary /tb_system/dut/drawer/bounds_draw
add wave -noupdate -radix decimal /tb_system/dut/drawer/hcount
add wave -noupdate -radix decimal /tb_system/dut/drawer/vcount
add wave -noupdate /tb_system/dut/drawer/pixel
add wave -noupdate -radix decimal /tb_system/dut/drawer/address
add wave -noupdate -radix decimal /tb_system/dut/drawer/horz
add wave -noupdate -radix decimal /tb_system/dut/drawer/vert
add wave -noupdate /tb_system/dut/drawer/temp
add wave -noupdate -radix decimal /tb_system/dut/vga/H_Cont
add wave -noupdate -radix decimal /tb_system/dut/vga/V_Cont
add wave -noupdate /tb_system/dut/color
add wave -noupdate /tb_system/dut/vga/mVGA_R
add wave -noupdate /tb_system/dut/vga/mVGA_G
add wave -noupdate /tb_system/dut/vga/mVGA_B
add wave -noupdate /tb_system/dut/vga/oVGA_R
add wave -noupdate /tb_system/dut/vga/oVGA_G
add wave -noupdate /tb_system/dut/vga/oVGA_B
add wave -noupdate /tb_system/dut/vga/canDraw
add wave -noupdate /tb_system/dut/vga/inH
add wave -noupdate /tb_system/dut/vga/inV
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {86 ps}
