module vending_machine(
  input        clk,
  input        reset,
  input  [1:0] coin,
  output reg   dispense,
  output reg   change
);

  // State encoding
  parameter s0  = 2'b00;
  parameter s5  = 2'b01;
  parameter s10 = 2'b10;
  parameter s15 = 2'b11;

  reg [1:0] state, next_state;

  // Sequential block: state transition
  always @(posedge clk or posedge reset) begin
    if (reset)
      state <= s0;
    else
      state <= next_state;
  end

  // Combinational block: next state + outputs
  always @(*) begin
    // Default values
    next_state = state;
    dispense   = 0;
    change     = 0;

    case (state)
      s0: begin
        case (coin)
          2'b01: next_state = s5;   // insert 5
          2'b10: next_state = s10;  // insert 10
          default: next_state = s0;
        endcase
      end

      s5: begin
        case (coin)
          2'b01: next_state = s10;  // 5 + 5
          2'b10: next_state = s15;  // 5 + 10
          default: next_state = s5;
        endcase
      end

      s10: begin
        case (coin)
          2'b01: next_state = s15;  // 10 + 5
          2'b10: begin              // 10 + 10 = 20
            next_state = s0;
            dispense   = 1;
            change     = 1;
          end
          default: next_state = s10;
        endcase
      end

      s15: begin
        dispense   = 1;             // product dispensed
        next_state = s0;
      end
    endcase
  end

endmodule
