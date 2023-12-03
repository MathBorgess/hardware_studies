iverilog -o design.vvp ./testbench.v
vvp design.vvp
sleep 1
gtkwave ./gate_simulation.vcd