module debouncer (
    input clk,
    input reset,
    input button_in,
    output reg button_out
);
    reg [7:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 8'h00;
            button_out <= 0;
        end else begin
            // Shift the input into the register
            shift_reg <= {shift_reg[6:0], button_in};
            
            // If all 8 bits are high, button is pressed
            if (shift_reg == 8'hFF) 
                button_out <= 1;
            // If all 8 bits are low, button is released
            else if (shift_reg == 8'h00) 
                button_out <= 0;
        end
    end
endmodule
