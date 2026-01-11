`timescale 1ns/1ns

module tb_seismic_fpga_core;

    // ---------------- Clock & Reset ----------------
    logic clk;
    logic rst_n;

    // ---------------- DUT Signals ----------------
    logic signed [15:0] sample_in;
    logic        sample_valid;

    logic        p_wave_detected;
    logic        s_wave_detected;
    logic        alarm;
    logic [31:0] delta_t_cycles;

    // ---------------- Parameters ----------------
    real CLK_PERIOD_NS = 10.0;       // 100 MHz
    real SAMPLE_RATE_HZ = 100.0;     // logical sampling rate
    real VP = 6.0;                   // km/s (P-wave)
    real VS = 3.5;                   // km/s (S-wave)

    // ---------------- DUT ----------------
    seismic_fpga_core dut (
        .clk(clk),
        .rst_n(rst_n),
        .sample_in(sample_in),
        .sample_valid(sample_valid),
        .p_wave_detected(p_wave_detected),
        .s_wave_detected(s_wave_detected),
        .alarm(alarm),
        .delta_t_cycles(delta_t_cycles)
    );

    // ---------------- Clock ----------------
    always #(CLK_PERIOD_NS/2) clk = ~clk;

    // ---------------- Test Sequence ----------------
    initial begin
        clk = 0;
        rst_n = 0;
        sample_valid = 0;
        sample_in = 0;

        $dumpfile("seismic.vcd");
        $dumpvars(0, tb_seismic_fpga_core);

        // Reset
        #50;
        rst_n = 1;
        sample_valid = 1;

        // -------- Noise --------
        repeat (30) begin
            @(posedge clk);
            sample_in = $urandom_range(0, 200);
        end

        // -------- Inject P-wave --------
        @(posedge clk);
        sample_in = 350;   // > P_THRESH
        $display("[%0t] Injected P-wave", $time);

        // -------- Quiet gap --------
        repeat (20) begin
            @(posedge clk);
            sample_in = $urandom_range(200, 350);
        end

        // -------- Inject S-wave --------
        @(posedge clk);
        sample_in = 900;   // > S_THRESH
        $display("[%0t] Injected S-wave", $time);

        // -------- Continue --------
        repeat (10) @(posedge clk);

        $finish;
    end

    // ---------------- Monitoring & Calculations ----------------
    real delta_t_sec;
    real distance_km;
    real magnitude;

    always @(posedge clk) begin
        if (p_wave_detected) begin
            $display("[%0t] >>> P-WAVE DETECTED", $time);
        end

        if (s_wave_detected) begin
            // Δt in seconds
            delta_t_sec = delta_t_cycles / SAMPLE_RATE_HZ;

            // Distance estimation
            distance_km = (VP * VS * delta_t_sec) / (VP - VS);

            // Simple magnitude proxy (amplitude-based)
            magnitude = sample_in / 100.0;

            $display("[%0t] >>> S-WAVE DETECTED", $time);
            $display("        Δt cycles   = %0d", delta_t_cycles);
            $display("        Δt seconds  = %0f", delta_t_sec);
            $display("        Distance km = %0f", distance_km);
            $display("        Magnitude ~ = %0f", magnitude);
        end

        if (alarm) begin
            $display("[%0t] !!! ALARM TRIGGERED !!!", $time);
        end
    end

endmodule
