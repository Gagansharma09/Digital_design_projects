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



///logic analiser type tb 

`timescale 1ns / 1ps

module tb_fpga_uart_rx;

    localparam CLK_PERIOD = 10;
    localparam CLK_FREQ = 100_000_000;
    localparam BAUD_RATE = 115_200;
    localparam CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;
    
    reg clk;
    reg rst_n;
    reg uart_rx;
    
    wire led0_r, led0_g, led0_b;
    wire led1_r, led1_g, led1_b;
    
    initial begin
        clk = 1'b0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
    fpga_uart_rx dut (
        .clk(clk),
        .rst_n(rst_n),
        .uart_rx(uart_rx),
        .led0_r(led0_r),
        .led0_g(led0_g),
        .led0_b(led0_b),
        .led1_r(led1_r),
        .led1_g(led1_g),
        .led1_b(led1_b)
    );
    
    task send_uart_byte;
        input [7:0] data;
        integer i;
        begin
            uart_rx = 1'b0;
            repeat(CLKS_PER_BIT) @(posedge clk);
            
            for (i = 0; i < 8; i = i + 1) begin
                uart_rx = data[i];
                repeat(CLKS_PER_BIT) @(posedge clk);
            end
            
            uart_rx = 1'b1;
            repeat(CLKS_PER_BIT) @(posedge clk);
        end
    endtask
    
    initial begin
        rst_n = 1'b0;
        uart_rx = 1'b1;
        
        #100;
        rst_n = 1'b1;
        #100;
        
        $display("[%0t] Test: LED0_R ON", $time);
        send_uart_byte(8'h01);
        #10000;
        
        $display("[%0t] Test: LED0_G ON", $time);
        send_uart_byte(8'h02);
        #10000;
        
        $display("[%0t] Test: LED0_B ON", $time);
        send_uart_byte(8'h04);
        #10000;
        
        $display("[%0t] Test: All LEDs", $time);
        send_uart_byte(8'h3F);
        #20000;
        
        $finish;
    end
    
    always @(led0_r or led0_g or led0_b or led1_r or led1_g or led1_b) begin
        $display("[%0t] LEDs: 0=[R:%b G:%b B:%b] 1=[R:%b G:%b B:%b]",
            $time, led0_r, led0_g, led0_b, led1_r, led1_g, led1_b);
    end

endmodule
