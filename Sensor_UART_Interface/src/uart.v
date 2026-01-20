`timescale 1ns/1ps

//==============================================================
// UART TRANSMITTER
//==============================================================
module uart_tx #(
  parameter CLK_FREQ  = 100000000,
  parameter BAUD_RATE = 115200
)(
  input  logic clk,
  input  logic rst_n,
  input  logic start,
  input  logic [7:0] data_in,
  output logic tx,
  output logic busy,
  output logic done
);

  localparam integer TICKS_PER_BIT = CLK_FREQ / BAUD_RATE;

  logic [$clog2(TICKS_PER_BIT)-1:0] tick_cnt;
  logic [2:0] bit_cnt;
  logic [7:0] shifter;

  typedef enum logic [1:0] {IDLE, START, DATA, STOP} state_t;
  state_t state;

  assign busy = (state != IDLE);

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state    <= IDLE;
      tx       <= 1;
      tick_cnt <= 0;
      bit_cnt  <= 0;
      done     <= 0;
    end else begin
      done <= 0;

      case (state)

        IDLE: begin
          tx <= 1;
          if (start) begin
            shifter <= data_in;
            state    <= START;
            tick_cnt <= 0;
          end
        end

        START: begin
          tx <= 0;
          if (tick_cnt == TICKS_PER_BIT-1) begin
            tick_cnt <= 0;
            state <= DATA;
          end else
            tick_cnt <= tick_cnt + 1;
        end

        DATA: begin
          tx <= shifter[0];
          if (tick_cnt == TICKS_PER_BIT-1) begin
            tick_cnt <= 0;
            shifter <= shifter >> 1;

            if (bit_cnt == 7) begin
              bit_cnt <= 0;
              state <= STOP;
            end else
              bit_cnt <= bit_cnt + 1;
          end else
            tick_cnt <= tick_cnt + 1;
        end

        STOP: begin
          tx <= 1;
          if (tick_cnt == TICKS_PER_BIT-1) begin
            state <= IDLE;
            done  <= 1;
          end else
            tick_cnt <= tick_cnt + 1;
        end
      endcase
    end
  end
endmodule


//==============================================================
// UART RECEIVER
//==============================================================
module uart_rx #(
  parameter CLK_FREQ  = 100000000,
  parameter BAUD_RATE = 115200
)(
  input  logic clk,
  input  logic rst_n,
  input  logic rx,
  output logic [7:0] data_out,
  output logic valid
);

  localparam integer TICKS_PER_BIT = CLK_FREQ / BAUD_RATE;

  logic [$clog2(TICKS_PER_BIT)-1:0] tick_cnt;
  logic [2:0] bit_cnt;
  logic [7:0] shifter;

  typedef enum logic [1:0] {IDLE, START, DATA, STOP} state_t;
  state_t state;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state    <= IDLE;
      valid    <= 0;
      tick_cnt <= 0;
      bit_cnt  <= 0;
      shifter  <= 0;
      data_out <= 0;
    end else begin
      valid <= 0;

      case (state)

        IDLE: begin
          if (!rx) begin
            tick_cnt <= TICKS_PER_BIT/2;
            state <= START;
          end
        end

        START: begin
          if (tick_cnt == 0) begin
            if (!rx) begin
              state <= DATA;
              tick_cnt <= TICKS_PER_BIT-1;
              bit_cnt <= 0;
            end else
              state <= IDLE;
          end else
            tick_cnt <= tick_cnt - 1;
        end

        DATA: begin
          if (tick_cnt == 0) begin
            shifter <= {rx, shifter[7:1]};
            tick_cnt <= TICKS_PER_BIT-1;

            if (bit_cnt == 7)
              state <= STOP;
            else
              bit_cnt <= bit_cnt + 1;
          end else
            tick_cnt <= tick_cnt - 1;
        end

        STOP: begin
          if (tick_cnt == 0) begin
            if (rx) begin
              data_out <= shifter;
              valid <= 1;
            end
            state <= IDLE;
          end else
            tick_cnt <= tick_cnt - 1;
        end
      endcase
    end
  end
endmodule


//==============================================================
// UART TOP (TX + RX)
//==============================================================
module uart_top #(
  parameter CLK_FREQ  = 100000000,
  parameter BAUD_RATE = 115200
)(
  input  logic clk,
  input  logic rst_n,

  // TX
  input  logic        tx_start,
  input  logic [7:0]  tx_data,
  output logic        tx_busy,
  output logic        tx_done,
  output logic        tx,

  // RX
  input  logic        rx,
  output logic [7:0]  rx_data,
  output logic        rx_valid
);

  uart_tx #(
    .CLK_FREQ (CLK_FREQ),
    .BAUD_RATE(BAUD_RATE)
  ) u_tx (
    .clk     (clk),
    .rst_n   (rst_n),
    .start   (tx_start),
    .data_in (tx_data),
    .tx      (tx),
    .busy    (tx_busy),
    .done    (tx_done)
  );

  uart_rx #(
    .CLK_FREQ (CLK_FREQ),
    .BAUD_RATE(BAUD_RATE)
  ) u_rx (
    .clk      (clk),
    .rst_n    (rst_n),
    .rx       (rx),
    .data_out (rx_data),
    .valid    (rx_valid)
  );

endmodule

///esp32 tx embeeded c code // ESP32 UART Transmitter for Cora Z7 FPGA
// ESP32 TX (GPIO17) → Cora Z7 U14 (CK_IO0)

#include <HardwareSerial.h>

// Use Serial2 on ESP32 (TX=GPIO17, RX=GPIO16)
HardwareSerial SerialPort(2);

void setup() {
    // Initialize Serial for debugging
    Serial.begin(115200);
    Serial.println("ESP32 UART Transmitter Starting...");
    
    // Initialize Serial2 for FPGA communication
    SerialPort.begin(115200, SERIAL_8N1, 16, 17); // RX=16, TX=17
    
    delay(1000);
    Serial.println("Sending LED patterns to FPGA...");
}

void loop() {
    // LED test patterns
    byte patterns[] = {
        0x01,  // LED0_R ON
        0x02,  // LED0_G ON
        0x04,  // LED0_B ON
        0x07,  // LED0 RGB ON
        0x08,  // LED1_R ON
        0x10,  // LED1_G ON
        0x20,  // LED1_B ON
        0x3F,  // All LEDs ON
        0x00   // All LEDs OFF
    };
    
    for (int i = 0; i < sizeof(patterns); i++) {
        SerialPort.write(patterns[i]);
        Serial.print("Sent: 0x");
        Serial.println(patterns[i], HEX);
        
        delay(1000); // 1 second between patterns
    }
}


//fpga based rx code 
      module fpga_uart_rx(
    input  wire clk,
    input  wire rst_n,
    input  wire uart_rx,
    
    output reg led0_r,
    output reg led0_g,
    output reg led0_b,
    output reg led1_r,
    output reg led1_g,
    output reg led1_b
);

    localparam CLK_FREQ = 100_000_000;
    localparam BAUD_RATE = 115_200;
    localparam CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;
    localparam CLKS_PER_HALF_BIT = CLKS_PER_BIT / 2;
    
    reg [9:0] clk_cnt;
    reg [2:0] bit_idx;
    reg [7:0] rx_data;
    reg [1:0] state;
    reg [1:0] sync_reg;
    
    wire uart_rx_sync;
    assign uart_rx_sync = sync_reg[1];
    
    localparam [1:0] IDLE  = 2'b00;
    localparam [1:0] START = 2'b01;
    localparam [1:0] DATA  = 2'b10;
    localparam [1:0] STOP  = 2'b11;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sync_reg <= 2'b11;
        end else begin
            sync_reg <= {sync_reg[0], uart_rx};
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            clk_cnt <= 10'd0;
            bit_idx <= 3'd0;
            rx_data <= 8'd0;
            
            led0_r <= 1'b0;
            led0_g <= 1'b0;
            led0_b <= 1'b0;
            led1_r <= 1'b0;
            led1_g <= 1'b0;
            led1_b <= 1'b0;
            
        end else begin
            case (state)
                IDLE: begin
                    clk_cnt <= 10'd0;
                    bit_idx <= 3'd0;
                    
                    if (uart_rx_sync == 1'b0) begin
                        state <= START;
                    end
                end
                
                START: begin
                    if (clk_cnt == CLKS_PER_HALF_BIT - 1) begin
                        clk_cnt <= 10'd0;
                        
                        if (uart_rx_sync == 1'b0) begin
                            state <= DATA;
                        end else begin
                            state <= IDLE;
                        end
                    end else begin
                        clk_cnt <= clk_cnt + 10'd1;
                    end
                end
                
                DATA: begin
                    if (clk_cnt == CLKS_PER_BIT - 1) begin
                        clk_cnt <= 10'd0;
                        rx_data[bit_idx] <= uart_rx_sync;
                        
                        if (bit_idx == 3'd7) begin
                            state <= STOP;
                        end else begin
                            bit_idx <= bit_idx + 3'd1;
                        end
                    end else begin
                        clk_cnt <= clk_cnt + 10'd1;
                    end
                end
                
                STOP: begin
                    if (clk_cnt == CLKS_PER_BIT - 1) begin
                        clk_cnt <= 10'd0;
                        
                        if (uart_rx_sync == 1'b1) begin
                            led0_r <= rx_data[0];
                            led0_g <= rx_data[1];
                            led0_b <= rx_data[2];
                            led1_r <= rx_data[3];
                            led1_g <= rx_data[4];
                            led1_b <= rx_data[5];
                        end
                        
                        state <= IDLE;
                    end else begin
                        clk_cnt <= clk_cnt + 10'd1;
                    end
                end
                
                default: state <= IDLE;
            endcase
        end
    end
endmodule
