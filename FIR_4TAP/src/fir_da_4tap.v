module fir_da_4tap(
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

    // Shift registers to store past inputs
    reg signed [7:0] x1, x2, x3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x1    <= 0;
            x2    <= 0;
            x3    <= 0;
            y_out <= 0;
        end
        else begin
            // Shift input samples
            x1 <= x_in;
            x2 <= x1;
            x3 <= x2;

            // FIR convolution
            // y(n) = 3*x(n) - 2*x(n-1) + 5*x(n-2) - 1*x(n-3)
            y_out <= (b0 * x_in) + (b1 * x1) + (b2 * x2) + (b3 * x3);
        end
    end

endmodule