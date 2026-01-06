// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module uart_tb;

  // Clock generation (100 MHz)
  logic clk = 0;
  always #5 clk = ~clk;

  // Reset
  logic rst_n = 0;

  // TX side
  logic        tx_start;
  logic [7:0]  tx_data;
  logic        tx_busy;
  logic        tx_done;
  logic        tx;

  // RX side
  logic        rx;
  logic [7:0]  rx_data;
  logic        rx_valid;

  // Loopback (TX feeds RX)
  assign rx = tx;

  // DUT
  uart_top #(
    .CLK_FREQ (100_000_000),
    .BAUD_RATE(115200)
  ) dut (
    .clk(clk),
    .rst_n(rst_n),

    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx_busy(tx_busy),
    .tx_done(tx_done),
    .tx(tx),

    .rx(rx),
    .rx_data(rx_data),
    .rx_valid(rx_valid)
  );

  // Test sequence
  initial begin
    $display("---- UART Loopback Test Started ----");

    // Reset
    rst_n = 0;
    tx_start = 0;
    tx_data  = 8'h00;
    #100;
    rst_n = 1;

    // Send a byte
    @(posedge clk);
    tx_data  = 8'hA5;
    tx_start = 1;
    @(posedge clk);
    tx_start = 0;

    // Wait for RX to complete
    wait (rx_valid);
    $display("RX Data = 0x%0h  (expected A5)", rx_data);

    #1000;
    $display("---- Test Complete ----");
    $finish;
  end

endmodule
