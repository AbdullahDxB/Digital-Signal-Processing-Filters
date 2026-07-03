module iir_filter(
    input clk,
    input rst,
    input signed [7:0] x_in,
    output reg signed [15:0] y_out
);

    // Feedforward coefficients: b0=3, b1=1, b2=2, b3=1
    parameter signed [7:0] b0 = 8'sd3;
    parameter signed [7:0] b1 = 8'sd1;
    parameter signed [7:0] b2 = 8'sd2;
    parameter signed [7:0] b3 = 8'sd1;

    // Input shift registers
    reg signed [7:0] x1, x2, x3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x1    <= 0;
            x2    <= 0;
            x3    <= 0;
            y_out <= 0;
        end
        else begin
            // Shift inputs
            x1 <= x_in;
            x2 <= x1;
            x3 <= x2;

            // KEY FIX: use y_out directly in RHS
            // In non blocking assignment RHS uses OLD value
            // So y_out in RHS = y(n-1) which is correct feedback
            y_out <= (b0 * x_in)  + 
                     (b1 * x1)    + 
                     (b2 * x2)    + 
                     (b3 * x3)    + 
                     y_out;        // y_out here = y(n-1)
        end
    end

endmodule