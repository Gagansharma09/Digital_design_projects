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

