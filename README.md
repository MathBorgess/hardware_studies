# Verilog Project

This project is designed to test various logic gates using Verilog. Verilog is a hardware description language used to model electronic systems.

## Getting Started

Download the Icarus, the Verilog compiler and simulator, from [here](https://bleyer.org/icarus/). You will need to install this in order to run the tests.
To run the tests, simply type `./test.sh` in your terminal. This will compile the Verilog code and run the simulation.

## Understanding Verilog

Verilog is a hardware description language used to model electronic systems. It allows designers to describe the behavior of a circuit in a high-level language, which can then be compiled into a low-level representation that can be used to program an FPGA or ASIC.
Futhermore, verilog is an event drive language, so it is important to understand how events work. An event is a change in the value of a signal. For example, if the value of a signal changes from 0 to 1, this is an event. Events are scheduled to occur at a specific time. When the simulation time reaches the time of an event, the event is executed. The event may cause other events to be scheduled. This continues until there are no more events to execute. The simulation time then advances to the time of the next event. This process continues until the simulation is complete. 
Processes can be instacied in two ways: combinational and sequential. Combinational processes are used to describe combinational logic, which is a logic that is dependent only on the current values of the inputs. Sequential processes are used to describe sequential logic, which is a logic that is dependent on the current values of the inputs and the previous values of the inputs.
Sequencial -> Syncronous : var_net <= var_net + 1
Combinational -> Asyncronous : var_net = var_net + 1


## Structure and behavior of modules

A module can have behavior code, which is code that describes the behavior of the module. Example:
```verilog Making a register a, that is updated with a delay of 2 times everytime that b or c changes
assign #2 a = b & c;
```
``` verilog Calling a external module
`include "and_gate.sv"
and_gate and1(.a(a), .b(b), .y(y));
```

## Contributing

If you would like to contribute to this project, please fork the repository and submit a pull request. We welcome contributions of all kinds, including bug fixes, new features, and documentation improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
