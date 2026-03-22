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

project_name
1src      -> RTL design files (.v)
2tb       -> SystemVerilog testbench files (.sv)
3sim     -> Simulation waveforms and logs

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

Simulation and Tools

Simulations are performed using:
- Xilinx Vivado Simulator
- EDA Playground 

Waveforms and logs are stored inside the respective sim/ directories.

Learning Outcomes

This repository demonstrates skills and experience in:
- RTL coding best practices
- Structural and behavioral modeling
- SystemVerilog-based verification
- FSM design and validation
- Digital arithmetic and logic circuits
- Clean and modular project organization
