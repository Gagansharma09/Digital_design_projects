# FPGA Earthquake Detection

**Author:** Gagan Sharma | IIT Madras — BS Electronic Systems  
**Language:** Verilog  
**Tools:** Xilinx Vivado · EDA Playground  
**Category:** FPGA · Sensor Processing · Real-Time Systems

---

## Overview

An FPGA-based earthquake detection system that processes accelerometer sensor data in real time. The system continuously monitors vibration magnitude, compares it against a configurable seismic threshold, and triggers an alert output when an earthquake-like event is detected.

This project demonstrates end-to-end RTL design from sensor data ingestion to event detection and output signaling — suitable for deployment on Xilinx FPGA boards.

---

## Block Diagram

```
Accelerometer Input (X, Y, Z axes)
        │
        ▼
┌─────────────────┐
│  Data Sampler   │  ← Samples sensor readings at fixed intervals
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Magnitude Calc  │  ← Computes resultant acceleration magnitude
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Threshold Logic │  ← Compares against configurable seismic threshold
└────────┬────────┘
         │
    ┌────┴────┐
    │         │
  Normal   ALERT → Output signal / LED / UART notification
```

---

## Project Structure

```
FPGA_Earthquake_Detection/
├── src/
│   ├── top.v                  # Top-level module
│   ├── data_sampler.v         # Sensor data sampling logic
│   ├── magnitude_calc.v       # Acceleration magnitude computation
│   └── threshold_detector.v   # Seismic threshold comparison and alert
├── tb/
│   └── tb_earthquake.sv       # Testbench with simulated seismic waveforms
└── sim/
    └── simulation results and waveform captures
```

---

## Key Features

- Real-time accelerometer data processing on FPGA hardware
- Configurable seismic detection threshold (parameterized)
- Three-axis (X, Y, Z) magnitude computation
- Alert output suitable for driving LEDs, buzzers, or UART notification
- Fully synthesizable Verilog RTL

---

## Concepts Covered

| Concept | Details |
|---------|---------|
| FPGA Sensor Interfacing | Reading accelerometer data into RTL logic |
| Magnitude Thresholding | Comparing computed magnitude against a seismic limit |
| Parameterized Design | Threshold and data width configurable via parameters |
| Alert Generation | Output pulse/flag when seismic event is detected |
| Real-Time RTL | Pipelined design suitable for continuous operation |

---

## How to Simulate

**Using Xilinx Vivado:**
1. Create a new project and add all `src/*.v` files as design sources
2. Add `tb/tb_earthquake.sv` as the simulation source
3. Run Behavioral Simulation
4. View waveforms in the Vivado Simulator

**Using EDA Playground:**
1. Paste `src/top.v` into the design panel
2. Paste `tb/tb_earthquake.sv` into the testbench panel
3. Select Icarus Verilog or ModelSim and click Run

---

## Simulation Results

Simulation waveforms are available in the `sim/` directory. Key signals to observe:
- `accel_x`, `accel_y`, `accel_z` — raw sensor inputs
- `magnitude` — computed resultant magnitude
- `alert` — goes HIGH when seismic threshold is exceeded

---

## Learning Outcomes

- FPGA-based real-time sensor data processing
- RTL design for physical sensing applications
- Parameterized threshold detection in hardware
- Testbench design with realistic sensor stimulus
