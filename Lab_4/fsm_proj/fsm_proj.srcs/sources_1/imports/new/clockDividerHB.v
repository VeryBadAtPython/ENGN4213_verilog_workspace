`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2026 11:25:26
// Design Name: 
// Module Name: clockDividerHB
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


module clockDividerHB #(
parameter integer THRESHOLD = 4_167,
parameter integer ON_TIME = 1
)(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg dividedClk,
    output wire beat
);
    reg [31:0] counter;
    
    always @(posedge clk) begin
        if (reset==1'b1 || counter >= THRESHOLD-1) counter <= 32'd0;
        else if (enable == 1'b1) counter <= counter + 1'b1;
    end
    
    always @(posedge clk) begin
        if (reset == 1'b1) dividedClk <= 1'b0;
        else if (counter >= THRESHOLD-1) dividedClk <= ~dividedClk;
    end
    
    assign beat=(counter>=THRESHOLD-ON_TIME)&(counter<=THRESHOLD-1)&(dividedClk);
    
endmodule
