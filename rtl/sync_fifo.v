module sync_fifo #(parameter DEPTH = 8, DWIDTH = 16)
(
    input                   clk,
    input                   rstn,
    input                   wr_en,
    input                   rd_en,
    input  [DWIDTH-1:0]     din,
    output reg [DWIDTH-1:0] dout,
    output                  empty,
    output                  full
);

    // Pointer width calculation
    localparam PTR_WIDTH = $clog2(DEPTH);

    reg [PTR_WIDTH-1:0] wptr;
    reg [PTR_WIDTH-1:0] rptr;

    // FIFO memory
    reg [DWIDTH-1:0] fifo_mem [0:DEPTH-1];

    // Write logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            wptr <= 0;
        else if (wr_en && !full) begin
            fifo_mem[wptr] <= din;
            wptr <= wptr + 1;
        end
    end

    // Read logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            rptr <= 0;
            dout <= 0;
        end
        else if (rd_en && !empty) begin
            dout <= fifo_mem[rptr];
            rptr <= rptr + 1;
        end
    end

    // Status flags
    assign empty = (wptr == rptr);
    assign full  = ((wptr + 1'b1) == rptr);

endmodule
