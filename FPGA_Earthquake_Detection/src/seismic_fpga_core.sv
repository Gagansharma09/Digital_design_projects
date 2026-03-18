// Code your design here
module seismic_fsm (
    input  logic clk,
    input  logic rst,

    input  logic p_wave_detect,
    input  logic s_wave_detect,

    input  logic [31:0] time_counter,

    output logic alert,
    output logic [31:0] delta_t
);

    typedef enum logic [2:0] {
        IDLE,
        MONITOR,
        P_DETECT,
        WAIT_S,
        S_DETECT,
        CALC,
        ALERT,
        RESET
    } state_t;

    state_t current_state, next_state;

    logic [31:0] t1, t2;
    logic [31:0] timeout_counter;

    parameter TIMEOUT = 32'd50000000; // adjust as needed

    // State register
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state logic
    always_comb begin
        next_state = current_state;

        case (current_state)

            IDLE:       next_state = MONITOR;

            MONITOR:
                if (p_wave_detect)
                    next_state = P_DETECT;

            P_DETECT:
                next_state = WAIT_S;

            WAIT_S:
                if (s_wave_detect)
                    next_state = S_DETECT;
                else if (timeout_counter > TIMEOUT)
                    next_state = RESET;

            S_DETECT:
                next_state = CALC;

            CALC:
                next_state = ALERT;

            ALERT:
                next_state = RESET;

            RESET:
                next_state = MONITOR;

        endcase
    end

    // Sequential logic
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            t1 <= 0;
            t2 <= 0;
            delta_t <= 0;
            alert <= 0;
            timeout_counter <= 0;
        end else begin
            case (current_state)

                MONITOR: begin
                    alert <= 0;
                    timeout_counter <= 0;
                end

                P_DETECT: begin
                    t1 <= time_counter;
                    timeout_counter <= 0;
                end

                WAIT_S: begin
                    timeout_counter <= timeout_counter + 1;
                end

                S_DETECT: begin
                    t2 <= time_counter;
                end

                CALC: begin
                    delta_t <= t2 - t1;
                end

                ALERT: begin
                    alert <= 1;
                end

                RESET: begin
                    alert <= 0;
                end

            endcase
        end
    end

endmodule
