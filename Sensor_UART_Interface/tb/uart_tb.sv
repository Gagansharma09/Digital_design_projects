module tb_uart;

  logic clk = 0;
  always #5 clk = ~clk; // 100MHz

  logic rst_n = 0;
  logic tx_start;
  logic [7:0] tx_data;
  logic tx_busy, tx_done;
  logic tx;
  logic rx = tx;        // loopback
  logic [7:0] rx_data;
  logic rx_valid;

  uart_top dut(
    .clk(clk), .rst_n(rst_n),
    .tx_start(tx_start), .tx_data(tx_data),
    .tx_busy(tx_busy), .tx_done(tx_done),
    .tx(tx), .rx(rx),
    .rx_data(rx_data), .rx_valid(rx_valid)
  );

  initial begin
    rst_n = 0; #50; rst_n = 1;

    tx_data = 8'hA5;
    tx_start = 1; #10; tx_start = 0;

    wait(rx_valid);
    $display("RX = %02h", rx_data);

    #1000 $finish;
  end
endmodule
