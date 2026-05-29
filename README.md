# Digital Design Projects — Verilog / SystemVerilog

**Author:** Gagan Sharma (`Gagansharma09`)  
**Institute:** IIT Madras — BS Electronic Systems  
**Tools:** Xilinx Vivado · EDA Playground · ModelSim  
**Languages:** Verilog · SystemVerilog

---

## Overview

A curated collection of RTL design and verification projects spanning combinational logic, sequential circuits, FSM design, UART communication, FIFO memory architecture, and FPGA-based sensor systems. Each project follows a consistent structure with separate source, testbench, and simulation directories.

---

## Repository Structure

Every project follows this layout:

```
project_name/
├── src/        # RTL design files (.v / .sv)
├── tb/         # SystemVerilog testbench files (.sv)
└── sim/        # Simulation waveforms, logs, and results
```

---

## Projects

| # | Project | Category | Language | Status |
|---|---------|----------|----------|--------|
| 1 | [Half Adder](#1-half-adder) | Combinational Logic | Verilog | ✅ Complete |
| 2 | [Full Adder](#2-full-adder) | Combinational Logic | Verilog | ✅ Complete |
| 3 | [Vending Machine Controller](#3-vending-machine-controller-fsm) | FSM / Sequential | SystemVerilog | ✅ Complete |
| 4 | [Synchronous FIFO](#4-synchronous-fifo) | Memory Architecture | SystemVerilog | ✅ Complete |
| 5 | [Sensor UART Interface](#5-sensor-uart-interface) | Communication Protocol | SystemVerilog | ✅ Complete |
| 6 | [Sensor Outlier Detection System](#6-sensor-outlier-detection-system) | Signal Processing / RTL | SystemVerilog | ✅ Complete |
| 7 | [FPGA Earthquake Detection](#7-fpga-earthquake-detection) | FPGA / Sensor Fusion | Verilog | ✅ Complete |

---

## 1. Half Adder

**Category:** Combinational Logic  
**Folder:** `Half_Adder/`

A fundamental arithmetic building block that computes the 1-bit binary sum and carry of two input bits.

**Files:**
- `src/Hf_adder.v` — RTL design
- `tb/Hf_tb.sv` — Testbench
- `sim/Hf_tb_simu` — Simulation output

**Concepts:** Boolean logic · Gate-level design · XOR/AND operations · Basic verification

---

## 2. Full Adder

**Category:** Combinational Logic  
**Folder:** `Full_Adder/`

Extends the Half Adder to support a carry-in bit, enabling multi-bit ripple carry addition when cascaded.

**Files:**
- `src/Full_adder.v` — RTL design
- `tb/Full_adder.tb.sv` — Testbench
- `sim/FA.simu` — Simulation output

**Concepts:** Carry propagation · Combinational logic · Testbench stimulus and monitoring

---

## 3. Vending Machine Controller (FSM)

**Category:** Finite State Machine / Sequential Logic  
**Folder:** `Vending_Machine/`

A behavioral FSM-based vending machine controller. Handles coin insertion sequences, accumulates value, dispenses the selected product, and returns change when applicable.

**Files:**
- `src/Vending_Machine.v` / `UVM.sv` — RTL and UVM design
- `tb/VM_testbench.sv` — Scenario-based testbench
- `sim/` — Simulation results and waveforms

**Concepts:** Mealy/Moore FSM · State transition logic · One-hot encoding · UVM methodology · Scenario-based verification

---

## 4. Synchronous FIFO

**Category:** Memory Architecture  
**Folder:** `Sync_FIFO/`

A parameterized synchronous First-In First-Out (FIFO) buffer with configurable depth and data width. Includes full/empty flag logic and overflow/underflow protection.

**Files:**
- `src/` — RTL design (parameterized FIFO)
- `tb/` — SystemVerilog testbench with directed and random tests
- `sim/` — Simulation waveforms and results

**Concepts:** Circular buffer · Read/write pointer management · Full/empty flag generation · Parameterized RTL · Synchronous design

---

## 5. Sensor UART Interface

**Category:** Communication Protocol  
**Folder:** `Sensor_UART_Interface/`

A UART transmitter and receiver module for interfacing a sensor with a host processor over a serial communication link. Implements standard 8N1 UART framing (8 data bits, no parity, 1 stop bit).

**Files:**
- `src/` — UART TX/RX RTL modules
- `tb/` — SystemVerilog testbench
- `sim/` — Waveforms and timing analysis

**Concepts:** UART protocol · Baud rate generation · Serial framing · Clock domain considerations · Sensor data packetization

---

## 6. Sensor Outlier Detection System

**Category:** Signal Processing / RTL  
**Folder:** `Sensor_Outlier_Detection_system/`

An RTL-based system that continuously monitors sensor data and flags anomalous readings (outliers) that exceed a configurable threshold. Designed for real-time hardware deployment.

**Files:**
- `src/` — RTL detection logic
- `tb/` — SystemVerilog testbench with normal and outlier stimulus
- `sim/` — Simulation waveforms

**Concepts:** Threshold-based detection · Real-time data monitoring · Parameterized comparators · Hardware anomaly detection · RTL pipeline

---

## 7. FPGA Earthquake Detection

**Category:** FPGA / Sensor Fusion  
**Folder:** `FPGA_Earthquake_Detection/`

An FPGA-based earthquake detection system that processes accelerometer sensor data in real time. Detects seismic events by analyzing vibration patterns, thresholding acceleration magnitude, and triggering an alert output.

**Files:**
- `src/` — Top-level RTL and detection modules
- `tb/` — Testbench with simulated seismic waveforms
- `sim/` — Simulation results and waveform captures

**Concepts:** FPGA sensor interfacing · Accelerometer data processing · Magnitude thresholding · Alert/interrupt generation · Real-time RTL systems

---

## Simulation Tools

| Tool | Purpose |
|------|---------|
| Xilinx Vivado Simulator | Primary simulation and synthesis |
| EDA Playground | Online simulation for quick tests |
| ModelSim | Waveform analysis and debugging |

---

## Skills Demonstrated

- RTL coding in Verilog and SystemVerilog
- Structural, dataflow, and behavioral modeling
- FSM design (Mealy and Moore)
- SystemVerilog testbench development
- UVM methodology (Vending Machine)
- UART serial communication protocol
- FIFO memory architecture
- FPGA sensor interfacing and real-time processing
- Clean, modular, parameterized design practices

---

## Connect

- **GitHub:** [Gagansharma09](https://github.com/Gagansharma09)
- **Institute:** IIT Madras — BS Electronic Systems
