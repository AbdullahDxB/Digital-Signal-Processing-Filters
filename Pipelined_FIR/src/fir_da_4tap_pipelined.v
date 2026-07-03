module fir_da_4tap_pipelined(
    input clk,
    input rst,
    input signed [7:0] x_in,
    output reg signed [15:0] y_out
);

    // Coefficients: b0=3, b1=-2, b2=5, b3=-1
    parameter signed [7:0] b0 = 8'sd3;
    parameter signed [7:0] b1 = -8'sd2;
    parameter signed [7:0] b2 = 8'sd5;
    parameter signed [7:0] b3 = -8'sd1;

    // Shift registers
    reg signed [7:0] x1, x2, x3;

    // Stage 1: capture all inputs
    reg signed [7:0] x0_s1, x1_s1, x2_s1, x3_s1;

    // Stage 2: delay inputs by 1 more
    reg signed [7:0] x1_s2, x2_s2, x3_s2;

    // Stage 3: delay inputs by 1 more
    reg signed [7:0] x2_s3, x3_s3;

    // Stage 4: delay inputs by 1 more
    reg signed [7:0] x3_s4;

    // Pipeline partial sum registers
    reg signed [15:0] p1, p2, p3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x1    <= 0; x2    <= 0; x3    <= 0;
            x0_s1 <= 0; x1_s1 <= 0;
            x2_s1 <= 0; x3_s1 <= 0;
            x1_s2 <= 0; x2_s2 <= 0; x3_s2 <= 0;
            x2_s3 <= 0; x3_s3 <= 0;
            x3_s4 <= 0;
            p1    <= 0; p2    <= 0; p3    <= 0;
            y_out <= 0;
        end
        else begin
            // ---- Shift input samples ----
            x1 <= x_in;
            x2 <= x1;
            x3 <= x2;

            // ---- Stage 1: capture current inputs ----
            x0_s1 <= x_in;
            x1_s1 <= x1;
            x2_s1 <= x2;
            x3_s1 <= x3;

            // ---- Stage 2: delay inputs by 1 ----
            x1_s2 <= x1_s1;
            x2_s2 <= x2_s1;
            x3_s2 <= x3_s1;

            // ---- Stage 3: delay inputs by 1 more ----
            x2_s3 <= x2_s2;
            x3_s3 <= x3_s2;

            // ---- Stage 4: delay inputs by 1 more ----
            x3_s4 <= x3_s3;

            // ---- Pipeline computations ----
            // Stage 1: b0 * x(n)
            p1 <= b0 * x0_s1;

            // Stage 2: add b1 * x(n-1)
            p2 <= p1 + (b1 * x1_s2);

            // Stage 3: add b2 * x(n-2)
            p3 <= p2 + (b2 * x2_s3);

            // Stage 4: add b3 * x(n-3)
            y_out <= p3 + (b3 * x3_s4);
        end
    end

endmodule