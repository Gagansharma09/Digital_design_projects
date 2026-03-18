module seismic_fsm_tb;

    logic clk, rst;
    logic p_wave_detect, s_wave_detect;
    logic [31:0] time_counter;

    logic alert;
    logic [31:0] delta_t;

    // DUT
    seismic_fsm dut (
        .clk(clk),
        .rst(rst),
        .p_wave_detect(p_wave_detect),
        .s_wave_detect(s_wave_detect),
        .time_counter(time_counter),
        .alert(alert),
        .delta_t(delta_t)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Time counter
    always_ff @(posedge clk) begin
        if (rst)
            time_counter <= 0;
        else
            time_counter <= time_counter + 1;
    end

    // =========================================================
    // 🔹 Scoreboard Variables
    // =========================================================
    logic [31:0] expected_t1, expected_t2;
    logic        p_seen, s_seen;

    // =========================================================
    // 🔹 Random Event Generator
    // =========================================================
    task generate_random_event();
        int delay_p, delay_s;
        bit s_present;

        delay_p = $urandom_range(5, 40);
        delay_s = $urandom_range(10, 80);
        s_present = $urandom_range(0,1);

        // Random idle noise
        repeat ($urandom_range(5,20)) begin
            @(posedge clk);
            p_wave_detect = ($urandom_range(0,20)==0);
            s_wave_detect = ($urandom_range(0,25)==0);
        end

        // Wait before P-wave
        repeat(delay_p) @(posedge clk);

        // P-wave
        p_wave_detect = 1;
        expected_t1 = time_counter;
        @(posedge clk);
        p_wave_detect = 0;

        // Wait before S-wave
        repeat(delay_s) @(posedge clk);

        if (s_present) begin
            s_wave_detect = 1;
            expected_t2 = time_counter;
            @(posedge clk);
            s_wave_detect = 0;
        end
    endtask

    // =========================================================
    // 🔹 Scoreboard + Self Checking
    // =========================================================
    always @(posedge clk) begin
        if (rst) begin
            p_seen <= 0;
            s_seen <= 0;
        end else begin

            if (p_wave_detect) begin
                p_seen <= 1;
                $display("[INFO] P-wave detected at %0t", $time);
            end

            if (s_wave_detect) begin
                s_seen <= 1;
                $display("[INFO] S-wave detected at %0t", $time);
            end

            if (alert) begin
                $display("[ALERT] Triggered at %0t | delta_t = %0d", $time, delta_t);

                // Check correctness
                if (p_seen && s_seen) begin
                    if (delta_t == (expected_t2 - expected_t1))
                        $display("[PASS] Correct delta_t");
                    else
                        $error("[FAIL] Wrong delta_t! Expected=%0d Got=%0d",
                            expected_t2 - expected_t1, delta_t);
                end else begin
                    $error("[FAIL] ALERT without valid P-S sequence!");
                end

                // Reset tracking
                p_seen <= 0;
                s_seen <= 0;
            end
        end
    end

    // =========================================================
    // 🔹 Assertions (Formal-like checks)
    // =========================================================

    // ALERT should only happen after S-wave
    property alert_after_s;
        @(posedge clk)
        alert |-> s_seen;
    endproperty

    assert property (alert_after_s)
        else $error("[ASSERT FAIL] ALERT without S-wave!");

    // FSM should not skip P-wave
    property p_before_s;
        @(posedge clk)
        s_wave_detect |-> p_seen;
    endproperty

    assert property (p_before_s)
        else $error("[ASSERT FAIL] S-wave before P-wave!");

    // =========================================================
    // 🔹 Debug Monitor (Console Visibility)
    // =========================================================
    always @(posedge clk) begin
        $display("T=%0t | State=%0d | P=%0b S=%0b | Alert=%0b | dt=%0d",
            $time,
            dut.current_state,
            p_wave_detect,
            s_wave_detect,
            alert,
            delta_t
        );
    end

    // =========================================================
    // 🔹 Test Sequence
    // =========================================================
    initial begin
        clk = 0;
        rst = 1;
        p_wave_detect = 0;
        s_wave_detect = 0;

        #20 rst = 0;

        repeat (15) begin
            generate_random_event();
        end

        #500 $display("Simulation Completed");
        $finish;
    end

endmodule
