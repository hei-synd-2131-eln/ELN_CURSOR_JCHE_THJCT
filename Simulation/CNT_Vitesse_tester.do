onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Analog-Step -height 74 -max 1008.0 -radix unsigned /consigne_vitesse_tb/U_0/consigne_vitesse
add wave -noupdate /consigne_vitesse_tb/U_0/clock
add wave -noupdate /consigne_vitesse_tb/U_0/accel
add wave -noupdate /consigne_vitesse_tb/U_0/decel
add wave -noupdate /consigne_vitesse_tb/U_0/pos
add wave -noupdate /consigne_vitesse_tb/U_0/reset
add wave -noupdate /consigne_vitesse_tb/U_0/start_0
add wave -noupdate /consigne_vitesse_tb/U_1/U_6/en_in
add wave -noupdate /consigne_vitesse_tb/U_1/U_6/load
add wave -noupdate /consigne_vitesse_tb/U_1/U_6/reset_fonc
add wave -noupdate /consigne_vitesse_tb/U_1/U_6/up_down
add wave -noupdate -radix unsigned /consigne_vitesse_tb/U_1/U_6/q
add wave -noupdate -radix unsigned /consigne_vitesse_tb/U_1/U_0/q
add wave -noupdate /consigne_vitesse_tb/U_1/U_5/out1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 4} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 310
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
WaveRestoreZoom {0 ps} {338574028 ps}
