module LED_driver (
    input  wire       clk,
    input  wire       blink_pulse,
    input  wire       blink_active,
    output reg  [1:0] LEDs
);

reg toggle; //note: undefined at system startup, but not critical for a LED chain. Add a reset chain if zeroing is needed.

initial begin // initialisation to 0, for simulation purposes
	toggle=1'b0;
end 

always @(posedge clk) begin
    if(blink_pulse)
        toggle <= ~toggle;
end

always @(*) begin
    if (blink_active) begin
        // railway crossing-style alternating lights  
        LEDs = (toggle) ? 2'b10 : 2'b01; // note this style of conditional syntax vs typical if/else
    end
    else begin
        // steady ON lights
        LEDs = 2'b11;
    end
end

endmodule