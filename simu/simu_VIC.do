vlib work
vcom -93 ../src/VIC.vhd
vcom -93 VIC_tb.vhd
vsim -novopt VIC_tb(BENCH)
view signals
add wave *
#lancer la sim
run -all