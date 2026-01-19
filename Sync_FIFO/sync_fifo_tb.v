// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb_sync_fifo;

    parameter DATA_WIDTH = 8;
    parameter DEPTH      = 8;
    parameter ADDR_WIDTH = 3;

    reg clk;
    reg rst_n;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH-1:0] data_i;

    wire [DATA_WIDTH-1:0] data_o;
    wire full;
    wire empty;

    // DUT
    sync_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(wr_en),
        .data_i(data_i),
        .rd_en(rd_en),
        .data_o(data_o),
        .full(full),
        .empty(empty)
    );

    // Clock generation (100 MHz)
    always #5 clk = ~clk;

    integer i;

    initial begin
        // Init
        clk    = 0;
        rst_n  = 0;
        wr_en  = 0;
        rd_en  = 0;
        data_i = 0;

        // Reset
        #20;
        rst_n = 1;
        $display("RESET DONE");

        // -------------------------------
        // WRITE PHASE
        // -------------------------------
        $display("Writing data into FIFO...");
        for (i = 0; i < DEPTH; i = i + 1) begin
            @(posedge clk);
            if (!full) begin
                wr_en  <= 1;
                data_i <= i + 8'h10;
                $display("WRITE: %h", i + 8'h10);
            end
        end
        @(posedge clk);
        wr_en <= 0;

        // Try writing when FULL
        @(posedge clk);
        wr_en  <= 1;
        data_i <= 8'hFF;
        @(posedge clk);
        wr_en <= 0;

        if (full)
            $display("FIFO FULL detected correctly");

        // -------------------------------
        // READ PHASE
        // -------------------------------
        $display("Reading data from FIFO...");
        for (i = 0; i < DEPTH; i = i + 1) begin
            @(posedge clk);
            if (!empty) begin
                rd_en <= 1;
            end
            @(posedge clk);
            rd_en <= 0;
            $display("READ: %h", data_o);
        end

        if (empty)
            $display("FIFO EMPTY detected correctly");

        // -------------------------------
        // SIMULTANEOUS READ + WRITE
        // -------------------------------
        $display("Testing simultaneous read/write...");
        @(posedge clk);
        wr_en  <= 1;
        rd_en  <= 1;
        data_i <= 8'hAA;

        @(posedge clk);
        wr_en <= 0;
        rd_en <= 0;

        $display("SIMULTANEOUS RW TEST DONE");

        #50;
        $display("TEST PASSED");
        $finish;
    end

endmodule
