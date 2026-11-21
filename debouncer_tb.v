module debouncer_tb;
    reg clk, reset, btn_in;
    wire btn_out;

    debouncer uut (clk, reset, btn_in, btn_out);
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; btn_in = 0;
        #10 reset = 0;
        
        // Simulate bouncing
        btn_in = 1; #10;
        btn_in = 0; #10;
        btn_in = 1; #10;
        btn_in = 1; #10;
        btn_in = 1; #100; // Stable high
        btn_in = 0; #10;
        btn_in = 1; #10;
        btn_in = 0; #100; // Stable low
        $finish;
    end
endmodule
