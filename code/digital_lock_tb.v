`timescale 1ns / 1ps
module digital_lock_tb;

reg clk, reset, in_bit;
wire lock;

// Instantiate the digital lock module
digital_lock uut (
    .clk(clk),
    .reset(reset),
    .in_bit(in_bit),
    .lock(lock)
);

// Clock generation (10-time unit period)
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    in_bit = 0;

    // Apply reset
    #10 reset = 0;

    // Test Case 1: Correct pattern "1101"
    #10 in_bit = 1;
    #10 in_bit = 1;
    #10 in_bit = 0;
    #10 in_bit = 1;
    #10 in_bit = 0;

    // Wait to observe lock activation
    #20;

    // Test Case 2: Incorrect pattern "101"
    reset = 1;
    #10 reset = 0;
    #10 in_bit = 1;
    #10 in_bit = 0;
    #10 in_bit = 1;
    #10 in_bit = 0;

    // Wait to observe that lock does not activate
    #20;

    // End simulation
    $stop;
end

endmodule
