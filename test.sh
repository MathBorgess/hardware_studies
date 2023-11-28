iverilog -o design.vvp ./testbench.sv
vvp design.vvp
sleep 1
gtkwave ./gate_simulation.vcd