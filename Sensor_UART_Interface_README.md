# Sensor UART Interface

**Author:** Gagan Sharma | IIT Madras — BS Electronic Systems  
**Language:** SystemVerilog  
**Tools:** Xilinx Vivado · EDA Playground  
**Category:** Communication Protocol · RTL Design · Serial Interface

---

## Overview

A complete UART (Universal Asynchronous Receiver/Transmitter) interface for transmitting sensor data over a serial link to a host processor or PC. Implements the standard **8N1 framing** — 8 data bits, no parity, 1 stop bit — with configurable baud rate generation.

This project covers both the **transmitter (TX)** and **receiver (RX)** sides, making it a complete serial communication subsystem.

---

## UART Frame Format (8N1)

```
  IDLE   START    D0   D1   D2   D3   D4   D5   D6   D7   STOP   IDLE
───┐      ┌──┬──┬──┬──┬──┬──┬──┬──┐      ┌──────
   │      │  │  │  │  │  │  │  │  │      │
   └──────┘  └──┴──┴──┴──┴──┴──┴──┘      └──────
  HIGH   LOW       8 Data Bits           HIGH
  (1)    (0)    (LSB first → MSB)         (1)
```

---

## Project Structure

```
Sensor_UART_Interface/
├── src/
│   ├── uart_tx.sv          # UART Transmitter — serializes parallel data
│   ├── uart_rx.sv          # UART Receiver — deserializes serial stream
│   ├── baud_gen.sv         # Baud rate generator (clock divider)
│   └── top.sv              # Top-level wrapper connecting TX, RX, baud gen
├── tb/
│   └── tb_uart.sv          # Testbench: sends sensor packets, verifies RX output
└── sim/
    └── simulation waveforms and logs
```

---

## Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `CLK_FREQ` | 50_000_000 | System clock frequency in Hz |
| `BAUD_RATE` | 115200 | UART baud rate |
| `DATA_BITS` | 8 | Number of data bits per frame |

Change `CLK_FREQ` to match your FPGA board's clock. `BAUD_RATE` can be set to 9600, 19200, 57600, or 115200.

---

## Key I/O Ports

### UART TX
| Port | Direction | Description |
|------|-----------|-------------|
| `clk`, `rst_n` | Input | Clock and active-low reset |
| `tx_data[7:0]` | Input | Parallel byte to transmit |
| `tx_start` | Input | Pulse HIGH to begin transmission |
| `tx_line` | Output | Serial TX output line |
| `tx_busy` | Output | HIGH while transmission is in progress |

### UART RX
| Port | Direction | Description |
|------|-----------|-------------|
| `rx_line` | Input | Serial RX input line |
| `rx_data[7:0]` | Output | Received parallel byte |
| `rx_valid` | Output | Pulses HIGH when a full byte is received |

---

## Concepts Covered

| Concept | Details |
|---------|---------|
| UART Protocol | 8N1 serial framing — start bit, 8 data bits, stop bit |
| Baud Rate Generation | Integer clock division to hit target baud rate |
| TX State Machine | IDLE → START → DATA (8 bits) → STOP → IDLE |
| RX Oversampling | 16× oversampling for robust mid-bit sampling |
| Sensor Packetization | Packing sensor readings into UART byte frames |

---

## How to Simulate

**Vivado:**
1. Add all `src/*.sv` as design sources
2. Add `tb/tb_uart.sv` as simulation source
3. Run Behavioral Simulation
4. Check that `rx_data` matches `tx_data` after each transmission

**EDA Playground:**
1. Paste `top.sv` as design, `tb_uart.sv` as testbench
2. Select SystemVerilog and run

---

## Verification Checklist

- [ ] Single byte transmit and receive matches
- [ ] `tx_busy` stays HIGH for exactly one full frame duration
- [ ] `rx_valid` pulses exactly once per received byte
- [ ] Back-to-back bytes transmit correctly without gaps
- [ ] Reset clears all state correctly

---

## Learning Outcomes

- Full UART TX/RX RTL implementation from scratch
- Baud rate clock generation via parameterized divider
- Serial protocol framing and timing constraints
- Sensor data serialization for host communication
- Oversampling-based receiver design for noise immunity
