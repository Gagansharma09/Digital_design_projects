Sensor Outlier Detection System (RTL, FPGA-Based)

1. Overview

This repository presents a hardware-based multi-sensor outlier detection system implemented entirely at the register-transfer level (RTL) using synthesizable Verilog. The system is designed for real-time embedded applications where sensor data must be continuously monitored and abnormal readings must be detected with deterministic latency, low power consumption, and minimal hardware resources.

Sensor data is acquired using an ESP32 microcontroller, which interfaces with external sensors and streams digitized samples to the FPGA. The FPGA performs real-time statistical processing and outlier detection without storing historical data.

The design is suitable for industrial monitoring, embedded sensing, safety-critical systems, and low-latency anomaly detection applications.



2. Motivation

In practical embedded systems, sensor readings are often affected by noise, drift, aging, interference, or sudden environmental changes. These effects introduce abnormal values (outliers) that can degrade system performance or cause incorrect decisions.

Software-based outlier detection techniques suffer from:
	•	Non-deterministic execution time
	•	Increased latency
	•	Memory overhead due to historical data storage

Learning-based methods (e.g., neural networks) require significant hardware resources, memory, and power, making them unsuitable for small or real-time embedded platforms.

This work addresses these limitations by implementing a lightweight, streaming, hardware-only outlier detection engine using exponential moving average (EMA) statistics.



3. System Architecture

3.1 Data Acquisition
	•	External sensors are connected to an ESP32 microcontroller.
	•	The ESP32 performs sensor interfacing and digitization.
	•	Sensor samples are transmitted from ESP32 to FPGA using a serial interface (e.g., UART/SPI).
	•	The FPGA receives continuous streams of digitized sensor data along with valid signals.

The FPGA does not perform sensor interfacing; it focuses exclusively on deterministic real-time data analysis.



3.2 Processing Pipeline (FPGA)

All processing blocks operate in a single synchronous clock domain to ensure deterministic timing behavior.

The pipeline consists of:
	1.	Sensor sample input
	2.	EMA-based mean estimation
	3.	EMA-based variance estimation
	4.	Adaptive threshold generation
	5.	Outlier decision logic
	6.	Output flag generation

Each sensor channel is processed independently, allowing parallel operation and eliminating cross-channel interference.



4. Outlier Detection Algorithm

The system implements a statistical outlier detection algorithm based on exponential moving averages.

4.1 EMA Mean Estimation

The running mean is updated as:

\mu(n) = \mu(n-1) + \alpha \left[x(n) - \mu(n-1)\right]

where:
	•	x(n) is the current sensor sample
	•	\mu(n) is the updated mean
	•	\alpha = \frac{1}{2^{SHIFT}} is the smoothing factor

The EMA approach allows real-time tracking of the signal’s central tendency without storing past samples.

⸻

4.2 EMA Variance Estimation

The running variance is updated as:

\sigma^2(n) = \sigma^2(n-1) + \alpha \left[(x(n)-\mu(n))^2 - \sigma^2(n-1)\right]

This formulation enables real-time estimation of signal dispersion using fixed-point arithmetic and avoids the need for historical buffers.

⸻

4.3 Adaptive Thresholding

An adaptive threshold is generated using the estimated variance:

T(n) = k \cdot \sigma^2(n)

where k is a programmable sensitivity factor.



4.4 Outlier Decision Rule

A sample is classified as an outlier if:

(x(n) - \mu(n))^2 > T(n)

The decision is registered to produce stable and synchronous output flags.



5. RTL Implementation

The design is implemented using modular, synthesizable Verilog and consists of the following core units:
	•	ema_mean_u: EMA mean estimation
	•	ema_variance_u: Pipelined EMA variance estimation
	•	threshold_gen_u: Adaptive threshold generator
	•	outlier_cmp_u: Outlier comparator

Key design characteristics:
	•	Fully streaming architecture
	•	No block RAM usage
	•	Fixed-point arithmetic
	•	Shift-based division (hardware efficient)
	•	Deterministic latency



6. Implementation Results

The design was synthesized and analyzed on a Xilinx FPGA platform.

Resource Utilization
	•	LUT usage: 2.88%
	•	DSP usage: 6.06%
	•	BRAM usage: 0%
	•	Registers: Low utilization

Performance
	•	Clock frequency: 100 MHz (timing met)
	•	Worst negative slack: +7.93 ns
	•	Latency: One sample per cycle (streaming)

Power
	•	Total power consumption: 0.124 W

These results demonstrate that the proposed architecture achieves reliable outlier detection with very low hardware and power overhead.


7. Verification

Functional verification was performed using cycle-accurate RTL simulation.
	•	Normal sensor inputs result in stable mean and variance tracking.
	•	Injected abnormal samples produce immediate outlier flags.
	•	Output signals are free of glitches and timing uncertainty.

The design behaves deterministically under all tested conditions.

8. Applications

The proposed system is suitable for:
	•	Industrial condition monitoring
	•	Embedded and IoT sensor platforms
	•	Safety-critical monitoring systems
	•	Real-time anomaly detection in resource-constrained devices

