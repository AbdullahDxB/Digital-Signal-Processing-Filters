module iir_filter_retimed(
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

    // Retiming register for feedforward path
    reg signed [15:0] ff_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x1     <= 0;
            x2     <= 0;
            x3     <= 0;
            ff_reg <= 0;
            y_out  <= 0;
        end
        else begin
            // Shift inputs
            x1 <= x_in;
            x2 <= x1;
            x3 <= x2;

            // KEY FIX: compute ff_reg directly here
            // RHS uses OLD values of x1,x2,x3 (pre NBA)
            // NOT the wire which sees post NBA values
            ff_reg <= (b0 * x_in) + 
                      (b1 * x1)   + 
                      (b2 * x2)   + 
                      (b3 * x3);

            // Output = registered feedforward + feedback
            // ff_reg RHS = feedforward from last cycle
            // y_out  RHS = y(n-1) correct feedback
            y_out <= ff_reg + y_out;
        end
    end

endmodule