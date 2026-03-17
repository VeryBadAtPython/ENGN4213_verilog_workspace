`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 10:52:32
// Design Name: 
// Module Name: multipleSevenSegmentDisplays_TOP
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


module multipleSevenSegmentDisplays_TOP(
    input clk,
    output wire [6:0] ssdAnode,
    output reg ssdCathode
    );
    
    wire divClk;

    clockDividerHB hb_inst (
        .clk(clk),
        .reset(1'b0),
        .enable(1'b1),
        .dividedClk(divClk),
        .beat()
    );
    
    reg activeDisplay;
    always @(posedge clk) activeDisplay <= divClk;
    
    reg [3:0] ssdValue;
    
    always @(*) begin
        case(activeDisplay)
            1'd0 : begin
                ssdValue = 4'd3; //1st digit of number '37'
                ssdCathode = 1;
            end
            1'd1 : begin //**TO DO: add content of other case
                ssdValue = 4'd7; //2nd digit of number '37'
                ssdCathode = 0;
            end
            default : begin
                ssdValue = 4'd10; // undefined - should not occur
                ssdCathode = 0;
            end
        endcase
    end
    
    sevenSegmentDecoder decoder (
        .bcd(ssdValue),
        .ssd(ssdAnode)
    );
    
endmodule
