# Sensor Outlier Detection System

**Author:** Gagan Sharma | IIT Madras — BS Electronic Systems  
**Language:** SystemVerilog  
**Tools:** Xilinx Vivado · EDA Playground  
**Category:** RTL Design · Signal Processing · Anomaly Detection

---

## Overview

An RTL-based real-time sensor outlier detection system. The hardware continuously monitors incoming sensor readings and flags any value that deviates significantly from the expected range — an "outlier" — using configurable upper and lower threshold bounds.

Designed for deployment in safety-critical and industrial monitoring applications where anomalous sensor readings must be identified instantly in hardware, without software overhead.

---

## How It Works

```
Sensor Data Stream (continuous)
        │
        ▼
┌──────────────────────┐
│   Input Register     │  ← Latches each incoming reading
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│  Threshold Comparator│  ← Checks: LOW_THRESH ≤ data ≤ HIGH_THRESH
└──────────┬───────────┘
           │
    ┌──────┴──────┐
    │             │
  NORMAL       OUTLIER → outlier_flag = 1
                          (drives alert, counter, or UART)
```

---

## Project Structure

```
Sensor_Outlier_Detection_system/
├── src/
│   ├── outlier_detector.sv      # Core detection RTL module
│   └── top.sv                   # Top-level wrapper
├── tb/
│   └── tb_sim.sv                # Testbench: normal + outlier stimulus sequences
└── sim/
    └── sim_wave.jpeg            # Simulation waveform screenshot
```

---

## Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `DATA_WIDTH` | 8 | Bit width of sensor input data |
| `HIGH_THRESH` | 200 | Upper bound — values above this are outliers |
| `LOW_THRESH` | 10 | Lower bound — values below this are outliers |

Adjust these at instantiation to match your sensor's operating range.

---

## I/O Ports

| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| `clk` | Input | 1 | System clock |
| `rst_n` | Input | 1 | Active-low synchronous reset |
| `sensor_data` | Input | DATA_WIDTH | Incoming sensor reading |
| `data_valid` | Input | 1 | Indicates valid data on sensor_data |
| `outlier_flag` | Output | 1 | HIGH when current reading is an outlier |
| `outlier_count` | Output | 16 | Running count of detected outliers |

---

## Concepts Covered

| Concept | Details |
|---------|---------|
| Threshold-Based Detection | Dual-bound comparator (upper + lower limit) |
| Parameterized RTL | Data width and thresholds set via parameters |
| Real-Time Monitoring | Processes every valid sensor sample in one clock cycle |
| Outlier Counting | Accumulates outlier events for statistical analysis |
| Synchronous Reset | Clean initialization of all registers |

---

## How to Simulate

**Vivado:**
1. Add `src/*.sv` as design sources
2. Add `tb/tb_sim.sv` as simulation source
3. Run Behavioral Simulation and observe `outlier_flag` and `outlier_count`

**EDA Playground:**
1. Paste design into left panel, testbench into right panel
2. Select SystemVerilog (IEEE 2012) and run

---

## Simulation Results

Waveform screenshot available in `sim/sim_wave.jpeg`.

Key signals to verify:
- `outlier_flag` goes HIGH only when `sensor_data` is outside `[LOW_THRESH, HIGH_THRESH]`
- `outlier_count` increments correctly with each detected outlier
- Normal values pass through without triggering the flag

---

## Learning Outcomes

- RTL design for real-time anomaly detection
- Parameterized comparator design in SystemVerilog
- Hardware-level sensor data validation
- Directed testbench covering normal, boundary, and outlier cases
