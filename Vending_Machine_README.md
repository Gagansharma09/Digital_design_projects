# Vending Machine Controller (FSM + UVM)

**Author:** Gagan Sharma | IIT Madras — BS Electronic Systems  
**Language:** SystemVerilog · UVM  
**Tools:** Xilinx Vivado · EDA Playground  
**Category:** FSM Design · Sequential Logic · UVM Verification

---

## Overview

A Finite State Machine (FSM) based vending machine controller implemented in SystemVerilog. The controller accepts coin inputs of different denominations, accumulates the total value, dispenses a product when sufficient credit is reached, and returns change when needed.

The project includes a **UVM (Universal Verification Methodology)** testbench (`UVM.sv`) making it one of the more advanced verification projects in this repository.

---

## State Machine Diagram

```
                    ┌─────────┐
          reset ───►│  IDLE   │◄─────────────────────┐
                    └────┬────┘                       │
                         │ coin inserted              │ no sale /
                         ▼                            │ timeout
                    ┌─────────┐                       │
                    │ COLLECT │──── enough credit? ───┤
                    │  COINS  │         YES           │
                    └────┬────┘                       │
                         │ (keeps accumulating)       │
                         ▼                            │
                    ┌─────────┐                       │
                    │DISPENSE │── product dispensed ──►│
                    └────┬────┘                       │
                         │                            │
                         ▼                            │
                    ┌─────────┐                       │
                    │ RETURN  │── change returned ────►┘
                    │ CHANGE  │
                    └─────────┘
```

---

## Project Structure

```
Vending_Machine/
├── src/
│   ├── Vending_Machine.v     # Original Verilog RTL (behavioral FSM)
│   └── UVM.sv                # Updated SystemVerilog design with UVM integration
├── tb/
│   └── VM_testbench.sv       # Scenario-based testbench
└── sim/
    └── simulation results and waveform logs
```

---

## Supported Coin Denominations

| Input | Value |
|-------|-------|
| `coin_1` | ₹1 / 1 unit |
| `coin_5` | ₹5 / 5 units |
| `coin_10` | ₹10 / 10 units |

*(Exact denomination mapping configurable via parameters)*

---

## I/O Ports

| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| `clk` | Input | 1 | System clock |
| `rst_n` | Input | 1 | Active-low reset |
| `coin_in[1:0]` | Input | 2 | Coin denomination select |
| `select` | Input | 1 | Product selection trigger |
| `dispense` | Output | 1 | Pulses HIGH when product is dispensed |
| `change[7:0]` | Output | 8 | Amount of change to return |
| `credit[7:0]` | Output | 8 | Current accumulated credit |

---

## Concepts Covered

| Concept | Details |
|---------|---------|
| Mealy FSM | Output depends on both current state AND inputs |
| Moore FSM | Output depends only on current state |
| State Encoding | One-hot and binary encoding compared |
| UVM Methodology | Transaction, Sequencer, Driver, Monitor, Scoreboard |
| Scenario Verification | Exact change, overpayment, multiple coins, reset mid-transaction |

---

## UVM Testbench Structure (`UVM.sv`)

```
UVM Test
└── UVM Environment
    ├── UVM Agent
    │   ├── Sequencer   ← generates coin + select sequences
    │   ├── Driver      ← drives DUT inputs cycle-accurately
    │   └── Monitor     ← observes outputs, sends to scoreboard
    └── Scoreboard      ← checks dispense and change correctness
```

---

## How to Simulate

**Vivado (RTL only):**
1. Add `src/Vending_Machine.v` or `UVM.sv` as design source
2. Add `tb/VM_testbench.sv` as simulation source
3. Run Behavioral Simulation

**EDA Playground (UVM):**
1. Select SystemVerilog + UVM library
2. Paste `UVM.sv` as design, `VM_testbench.sv` as testbench
3. Run and check console for transaction logs

---

## Test Scenarios

| Scenario | Expected Behaviour |
|----------|--------------------|
| Exact change inserted | Product dispensed, change = 0 |
| Overpayment | Product dispensed, correct change returned |
| Insufficient credit | Stay in COLLECT state, no dispense |
| Reset mid-transaction | All state cleared, return to IDLE |
| Multiple coin types | Credit accumulates correctly |

---

## Learning Outcomes

- Mealy and Moore FSM design and trade-offs
- One-hot vs binary state encoding
- SystemVerilog FSM behavioral modeling
- Introduction to UVM verification methodology
- Scenario-based and coverage-driven verification
