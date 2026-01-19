module sync_fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 8,
    parameter ADDR_WIDTH = 3   // log2(DEPTH)
)(
    input                   clk,
    input                   rst_n,
    input                   wr_en,
    input  [DATA_WIDTH-1:0] data_i,
    input                   rd_en,
    output reg [DATA_WIDTH-1:0] data_o,
    output                  full,
    output                  empty
);

    // Memory
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Pointers and count
    reg [ADDR_WIDTH-1:0] wr_ptr;
    reg [ADDR_WIDTH-1:0] rd_ptr;
    reg [ADDR_WIDTH:0]   count;

    // Status flags
    assign full  = (count == DEPTH);
    assign empty = (count == 0);

    // Write logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= 0;
        end else if (wr_en && !full) begin
            mem[wr_ptr] <= data_i;
            wr_ptr <= wr_ptr + 1'b1;
        end
    end

    // Read logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rd_ptr <= 0;
            data_o <= 0;
        end else if (rd_en && !empty) begin
            data_o <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1'b1;
        end
    end

    // Count logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 0;
        end else begin
            case ({wr_en && !full, rd_en && !empty})
                2'b10: count <= count + 1'b1;
                2'b01: count <= count - 1'b1;
                default: count <= count;
            endcase
        end
    end

endmodule
