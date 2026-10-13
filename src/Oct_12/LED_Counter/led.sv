module led (
    input logic clk,
    output logic [3:0] led
);
    logic [31:0] counter;
    logic clk_out;

    always_ff @(posedge clk) begin
        if (counter == 124999999) begin
            counter <= 1;
            clk_out <= 0;
        end else begin
            counter <= counter + 1;
            clk_out <= 1;
        end
    end

    logic [3:0] led_reg;
    
    always_ff @(posegde clk_out) begin
        led_reg <= led_reg + 1;
    end

    assign led = led_reg;
endmodule

