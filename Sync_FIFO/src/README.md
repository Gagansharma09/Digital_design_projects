# Synchronous FIFO (RTL)

## Description
Parameterised synchronous FIFO implemented in Verilog with:
- Full / Empty detection
- Separate read and write pointers
- Count-based occupancy tracking

## Features
- Depth: 8 entries (parameterised)
- Data width: 8 bits
- Single clock domain
- Fully self-checking testbench

## Verification
- Reset behavior verified
- Full and empty conditions tested
- Simultaneous read/write supported
- Simulated using Cadence Xcelium

## Files
- `syn_fifo.v` – FIFO RTL
- `tb_sync_fifo.sv` – Self-checking testbench
