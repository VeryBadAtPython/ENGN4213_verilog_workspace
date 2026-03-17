`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 09:19:16
// Design Name: 
// Module Name: singleSevenSegmentDisplay_TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module singleSevenSegmentDisplay_TOP(
    input wire clk, reset, enable,
    output wire [6:0] ssdAnode,
    output wire ssdCathode
);
    
    wire beat;

    clockDividerHB hb_inst (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .dividedClk(),
        .beat(beat)
    );
    
    reg [3:0] counter;
    reg last_beat;
    
    always @(posedge clk) begin
        if (reset==1 || counter>=4'd10) begin
            counter <= 4'b0;
        end else if (enable==1 && last_beat==0 && beat==1) begin
            counter <= counter + 1;
        end
        last_beat <= beat; 
    end
    
    sevenSegmentDecoder decoder (
        .bcd(counter),
        .ssd(ssdAnode)
    );
    
    assign ssdCathode=1'b1;

endmodule
