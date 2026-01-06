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
