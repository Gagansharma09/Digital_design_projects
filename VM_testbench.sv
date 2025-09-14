timescale 1ns/1ps

module tb_vending_machine;

  reg clk;
  reg reset;
  reg [1:0] coin;
  wire dispense;
  wire change;

  // DUT instantiation
  vending_machine dut (
    .clk(clk),
    .reset(reset),
    .coin(coin),
    .dispense(dispense),
    .change(change)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Task: insert coin
  task insert_coin(input [1:0] c);
    begin
      @(negedge clk);
      coin = c;
      @(posedge clk);
      @(negedge clk);
      coin = 2'b00;
    end
  endtask

  // VCD dump
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_vending_machine);
  end

  // -------------------
  // Monitor for debug
  // -------------------
  initial begin
    $monitor("TIME=%0t | STATE=%0b | COIN=%0b | DISPENSE=%0b | CHANGE=%0b",
              $time, dut.state, coin, dispense, change);
  end

  // Test sequence
  initial begin
    clk   = 0;
    reset = 1;
    coin  = 2'b00;

    // Apply reset
    #12 reset = 0;

    // Test 1: 5 + 10 = 15
    insert_coin(2'b01); // 5
    insert_coin(2'b10); // 10
    if (dispense)
      $display("Test1 PASS: Dispense triggered at %t", $time);
    else
      $display("Test1 FAIL: No dispense at %t", $time);

    // Test 2: 10 + 10 = 20 (dispense + change expected)
    insert_coin(2'b10); // first 10
    @(negedge clk);
    coin = 2'b10;       // second 10
    #1;                 // small delay to capture combinational outputs
    if (dispense && change)
      $display("Test2 PASS: Dispense+Change at %t", $time);
    else
      $display("Test2 FAIL: Unexpected output at %t", $time);
    @(negedge clk);
    coin = 2'b00;

    // Test 3: 10 + 5 = 15
    insert_coin(2'b10); // 10
    insert_coin(2'b01); // 5
    if (dispense)
      $display("Test3 PASS: Dispense triggered at %t", $time);
    else
      $display("Test3 FAIL: No dispense at %t", $time);

    #50 $finish;
  end

endmodule
