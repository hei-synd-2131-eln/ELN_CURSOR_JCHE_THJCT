onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pwm_generator_tb/U_0/clock
add wave -noupdate /pwm_generator_tb/U_0/pwm_sig1
add wave -noupdate -format Analog-Step -height 74 -max 170.0 -min 100.0 -radix unsigned /pwm_generator_tb/U_0/consigne_vitesse
add wave -noupdate /pwm_generator_tb/U_0/reset
add wave -noupdate -format Analog-Step -height 74 -max 1023.0000000000001 -radix unsigned /pwm_generator_tb/U_0/val_cont
add wave -noupdate -radix unsigned /pwm_generator_tb/U_0/pwm_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 300
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1000
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {332891909 ps}
