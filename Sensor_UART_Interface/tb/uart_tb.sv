`timescale 1ns/1ps

module uart_tb;

  logic clk = 0;
  always #5 clk = ~clk;    // 100 MHz clock

  logic rst_n = 0;

  // TX
  logic        tx_start;
  logic [7:0]  tx_data;
  logic        tx_busy;
  logic        tx_done;
  logic        tx;

  // RX
  logic        rx;
  logic [7:0]  rx_data;
  logic        rx_valid;

  assign rx = tx;   // loopback

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

  // wave dump (flat path so EDA Playground won't fail)
  initial begin
    $dumpfile("uart_wave.vcd");
    $dumpvars(0, uart_tb);
  end

  task send(input [7:0] d);
  begin
    @(posedge clk);
    tx_data  = d;
    tx_start = 1;
    @(posedge clk);
    tx_start = 0;
    wait (tx_done);
  end
  endtask

  task wait_for_rx;
    integer c;
  begin
    c = 0;
    while (!rx_valid && c < 200000) begin
      @(posedge clk);
      c++;
    end
    if (!rx_valid) begin
      $display("TIMEOUT: RX did not complete");
      $finish;
    end
  end
  endtask

  initial begin
    $display("---- UART Loopback Test ----");

    rst_n = 0;
    tx_start = 0;
    tx_data = 0;
    #80;
    rst_n = 1;

    send(8'hA5); wait_for_rx(); $display("RX = %0h (expected A5)", rx_data);
    send(8'h3C); wait_for_rx(); $display("RX = %0h (expected 3C)", rx_data);
    send(8'hFF); wait_for_rx(); $display("RX = %0h (expected FF)", rx_data);

    #200;
    $display("---- Test Complete ----");
    $finish;
  end

endmodule



