
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
      state <= IDLE;
      valid <= 0;
    end else begin
      valid <= 0;

      case (state)

        IDLE: begin
          if (!rx) begin
            tick_cnt <= TICKS_PER_BIT/2; // mid-bit sample
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
            shifter <= {rx, shifter[7:1]}; // LSB first
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
