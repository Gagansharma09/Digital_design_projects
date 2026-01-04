// Code your design here
`timescale 1ns/1ps
//------------------------------------------------------------
// MULTI-CHANNEL EMA-BASED OUTLIER DETECTION ENGINE (FPGA-SAFE)
// Deterministic 2-cycle latency, DSP-mapped, timing-clean
//------------------------------------------------------------

//------------------------------------------------------------
// 1) SENSOR SAMPLE GENERATOR (dummy input source)
//------------------------------------------------------------
module sensor_reader_u (
    input  wire clk,
    input  wire rst_n,
    output reg  [9:0] sample0,
    output reg  [9:0] sample1,
    output reg  [9:0] sample2,
    output reg  [9:0] sample3,
    output reg        valid0,
    output reg        valid1,
    output reg        valid2,
    output reg        valid3
);
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sample0 <= 100; sample1 <= 200;
        sample2 <= 300; sample3 <= 400;
        valid0 <= 0; valid1 <= 0; valid2 <= 0; valid3 <= 0;
    end else begin
        sample0 <= sample0 + 5;   valid0 <= 1;
        sample1 <= sample1 + 8;   valid1 <= 1;
        sample2 <= sample2 + 3;   valid2 <= 1;
        sample3 <= sample3 + 10;  valid3 <= 1;
    end
end
endmodule


//------------------------------------------------------------
// 2) EMA MEAN  (single-cycle, lightweight)
//------------------------------------------------------------
module ema_mean_u (
    input  wire clk,
    input  wire rst_n,
    input  wire [9:0] sample_in,
    input  wire sample_valid,
    output reg  signed [15:0] mean_out
);
parameter SHIFT = 4;
wire signed [15:0] s = {6'b0, sample_in};

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        mean_out <= 0;
    else if (sample_valid)
        mean_out <= mean_out + ((s - mean_out) >>> SHIFT);
end
endmodule


//------------------------------------------------------------
// 3) EMA VARIANCE (PIPELINED FOR TIMING)
//------------------------------------------------------------
module ema_variance_u (
    input  wire clk,
    input  wire rst_n,
    input  wire [9:0] sample_in,
    input  wire signed [15:0] mean_in,
    input  wire sample_valid,
    output reg  signed [15:0] var_out
);
parameter SHIFT = 4;

// ---- Stage-1: subtract + register ----
reg signed [15:0] d_reg;
reg               v_reg;
wire signed [15:0] s = {6'b0, sample_in};
wire signed [15:0] d = s - mean_in;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        d_reg <= 0;
        v_reg <= 0;
    end else begin
        d_reg <= d;
        v_reg <= sample_valid;
    end
end

// ---- Stage-2: multiply (DSP) + register ----
reg signed [31:0] d2_reg;
wire signed [31:0] d2 = d_reg * d_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        d2_reg <= 0;
    else if (v_reg)
        d2_reg <= d2;
end

wire signed [15:0] d2s = d2_reg[23:8];

// ---- EMA accumulate ----
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        var_out <= 0;
    else if (v_reg)
        var_out <= var_out + ((d2s - var_out) >>> SHIFT);
end
endmodule


//------------------------------------------------------------
// 4) THRESHOLD  (K² • variance)
//------------------------------------------------------------
module threshold_gen_u (
    input  wire clk,
    input  wire rst_n,
    input  wire signed [15:0] variance_in,
    output reg  signed [31:0] threshold_out
);
parameter K2 = 9;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        threshold_out <= 0;
    else
        threshold_out <= variance_in * K2;
end
endmodule


//------------------------------------------------------------
// 5) OUTLIER COMPARATOR (PIPELINED)
//------------------------------------------------------------
module outlier_cmp_u (
    input  wire clk,
    input  wire rst_n,
    input  wire [9:0] sample_in,
    input  wire signed [15:0] mean_in,
    input  wire signed [31:0] threshold_in,
    output reg  outlier_flag
);

// ---- Stage-1: subtract ----
reg signed [15:0] d_reg;
wire signed [15:0] s = {6'b0, sample_in};
wire signed [15:0] d = s - mean_in;

always @(posedge clk or negedge rst_n)
    if (!rst_n) d_reg <= 0;
    else        d_reg <= d;

// ---- Stage-2: multiply + compare ----
wire signed [31:0] d2 = d_reg * d_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        outlier_flag <= 0;
    else
        outlier_flag <= (d2 > threshold_in);
end
endmodule


//------------------------------------------------------------
// 6) TOP-LEVEL OUTLIER ENGINE (TIMING-CLEAN)
//------------------------------------------------------------
module top_outlier_system_fpga (
    input  wire clk,
    input  wire rst_n,

    output wire [3:0] outlier_flags, // per-channel anomaly
    output wire       outlier_any,   // OR-reduced status
    output wire       anomaly_pulse  // 1-cycle rising-edge pulse
);

wire [9:0] s0,s1,s2,s3;
wire v0,v1,v2,v3;
wire signed [15:0] m0,m1,m2,m3;
wire signed [15:0] var0,var1,var2,var3;
wire signed [31:0] t0,t1,t2,t3;
wire o0,o1,o2,o3;

sensor_reader_u SRC (clk,rst_n,s0,s1,s2,s3,v0,v1,v2,v3);

// EMA mean
ema_mean_u M0(clk,rst_n,s0,v0,m0);
ema_mean_u M1(clk,rst_n,s1,v1,m1);
ema_mean_u M2(clk,rst_n,s2,v2,m2);
ema_mean_u M3(clk,rst_n,s3,v3,m3);

// EMA variance (pipelined)
ema_variance_u V0(clk,rst_n,s0,m0,v0,var0);
ema_variance_u V1(clk,rst_n,s1,m1,v1,var1);
ema_variance_u V2(clk,rst_n,s2,m2,v2,var2);
ema_variance_u V3(clk,rst_n,s3,m3,v3,var3);

// Threshold
threshold_gen_u T0(clk,rst_n,var0,t0);
threshold_gen_u T1(clk,rst_n,var1,t1);
threshold_gen_u T2(clk,rst_n,var2,t2);
threshold_gen_u T3(clk,rst_n,var3,t3);

// Comparator (pipelined)
outlier_cmp_u C0(clk,rst_n,s0,m0,t0,o0);
outlier_cmp_u C1(clk,rst_n,s1,m1,t1,o1);
outlier_cmp_u C2(clk,rst_n,s2,m2,t2,o2);
outlier_cmp_u C3(clk,rst_n,s3,m3,t3,o3);

// Export detection signals
assign outlier_flags = {o3,o2,o1,o0};
assign outlier_any   = |outlier_flags;

// one-cycle pulse for logging/interrupt
reg outlier_any_d;
always @(posedge clk or negedge rst_n)
    if (!rst_n) outlier_any_d <= 0;
    else        outlier_any_d <= outlier_any;

assign anomaly_pulse = outlier_any & ~outlier_any_d;

endmodule
