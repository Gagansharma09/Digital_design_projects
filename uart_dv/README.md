# UART Design and Verification

SystemVerilog implementation and verification of a UART transmitter developed to study RTL design, finite-state machine architecture, baud-rate timing, self-checking testbenches, and basic SystemVerilog Assertions (SVA).

## Project Status

- UART TX RTL — Complete
- Directed Testbench — Complete
- Protocol-Aware Self-Checking — Complete
- Basic SVA Verification — Complete
- UART RX — Planned
- TX–RX Loopback Verification — Planned

## Design Overview

The UART transmitter implements an 8-bit UART transmission flow using a finite-state machine.

The transmitter sends:

```text
IDLE → START → DATA[0:7] → STOP → IDLE
