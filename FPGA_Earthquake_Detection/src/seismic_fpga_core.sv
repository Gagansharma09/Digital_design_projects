// FPGA-Based Threshold Seismic Detection Core
// P-wave → S-wave → Alarm + Δt measurement
module seismic_fpga_core (
    input  logic        clk,
    input  logic        rst_n,

    input  logic signed [15:0] sample_in,
    input  logic        sample_valid,

    output logic        p_wave_detected,
    output logic        s_wave_detected,
    output logic        alarm,
    output logic [31:0] delta_t_cycles
);

    // Parameters 
    parameter signed [15:0] P_THRESH = 16'sd300;
    parameter signed [15:0] S_THRESH = 16'sd700;

    // Internal 
    logic [31:0] p_time_counter;
    logic        p_seen;

    // ---------------- Logic ----------------
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            p_wave_detected <= 0;
            s_wave_detected <= 0;
            alarm           <= 0;
            p_time_counter  <= 0;
            delta_t_cycles  <= 0;
            p_seen          <= 0;
        end
        else if (sample_valid) begin

            // P-wave detection
            if (!p_seen && (sample_in >= P_THRESH)) begin
                p_wave_detected <= 1;
                p_seen          <= 1;
                p_time_counter  <= 0;
            end
            else
                p_wave_detected <= 0;

            //  Count after P-wave 
            if (p_seen)
                p_time_counter <= p_time_counter + 1;

            // -------- S-wave detection --------
            if (p_seen && (sample_in >= S_THRESH)) begin
                s_wave_detected <= 1;
                alarm           <= 1;
                delta_t_cycles  <= p_time_counter;
            end
            else
                s_wave_detected <= 0;
        end
    end

endmodule
