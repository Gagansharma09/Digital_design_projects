`timescale 1ns/1ps

module tb_top_outlier_system_fpga;

reg clk = 0;
reg rst_n = 0;

wire [3:0] outlier_flags;
wire       outlier_any;
wire       anomaly_pulse;

top_outlier_system_fpga DUT (
    .clk(clk),
    .rst_n(rst_n),
    .outlier_flags(outlier_flags),
    .outlier_any(outlier_any),
    .anomaly_pulse(anomaly_pulse)
);

always #5 clk = ~clk; // 100 MHz

always @(posedge clk)
    $display("T=%0t | FLAGS=%b ANY=%b PULSE=%b",
        $time, outlier_flags, outlier_any, anomaly_pulse);

initial begin
    #20 rst_n = 1;
    #800 $finish;
end

endmodule
