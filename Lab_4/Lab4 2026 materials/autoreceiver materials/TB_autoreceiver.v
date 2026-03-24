`timescale 1ns / 1ps

`timescale 1ns/1ps

module TB_autoreceiver;

    // inputs
    reg clk;
    reg reset;
    reg s_clock;
    reg s_data;

    // outputs
    wire [1:0] LEDs;
    wire [6:0] ssdAnode;
    wire ssdCathode;

    // Instantiate UUT
    autoreceiver_top uut (
        .clk(clk),
        .reset(reset),
        .s_clock(s_clock),
        .s_data(s_data),
        .LEDs(LEDs),
        .ssdAnode(ssdAnode),
        .ssdCathode(ssdCathode)
    );

    // System clock: 125 MHz (8 ns period)
    initial clk = 0;
    always #4 clk = ~clk;

    // Parameters for simulation
    parameter BYTE_TO_SEND = 8'b01000110; // ASCII 'F'
    parameter BIT_PERIOD_US = 100_000;  // 100 us = 10 kHz

    // Index variable for "for" loop
    integer i;

    initial begin
        // Initial conditions
        reset   = 1;
        s_clock = 1;  // idle HIGH
        s_data  = 1;  // idle HIGH

        // Reset pulse
        #100;
        reset = 0;

        // Wait before sending burst
        #1000;

        // Send ASCII byte MSB first
        for (i = 7; i >= 0; i = i - 1) begin

            // Half period LOW
            # (BIT_PERIOD_US/2);
            s_clock = 0;
            
            s_data = BYTE_TO_SEND[i];

            // Half period HIGH = rising edge (sample point)
            # (BIT_PERIOD_US/2);
            s_clock = 1;
        end

        // Return to idle
        # (BIT_PERIOD_US/2);
        s_data = 1;

        // Wait to observe outputs
        #200_000;

        $finish;
    end

endmodule