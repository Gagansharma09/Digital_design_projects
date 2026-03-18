FSM -EARTHQUAKE DETECTION SYSTEM


OVERVIEW:
---------
This project implements a simple real-time earthquake detection
system using FSM logic. It detects seismic events by identifying
P-wave and S-wave signals and generates an alert based on their
timing difference.

FEATURES:
---------
- P-wave detection (threshold-based)
- S-wave detection (threshold-based)
- FSM-based control logic
- Time difference (delta_t) calculation
- Alert signal generation
- Randomized testbench verification

DESIGN FLOW:
------------
[IDLE] 
   ↓
[MONITOR SIGNAL]
   ↓ (P-wave detected)
[P_DETECT]
   ↓
[WAIT FOR S-WAVE]
   ↓ (S-wave detected)
[S_DETECT]
   ↓
[CALCULATE delta_t]
   ↓
[ALERT]
   ↓
[RESET → MONITOR]

FILES:
------
FSM-based seismic detection logic
Randomized verification testbench

HOW TO RUN:
-----------
open edaplaygorund and run
OUTPUT:
-------
- Console logs for P-wave and S-wave detection
- delta_t calculation results
- ALERT signal on valid seismic event

GOAL:
-----
To demonstrate a basic real-time seismic detection
system with FSM control and verification.

============================================================
