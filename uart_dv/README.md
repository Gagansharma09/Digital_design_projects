# UART Design and Verification and complete rtl to gds using catalyser tool and skywater 130nm pdk

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

                           +----------------------------------------------+
                           |                UART TRANSMITTER              |
                           |                                              |
 clk --------------------->|                                              |
 rst_n ------------------->|                                              |
 data_in[7:0] -----------> |                                              |
 tx_start ---------------> |                                              |
                           |                                              |
                           | +------------------------------+             |
                           | |        State Register        |             |
                           | |      state <= next_state     |             |
                           | +--------------+---------------+             |
                           |                |                             |
                           |                v                             |
                           | +------------------------------+             |
                           | |      Next State Logic        |             |
                           | | IDLE->START->DATA->STOP      |             |
                           | +--------------+---------------+             |
                           |                |                             |
                           |                v                             |
                           | +------------------------------+             |
                           | |       Baud Counter           |             |
                           | | baud_cnt / baud_tick         |             |
                           | +--------------+---------------+             |
                           |                |                             |
                           |          baud_tick                           |
                           |                |                             |
                           |      +---------+----------+                  |
                           |      |                    |                  |
                           |      v                    v                  |
                           | +-----------+      +---------------+         |
                           | | Bit Count |      | Shift Register|         |
                           | | 0→7       |      | Load data_in  |         |
                           | |           |      | Shift Right   |         |
                           | +-----+-----+      +-------+-------+         |
                           |       |                    |                 |
                           |       +---------+----------+                 |
                           |                 |                            |
                           |                 v                            |
                           | +------------------------------+             |
                           | |        TX Output MUX         |             |
                           | |                              |             |
                           | | IDLE  -> 1                  |             |
                           | | START -> 0                  |             |
                           | | DATA  -> shifter[0]         |             |
                           | | STOP  -> 1                  |             |
                           | +--------------+---------------+             |
                           |                |                             |
                           +----------------|-----------------------------+
                                            |
                                            |
                                            v
                                           tx

Outputs
-------
tx_busy = (state != IDLE)

tx_done = (state == STOP && baud_tick)


UART RX (Architecture You Should Build)


                           +----------------------------------------------+
                           |                UART RECEIVER                 |
                           |                                              |
 clk --------------------->|                                              |
 rst_n ------------------->|                                              |
 rx ---------------------->|                                              |
                           |                                              |
                           | +------------------------------+             |
                           | |     Edge Detector            |             |
                           | | previous_rx & current_rx     |             |
                           | | Detect Falling Edge          |             |
                           | +--------------+---------------+             |
                           |                |                             |
                           |                v                             |
                           | +------------------------------+             |
                           | |       State Register         |             |
                           | |      state <= next_state     |             |
                           | +--------------+---------------+             |
                           |                |                             |
                           |                v                             |
                           | +------------------------------+             |
                           | |      Next State Logic        |             |
                           | | IDLE->START->DATA->STOP      |             |
                           | +--------------+---------------+             |
                           |                |                             |
                           |                v                             |
                           | +------------------------------+             |
                           | |      Baud Counter            |             |
                           | | Half Baud + Full Baud        |             |
                           | +--------------+---------------+             |
                           |                |                             |
                           |          baud_tick                           |
                           |                |                             |
                           |      +---------+----------+                  |
                           |      |                    |                  |
                           |      v                    v                  |
                           | +-----------+      +---------------+         |
                           | | Bit Count |      | Shift Register|         |
                           | | 0→7       |      | shifter[bit]  |         |
                           | |           |      | <= rx         |         |
                           | +-----+-----+      +-------+-------+         |
                           |       |                    |                 |
                           |       +---------+----------+                 |
                           |                 |                            |
                           |                 v                            |
                           | +------------------------------+             |
                           | |      Output Register         |             |
                           | | data_out <= shifter          |             |
                           | +--------------+---------------+             |
                           |                |                             |
                           +----------------|-----------------------------+
                                            |
                                            |
                +---------------------------+-------------------------+
                |                           |                         |
                v                           v                         v
           data_out[7:0]                rx_done                  rx_busy
