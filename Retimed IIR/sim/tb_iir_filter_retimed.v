module tb_iir_filter_retimed;

    reg clk;
    reg rst;
    reg signed [7:0] x_in;
    wire signed [15:0] y_out;

    // Instantiate retimed IIR filter
    iir_filter_retimed uut (
        .clk(clk),
        .rst(rst),
        .x_in(x_in),
        .y_out(y_out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        x_in = 0;

        // Hold reset for 2 clock cycles
        @(posedge clk);
        @(posedge clk);
        rst = 0;

        // Impulse input
        @(posedge clk); x_in = 8'sd1;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;
        @(posedge clk); x_in = 8'sd0;

        // Wait and finish
        #300;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | x_in=%0d | y_out=%0d",
                  $time, x_in, y_out);
    end

endmodule