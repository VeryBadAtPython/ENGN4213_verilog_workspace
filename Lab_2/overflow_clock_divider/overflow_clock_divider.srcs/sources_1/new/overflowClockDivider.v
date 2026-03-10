`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2026 10:45:02
// Design Name: 
// Module Name: overflowClockDivider
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


module overflowClockDivider (
    input wire clk,
    input wire reset,
    input wire enable,
    output wire dividedClk
);
    reg [26:0] counter;
    always @(posedge clk) begin
        if (reset == 1'b1) counter <= 27'd0;
        else if (enable == 1'b1) counter <= counter + 1'b1;
    end
    assign dividedClk = counter[26];
endmodule