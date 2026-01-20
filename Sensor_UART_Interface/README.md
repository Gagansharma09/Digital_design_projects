## Project Structure

- `src/uart_rx_fpga.v`  
  Synthesizable UART receiver implemented in Verilog for FPGA.

- `src/esp32_uart_tx.c`  
  Embedded C code running on ESP32 to transmit UART data to FPGA.

- `tb/uart_rx_tb.sv`  
  Functional SystemVerilog testbench for UART RX verification.

- `tb/uart_rx_logic_tb.sv`  
  Logic-analyzer-style testbench for waveform-based UART timing analysis.

- `sim/`  
  Simulation artifacts directory.
