`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2026 09:49:13
// Design Name: 
// Module Name: overflowCounter
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


module overflowCounter(
    input wire clk, reset, enable,
    output wire [3:0] led
);
    reg [28:0] counter;
    always @(posedge clk) begin
        if (reset == 1'b1)counter <= 29'd0;
        else if (enable == 1'b1) counter <=  counter + 1'b1;
        else counter <= counter;
    end
    assign led = counter[28:25];
endmodule
