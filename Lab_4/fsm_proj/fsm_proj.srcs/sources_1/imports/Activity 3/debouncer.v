module debouncer (
input wire switchIn,
input wire clk,
input wire reset,
output wire debounceout
);

    wire beat;
    clockDividerHB hb_instt (
        .clk(clk),
        .reset(1'b0),
        .enable(1'b1),
        .dividedClk(),
        .beat(beat)
    );
    
    reg[2:0] pipeline;
    always @(posedge clk) begin
        if (beat) begin
            pipeline[0] <= switchIn;
            pipeline[1] <= pipeline[0];
            pipeline[2] <= pipeline[1];
        end
    end
    
    assign debounceout = &pipeline;

endmodule
