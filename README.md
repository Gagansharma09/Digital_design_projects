Digital Design Projects (Verilog / SystemVerilog)

This repository contains a curated collection of RTL design and verification projects implemented using Verilog and SystemVerilog. Each project follows a structured layout with separate folders for design source files, testbench files, and simulation outputs.

The objective of this repository is to demonstrate capability in:
- RTL design
- Testbench development
- Simulation and debugging
- Digital logic and architecture fundamentals

------------------------------------------------------------

Repository Structure

Each project is organized as:

project_name/
│
├── src/      -> RTL design files (.v)
├── tb/       -> SystemVerilog testbench files (.sv)
└── sim/      -> Simulation waveforms and logs

------------------------------------------------------------

Projects Included

1. Full Adder

Description:
Digital full-adder circuit performing bit-wise addition with carry propagation.

Folder:
Full_Adder/

Files:
- src/Full_adder.v
- tb/Full_adder.tb.sv
- sim/FA.simu

Concepts Covered:
- Combinational logic
- Carry operation
- Testbench stimulus and monitoring

------------------------------------------------------------

2. Half Adder

Description:
Basic arithmetic building block producing sum and carry outputs.

Folder:
Half_Adder/

Files:
- src/Hf_adder.v
- tb/Hf_tb.sv
- sim/Hf_tb_simu

Concepts Covered:
- Boolean equations
- Gate-level design
- Basic verification

------------------------------------------------------------

3. Vending Machine Controller (FSM)

Description:
Finite State Machine–based vending machine controller handling coin input and product dispense logic.

Folder:
Vending_Machine/

Files:
- src/Vending_Machine.v
- tb/VM_testbench.sv
- sim/Simulation results

Concepts Covered:
- Mealy/Moore FSM design
- State transition logic
- Scenario-based verification

------------------------------------------------------------

4. FIR Filter Accelerator (AXI4-Based)

Description:
Hardware accelerator implementation of a FIR filter with an AXI4-Lite interface.

Folder:
FIR_Filter_AXI/

Files:
- src/fir_axi_accelerator.v
- tb/
- sim/

Concepts Covered:
- DSP hardware architecture
- Pipelining concepts
- AXI-based RTL integration

Note: Testbench and simulation are work in progress.

------------------------------------------------------------

Simulation and Tools

Simulations are performed using:
- ModelSim / Questa
- Xilinx Vivado Simulator
- EDA Playground (for quick functional checks)

Waveforms and logs are stored inside the respective sim/ directories.

------------------------------------------------------------

Learning Outcomes

This repository demonstrates skills and experience in:
- RTL coding best practices
- Structural and behavioral modeling
- SystemVerilog-based verification
- FSM design and validation
- Digital arithmetic and logic circuits
- Clean and modular project organization

------------------------------------------------------------

Future Enhancements

Planned upcoming additions:
- Multiplier / ALU
- UART transmitter and receiver
- FIFO (synchronous and asynchronous)
- SPI / I2C controller
- Parameterized design variants
- FPGA implementation and timing reports

------------------------------------------------------------
